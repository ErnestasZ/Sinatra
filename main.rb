require './customer'
require './customer_generator'
require 'pg'



20.times do
customer = CustomerGenerator.generate_customer
customer.create
end
