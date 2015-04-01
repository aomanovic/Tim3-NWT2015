json.array!(@ed_links) do |ed_link|
  json.extract! ed_link, :id, :EvidentionID, :DiagnoseID, :Description
  json.url ed_link_url(ed_link, format: :json)
end
