class CreateClients < ActiveRecord::Migration[5.1]
  def change
  	create_table :clients do |t|
  			t.text :name
  			t.text :phone
  			t.text :adress
  			
  			t.timestamp
  end
end
end
