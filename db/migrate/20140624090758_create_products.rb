class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.attachment :avatar
      t.attachment :resume

      t.timestamps
    end
  end
end
