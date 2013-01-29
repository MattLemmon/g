require 'gosu'


module ZOrder
  Background, Stars, Player, Drone, UI = *0..4
end


#
#    P L A Y E R    C L A S S
#
class Player
  attr_reader :score

  def initialize(window)
    @image = Gosu::Image.new(window, "media/Starfighter.bmp", false)
    @beep = Gosu::Sample.new(window, "media/Beep.wav")
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @score = 0
  end

  def warp(x, y)
    @x, @y = x, y
  end
  
  def turn_left
    @angle -= 4.5
  end
  
  def turn_right
    @angle += 4.5
  end
  
  def accelerate
    @vel_x += Gosu::offset_x(@angle, 0.5)
    @vel_y += Gosu::offset_y(@angle, 0.5)
  end
  
  def move
    @x += @vel_x
    @y += @vel_y
    @x %= 1000
    @y %= 600
    
    @vel_x *= 0.98
    @vel_y *= 0.98
  end

  def draw
    @image.draw_rot(@x, @y, ZOrder::Drone, @angle)
  end

 def score
    @score
  end

  def collect_stars(stars)
    stars.reject! do |star|
      if Gosu::distance(@x, @y, star.x, star.y) < 35 then
        @score += 1000
        @beep.play
        true
      else
        false
      end
    end
  end
end


#
#    D R O N E    C L A S S
#
class Drone

	def initialize(window)
		@image = Gosu::Image.new(window, "media/Drone.bmp", false)
    @color = Gosu::Color.new(0xff000000)
    @color.red = rand(256 - 40) + 40
    @color.green = rand(256 - 40) + 40
    @color.blue = rand(256 - 40) + 40
		@x = rand * 1000
		@y = rand * 600
    @vel_x = @vel_y = 0.0
    @angle = (45.5 + rand(315))
    @score = 0
	end

  def warp(x,y)
    @x, @y = x, y
  end

  def turn_left
    @angle -= 2.5
  end
  
  def turn_right
    @angle += 2.5
  end
  
  def accelerate
    @vel_x += Gosu::offset_x(@angle, 0.5)
    @vel_y += Gosu::offset_y(@angle, 0.5)
  end

  def move
    @x += @vel_x
    @y += @vel_y
    @x %= 1000
    @y %= 600
    
    @vel_x *= 0.50
    @vel_y *= 0.50
  end

  def draw
    @image.draw_rot(@x, @y, ZOrder::Drone, @angle)

  end

  def collect_stars(stars)
    stars.reject! do |star|
      if Gosu::distance(@x, @y, star.x, star.y) < 25 then
        @score += 10
        true
      else
        false
      end
    end
  end


  def score
    score = @score
  end

end


#
#    D R O N E    2    C L A S S
#
class Drone2

  def initialize(window)
    @image = Gosu::Image.new(window, "media/Drone2.bmp", false)
    @color = Gosu::Color.new(0xff000000)
    @color.red = rand(256 - 40) + 40
    @color.green = rand(256 - 40) + 40
    @color.blue = rand(256 - 40) + 40
    @x = rand * 1000
    @y = rand * 600
    @vel_x = @vel_y = 0.0
    @angle = (45.5 + rand(315))
    @score = 0
  end

  def warp(x,y)
    @x, @y = x, y
  end

  def turn_left
    @angle -= 1.5
  end
  
  def turn_right
    @angle += 1.5
  end
  
  def accelerate
    @vel_x += Gosu::offset_x(@angle, 0.9)
    @vel_y += Gosu::offset_y(@angle, 0.9)
  end

  def move
    @x += @vel_x
    @y += @vel_y
    @x %= 1000
    @y %= 600
    
    @vel_x *= 0.5
    @vel_y *= 0.5
  end


  def draw
    @image.draw_rot(@x, @y, ZOrder::Drone, @angle)

  end

  def collect_stars(stars)
    stars.reject! do |star|
      if Gosu::distance(@x, @y, star.x, star.y) < 100 then
        @score += 1000
        true
      else
        false
      end
    end
  end

  def score
    score = @score
  end
end



