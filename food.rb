class Food
  attr_reader :name, :carbs, :protein, :fat, :fiber, :calories, :servings
  def initialize(name:, carbs:, protein:, fat:, fiber:, calories:)
    @name = name
    @carbs = carbs
    @protein = protein
    @fat = fat
    @fiber = fiber
    @calories = calories
    @servings = 1
  end
end

class Meal
  attr_accessor :foods, :day

  ATTRIBUTES = [:carbs, :protein, :fat, :fiber, :calories]

  def add_food(food, quantity = 1)
    @foods ||= []
    @quantity = quantity
    while (@quantity != 0)
      @foods.push(food)
      @quantity -= 1
    end
  end

  def stats
    puts "Carbs: #{carbs}, Protein: #{protein}, Fat: #{fat}, fiber: #{fiber}, calories: #{calories}"
    puts "Carbs: #{carbs - @day.carbs_per_meal}, Protein: #{protein - @day.protein_per_meal}, Fat: #{fat - @day.fat_per_meal}, fiber: #{fiber - @day.fiber_per_meal}, calories: #{calories - @day.calories_per_meal}"
    puts "#{@foods.map { |f| f.name }}"
  end

  def carbs
    @foods.map { |f| f.carbs}.inject(:+)
  end
  def protein
    @foods.map { |f| f.protein}.inject(:+)
  end
  def fat
    @foods.map { |f| f.fat}.inject(:+)
  end
  def fiber
    @foods.map { |f| f.fiber}.inject(:+)
  end
  def calories
    @foods.map { |f| f.calories}.inject(:+)
  end

end

class Day
  attr_accessor :meals, :carbs, :protein, :fat, :fiber, :calories

  def initialize(carbs:, protein:, fat:, fiber:, calories:)
    @meals = []
    @carbs = carbs
    @protein = protein
    @fat = fat
    @fiber = fiber
    @calories = calories
  end

  def add_meal(meal)
    @meals.push(meal) unless meal == nil
    meal.day = self
  end

  def stats
    puts "Carbs: #{total_carbs}, Protein: #{total_protein}, Fat: #{total_fat}, fiber: #{total_fiber}, calories: #{total_calories}"
    puts "Carbs: #{total_carbs - @carbs}, Protein: #{total_protein - @protein}, Fat: #{total_fat - @fat}, fiber: #{total_fiber - @fiber}, calories: #{total_calories - @calories}"
  end

  def carbs_per_meal
    @carbs / @meals.count
  end

  def protein_per_meal
    @protein / @meals.count
  end

  def fat_per_meal
    @fat / @meals.count
  end

  def fiber_per_meal
    @fiber / @meals.count
  end

  def calories_per_meal
    @calories / @meals.count
  end

  def total_carbs
    @meals.map { |f| f.carbs}.inject(:+)
  end
  def total_protein
    @meals.map { |f| f.protein}.inject(:+)
  end
  def total_fat
    @meals.map { |f| f.fat}.inject(:+)
  end
  def total_fiber
    @meals.map { |f| f.fiber}.inject(:+)
  end
  def total_calories
    @meals.map { |f| f.calories}.inject(:+)
  end
end

@egg = Food.new(name: "egg", carbs: 0, protein: 6, fat: 5, fiber: 0, calories: 70)
@butter = Food.new(name: "butter", carbs: 0, protein: 0, fat: 12, fiber: 0, calories: 102)
@chicken = Food.new(name: "chicken", carbs: 0, protein: 21, fat: 1, fiber: 0, calories: 120)
@veggies = Food.new(name: "veggies", carbs: 8, protein: 1, fat: 0, fiber: 2, calories: 40)
@tilapia = Food.new(name: "tilapia", carbs: 0, protein: 23, fat: 2, fiber: 1, calories: 110)
@rice = Food.new(name: "rice", carbs: 35, protein: 3, fat: 0, fiber: 0, calories: 150)
@salmon = Food.new(name: "salmon", carbs: 0, protein: 37, fat: 20, fiber: 0, calories: 340)
@bread = Food.new(name: "bread", carbs: 15, protein: 3, fat: 0, fiber: 0, calories: 150)
@mixed_berries = Food.new(name: "mixed berries", carbs: 17, protein: 1, fat: 0, fiber: 3, calories: 70)
@blueberries = Food.new(name: "blueberries", carbs: 18, protein: 0, fat: 0, fiber: 6, calories: 60)
@almond_milk = Food.new(name: "almond milk", carbs: 2, protein: 1, fat: 2, fiber: 0, calories: 30)
@peanut_butter = Food.new(name: "peanut butter", carbs: 8, protein: 7, fat: 16, fiber: 0, calories: 190)
@banana = Food.new(name: "banana", carbs: 27, protein: 1, fat: 0, fiber: 3, calories: 105)
@cucumber = Food.new(name: "cucumber", carbs: 2, protein: 0, fat: 0, fiber: 0, calories: 8)
@spinach = Food.new(name: "spinach", carbs: 1, protein: 1, fat: 0, fiber: 1, calories: 7)
@black_beans = Food.new(name: "black beans", carbs: 25, protein: 7, fat: 1, fiber: 6, calories: 140)
@avocado = Food.new(name: "avocado", carbs: 12, protein: 3, fat: 21, fiber: 10, calories: 234)


@b = Meal.new
@s = Meal.new
@l = Meal.new
@d = Meal.new
@day = Day.new(carbs: 245, protein: 160, fat: 80, fiber: 45, calories: 2341)

@day.add_meal(@b)
@day.add_meal(@l)
@day.add_meal(@s)
@day.add_meal(@d)

@b.add_food(@egg, 4)
@b.add_food(@butter, 1)
@b.add_food(@black_beans, 2)
puts "Breakfast:"
@b.stats
puts ""

@s.add_food(@spinach, 4)
@s.add_food(@cucumber, 3)
@s.add_food(@avocado, 1)
@s.add_food(@banana, 1)
puts "Veggie Shake:"
@s.stats
puts ""

@l.add_food(@chicken, 4)
@l.add_food(@veggies, 2)
@l.add_food(@rice, 2)
puts "Lunch:"
@l.stats
puts ""

@d.add_food(@salmon, 1)
@d.add_food(@rice, 1)
@d.add_food(@veggies, 2)
puts "Dinner:"
@d.stats
puts ""



puts "Totals:"
@day.stats
puts ""

exit
