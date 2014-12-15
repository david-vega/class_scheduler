json.(@reservations) do |reservation|
  json.partial! reservation
end
