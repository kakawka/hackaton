class CreateLicenseAgreementTerms < ActiveRecord::Migration
  def change
    create_table :license_agreement_terms do |t|
      t.string :code
      t.text :text
      t.integer :sort

      t.timestamps
    end
  end
end
