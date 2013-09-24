json.array!(@headquarters) do |headquarter|
  json.extract! headquarter, :name
  json.url headquarter_url(headquarter, format: :json)
end