# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.destroy_all

User.create! [
  { username: "Fiorina", password_digest: "abc001" },
  { username: "Trump", password_digest: "abc002" },
  { username: "Carson", password_digest: "abc003" },
  { username: "Clinton", password_digest: "abc004" }
]

User.find_by!(username: "Fiorina").create_profile(first_name: "Carly", last_name: "Fiorina", birth_year: 1954, gender: "female")
User.find_by!(username: "Trump").create_profile(first_name: "Donald", last_name: "Trump", birth_year: 1946, gender: "male")
User.find_by!(username: "Carson").create_profile(first_name: "Ben", last_name: "Carson", birth_year: 1951, gender: "male")
User.find_by!(username: "Clinton").create_profile(first_name: "Hillary", last_name: "Clinton", birth_year: 1947, gender: "female")

User.all.each_with_index do |user, index|
  user.todo_lists.create! [{list_name: "list #{index}", list_due_date: Date.today + 1.year}]
end

TodoList.all.each_with_index do |todo_list, index|
  5.times do |index|
    todo_list.todo_items.create! [{title: "item #{index}", due_date: Date.today + 1.year, description: "item #{index}"}]
  end
end
