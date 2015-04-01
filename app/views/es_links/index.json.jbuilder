json.array!(@es_links) do |es_link|
  json.extract! es_link, :id, :EvidentionID, :SymptomID, :Description
  json.url es_link_url(es_link, format: :json)
end
