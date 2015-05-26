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
  attr_accessor :foods

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
    puts "Carbs: #{carbs - 110}, Protein: #{protein - 42}, Fat: #{fat - 19}, fiber: #{fiber - 15}, calories: #{calories - 777}"
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

class TotalDay
  attr_accessor :meals

  def initialize
    @meals = []
  end

  def add_meal(meal)
    @meals.push(meal) unless meal == nil
  end

  def stats
    puts "Carbs: #{carbs}, Protein: #{protein}, Fat: #{fat}, fiber: #{fiber}, calories: #{calories}"
    puts "Carbs: #{carbs - 330}, Protein: #{protein - 127}, Fat: #{fat - 56}, fiber: #{fiber - 46}, calories: #{calories - 2330}"
  end

  def carbs
    @meals.map { |f| f.carbs}.inject(:+)
  end
  def protein
    @meals.map { |f| f.protein}.inject(:+)
  end
  def fat
    @meals.map { |f| f.fat}.inject(:+)
  end
  def fiber
    @meals.map { |f| f.fiber}.inject(:+)
  end
  def calories
    @meals.map { |f| f.calories}.inject(:+)
  end
end

@egg = Food.new(name: "egg", carbs: 0, protein: 6, fat: 5, fiber: 0, calories: 70)
@butter = Food.new(name: "butter", carbs: 0, protein: 0, fat: 12, fiber: 0, calories: 102)
@chicken = Food.new(name: "chicken", carbs: 0, protein: 21, fat: 1, fiber: 0, calories: 120)
@veggies = Food.new(name: "veggies", carbs: 8, protein: 1, fat: 0, fiber: 2, calories: 40)
@tilapia = Food.new(name: "tilapia", carbs: 0, protein: 23, fat: 2, fiber: 1, calories: 110)
@rice = Food.new(name: "rice", carbs: 35, protein: 3, fat: 0, fiber: 0, calories: 150)

@b = Meal.new
@l = Meal.new
@d = Meal.new
@day = TotalDay.new

@b.add_food(@egg, 4)
@b.add_food(@butter, 1)
puts "Breakfast:"
@b.stats
puts ""

@l.add_food(@chicken, 2)
@l.add_food(@veggies, 2)
@l.add_food(@rice, 2)
puts "Lunch:"
@l.stats
puts ""


@day.add_meal(@b)
@day.add_meal(@l)
puts "Totals:"
@day.stats
puts ""

exit

