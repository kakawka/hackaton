require 'digest/md5'

class Visitor < ActiveRecord::Base
  has_many :term_acceptances
  # validates :uid, presence: true

  def self.find_or_create(uid)
    visitor = Visitor.find_by_uid(uid)
    if visitor.nil?
      visitor = Visitor.create(:uid => uid)
      if uid.blank?
        visitor.update_column :uid, Digest::MD5.hexdigest("#{visitor.id}#{visitor.created_at}")
      end
    end
    visitor
  end
end
