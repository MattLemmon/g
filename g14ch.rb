#!/usr/bin/env ruby
require 'rubygems' rescue nil
$LOAD_PATH.unshift File.join(File.expand_path(__FILE__), "..", "..", "lib")
require 'chingu'
include Gosu
include Chingu

# Set to true to see bounding circles used for collision detection
DEBUG = true


#
#  WINDOW CLASS
#
class Game < Chingu::Window
  def initialize
    super(800,600)
    self.input = {:esc => :exit}
    
    push_game_state(Intro)
  end
end

#
#  PAUSE CLASS
#
class Pause < Chingu::GameState
  def initialize(options = {})
    super
    @title = Chingu::Text.create(:text=>"PAUSED (press 'p' to un-pause)", :x=>50, :y=>50, :size=>20, :color => Color.new(0xFF00FF00))
    self.input = { :p => :un_pause }
  end

  def un_pause
    pop_game_state(:setup => false)    # Return the previous game state, dont call setup()
  end
  
  def draw
    previous_game_state.draw    # Draw prev game state onto screen (in this case our level)
    super                       # Draw game objects in current game state, this includes Chingu::Texts
  end  
end

#
#  INTRO GAMESTATE
#
class Intro < Chingu::GameState 
  def initialize(options = {})
    super
    @title = Chingu::Text.create(:text=>"Press a number (1-3) to choose your mission", :x=>200, :y=>50, :size=>30)
    self.input = { :"1" => :m1, :"2" => :m2, :"3" => :m3 }
  end
  
  def m1
    @title.text = "Mission 1 selected ('enter' to continue)"
    self.input = { :enter => Mission1.new, :return => Mission1.new, :"2" => :m2, :"3" => :m3 }
  end
  
  def m2
    @title.text = "Mission 2 selected (Enter to continue)"
    self.input = { :"1" => :m1, :"3" => :m3, :enter => Mission2.new, :return => Mission2.new }
  end

  def m3
    @title.text = "Mission 3 selected (Enter to continue)"
    self.input = { :"1" => :m1, :"2" => :m2 }
  end
end

#
#  MISSION 1
#
class Mission1 < Chingu::GameState
  def initialize(options = {})
    super
    @title = Chingu::Text.create(:text=>"  P = Pause   R = Restart", :x=>20, :y=>560, :size=>20)
    
    @player = Player.create(:zorder => 2, :x=>320, :y=>240)
    @pl_score = 0
    @dr_score = 0
    @score_text = Text.create("    PLAYER: #{@pl_score}    DRONES: #{@dr_score} ", :x => 10, :y => 10, :zorder => 55, :size=>20)
    @drone = Drone.create(:zorder => 2, :x=>rand(800), :y=>rand(600))
    @drone2 = Drone.create(:zorder => 2, :x=>rand(800), :y=>rand(600))


    self.input = {:p => Pause, :r => lambda{ current_game_state.setup } }
  end

  def update
    super

    if rand(100) < 4 && Star.all.size < 25
      Star.create
    end
    
    #
    # Collide @player with all instances of class Star
    #
    @player.each_collision(Star) do |player, star| 
      star.destroy
      @pl_score+=1000
    end
    @drone.each_collision(Star) do |drone, star|
      star.destroy
      @dr_score+=1000
    end
    @drone2.each_collision(Star) do |drone2, star|
      star.destroy
      @dr_score+=1000
    end
        
    @score_text.text = "    PLAYER: #{@pl_score}    DRONES: #{@dr_score} "

    $window.caption = "   GALAXY CRAFT                                                 cosmic soup " 
  end

  def setup
    @drone.x = rand(800)
    @drone.y = rand(600)
    @drone.velocity_x = 0
    @drone.velocity_y = 0
    @drone.angle = rand(360)
    @drone2.x = rand(800)
    @drone2.y = rand(600)
    @drone2.velocity_x = 0
    @drone2.velocity_y = 0
    @drone2.angle = rand(360)
    Star.destroy_all
    @player.x = 400
    @player.y = 300
    @player.velocity_x = 0
    @player.velocity_y = 0
    @player.angle =0
  end

  def draw
    Image["Space.4.png"].draw(0,0,0)
    super
  end
end