#
#    D R O N E    3    C L A S S
#
class Drone3

  def initialize(window)
    @image = Gosu::Image.new(window, "media/Drone.bmp", false)
    @color = Gosu::Color.new(0xff000000)
    @color.red = rand(256 - 40) + 40
    @color.green = rand(256 - 40) + 40
    @color.blue = rand(256 - 40) + 40
    @x = rand * 1000
    @y = rand * 600
    @vel_x = @vel_y = 0.0
    @angle = (45.5 + rand(315))
    @score = 0
  end

  def warp(x,y)
    @x, @y = x, y
  end

  def turn_left
    @angle -= 2.5
  end
  
  def turn_right
    @angle += 2.5
  end
  
  def accelerate
    @vel_x += Gosu::offset_x(@angle, 0.5)
    @vel_y += Gosu::offset_y(@angle, 0.5)
  end

  def move
    @x += @vel_x
    @y += @vel_y
    @x %= 1000
    @y %= 600
    
    @vel_x *= 0.50
    @vel_y *= 0.50
  end


  def draw
    @image.draw_rot(@x, @y, ZOrder::Drone, @angle)
  end

  def collect_stars(stars)
    stars.reject! do |star|
      if Gosu::distance(@x, @y, star.x, star.y) < 25 then
        @score += 1000
        true
      else
        false
      end
    end
  end

  def score
    score = @score
  end
end




#
#   S T A R    C L A S S 
#
class Star
  attr_reader :x, :y

  def initialize(animation)
    @animation = animation
    @color = Gosu::Color.new(0xff000000)
    @color.red = rand(256 - 40) + 40
    @color.green = rand(256 - 40) + 40
    @color.blue = rand(256 - 40) + 40
    @x = rand * 1000
    @y = rand * 600
  end

  def draw  
    img = @animation[Gosu::milliseconds / 100 % @animation.size];
    img.draw(@x - img.width / 2.0, @y - img.height / 2.0,
        ZOrder::Stars, 1, 1, @color, :add)
  end
end


#
#   W I N D O W     C L A S S
#
class GameWindow < Gosu::Window
  def initialize
    super 1000, 600, false
    self.caption = "Game"

    @background_image = Gosu::Image.new(self, "media/Space2.png", true)

    @player = Player.new(self)
    @player.warp(500,300)

    @drone = Drone.new(self)
    @drone2 = Drone2.new(self)
    @drone3 = Drone3.new(self)
#    @drones = Array.new

    @star_anim = Gosu::Image::load_tiles(self, "media/Star.png", 25, 25, false)
    @stars = Array.new

    @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
  end

  
  def update
     if button_down? Gosu::KbLeft or button_down? Gosu::GpLeft then
      @player.turn_left
    end
    if button_down? Gosu::KbRight or button_down? Gosu::GpRight then
      @player.turn_right
    end
    if button_down? Gosu::KbUp or button_down? Gosu::GpButton0 then
      @player.accelerate
    end
    @player.move
    @player.collect_stars(@stars)

    a = rand(100)
    if a < 90 then
      @drone.turn_left
    end
    if a > 10 then
      @drone.turn_right
    end
    if a < 70 then
      @drone.accelerate
    end
    b = rand(100)
    if b < 90 then
      @drone2.turn_left
    end
    if b > 10 then
      @drone2.turn_right
    end
    if b < 70 then
      @drone2.accelerate
    end
    c = rand(100)
    if c < 90 then
      @drone3.turn_left
    end
    if c > 10 then
      @drone3.turn_right
    end
    if c < 70 then
      @drone3.accelerate
    end

    if button_down? Gosu::KbSpace then
      @drone.warp(rand(1000), rand(600))
      @drone2.warp(rand(1000), rand(600))
      @drone3.warp(rand(1000), rand(600))
    end


    @drone.move
    @drone.collect_stars(@stars)

    @drone2.move
    @drone2.collect_stars(@stars)

    @drone3.move
    @drone3.collect_stars(@stars)

#
#
#    if @drones.size < 10 then
#      @drones.push(Drone.new(@drone))
#    end
#
#

    if rand(400) < 8 and @stars.size < 30 then
      @stars.push(Star.new(@star_anim))
    end

  end

  
  def draw
#    totalScore = @drone.score + @drone2.score + @drone3.score
  	@player.draw
  	@drone.draw
    @drone2.draw
    @drone3.draw
    @background_image.draw(0, 0, ZOrder::Background)
    @stars.each { |star| star.draw }
#    @font.draw("Score: #{@player.score}   #{@drone.score}", 10, 10, ZOrder::UI, 1.0, 1.0, 0xffffff00)
#    @font.draw("Score: #{@drone.score}", 10, 10, ZOrder::UI, 1.0, 1.0, 0xffffff00)
    @font.draw("PLAYER : #{@player.score}   Drone 1 : #{@drone.score}   Drone 2 : #{@drone2.score}   Drone 3 : #{@drone3.score}   DRONES : #{@drone.score + @drone2.score + @drone3.score}", 10, 10, ZOrder::UI, 1.0, 1.0, 0xffffff00)
  end
#                       ^^^ SCORING  SCORING  SCORING ^^^

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end



window = GameWindow.new
window.show

