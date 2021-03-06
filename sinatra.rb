require 'sinatra/base'
require 'pg'
require './customer'
require './customer_generator'
require 'pry'
require 'pry-nav'


$pg = PGconn.connect("localhost", 5432, '', '', "new_customers")

class ManoApp < Sinatra::Base

  get '/' do
    @per_page = 10
    @page = params['page'].to_i

    @customers = Customer.allll(@per_page, @page)
    @last_page = Customer.count / @per_page
    # binding.pry
    erb :main
  end

  get '/add_customer' do
    @customer = Customer.new(name: '', surname: '', code: nil, age: nil, id: nil)
    erb :add_customer
  end

  get '/customers/:id' do
    @customer = Customer.find(params[:id])
    erb :show_customer
  end

  get '/customers/:id/edit' do
    @customer = Customer.find(params[:id])
    erb :edit_customer
  end

  post '/customers' do
    # binding.pry
    @customer = Customer.find(params[:id])
    @customer.update(params)
    redirect "/customers/#{params[:id]}"

  end

  post '/add_customer' do
    # binding.pry
    @customer = Customer.new(name: params[:name], surname: params[:surname],
                            age: params[:age], code: params[:code], id: nil)
    binding.pry
    @customer.create
    erb :show_customer
    # redirect "/customers/#{params[:id]}"

  end

  def pg
    $pg
  end

end

ManoApp.run!
