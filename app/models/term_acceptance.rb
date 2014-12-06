class TermAcceptance < ActiveRecord::Base
  belongs_to :visitor
  belongs_to :license_agreement_term

  def as_json(options)
    {
      :code => self.license_agreement_term.code,
      :accepted => self.accepted
    }
  end
end
