class LicenseAgreement < ActiveRecord::Base
  belongs_to :user
  has_many :license_agreement_terms
  has_many :lecense_agreement_acceptances
  accepts_nested_attributes_for :license_agreement_terms

  validates :name, :domain, :user_id, presence: true
end
