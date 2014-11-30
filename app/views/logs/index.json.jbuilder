json.array!(@logs) do |log|
  json.extract! log, :id, :plane_id, :text, :status, :user_id
  json.url log_url(log, format: :json)
end
