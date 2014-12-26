json.array!(@notes) do |note|
  json.extract! note, :id, :plane_id, :title, :state, :user_id
  json.url note_url(note, format: :json)
end
