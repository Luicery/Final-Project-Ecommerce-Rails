# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
u1 = User.create(name:"Bobby", email:"Bobby@gmail.com", password:"test", address:"19 Tipu Road, Flat Bush Auckland", phone:"+6425205406")
Cart.destroy_all
c1 = Cart.create
Wishlist.destroy_all
w1 = Wishlist.create
Item.destroy_all
i1 = Item.create(title:"Testing", page:0, index:0)
u1.cart = c1
u1.wishlist = w1
u1.cart.items << i1