=begin
#
#  MISSION 2                             #  2  #  2  #  2  #  2  #  2  #  2  #  2  #
#
class Mission2 < Chingu::GameState
  def initialize(options = {})
    super
    @title = Chingu::Text.create(:text=>"   Mission 2 . P: pause R: restart", :x=>20, :y=>10, :size=>20)
    
    @player = Player.create(:zorder => 2, :x=>320, :y=>240)
    @score = 0
    @score_text = Text.create("Score: #{@score}", :x => 10, :y => 10, :zorder => 55, :size=>20)
    @drone = Drone.create(:zorder => 2, :x=>rand(800), :y=>rand(600))

    self.input = {:p => Pause, :r => lambda{ current_game_state.setup } }
  end

  def update
    super

    if rand(100) < 4 && Star.all.size < 25
      Star.create
    end

#   C O L L I S I O N S    #   C O L L I S I O N S    #   C O L L I S I O N S    #   C O L L I S I O N S    
    @player.each_collision(Star) do |player, star| 
      star.destroy
      @pl_score+=1000
    end

    @score_text.text = "Score: #{@score}"

    $window.caption = "   GALAXY CRAFT " + @score_text.text
  end

  def setup
    @drone.x = rand(800)
    @drone.y = rand(600)
    @drone.velocity_x = 0
    @drone.velocity_y = 0
    @drone.angle = rand(360)

    Star.destroy_all
    @player.x = 400
    @player.y = 300
    @player.velocity_x = 0
    @player.velocity_y = 0
    @player.angle =0
  end

end

=end




#
#  PLAYER CLASS  #  PLAYER CLASS  #  PLAYER CLASS  #  PLAYER CLASS  #  PLAYER CLASS  #  PLAYER CLASS  
#
class Player < GameObject
  trait :bounding_circle, :debug => DEBUG
  traits :collision_detection, :effect, :velocity
  
  def initialize(options={})
    super(options)
    @image = Image["Starfighter.1.bmp"]
    self.input = {:holding_right=>:turn_right, :holding_left=>:turn_left, :holding_up=>:accelerate, :holding_down=>:brake}
    self.max_velocity = 200
  end
  
  def accelerate
    self.velocity_x = Gosu::offset_x(self.angle, 15.0)
    #*self.max_velocity_x
    self.velocity_y = Gosu::offset_y(self.angle, 15.0)
    #*self.max_velocity_y
  end

  def brake
    self.velocity_x *= 0.8
    self.velocity_y *= 0.8
  end

  def turn_right
    # The same can be achieved without trait 'effect' as: self.angle += 4.5
    rotate(4.5)
  end
  
  def turn_left
    # The same can be achieved without trait 'effect' as: self.angle -= 4.5
    rotate(-4.5)
  end
  
  def update
    self.velocity_x *= 0.98 # dampen the movement
    self.velocity_y *= 0.98
    
    @x %= $window.width # wrap around the screen
    @y %= $window.height
  end
end

#
#  D R O N E   C L A S S
#
class Drone < GameObject
  trait :bounding_circle, :debug => DEBUG
  traits :collision_detection, :effect, :velocity
  
  def initialize(options={})
    super(options)
    @image = Image["Drone1.1.bmp"]
    self.input = {:holding_right=>:turn_right, :holding_left=>:turn_left, :holding_up=>:accelerate}
    self.max_velocity = 40
  end
  
  def accelerate
    self.velocity_x = Gosu::offset_x(self.angle, 0.5)*self.max_velocity_x
    self.velocity_y = Gosu::offset_y(self.angle, 0.5)*self.max_velocity_y
  end
  
  def turn_right
    # The same can be achieved without trait 'effect' as: self.angle += 4.5
    rotate(4.5)
  end
  
  def turn_left
    # The same can be achieved without trait 'effect' as: self.angle -= 4.5
    rotate(-4.5)
  end
  
  def update
    self.velocity_x *= 0.95 # dampen the movement
    self.velocity_y *= 0.95
    
    @x %= $window.width # wrap around the screen
    @y %= $window.height
  end
end

#
#  STAR CLASS
#
class Star < GameObject
  trait :bounding_circle, :debug => DEBUG
  trait :collision_detection
  
  def initialize(options={})
    super
    @animation = Chingu::Animation.new(:file => "Star.png", :size => 25)
    @image = @animation.next
    self.zorder = 1
    self.color = Gosu::Color.new(0xff000000)
    self.color.red = rand(255 - 40) + 40
    self.color.green = rand(255 - 40) + 40
    self.color.blue = rand(255 - 40) + 40
    self.x =rand * 800
    self.y =rand * 600
    
    #
    # A cached bounding circle will not adapt to changes in size, but it will follow objects X / Y
    # Same is true for "cache_bounding_box"
    #
    cache_bounding_circle
  end
  
  def update
    # Move the animation forward by fetching the next frame and putting it into @image
    # @image is drawn by default by GameObject#draw
    @image = @animation.next
  end
end



Game.new.show