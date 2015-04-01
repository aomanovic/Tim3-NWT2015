json.array!(@people) do |person|
  json.extract! person, :id, :Name, :Surname, :DateOfBirth, :UserTypeID, :Address, :Telephone
  json.url person_url(person, format: :json)
end
