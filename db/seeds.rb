# 1. Clean the database 🗑️
puts "Cleaning database..."
Recipe.destroy_all

# 2. Create the instances 🏗️
puts "Creating recipes..."
Recipe.create!(
  name: "Mac and Chesse",
  description: "A creammy pasta bake",
  image_url: "https://plus.unsplash.com/premium_photo-1667233388252-58a70af76dc5?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  rating: 4.1)
puts "Created Mac and Chesse"
Recipe.create!(
  name: "Jerk Chicken",
  description: "A jamaican classic bbq technique",
  image_url: "https://plus.unsplash.com/premium_photo-1701294740099-f52cbfbe3adb?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  rating: 4.9)
puts "Created Jerk Chicken"
Recipe.create!(
  name: "Jollof Rice",
  description: "West african rice",
  image_url: "https://images.unsplash.com/photo-1664993101841-036f189719b6?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  rating: 3.8)
puts "Created Jollof Rice"
Recipe.create!(
  name: "Burger",
  description: "Meat patty between 2 buns",
  image_url: "https://plus.unsplash.com/premium_photo-1683619761492-639240d29bb5?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  rating: 4.2)
puts "Created Burger"

# 3. Display a message 🎉
puts "Finished! Created #{Recipe.count} recipes."
