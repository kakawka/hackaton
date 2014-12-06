require "addressable/uri"

class Api::LicenseAgreementsController < ApplicationController
  before_filter :load_agreement
  skip_before_filter :verify_authenticity_token

  def terms
    visitor = Visitor.find_or_create(params[:uid])
    respond_to do |format|
      format.json { render :json => { :terms => @license_agreement.license_agreement_terms, :uid => visitor.uid } }
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
    @license_agreement = LicenseAgreement.find_by_domain(
      Addressable::URI.parse(request.referer).host
    )
  end
end
