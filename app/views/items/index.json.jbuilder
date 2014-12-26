json.array!(@items) do |item|
  json.extract! item, :id, :text, :user_id, :note_id
  json.url item_url(item, format: :json)
end
