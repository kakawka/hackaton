class EditLicenseAgreementAcceptance < ActiveRecord::Migration
  def change
    rename_column :license_agreement_acceptances, :linense_agreement_id, :license_agreement_id
  end
end
