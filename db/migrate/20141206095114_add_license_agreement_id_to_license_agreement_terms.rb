class AddLicenseAgreementIdToLicenseAgreementTerms < ActiveRecord::Migration
  def change
    add_reference :license_agreement_terms, :license_agreement, index: true
  end
end
