json.(@users) do |user|
  json.partial! user
end