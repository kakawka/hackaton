class Visitor < ActiveRecord::Base
  has_many :term_acceptances

  validates :uid, presence: true 
end
