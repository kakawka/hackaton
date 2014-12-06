class RemoveAcceptedAtFromTermAcceptance < ActiveRecord::Migration
  def change
    remove_column :term_acceptances, :accepted_at, :datatime
  end
end
