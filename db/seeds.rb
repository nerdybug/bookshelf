# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_list = [
    ["test_user1", "testing1"],
    ["test_user2", "testing2"]
]

user_list.each do |name, password|
    User.create(name: name, password: password)
end

author_list = [
    "test_author1", 
    "test_author2"
]

author_list.each do |name|
    Author.create(name: name)
end
test_user1 = User.find_by(name: "test_user1")
test_user2 = User.find_by(name: "test_user2")
test_author1 = Author.find_by(name: "test_author1")
test_author2 = Author.find_by(name: "test_author2")
book_list = [
    ["test_book1", test_user1.id, test_author1.id], 
    ["test_book2", test_user2.id, test_author2.id]
]

book_list.each do |title, user_id, author_id|
    Book.create(title: title, user_id: user_id, author_id: author_id)
end
