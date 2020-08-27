require_relative 'cat'
require_relative 'dog'
require 'pry'

class Owner
  # code goes here
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name=name
    @species="human"
    @@all << self
  end

  def say_species
    "I am a human."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all=[]
  end

  def cats
    Cat.all.select do |cat_name|
      cat_name.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog_name|
      dog_name.owner == self 
    end
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    Dog.all.select do |dog|
      #binding.pry
      dog.mood = "happy"
    end
  end

  def feed_cats 
    Cat.all.select do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    self.dogs.each do |ex|
      ex.mood = "nervous"
      ex.owner = nil
    end
    self.cats.each do |ex|
      ex.mood = "nervous"
      ex.owner = nil
    end
  end

  def list_pets
    # binding.pry
    "I have #{self.dogs.count} dog(s), and #{+self.cats.count} cat(s)."
  end

end