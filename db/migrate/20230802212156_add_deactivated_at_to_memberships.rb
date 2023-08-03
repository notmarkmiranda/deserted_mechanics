class AddDeactivatedAtToMemberships < ActiveRecord::Migration[7.0]
  def change
    add_column :memberships, :deactivated_at, :datetime
    remove_column :memberships, :active, :boolean
    remove_column :memberships, :deleted_at, :datetime
  end
end
