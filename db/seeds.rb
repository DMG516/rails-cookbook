require "open-uri"
require "json"

# 1. Clean the database 🗑️
puts "Cleaning database..."
Bookmark.destroy_all
Recipe.destroy_all


# 2. Create the instances 🏗️
puts "Creating recipes..."

categories = ['Breakfast', 'Pasta', 'Seafood', 'Dessert']

def recipe_builder(id)
  url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=#{id}"
  meals_serialized = URI.parse(url).read
  meal = JSON.parse(meals_serialized)['meals'][0]

  puts "Creating #{meal['strMeal']}"
  Recipe.create!(
    name: meal['strMeal'],
    description: meal['strInstructions'],
    image_url: meal['strMealThumb'],
    rating: rand(2..5.0).floor(1)
  )
end

categories.each do |category|
  url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=#{category}"
  recipes_serialized = URI.parse(url).read
  recipes = JSON.parse(recipes_serialized)
  recipes['meals'].take(5).each do |recipe|
    recipe_builder(recipe['idMeal'])
  end
end



# Recipe.create!(
#   name: "Mac and Chesse",
#   description: "A creammy pasta bake",
#   image_url: "https://plus.unsplash.com/premium_photo-1667233388252-58a70af76dc5?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
#   rating: 4.1)
# puts "Created Mac and Chesse"
# Recipe.create!(
#   name: "Jerk Chicken",
#   description: "A jamaican classic bbq technique",
#   image_url: "https://plus.unsplash.com/premium_photo-1701294740099-f52cbfbe3adb?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
#   rating: 4.9)
# puts "Created Jerk Chicken"
# Recipe.create!(
#   name: "Jollof Rice",
#   description: "West african rice",
#   image_url: "https://images.unsplash.com/photo-1664993101841-036f189719b6?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
#   rating: 3.8)
# puts "Created Jollof Rice"
# Recipe.create!(
#   name: "Burger",
#   description: "Meat patty between 2 buns",
#   image_url: "https://plus.unsplash.com/premium_photo-1683619761492-639240d29bb5?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
#   rating: 4.2)
# puts "Created Burger"

# 3. Display a message 🎉
puts "Finished! Created #{Recipe.count} recipes."
