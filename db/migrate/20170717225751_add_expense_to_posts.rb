class AddExpenseToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :expense, :integer 
  end
end
