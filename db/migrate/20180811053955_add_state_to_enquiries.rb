class AddStateToEnquiries < ActiveRecord::Migration[5.2]
  def change
    add_column :enquiries, :state, :integer, default: Enquiry.states[:pending], null: false
  end
end
