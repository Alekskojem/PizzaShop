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
	@orders_input = params[:orders_input] # Получаем orders из параметров.
	@items = parse_orders_input @orders_input # Глобальная переменная коорую будем использовать во вьюхе

	@items.each do |item| # Делаем запрос для каждого элемента
		item[0] = Product.find(item[0]) # Вывод объектана на страничку сайта
	end

	erb :cart
end

def parse_orders_input orders_input # Функция которая будет возвращать нам данные массива, строки которую разбивали.
	s1 = orders_input.split(/,/)
	arr = []
	s1.each do |x|
		s2 = x.split(/\=/) # Регулярное віражение в скобках с слешами.

		s3 = s2[0].split(/_/)

		id = s3[1]
		cnt = s2[1]

		arr2 = [id, cnt]
		arr.push arr2
	end
	return arr
end

