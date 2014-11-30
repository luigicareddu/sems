json.array!(@planes) do |plane|
  json.extract! plane, :id, :ac_type, :name, :status
  json.url plane_url(plane, format: :json)
end
