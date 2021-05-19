Category.destroy_all
Product.destroy_all
State.destroy_all
Patient.destroy_all

CATEGORIES.each do |category|
  Category.create!(
    name: category
  )
end

PRODUCTS.each do |product|
  category = Category.find_by(name: product[:category])
  Product.create!(
    name: product[:name],
    ndc: product[:ndc],
    quantity: product[:qty],
    price: product[:price],
    instructions: product[:instructions],
    category_id: category.id
  )
rescue StandardError => e
  puts "Product not found: #{product}"
end

STATES.each do |state|
  State.create!(
    name: state[0],
    code: state[1],
    active: state[2],
    minimum_age: state[3]
  )
end
