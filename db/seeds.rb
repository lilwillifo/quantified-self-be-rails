meal_list = ["Breakfast", "Snack", "Lunch", "Dinner"]

meal_list.each do |name|
  meal = Meal.create!(name: name)
end
