class LicenseAgreementAcceptance < ActiveRecord::Base
  belongs_to :visitor
  belongs_to :linense_agreement
end
