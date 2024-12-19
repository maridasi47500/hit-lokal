# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#require "nokogiri"
#Cat.all.destroy_all
#@x=File.read("./moncode.html")
#@code=Nokogiri::HTML(@x)
#@code.children[1].children[0].children.each do |cat|
#Cat.create(name:cat.inner_html.strip.squish)
#end
#Artist.left_joins(:clips).select("artists.*, count(clips.id) as mycount").group("artists.id").having("mycount = 0").destroy_all
Clip.all.each do |clip|
View.create(clip_id:clip.id, created_at: Date.today.monday)
View.create(clip_id:clip.id, created_at: Date.today.last_week.monday)
View.create(clip_id:clip.id, created_at: Date.today.last_week.last_week.monday)
end
