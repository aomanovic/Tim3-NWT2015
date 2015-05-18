# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
UserType.create([{user_type: 'administrator'},{user_type: 'pacijent'},{user_type: 'osoblje'}])

User.create([{firstname: 'Adnan', lastname: 'Omanovic', email: 'ndwwlcjn@sharklasers.com', username: 'aomanovic', password_digest: '$2a$10$q.sBXyW.unnJBfBIOj63XOaie82su84cnQ7DrAcnp6X6wrJAlLvm.', is_active: 1, user_type_id: 1 }])
