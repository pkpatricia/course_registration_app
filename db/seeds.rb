# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env.development?
    
    email = "admin@example.com"
    if Admin.find_by_email(email).blank?
      Admin.create! email: email, password: email, password_confirmation: email
    end
    
    names = ['Jim OKely', 'Bob Dylan', 'Scrooge McDuck']
    names.each {|name| Instructor.find_or_create_by name: name }
  
    Course.find_or_create_by name: "clown carmanship", description: 'some description here', location: "interwebs", instructor: Instructor.first
    Course.find_or_create_by name: "Speaking stupid", description: 'learn how to talk like an idiot', location: "washington", instructor: Instructor.last
    Course.find_or_create_by name: "Underwater breathing", description: 'some description here', location: "Pacific Ocean", instructor: Instructor.last

  
  users = [['Stephanie Thomas', 'stephaniethomas@example.com'], 
              ['Brian Williams', 'brian.williams@example.com']]
  users.each do |user|
    next if User.exists?(email: user[1])
    User.create(name: user[0], email: user[1], 
                password: user[1], password_confirmation: user[1])
    end
end
