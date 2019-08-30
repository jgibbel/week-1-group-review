# begin to build a simple program that models Instagram
# you should have a User class, a Photo class and a comment class

class User 
  
  @@all = []
  
  attr_reader :name
  
  def initialize(name)
    @name = name 
    @photos = []
    @@all << self
  end 

  def photos 
    Photo.all.select {|photo| photo.user == self}
  end 

  def self.all 
    @@all 
  end 
  
end 

class Photo 
  
  @@all = []
  
  attr_accessor :user
  
  def initialize
    @@all << self
  end 
  
  def comments
    Comment.all.select {|comment| comment.photo == self}
  end 
  
  def make_comment(text)
    Comment.new(self, text)
  end 

  def self.all 
    @@all 
  end 
  
end 

class Comment 
  @@all = []
  attr_reader :photo, :text
  def initialize(photo, text)
    @photo = photo 
    @text = text
    @@all << self 
  end 

  def self.all 
    @@all 
  end 

end 


sandwich_photo = Photo.new
sophie = User.new("Sophie")
sandwich_photo.user = sophie
puts sandwich_photo.user.name
# => "Sophie"
puts sophie.photos
# => [#<Photo:0x00007fae2880b370>]


sandwich_photo.comments
# => []

sandwich_photo.make_comment("this is such a beautiful photo of your lunch!! I love photos of other people's lunch")
puts sandwich_photo.comments
# => [#<Comment:0x00007fae28043700>]

puts Comment.all
#=> [#<Comment:0x00007fae28043700>]
