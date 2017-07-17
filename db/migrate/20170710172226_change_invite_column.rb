class ChangeInviteColumn < ActiveRecord::Migration
  def change
    rename_column :invites, :user_group_id, :place_id
  end
end
