# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

OrderStatus.create(status: 'PROCESSING') unless OrderStatus.exists?(status: 'PROCESSING')
OrderStatus.create(status: 'COMPLETED') unless OrderStatus.exists?(status: 'COMPLETED')

