class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :title
      t.text :description
      t.integer :budget
      t.date :date_response_by
      t.date :date_request_executed
      t.string :location
      t.string :company_name
      t.text :address
      t.string :category
      t.string :sub_category

      t.timestamps
    end
  end
end
