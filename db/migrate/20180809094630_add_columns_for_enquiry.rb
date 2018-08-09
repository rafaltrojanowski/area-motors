class AddColumnsForEnquiry < ActiveRecord::Migration[5.2]
  def change
    add_column :enquiries, :name, :string
    add_column :enquiries, :email, :string
    add_column :enquiries, :message, :text
    add_column :enquiries, :source, :string
  end
end
