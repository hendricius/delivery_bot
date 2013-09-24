json.array!(@companies) do |company|
  json.extract! company, :headquarter_id, :name, :street, :city, :country, :zipcode
  json.url company_url(company, format: :json)
end