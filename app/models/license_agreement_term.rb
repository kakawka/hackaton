class LicenseAgreementTerm < ActiveRecord::Base
  has_many :term_acceptances
end
