class AddStateToCities < ActiveRecord::Migration[5.1]
  def change
    add_column :cities, :state, :string
  end
end
