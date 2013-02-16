# Basically, the tutorial game taken to a jump'n'run perspective.
# This is an epic example of implementing wall-jumping into
# the Captain Ruby example. Be amazed or else. :]

begin
  # In case you use Gosu via rubygems.
  require 'rubygems'
rescue LoadError
  # In case you don't.
end

require 'gosu.rb'
include Gosu

module Tiles
  Grass = 0
  Earth = 1
end

class CollectibleGem
  attr_reader :x, :y

  def initialize(image, x, y)
    @image = image
    @x, @y = x, y
    @initTime = Gosu::milliseconds #the the milliseconds when created
    @delay = (rand 100)+1 #add a delay to the time so they move differently
  end
  
  #thisTime is the gems own independant time so they all move differently.
  #quite handy in independant animations like on-the-spot explosions.
  def thisTime
    Gosu::milliseconds - @initTime/@delay
  end
  
  def draw(screen_x, screen_y)
    # Draw, slowly rotating
    @image.draw_rot(@x - screen_x, @y - screen_y, 0,
      25 * Math.sin(thisTime / 133.7))
  end
end

#Dust particle class draws "smoke" at the given position with 
#a given lifespan. The lifespan shares a value with alpha
#so as the life decreases, so does the visibility.
class DustParticle
  attr_reader :x, :y
  
  def initialize(window, x, y, life)
    @x = x
    @y = y
    @graphic = Image.new(window, "media/dust.png", false)
    @lifespan = life
    @color = Gosu::Color.new(0xff000000)
    #make the color "brownish" corresponding to the tile
    @color.red = 255
    @color.green = 190
    @color.blue = 100
    
    amount = 0
    
    if @lifespan > 255 then
      amount = 255
    else
      amount = @lifespan
    end
    
    @color.alpha = amount
  end
  
  def draw(screen_x, screen_y)
    if ( @lifespan > 1 ) then
    @graphic.draw(@x - screen_x, @y - screen_y, 0, 1,1, @color)
      end
  end
      
  def update
    @lifespan -=1
    
    if @color.alpha > 0 then
      @color.alpha = @lifespan
    else
     @color.alpha = 0
    end
  end
  
  def remove?
    if @lifespan < 1 then
      true
        else
          false
        end
    end
    
end
        
      
# Player class.
class CptnRuby
  attr_reader :x, :y

  def initialize(window, x, y)
    @x, @y = x, y
    @dir = :left
    @vy = 0 # Vertical velocity
    @vx = 0 # Horizontally velocity for wall-jumping goodness
    @wall = 0 # Wall climbing or not
    @map = window.map
    # Load all animation frames
    @standing, @walk1, @walk2, @jump, @wall_climb=
      *Image.load_tiles(window, "media/CptnRuby.png", 50, 50, false)
    # This always points to the frame that is currently drawn.
    # This is set in update, and used in draw.
    @cur_image = @standing    
    @smoke = [] #Captain Ruby should have an array of particles stored. He creates them
                #However there is possibly a more ideal way of doing this but I'm a Ruby newb. :D
    @window = window
  end
  
  def draw(screen_x, screen_y)
    # Flip vertically when facing to the left.
    if @dir == :left then
      offs_x = -25
      factor = 1.0
    else
      offs_x = 25
      factor = -1.0
    end
    @cur_image.draw(@x - screen_x + offs_x, @y - screen_y - 49, 0, factor, 1.0)
    
    #draw character's smoke too
    @smoke.each { |s| s.draw(screen_x, screen_y) }
  end
  
  # Could the object be placed at x + offs_x/y + offs_y without being stuck?
  def would_fit(offs_x, offs_y)
    # Check at the center/top and center/bottom for map collisions
    not @map.solid?(@x + offs_x, @y + offs_y) and
      not @map.solid?(@x + offs_x, @y + offs_y - 45)
  end
  
  def update(move_x)
    # Select image depending on action
    if (move_x == 0)
      @cur_image = @standing
    else 
      @cur_image = (milliseconds / 175 % 2 == 0) ? @walk1 : @walk2
    end
    if (@vy < 0)
      @cur_image = @jump
    end
    if @wall != 0
      #if you are wall-climbing, set the image to so
      @cur_image = @wall_climb
    end

    # Acceleration/gravity
    # By adding 1 each frame, and (ideally) adding vy to y, the player's
    # jumping curve will be the parabole we want it to be.
    @vy += 1
    # Vertical movement
    if @vy > 0
      @vy.times { if would_fit(0, 1) then @y += 1 
        @wall = 0 #The character is jumping, therefore there is no way the character is on a wall.
        else @vy = 0 
        @wall = 0 end } #The character is jumping, therefore there is no way the character is on a wall.
    end
    if @vy < 0 then
      (-@vy).times { if would_fit(0, -1) then @y -= 1 else @vy = 0 end }
      @wall = 0 #The character is jumping, therefore there is no way the character is on a wall.
    end
    
    # Directional walking, horizontal movement
    if move_x > 0 then
      @dir = :right
        move_x.times { if would_fit(1, 0) then 
          @x += 1 
          else #If you cannot fit, that means you will most likely be on a wall
            if @vy > 1 then #So if you are not standing still... 
              @vy/=2 #dampen the velocity
              @wall = 1 #We move to the right.
            i = 0
              while i < 4 #Create dust particles
                  i += 1
                  @smoke.push(DustParticle.new(@window, (@x-20) + ( @wall*5) + (@wall * rand(10)), @y-10 , rand(50)))                  end
            end
        end }
    end
    if move_x < 0 then
      @dir = :left
        (-move_x).times { if would_fit(-1, 0) then 
          @x -= 1 
          else #If you cannot fit, that means you will most likely be on a wall
            if @vy > 1 then #So if you are not standing still... 
              @vy/=2 #dampen the velocity
              @wall = -1 #We move to the left.
            i = 0
              while i < 4 #Create dust particles
                  i += 1
                  @smoke.push(DustParticle.new(@window, @x + ( @wall*5) + (@wall * rand(10)), @y-10 , rand(50)))
                end
            end
        end }
      end
    
    #Now we have to check the x velocity which is used when wall jumping
    #It's pretty much the same as the y velocity
    if @vx > 0 then
      @vx -= 1
      @vx.times{if would_fit(-2, 0) then @x -= 2 end}
    end
    if @vx < 0 then
      @vx += 1
      (-@vx).times{if would_fit(2, 0) then @x += 2 end}
    end
    
    #update the smoke
    @smoke.each { |s| s.update }
      #manage the smoke particles
    @smoke.reject! do |s|
      s.remove?
    
  end
  end
  
  def try_to_jump
    if @map.solid?(@x, @y + 1) then
      @vy = -20
      @wall = 0 #Not climing walls anymore you monkey
    end
    
    if @wall != 0
      if @map.solid?( @x + @wall, @y ) then
        @vy = -15 #On a wall and jumping? Walljump!
        @vx = 10 * @wall #Set the x velocity according to the direction we face from the wall
        @wall = 0
      end
    end
  end
  
  def collect_gems(gems)
    # Same as in the tutorial game.
    gems.reject! do |c|
      (c.x - @x).abs < 50 and (c.y - @y).abs < 50
    end
  end
