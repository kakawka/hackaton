class CreateLicenseAgreementAcceptances < ActiveRecord::Migration
  def change
    create_table :license_agreement_acceptances do |t|
      t.references :visitor, index: true
      t.references :linense_agreement, index: true
      t.boolean :accepted

      t.timestamps
    end
  end
end
