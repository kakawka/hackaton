class CreateLicenseAgreements < ActiveRecord::Migration
  def change
    create_table :license_agreements do |t|
      t.string :name
      t.string :domain
      t.references :user, index: true

      t.timestamps
    end
  end
end
