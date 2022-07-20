# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(name: 'Tommy', photo: 'https://www.istockphoto.com/vector/businessman-icon-vector-symbol-for-web-flat-design-gm1390193778-447241583', bio: 'Driver from Tunisia.', posts_counter: 0)
User.create(name: 'Sillia', photo: 'https://www.istockphoto.com/vector/businessman-avatar-icon-gm1298227218-391128738', bio: 'Doctor from Egypt', posts_counter: 0)
User.create(name: 'Sarah', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Morocco.', posts_counter: 0)
User.create(name: 'Mike', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Engineer from Algeria', posts_counter: 0)
User.create(name: 'Selma', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', email: 'selma@gmail.com', password: 'selma123'