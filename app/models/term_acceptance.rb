class TermAcceptance < ActiveRecord::Base
  belongs_to :visitor
  belongs_to :license_agreement_term
end
