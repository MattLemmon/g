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
    @image = Gosu::Image.new(@window, "media/Starfighter.5.bmp", false)
    @beep = Gosu::Sample.new(@window, "media/Beep.wav")
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @size = @image.width / 2
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



  def collides?(galactic_object)
    collision_size = @size + galactic_object.size
    does_collide   = galactic_object != self
    does_collide &&= Gosu::distance(@x, @y, galactic_object.x, galactic_object.y) < collision_size
    does_collide
  end








  def collect_stars(stars)
    stars.reject! do |star|
      if collides?(star)
        @score += 1000
        @beep.play
        true
      else
        false
      end
    end
  end

  def collect_drones(drones)
    drones.reject! do |drone|
      dead = false
      if collides?(drone)
        drone.score -= 1
        if drone.score < 0
          @score += 5000
          dead = true
        end
      end
      dead
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

end


#
#    D R O N E    C L A S S
#
class Drone
  attr_reader :genes, :x, :y, :z, :angle, :score, :generation, :size
  attr_writer :score

  def initialize(window, spawn, x, y, z, genes, generation)
    @window = window
    @spawn = spawn
    @x = x
    @y = y
    @z = z
#    @angle = angle
#     @x = rand * 1000
#     @y = rand * 600
    @angle = (45.5 + rand(315))
    @vel_x = @vel_y = 0.00
    @score = 400
    @genes = genes || {
      left:  rand(100),
      right: rand(100),
      accel: rand(100),
      #warp:  rand(10),
    }
    @generation = generation || 1
    @size = @spawn.width / 2
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
    @vel_x += Gosu::offset_x(@angle, 0.90)
    @vel_y += Gosu::offset_y(@angle, 0.90)
  end

  def move
    @x += @vel_x
    @y += @vel_y
    @x %= 1000
    @y %= 600
    
    @vel_x *= 0.50
    @vel_y *= 0.50
  end

  def movement
    if @score > 0
      c = rand(100)
      if c > @genes[:left] then
        turn_left
      end
      if c < @genes[:right] then
        turn_right
      end
      if c > @genes[:accel] then
        accelerate
      end
      #if c < @genes[:warp] then
      #  warp(rand(1000), rand(600))
      #end
    end
    if @window.button_down? Gosu::KbSpace then
      warp(rand(1000), rand(600))
    end
    @score -= 1
  end

  def draw
#    @z = z
    img = @spawn
    img.draw_rot(@x, @y, @z, @angle)
#    img.draw_rot(@x, @y, ZOrder::Drone, @angle, 1, 1, @color, :add)
# draw_rot(text, x, y, z, angle, factor_x=1, factor_y=1, color=0xffffffff, mode=:default); end
  end

  def collides?(galactic_object)
    collision_size = @size + galactic_object.size
    does_collide   = galactic_object != self
    does_collide &&= Gosu::distance(@x, @y, galactic_object.x, galactic_object.y) < collision_size
    does_collide
  end

  def collect_stars(stars)
    stars.reject! do |star|
      if collides?(star)
        @score += 300
        true
      else
        false
      end
    end
  end

  def cannibalize_drones(drones)
    drones.reject! do |drone|
      if drone.score < 0 && collides?(drone)
        @score += 400
        true
      else
        false
      end
    end
  end

  def score_reset
    @score = 0
  end
#  def score(drone_score)
#    @drone_score = drone_score
#  end

  def mate(genes)
    new_genes = {}
    @genes.each do |gene, value|
      r = rand(100)
      new_genes[gene] = r < 25 ? @genes[gene] : r < 50 ? genes[gene] : r < 75 ? rand(100) : @genes[gene] / 2 + genes[gene] / 2
    end
    new_genes
  end

  def to_s
    "(generation: #{@generation}, " + @genes.map{|k,v| "#{k}: #{v}"}.join(", ") + ")"
  end
end


