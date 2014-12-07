class LicenseAgreement < ActiveRecord::Base
  belongs_to :user
  has_many :license_agreement_terms
  has_many :license_agreement_acceptances
  accepts_nested_attributes_for :license_agreement_terms, :reject_if => :all_blank, :allow_destroy => true


  validates :name, :domain, :user_id, presence: true
end
