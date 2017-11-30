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
	erb :hello
	end

