class AddColumnToSubscriptions < ActiveRecord::Migration
  def change
  	add_column :subscriptions, :course_id, :integer
    add_column :subscriptions, :user_id, :integer
  end
end
