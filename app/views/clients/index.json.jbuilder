json.array!(@clients) do |client|
  json.extract! client, :first_name, :last_name, :city, :street, :zipcode, :country, :latitute, :longitude
  json.url client_url(client, format: :json)
end