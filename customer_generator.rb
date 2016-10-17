require './Customer'

class CustomerGenerator

  def  self.generate_customer
    Customer.new(name: generate_name, surname: generate_surname, age: generate_age, code: generate_code)
  end

  def self.generate_name
    ["Jonas", "Ugne", "Tomas", "Daiva", "Roma", "Paulius", "Petras", "Nojus", "Zigmas", "Maxe"].sample
  end

  def self.generate_surname
    %w{
        Jonaite
        Ugnaitis
        Tomasaite
        Daivaaitis
        Romaaite
        Pauliuaitis
        Petraaite
        Nojuaitis
        Zigmatienis
        Maximaite
    }.sample
  end

  def self.generate_age
    rand(15..42)
  end

  def self.generate_code
    rand(3168684..4968684)
  end
end
