

class MusicComponent
  def total_time
    raise('abstract method')
  end
end

class MusicGroup < MusicComponent
  def initialize
    @children = Array.new
  end

  def add_child(component)
    @children << component
  end

  def total_time
    total_time = 0
    #@children.each {|item| total_time += item.total_time}
    @children.each do |item|
      total_time += item.total_time
    end
    total_time
  end
end

class Discography < MusicGroup
  def initialize(artist)
    super()
    @artist = artist
  end
end

class Album < MusicGroup
  attr_accessor :parent, :title

  def initialize(title)
    super()
    @title = title
  end
end

class Song < MusicGroup
  attr_accessor :parent, :title

  def initialize(title, time)
    @title = title
    @time = time
  end

  def total_time
    @time
  end
end


beatles_discography = Discography.new('The Beatles')
rubber_soul = Album.new('Rubber Soul')
revolver = Album.new('Revolver')
rubber_soul.add_child Song.new('Norwegian Wood', 1.5)
rubber_soul.add_child Song.new('Nowhere Man', 2.0)
revolver.add_child Song.new('Eleanor Rigby', 1.5)
revolver.add_child Song.new('Tomorrow Never Knows', 2.5)
beatles_discography.add_child rubber_soul
beatles_discography.add_child revolver

puts rubber_soul.total_time           # => 3.5
puts revolver.total_time              # => 4.0
puts beatles_discography.total_time
