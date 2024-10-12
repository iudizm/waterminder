class AddDailyGoalToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :daily_goal, :integer
  end
end
