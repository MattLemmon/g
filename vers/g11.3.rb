require 'gosu'


module ZOrder
  Background, Stars, SubDrone, Drone, Player, UI = *0..5
end


#
#    P L A Y E R    C L A S S
#
class Player
  attr_reader :score

  def initialize(window)
    @window = window
    @image = Gosu::Image.new(@window, "media/Starfighter.3.bmp", false)
    @beep = Gosu::Sample.new(@window, "media/Beep.wav")
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
    @vel_x *= 0.9
    @vel_y *= 0.9
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
      if Gosu::distance(@x, @y, star.x, star.y) < 39 then
        @score += 1000
        @beep.play
        true
      else
        false
      end
    end
  end

  def movement
    if @window.button_down? Gosu::KbLeft or @window.button_down? Gosu::GpLeft then
      turn_left
    end
    if @window.button_down? Gosu::KbRight or @window.button_down? Gosu::GpRight then
      turn_right
    end
    if @window.button_down? Gosu::KbUp or @window.button_down? Gosu::GpButton0 then
      accelerate
    end
    if @window.button_down? Gosu::KbDown or @window.button_down? Gosu::GpButton2 then
      brake
    end
  end

  def kill_drones(drones)
    drones.reject! do |drone|
      if drone.food < -300 then
        true
      else
        false
      end
    end
  end

  def kill_drones2(drones2)
    drones2.reject! do |drone2|
      if drone2.score < -300 then
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

	def initialize(window, spawn, x, y, z)
    @window = window
    @spawn = spawn
    @x = x
    @y = y
    @z = z
#    @angle = angle
#	   @x = rand * 1000
#		 @y = rand * 600
    @angle = (45.50 + rand(315))
    @vel_x = @vel_y = 0.0
    @score = 0
    @scr = 0
	end

  def x
    @x
  end

  def y
    @y
  end

  def z
    @z
  end

  def angle
    @angle
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
    @vel_x += Gosu::offset_x(@angle, 0.6)
    @vel_y += Gosu::offset_y(@angle, 0.6)
  end

  def move
    @x += @vel_x
    @y += @vel_y
    @x %= 1000
    @y %= 600
    
    @vel_x *= 0.60
    @vel_y *= 0.60
  end

  def movement
    c = rand(100)
    if c < 90 then
      turn_left
    end
    if c > 10 then
      turn_right
    end
    if c < 70 then
      accelerate
    end
    if @window.button_down? Gosu::KbSpace then
      warp(rand(1000), rand(600))
    end
  end

  def draw
#    @z = z
    img = @spawn
    img.draw_rot(@x, @y, @z, @angle)
#    img.draw_rot(@x, @y, ZOrder::Drone, @angle, 1, 1, @color, :add)
# draw_rot(text, x, y, z, angle, factor_x=1, factor_y=1, color=0xffffffff, mode=:default); end
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
    @score
  end

#  def scr
#    @scr
#  end

  def score_reset
      @score = 0
#      if @scr == 2 then
#        @scr = 0
#      else
#        @scr += 1
#      end
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
    self.caption = "           *  *  *  *  *    G A L A X Y   C R A F T    *  *  *  *  *                                                                                                   c o s m i c   s o u p"
    @background_image = Gosu::Image.new(self, "media/Space.6.png", true)
    @player = Player.new(self)
    @player.warp(500,300)

#    @drone_create = Gosu::Image::draw_rot(@x, @y, ZOrder::Drone, @angle)
    @drone_img = Gosu::Image.new(self, "media/Drone1.1.bmp", false)
    @drones = Array.new
    @tot_score = 0

    @star_anim = Gosu::Image::load_tiles(self, "media/Star.png", 25, 25, false)
    @stars = Array.new
    @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
  end

  
  def update
    @player.movement
    @player.move
    @player.collect_stars(@stars)


    if @drones.size < 3 then
      @drones.push(Drone.new(self, @drone_img, rand(1000), rand(600), (ZOrder::Drone - 1)))
    end

    @drones.each do |drone|
      drone.movement
      drone.move
      drone.collect_stars(@stars)
      @tot_score += drone.score
#      drone.score_reset
#        if drone.scr == 2 then

      if @drones.size >= 200 and @drones.size < 250 and rand(500) == 1 then
        @drones.push(Drone.new(self, @drone_img, drone.x, drone.y, ZOrder::SubDrone))
      end

      if @drones.size >= 250 and @drones.size < 300 and rand(450) == 1 then
        @drones.push(Drone.new(self, @drone_img, drone.x, drone.y, ZOrder::SubDrone))
      end

      if @drones.size >= 300 and @drones.size < 400 and rand(400) == 1 then
        @drones.push(Drone.new(self, @drone_img, drone.x, drone.y, ZOrder::SubDrone))
      end

      if @drones.size >= 400 and @drones.size < 550 and rand(300) == 1 then
        @drones.push(Drone.new(self, @drone_img, drone.x, drone.y, ZOrder::SubDrone))
      end

      if @drones.size >= 550 and @drones.size < 3000 and rand(250) == 1 then
        @drones.push(Drone.new(self, @drone_img, drone.x, drone.y, ZOrder::SubDrone))
      end

#      if @drones.size >= 800 and @drones.size < 1800 and rand(100) == 1 then
#        @drones.push(Drone.new(self, @drone_img, drone.x, drone.y, ZOrder::SubDrone))
#      end
#
#      if @drones.size >= 1800 and @drones.size < 3000 and rand(70) == 1 then
#        @drones.push(Drone.new(self, @drone_img, drone.x, drone.y, ZOrder::SubDrone))
#      end

#      if @drones.size >= 1200 and @drones.size <= 2500 then
#        @drones.push(Drone.new(self, @drone_img, drone.x, drone.y, ZOrder::SubDrone))
#      end

      if @drones.size <= 1000 and drone.score != 0 then
        drone.score_reset
        @drones.push(Drone.new(self, @drone_img, drone.x, drone.y, ZOrder::SubDrone))
      else
        if drone.score != 0 then
          drone.score_reset
        end
      end
    end

    if @drones.size < 6 and @stars.size < 30 then
      @stars.push(Star.new(@star_anim))
    end

    if @player.score < 9000 and @drones.size >= 4 and @drones.size < 12 and @stars.size < 80 then
      @stars.push(Star.new(@star_anim))
    end

    if @drones.size > 200 and @drones.size < 1500 and rand(3) == 1 then
      @stars.push(Star.new(@star_anim))
    end


    if rand(100) < 15 then
      @stars.push(Star.new(@star_anim))
    end



    if button_down? Gosu::KbS then
      @stars.push(Star.new(@star_anim))
    end

  end


  
  def draw
  	@player.draw  	
    @drones.each { |drone| drone.draw }
    @stars.each { |star| star.draw }
    @background_image.draw(0, 0, ZOrder::Background)
    @font.draw("     Score:    PLAYER  #{@player.score}     DRONES  #{@tot_score} \
            Population: DRONES  #{@drones.size}     STARS  #{@stars.size}", \
      10, 10, ZOrder::UI, 1.0, 1.0, 0xffffff00)
  end


  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end



window = GameWindow.new
window.show

