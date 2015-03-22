json.(@search_results) do |search_result|
  json.partial! search_result
end
