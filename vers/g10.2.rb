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
    @image = Gosu::Image.new(@window, "media/Starfighter.4.bmp", false)
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
    @x %= 1200
    @y %= 800
    
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
      if Gosu::distance(@x, @y, star.x, star.y) < 43 then
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
    if @window.button_down? Gosu::KbDown or @window.button_down? Gosu::GpButton1 then
      brake
    end
  end

  def kill_drones(drones)
    drones.reject! do |drone|
      if drone.score < -2500 or Gosu::distance(@x, @y, drone.x, drone.y) < 43 then
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

	def initialize(window, spawn, x, y, z, veloz, left, right, c1, c2, c3)
    @window = window
    @spawn = spawn
    @x = x
    @y = y
    @z = z
    @veloz = veloz
    @left = left
    @right = right
    @c1 = c1
    @c2 = c2
    @c3 = c3
#    @angle = angle
#	   @x = rand * 1000
#		 @y = rand * 600
    @angle = (45.5 + rand(315))
    @vel_x = @vel_y = 0.0
    @score = 0
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

  def veloz
    @veloz
  end

  def left
    @left
  end

  def right
    @right
  end

  def c1
    @c1
  end

  def c2
    @c2
  end

  def c3
    @c3
  end

#  def angle
#    @angle
#  end

  def warp(x,y)
    @x, @y = x, y
  end

  def turn_left
    @angle -= left
  end
  
  def turn_right
    @angle += right
  end
  
  def accelerate
    @vel_x += Gosu::offset_x(@angle, veloz)
    @vel_y += Gosu::offset_y(@angle, veloz)
  end

  def move
    @x += @vel_x
    @y += @vel_y
    @x %= 1200
    @y %= 800
    
    @vel_x *= 0.70
    @vel_y *= 0.70
  end

  def movement
    c = rand(100)
    if c < c1 then
      turn_left
    end
    if c > c2 then
      turn_right
    end
    if c < c3 then
      accelerate
    end
    if @window.button_down? Gosu::KbSpace then
      warp(rand(1200), rand(800))
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

  def score_reset
    @score -= 1100
  end

  def hunger
    @score = @score -1
  end

#  def die(drones)
#    drones.reject! do |drone|
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
    @x = rand * 1200
    @y = rand * 800
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
    super 1200, 800, false
    self.caption = "           *  *  *  *  *    G A L A X Y   C R A F T    *  *  *  *  *                                                                                                   c o s m i c   s o u p"
    @background_image = Gosu::Image.new(self, "media/Space.6.png", true)

    @player = Player.new(self)
    @player.warp(600,400)

    @drone_img = Gosu::Image.new(self, "media/Drone1.1.bmp", false)
#    @drone_create = Gosu::Image::draw_rot(@x, @y, ZOrder::Drone, @angle)
    @drones = Array.new

    @star_anim = Gosu::Image::load_tiles(self, "media/Star.png", 25, 25, false)
    @stars = Array.new

    @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
  end

  
  def update
    @player.movement
    @player.move
    @player.collect_stars(@stars)
    @player.kill_drones(@drones)

    if @drones.size < 1 then
      @drones.push(Drone.new(self, @drone_img, rand(1200), rand(800), ZOrder::Drone, 0.75, 2.5, 2.5, 80, 20, 70))
    end

    @drones.each do |drone|
      drone.movement
      drone.move
      drone.collect_stars(@stars)
      drone.hunger
    end
    

    @drones.each do |drone|
      if rand(30) == 5 and drone.score >= 1500 then
        drone.score_reset
        turn = rand(100) / 100.00
        c = rand(10) / 3.00
        v1 = 0
        v2 = 0
#        v1 = rand(100) / 500.00 * 1.05
#        v2 = rand(100) / 500.00 * 0.95
        if rand(9) == 1 then
          @drones.push(Drone.new(self, @drone_img, drone.x, drone.y, ZOrder::SubDrone, \
            drone.veloz, drone.left, drone.right, drone.c1, drone.c2, drone.c3))
        else
          if rand(8) == 1 then
            @drones.push(Drone.new(self, @drone_img, drone.x, drone.y, ZOrder::SubDrone, \
              drone.veloz + v1, drone.left + turn, \
              drone.right + turn, drone.c1 + c, drone.c2 - c, drone.c3))
          else
            if rand(7) == 1 then
              @drones.push(Drone.new(self, @drone_img, drone.x, drone.y, ZOrder::SubDrone, \
                drone.veloz + v1, drone.left - turn, \
                (drone.right - turn), drone.c1 - c, drone.c2 + c, drone.c3))
            else
              if rand(6) == 1 then
                @drones.push(Drone.new(self, @drone_img, drone.x, drone.y, ZOrder::SubDrone, \
                  drone.veloz + v1, drone.left + turn, \
                  drone.right - turn, drone.c1 + c, drone.c2 + c, drone.c3))
              else
                if rand(5) == 1 then
                  @drones.push(Drone.new(self, @drone_img, drone.x, drone.y, ZOrder::SubDrone, \
                    drone.veloz + v1, drone.left - turn, \
                    drone.right + turn, drone.c1 - c, drone.c2 - c, drone.c3))
                else
                  if rand(4) == 1 then
                    @drones.push(Drone.new(self, @drone_img, drone.x, drone.y, ZOrder::SubDrone, \
                      drone.veloz - v2, drone.left + turn, \
                      drone.right + turn, drone.c1 + c, drone.c2 - c, drone.c3))
                  else
                    if rand(3) == 1 then
                      @drones.push(Drone.new(self, @drone_img, drone.x, drone.y, ZOrder::SubDrone, \
                        drone.veloz - v2, drone.left - turn, \
                        drone.right - turn, drone.c1 - c, drone.c2 + c, drone.c3))
                    else
                      if rand(2) == 1 then
                        @drones.push(Drone.new(self, @drone_img, drone.x, drone.y, ZOrder::SubDrone, \
                          drone.veloz - v2, drone.left + turn, \
                          drone.right - turn, drone.c1 + c, drone.c2 + c, drone.c3))
                      else
                        @drones.push(Drone.new(self, @drone_img, drone.x, drone.y, ZOrder::SubDrone, \
                          drone.veloz - v2, drone.left - turn, \
                          drone.right + turn, drone.c1 - c, drone.c2 - c, drone.c3))
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end

    if rand(100) < 4 and @stars.size < 150 then
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
    @font.draw("PLAYER: #{@player.score}        Num Drones: #{@drones.size}      Num Stars: #{@stars.size}", 10, 10, ZOrder::UI, 1.0, 1.0, 0xffffff00)
#    @font.draw("PLAYER: #{@player.score}     DRONES : #{@drone.score}", 10, 10, ZOrder::UI, 1.0, 1.0, 0xffffff00)
  end


  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end

end


window = GameWindow.new
window.show
