class AddVehicleDetailsColumnsToEnquiries < ActiveRecord::Migration[5.2]
  def change
    add_column :enquiries, :make, :string
    add_column :enquiries, :model, :string
    add_column :enquiries, :colour, :string
    add_column :enquiries, :year, :string
    add_column :enquiries, :reference, :string
  end
end
