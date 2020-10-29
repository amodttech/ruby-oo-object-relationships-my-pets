require 'pry'

class Owner
  # attr_accessor :mood
  attr_writer :mood
  attr_reader :name, :species
  @@all = []
  
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end
  
  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select {|cats| cats.owner == self}
  end

  def dogs
    Dog.all.select {|dogs| dogs.owner == self}
    # binding.pry
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    #self.dogs.select {|ele| } = "happy"
    # binding.pry
    Dog.all.each {|dog| if dog.owner == self
        dog.mood = "happy" end}
  end

  def feed_cats
    #self.dogs.select {|ele| } = "happy"
    # binding.pry
    # Cat.all.each {|cat| if cat.owner == self
    #     cat.mood = "happy" end}

    Cat.all.each do |cat|
      if cat.owner == self
        cat.mood = "happy"
      end
    end
  end

  def sell_pets
    Cat.all.each do |cat|
      if cat.owner == self
        cat.mood = "nervous"
        cat.owner = nil
      end
    end
    Dog.all.each do |dog|
      if dog.owner == self
        dog.mood = "nervous"
        dog.owner = nil
      end
    end
  end

  def list_pets
    # pets = []
    # pets << self.dogs
    # pets << self.cats
    # pets
    # ""
    "I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
  end


end