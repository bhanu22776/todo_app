# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: 'Developer 1', email: 'developer1@abc.com', password: '123')
User.create(name: 'Developer 2', email: 'developer2@abc.com', password: '123')
User.create(name: 'Developer 3', email: 'developer3@abc.com', password: '123')
manager = User.create(name: 'Admin', email: 'manager@abc.com', password: '123')
manager.add_role(:admin)
