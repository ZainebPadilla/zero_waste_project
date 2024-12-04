# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

RawMaterial.destroy_all

RawMaterial.create!([ 
    {aliment_name: "Boeuf", co2_per_kg: 27, waste_rate: 0.20},
    {aliment_name: "Agneau", co2_per_kg: 24, waste_rate: 0.20},
    {aliment_name: "Fromage", co2_per_kg: 13.5, waste_rate: 0.15},
    {aliment_name: "Porc", co2_per_kg: 7, waste_rate: 0.10},
    {aliment_name: "Poulet", co2_per_kg: 6, waste_rate: 0.10},
    {aliment_name: "Oeufs", co2_per_kg: 4.5, waste_rate: 0.08},
    {aliment_name: "Riz", co2_per_kg: 4, waste_rate: 0.10},
    {aliment_name: "Pain", co2_per_kg: 1.6, waste_rate: 0.05},
    {aliment_name: "Pomme de terre", co2_per_kg: 0.5, waste_rate: 0.15},
    {aliment_name: "Pommes", co2_per_kg: 0.6, waste_rate: 0.30},
    {aliment_name: "Tomates", co2_per_kg: 1.4, waste_rate: 0.20},
    {aliment_name: "Chocolat", co2_per_kg: 19, waste_rate: 0.05},
    {aliment_name: "Café", co2_per_kg: 15, waste_rate: 0.05},
    {aliment_name: "Huile d'olive", co2_per_kg: 6, waste_rate: 0.03},
    {aliment_name: "Carottes", co2_per_kg: 0.25, waste_rate: 0.20},
    {aliment_name: "Bananes", co2_per_kg: 0.9, waste_rate: 0.25},
    {aliment_name: "Poivrons", co2_per_kg: 1.1, waste_rate: 0.20},
    {aliment_name: "Haricots verts", co2_per_kg: 0.4, waste_rate: 0.18},
])

puts "20 aliments ont été créés avec succès !"
