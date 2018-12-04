# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



apple = Stock.create(name: "Apple", ticker: "AAPL")
google = Stock.create(name: "Google", ticker: "GOOGL")
netflix = Stock.create(name: "Netflix",ticker: "NFLX")
nike = Stock.create(name: "Nike", ticker: "NKE")


bobby = User.create(first_name: "Bobby", email: "bhagyaraj01@gmail.com", password: "test")
marju = User.create(first_name: "Marju", email: "test1", password: "test")
gabriel = User.create(first_name: "Gabriel", email: "test2", password: "test")


bobby_apple = UserStock.create(user_id: 1, stock_id: 1)
bobby_google = UserStock.create(user_id: 1, stock_id: 2)
marju_apple = UserStock.create(user_id: 2, stock_id: 1)
gabriel_apple = UserStock.create(user_id: 3, stock_id: 1)
gabriel_nike = UserStock.create(user_id: 3, stock_id: 4)
gabriel_netflix = UserStock.create(user_id: 3, stock_id: 3)


note1 = Note.create(title: "test1", content: "bobby_apple", article_url: "test_url", user_stock_id: 1)
note1_2 = Note.create(title: "test1_2", content: "bobby_apple2", article_url: "test_url", user_stock_id: 1)
note2 = Note.create(title: "test2", content: "bobby_google", article_url: "test_url", user_stock_id: 2)
note3 = Note.create(title: "test3", content: "gabriel_apple", article_url: "test_url", user_stock_id: 4)
note4 = Note.create(title: "test4", content: "gabriel_nike", article_url: "test_url", user_stock_id: 5)

