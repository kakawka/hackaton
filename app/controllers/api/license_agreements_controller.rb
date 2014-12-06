class Api::LicenseAgreementsController < ApplicationController
  def terms
    @license_agreement = LicenseAgreement.find_by_domain(params[:domain])
    respond_to do |format|
      format.json { render :json => { :terms => @license_agreement.license_agreement_terms } }
    end
  end
end
