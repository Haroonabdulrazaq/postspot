# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Article.create([{ title: 'Why do we use it?',
                  text: 'It is a long established fact that a reader will be distracted by the readable content',
                  user_id: 1, category_id: 1 }])
Category.create([ { name: 'Business', priority: 1 },
                  { name: 'Sport', priority: 2 },
                  { name: 'Fashion', priority: 3 },
                  { name: 'Entertainment', priority: 4 }
])
