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
    @image = Gosu::Image.new(window, "media/Starfighter.2.bmp", false)
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

  def brake
    @vel_x = 0
    @vel_y = 0
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
    @image.draw_rot(@x, @y, ZOrder::Player, @angle)
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

	def initialize(droner)
    @droner = droner
#		@image = Gosu::Image.new(window, "media/Drone1.1.bmp", false)
		@x = rand * 1000
		@y = rand * 600
    @vel_x = @vel_y = 0.0
    @angle = 90.00
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
    img = @droner
    img.draw_rot(@x, @y, ZOrder::Drone, @angle)
#    img.draw_rot(@x, @y, ZOrder::Drone, @angle, 1, 1, @color, :add)
# draw_rot(text, x, y, z, angle, factor_x=1, factor_y=1, color=0xffffffff, mode=:default); end
  end

=begin
    @drones.each { |drone|
      c = rand(100)
      if c < 90 then
        @droner.turn_left
      end
      if c > 10 then
        @droner.turn_right
      end
      if c < 70 then
        @droner.accelerate
      end
      if button_down? Gosu::KbSpace then
        @droner.warp(rand(1000), rand(600))
      end
      @droner.move

      @drone.collect_stars(@stars)
}
=end

#  def collect_stars(stars)
#    stars.reject! do |star|
#      if Gosu::distance(@x, @y, star.x, star.y) < 25 then
#        @score += 10
#        true
#      else
#        false
#      end
#    end
#  end
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

    @background_image = Gosu::Image.new(self, "media/Space.1.png", true)

    @player = Player.new(self)
    @player.warp(500,300)

    @droner = Gosu::Image.new(self, "media/Drone1.1.bmp", false)
#    @drone_create = Gosu::Image::draw_rot(@x, @y, ZOrder::Drone, @angle)
    @drones = Array.new


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
    if button_down? Gosu::KbDown or button_down? Gosu::GpButton1 then
      @player.brake
    end

    @player.move
    @player.collect_stars(@stars)


    if @drones.size < 30 then
      @drones.push(Drone.new(@droner))
    end
#
#
#
#

    if rand(100) < 20 and @stars.size < 400 then
      @stars.push(Star.new(@star_anim))
    end

  end

  
  def draw
  	@player.draw
  	
    @drones.each { |drone| drone.draw }
    
    @background_image.draw(0, 0, ZOrder::Background)
    @stars.each { |star| star.draw }
    @font.draw("Score: #{@player.score}", 10, 10, ZOrder::UI, 1.0, 1.0, 0xffffff00)
  end


  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end



window = GameWindow.new
window.show

