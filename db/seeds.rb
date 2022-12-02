# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "deleting previous users..."
User.destroy_all
puts "finished deleting"

puts "\n"
puts "--------------------"
puts "\n"

puts "adding new user..."

User.create(open_id: "test_open_id", name: "路人甲", avatar_url: "https://media.istockphoto.com/id/1401980646/photo/3d-rendered-classic-sculpture-metaverse-avatar-with-network-of-low-poly-glowing-purple-lines.jpg?b=1&s=170667a&w=0&k=20&c=nLf9fDcHVLZ9bPijP5QQrj0apVLdPXITVF6EAMqj1rg=", role: "audience")
User.create(open_id: "test_open_id", name: "路人乙", avatar_url: "https://media.istockphoto.com/id/1369419005/photo/group-of-people-multicolor-peoples-background-teamwork-and-unity-concept.jpg?b=1&s=170667a&w=0&k=20&c=Hb5UrCI1mYg5yc42ixYUHceQ_jixEmI8oKJ3PxKGyDc=", role: "club holder")

puts "finished adding, #{User.count} users have been added."

puts "deleting previous shows..."
Show.destroy_all
puts "finished deleting"

puts "\n"
puts "--------------------"
puts "\n"

puts "adding new shows..."

Show.create(name: "新人赛", description: "仅限新人", poster_url: "https://images.unsplash.com/photo-1580130601254-05fa235abeab?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHBvc3RlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60", address: "延平路425", club_name: "俱乐部A", date: "12/02/2022", time: "19:00", comedian_name: "一号嘉宾", organizer_name: "路人乙")
Show.create(name: "爆梗赛", description: "娱乐至上", poster_url: "https://images.unsplash.com/photo-1562448079-b5631888445f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHBvc3RlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60", address: "中山南路", club_name: "喜剧联合国", date: "12/04/2022", time: "19:30", comedian_name: "二号嘉宾", organizer_name: "路人乙")

puts "finished adding, #{Show.count} shows have been added."
