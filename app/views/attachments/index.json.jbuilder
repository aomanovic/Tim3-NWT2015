json.array!(@attachments) do |attachment|
  json.extract! attachment, :id, :EvidentionID, :Image
  json.url attachment_url(attachment, format: :json)
end
