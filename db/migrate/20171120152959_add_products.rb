class AddProducts < ActiveRecord::Migration[5.1]
  def change
  	Product.create ({
  		:title => 'Papperoni',
  		:description => 'Papperoni Cheese Pizza', 
  		:price => 120, :size => 40, 
  		:is_spicy => true, 
  		:is_veg => false, 
  		:is_best_offer => false, 
  		:path_to_image => '/images/papperoni.jpg'
  		})

  	Product.create ({
  		:title => 'Hawaii', 
  		:description => 'Hawaii Chicken Pizza', 
  		:price => 140,
  		:size => 40, 
  		:is_spicy => true, 
  		:is_veg => false, 
  		:is_best_offer => false, 
  		:path_to_image => '/images/hawaii.jpg'
  		})

  	Product.create ({
  		:title => 'Vegpizza', 
  		:description => 'Nice Vegetarian pizza', 
  		:price => 130, 
  		:size => 40, 
  		:is_spicy => false, 
  		:is_veg => true, 
  		:is_best_offer => false, 
  		:path_to_image => '/images/vegpizza.jpg'
  		})

  end
end
