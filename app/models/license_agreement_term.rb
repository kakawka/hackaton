class LicenseAgreementTerm < ActiveRecord::Base
  has_many :term_acceptances
  belongs_to :license_agreement
end
