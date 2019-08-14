class Owner
  @@all = []

  attr_reader :name, :species
  def initialize(name = nil)
    @species = "human"
    @name = name
    @@all << self
  end

  def say_species
    "I am a %s." % @species
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select { |cat| cat.owner == self }
  end

  def dogs
    Dog.all.select { |dog| dog.owner == self }
  end

  def buy_cat(name)
    cat = Cat.new(name, self)
  end

  def buy_dog(name)
    dog = Dog.new(name, self)
  end

  def list_pets
    "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
  end

  def sell_pets
    (dogs + cats).each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end

  def walk_dogs
    dogs.each { |dog| dog.mood = "happy" }
  end

  def feed_cats
    cats.each { |cat| cat.mood = "happy" }
  end

  def feed_dogs
    dogs.each { |dog| dog.mood = "happy" }
  end
end