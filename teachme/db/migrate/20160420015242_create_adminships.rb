class CreateAdminships < ActiveRecord::Migration
  def change
    create_table :adminships do |t|

      t.timestamps null: false
    end
  end
end
