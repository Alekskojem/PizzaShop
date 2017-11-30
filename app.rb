#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:pizzashop.db"

class Product < ActiveRecord::Base
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

post '/cart' do
	orders_input = params[:orders]
	@orders = parse_orders_input orders_input
	erb 'Hello! #{@orders.inspect}'
	end
def parse_orders_input orders_input
	s1 = orders_input.split(/,/)
	arr = []
	s1.each do |x|
		s2 = x.split(/\=/)

		id = s3[1]
		cnt = s2[1]

		arr2 = [id, cnt]
		arr.push arr2
	end
	return arr
end

