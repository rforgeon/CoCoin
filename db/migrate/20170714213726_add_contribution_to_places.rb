class AddContributionToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :contribution, :integer
  end
end
