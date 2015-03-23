# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

['admin', 'user'].each do |role|
  Role.find_or_create_by({name: role})
end

technologies = Technology.create([{ name: 'Ruby' }, { name: 'HTML' },
  { name: 'CSS' }, { name: 'JavaScript' }])

Theme.create(name: 'Rails', technology_id: Technology.find_by(name: 'Ruby').id)
Theme.create(name: 'OOP in Ruby', technology_id: Technology.find_by(name: 'Ruby').id)
Theme.create(name: 'Syntax Ruby', technology_id: Technology.find_by(name: 'Ruby').id)
Theme.create(name: 'TDD', technology_id: Technology.find_by(name: 'Ruby').id)
Theme.create(name: 'BDD', technology_id: Technology.find_by(name: 'Ruby').id)

Theme.create(name: 'SLIM', technology_id: Technology.find_by(name: 'HTML').id)
Theme.create(name: 'HAML', technology_id: Technology.find_by(name: 'HTML').id)
Theme.create(name: 'HTML5', technology_id: Technology.find_by(name: 'HTML').id)
Theme.create(name: 'Forms', technology_id: Technology.find_by(name: 'HTML').id)

Theme.create(name: 'CSS3', technology_id: Technology.find_by(name: 'CSS').id)
Theme.create(name: 'SASS', technology_id: Technology.find_by(name: 'CSS').id)
Theme.create(name: 'SCSS', technology_id: Technology.find_by(name: 'CSS').id)
Theme.create(name: 'LESS', technology_id: Technology.find_by(name: 'CSS').id)
Theme.create(name: 'Bootstrap', technology_id: Technology.find_by(name: 'CSS').id)
Theme.create(name: 'Zurb Foundation', technology_id: Technology.find_by(name: 'CSS').id)

Theme.create(name: 'ECMAScript', technology_id: Technology.find_by(name: 'JavaScript').id)
Theme.create(name: 'jQuery', technology_id: Technology.find_by(name: 'JavaScript').id)
Theme.create(name: 'extJS', technology_id: Technology.find_by(name: 'JavaScript').id)
Theme.create(name: 'CoffeeScript', technology_id: Technology.find_by(name: 'JavaScript').id)
Theme.create(name: 'TypeScript', technology_id: Technology.find_by(name: 'JavaScript').id)
Theme.create(name: 'AngularJS', technology_id: Technology.find_by(name: 'JavaScript').id)
Theme.create(name: 'EmberJS', technology_id: Technology.find_by(name: 'JavaScript').id)
Theme.create(name: 'ReactJS', technology_id: Technology.find_by(name: 'JavaScript').id)
Theme.create(name: 'MeteorJS', technology_id: Technology.find_by(name: 'JavaScript').id)
Theme.create(name: 'Cross browser', technology_id: Technology.find_by(name: 'JavaScript').id)
