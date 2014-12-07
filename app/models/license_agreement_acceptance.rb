class LicenseAgreementAcceptance < ActiveRecord::Base
  belongs_to :visitor
  belongs_to :license_agreement
end
