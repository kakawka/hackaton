require "addressable/uri"

class Api::LicenseAgreementsController < ApplicationController
  before_filter :load_agreement
  skip_before_filter :verify_authenticity_token

  def terms
    visitor = Visitor.find_or_create(params[:uid])
    result = {
      :terms => @license_agreement.license_agreement_terms,
      :acceptances => visitor.term_acceptances,
      :uid => visitor.uid
    }
    respond_to do |format|
      format.json { render :json => result }
    end
  end

  def accept
    visitor = Visitor.find_or_create(params[:uid])
    term = @license_agreement.license_agreement_terms.find_by_code(params[:term])
    if !visitor.nil? && !term.nil?
      TermAcceptance.create(
        :visitor_id => visitor.id,
        :accepted => params[:accepted],
        :license_agreement_term_id => term.id
      )
    end

    head :no_content
  end

  def load_agreement
    host = Addressable::URI.parse(request.referer).host
    @license_agreement = LicenseAgreement.find_by_domain(host)
    unless @license_agreement.nil?
      unless request.port == 80
        headers['Access-Control-Allow-Origin'] = "http://#{host}:#{request.port}"
      else
        headers['Access-Control-Allow-Origin'] = "http://#{host}"
      end
      headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    end
  end
end
