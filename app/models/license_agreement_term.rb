class LicenseAgreementTerm < ActiveRecord::Base
  has_many :term_acceptances
  belongs_to :license_agreement

  validates :text, :license_agreement_id, :code, presence: true 
end