end

# Map class holds and draws tiles and gems.
class Map
  attr_reader :width, :height, :gems
  
  def initialize(window, filename)
    # Load 60x60 tiles, 5px overlap in all four directions.
    @tileset = Image.load_tiles(window, "media/CptnRuby Tileset.png", 60, 60, true)
    @sky = Image.new(window, "media/Space.png", true)

    gem_img = Image.new(window, "media/CptnRuby Gem.png", false)
    @gems = []

    lines = File.readlines(filename).map { |line| line.chop }
    @height = lines.size
    @width = lines[0].size
    @tiles = Array.new(@width) do |x|
      Array.new(@height) do |y|
        case lines[y][x, 1]
        when '"'
          Tiles::Grass
        when '#'
          Tiles::Earth
        when 'x'
          @gems.push(CollectibleGem.new(gem_img, x * 50 + 25, y * 50 + 25))
          nil
        else
          nil
        end
      end
    end
  end
  
  def draw(screen_x, screen_y)
    # Sigh, stars!
    @sky.draw(0, 0, 0)
    

    # Very primitive drawing function:
    # Draws all the tiles, some off-screen, some on-screen.
    @height.times do |y|
      @width.times do |x|
        tile = @tiles[x][y]
        if tile
          # Draw the tile with an offset (tile images have some overlap)
          # Scrolling is implemented here just as in the game objects.
          @tileset[tile].draw(x * 50 - screen_x - 5, y * 50 - screen_y - 5, 0)
        end
      end
    end
    @gems.each { |c| c.draw(screen_x, screen_y) }
  end
  
  # Solid at a given pixel position?
  def solid?(x, y)
    y < 0 || @tiles[x / 50][y / 50]
  end
end

class Game < Window
  attr_reader :map

  def initialize
    super(640, 480, false)
    self.caption = "Cptn. Ruby"
    @map = Map.new(self, "media/CptnRuby Map.txt")
    @cptn = CptnRuby.new(self, 400, 100)
    # Scrolling is stored as the position of the top left corner of the screen.
    @screen_x = @screen_y = 0
  end
  def update
    move_x = 0
    move_x -= 5 if button_down? Button::KbLeft
    move_x += 5 if button_down? Button::KbRight
    @cptn.update(move_x)
    @cptn.collect_gems(@map.gems)
    # Scrolling follows player
    @screen_x = [[@cptn.x - 320, 0].max, @map.width * 50 - 640].min
    @screen_y = [[@cptn.y - 240, 0].max, @map.height * 50 - 480].min
  end
  def draw
    @map.draw @screen_x, @screen_y
    @cptn.draw @screen_x, @screen_y
  end
  def button_down(id)
    if id == Button::KbUp then @cptn.try_to_jump end
    if id == Button::KbEscape then close end
  end
end

Game.new.show
