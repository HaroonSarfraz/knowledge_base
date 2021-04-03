# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.development?

  ["Rails", "Category 1", "Category 2", "Category 3", "Category 4", "Category 5", "Category 6", "Category 7", "Category 8", "Category 9", "Category 10"].each do |c|
    Category.create(name: c)
  end

  ["New to Rails", "Sub Category 1", "Sub Category 2", "Sub Category 3", "Sub Category 4", "Sub Category 5", "Sub Category 6", "Sub Category 7", "Sub Category 8", "Sub Category 9", "Sub Category 10", "Sub Cat 1", "Sub Cat 2", "Sub Cat 3", "Sub Cat 4", "Sub Cat 5", "Sub Cat 6", "Sub Cat 7", "Sub Cat 8", "Sub Cat 9", "Sub Cat 10"].each do |c|
    SubCategory.create(category: Category.first, name: c)
  end

  a = Article.new
  a.sub_category = SubCategory.first
  a.title = 'Beta'
  a.content = "<title>ABC</title>"
  a.save
end
