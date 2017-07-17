class AddTotalFundsToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :total_funds, :integer
  end
end
