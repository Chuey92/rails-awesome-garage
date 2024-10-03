# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Destroy all previous records in the correct order
Favorite.destroy_all
Review.destroy_all
Car.destroy_all # Cars must be destroyed before owners to prevent foreign key violations
Owner.destroy_all

# Create owners and store them in variables
owner1 = Owner.create!(nickname: "JohnDoe")
owner2 = Owner.create!(nickname: "JaneSmith")
owner3 = Owner.create!(nickname: "MikeJohnson")

# Create cars and associate them with owners using foreign keys
Car.create!(
  brand: "Toyota",
  model: "Camry",
  year: 2020,
  fuel: "Gasoline",
  owner_id: owner1.id
)

Car.create!(
  brand: "Honda",
  model: "Civic",
  year: 2021,
  fuel: "Gasoline",
  owner_id: owner2.id
)

# Adding a third car
Car.create!(
  brand: "Ford",
  model: "Mustang",
  year: 2019,
  fuel: "Gasoline",
  owner_id: owner3.id
)

# Optionally create reviews
Review.create!(
  comment: "Great performance!",
  rating: 9,
  car_id: Car.first.id
)

Review.create!(
  comment: "Comfortable and fuel-efficient.",
  rating: 8,
  car_id: Car.second.id
)

# Optionally create favorites
Favorite.create!(car_id: Car.first.id)
Favorite.create!(car_id: Car.third.id)
