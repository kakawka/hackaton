class CreateTermAcceptances < ActiveRecord::Migration
  def change
    create_table :term_acceptances do |t|
      t.references :visitor, index: true
      t.references :license_agreement_term, index: true
      t.boolean :accepted
      t.datetime :accepted_at

      t.timestamps
    end
  end
end
