json.array!(@drivers) do |driver|
  json.extract! driver, :headquarter_id, :name, :phone, :home_latitude, :home_longitude
  json.url driver_url(driver, format: :json)
end