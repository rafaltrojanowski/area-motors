class CreateEnquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :enquiries do |t|
      t.string :website, null: false

      t.timestamps
    end
  end
end
