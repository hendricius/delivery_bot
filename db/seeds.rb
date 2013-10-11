def sample_headquarter
  Headquarter.first || Headquarter.create(name: "Headquarter 1")
end

def sample_company(optional_args = {})
  hash = {
    name: "Company " + SecureRandom.hex(5),
    street: "Teststreet",
    zipcode: 37075,
    city: "Göttingen",
    country: "DE"
  }
  hash = hash.merge(optional_args)
  sample_headquarter.companies.create(hash)
end

def sample_client(optional_args = {})
  hash = {
    first_name: "User" + SecureRandom.hex(5),
    last_name: "User",
    street: "Teststreet",
    zipcode: 37075,
    city: "Göttingen",
    country: "DE"
  }
  hash = hash.merge(optional_args)
  Client.create(hash)
end

def sample_driver(optional_args = {})
  hash = {
    name: "Driver " + SecureRandom.hex(5),
    street: "Teststreet",
    zipcode: 37075,
    city: "Göttingen",
    phone: 123123,
    max_capacity: rand(Driver::CAPACITY),
    country: "DE"
  }
  hash = hash.merge(optional_args)
  sample_headquarter.drivers.create(hash)
end


sample_headquarter

company1 = sample_company(name: "Risotto Göttingen GmbH", zipcode: "37073", street: "Weender Landstraße 3")
company2 = sample_company(name: "Jenny's Pizza Göttingen Nord", zipcode: "37075", street: "An der Lutter 22")
sample_company(name: "Eat a Pizza Göttingen Nord", zipcode: "37075", street: "Weender Landstraße 77")
sample_company(name: "Jenny's Pizza Göttingen Süd", zipcode: "37078", street: "Geismar Landstraße 36")

client1 = sample_client(first_name: "Hendrik", street: "Kreuzbergring 4", zipcode: 37075)
client2 = sample_client(first_name: "Bene", street: "Kreuzbergring 28", zipcode: 37075)
client3 = sample_client(first_name: "Sarah", street: "Zimmermannstraße 5", zipcode: 37075)
client4 = sample_client(first_name: "Torkonen", street: "Waldweg 2", zipcode: 37075)
client5 = sample_client(first_name: "Wolverine", street: "Platz der Göttinger Sieben 5", zipcode: 37075)
client6 = sample_client(first_name: "Storm", street: "Philipp Reiss Straße 1", zipcode: 37075)

sample_driver(name: "Luigi", street: "Von Ossietzky Str. 1",  zipcode: 37085)
sample_driver(name: "Mario", street: "Göttinger Str. 41",  zipcode: 37124)
sample_driver(name: "Bowser", street: "Kurze-Geismar-Str. 41",  zipcode: 37073)

client1.orders.create(company: company1, content: "1 * Suflaki", capacity: rand(Order::CAPACITY))
client2.orders.create(company: company2, content: "2 * Pizzabrötchen", capacity: rand(Order::CAPACITY))
client3.orders.create(company: company1, content: "1 * Suflaki", capacity: rand(Order::CAPACITY))
client4.orders.create(company: company2, content: "2 * Pizzabrötchen", capacity: rand(Order::CAPACITY))
client5.orders.create(company: company2, content: "2 * Sucuk", capacity: rand(Order::CAPACITY))
client6.orders.create(company: company2, content: "2 * Salami", capacity: rand(Order::CAPACITY))
