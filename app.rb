#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:pizzashop.db"

class Product < ActiveRecord::Base
end

class Order < ActiveRecord::Base
	end

#class Client < ActiveRecord::Base
#end
#validates :name, presence: true, length: { minimum: 3 }
#validates :phone, presence: true
#validates :adress, presence: true

get '/' do
@products = Product.all 
	erb :index
end

get '/about' do
	erb :about
end

get '/something' do
	erb :something
end

get '/contacts' do
	erb :contacts
end

post '/place_order' do
	@order = Order.create params[:order]
	erb :order_placed
end

post '/cart' do
	# Получаем orders-списпк параметров и разбираем (parse) их
	@orders_input = params[:orders_input] 
	# Глобальная переменная коорую будем использовать во вьюхе
	@items = parse_orders_input @orders_input 
	#Выводим сообщение о том что корзина пуста
	if @items.length == 0
		return erb :cart_is_empty
	end
	# Выводим список продуктов в корзине
	@items.each do |item| 
		# Вывод объектана на страничку сайта
		item[0] = Product.find(item[0]) 
	end
	# Возвращаем представление по умолчанию
	erb :cart
end
# Функция которая будет возвращать нам данные массива, строки которую разбивали.
def parse_orders_input orders_input 
	s1 = orders_input.split(/,/)
	arr = []
	s1.each do |x|
		# Регулярное віражение в скобках с слешами.
		s2 = x.split(/\=/) 

		s3 = s2[0].split(/_/)

		id = s3[1]
		cnt = s2[1]

		arr2 = [id, cnt]
		arr.push arr2
	end
	return arr
end