#
#   S T A R    C L A S S 
#
class Star
  attr_reader :x, :y, :size

  def initialize(animation)
    @animation = animation
    @color = Gosu::Color.new(0xff000000)
    @color.red = rand(256 - 40) + 40
    @color.green = rand(256 - 40) + 40
    @color.blue = rand(256 - 40) + 40
    @x = rand * 1000
    @y = rand * 600
    @size = 10
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
    @background_image = Gosu::Image.new(self, "media/Space.4.png", true)

    @player = Player.new(self)
    @player.warp(500,300)

    @drone_img = Gosu::Image.new(self, "media/Drone1.6.bmp", false)
#    @drone_create = Gosu::Image::draw_rot(@x, @y, ZOrder::Drone, @angle)
    @drones = Array.new

    @star_anim = Gosu::Image::load_tiles(self, "media/Star.png", 25, 25, false)
    @stars = Array.new

    @font = Gosu::Font.new(self, Gosu::default_font_name, 20)

    @needs_spawn = true
  end

  def mate_drones(drone, mates)
    mates.reject! do |mate|
      fertile = (drone.score > 1000) && (mate.score > 1000) && (drone.genes != mate.genes)
      if fertile and Gosu::distance(drone.x, drone.y, mate.x, mate.y) < 50 then
        drone.score -= 500
        mate.score -= 500
        genes = drone.mate(mate.genes)
        generation = [drone.generation, mate.generation].max + 1
        baby_drone = Drone.new(self, @drone_img, drone.x + rand(30)-15, drone.y + rand(30)-15, ZOrder::SubDrone, genes, generation)
        @drones.push(baby_drone)
#        puts "Hot drone lovin puts a bun in the oven... #{baby_drone}"
        true
      else
        false
      end
    end
  end
  
  def update
    @player.movement
    @player.move
#    @player.collect_stars(@stars)

###   ###   ###   ###   INITIAL DRONE PUSH   ###   ###   ###    DRONE PUSH   ###   ###
    if @needs_spawn
      @drones.push(Drone.new(self, @drone_img, rand(1000), rand(600), (ZOrder::Drone - 1), nil, nil)) while @drones.size < 20
      @stars.push(Star.new(@star_anim)) while @stars.size < 300
      @needs_spawn = false
    end

    mates = @drones.clone
    @drones_score = 0
    @drones.each do |drone|
      drone.movement
      drone.move
      drone.collect_stars(@stars)
      mate_drones(drone, mates)
      drone.cannibalize_drones(@drones)
      @drones_score += drone.score
    end

    @player.collect_drones(@drones)

    if rand(100) < 6 and @stars.size < 200 then
      @stars.push(Star.new(@star_anim))
    end
#   #   #   #   PUSH STARS   #   #   #   #   #   PUSH STARS   #   #   #   #   #  #   
  end


  def draw
    @player.draw
    @drones.each { |drone| drone.draw }
    @background_image.draw(0, 0, ZOrder::Background)
    @stars.each { |star| star.draw }
    @font.draw("#{self}", 10, 10, ZOrder::UI, 1.0, 1.0, 0xffffff00)
  end

  def to_s
    mature_drones_count = @drones.select{|d| d.score > 1000}.count
    dying_drones_count  = @drones.select{|d| d.score < 0}.count
    generations = 0 and @drones.each { |d| generations = [generations, d.generation].max }
    stats = []
    stats << "PLAYER: #{@player.score}"
    stats << "# DRONES: #{@drones.count}"
    stats << "SEXUALLY MATURE: #{mature_drones_count}"
    stats << "DYING: #{dying_drones_count}"
    stats << "GENERATIONS: #{generations}"
    stats << "STARS: #{@stars.count}"
    stats.join("       ")
  end

  def button_down(id)
    case id
    when Gosu::KbEscape
      close
    when Gosu::KbS
      @needs_spawn = true
    end
  end
end



window = GameWindow.new
window.show

