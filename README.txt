~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
.     `         *           `           *     `             *  .    .
  *       .              .       .                  .              `  
       `           *           `            +           -        .
  `          *             .                   *           .          .
  G A L A X Y   C R A F T   
  .      `       .        .   g5   *                `           * `    
         *            .              c o s m i c   s o u p       `
   ,        .      `       *                     .                  `
.     `         -              -        *     `    powered by GOSU
  *       .              .            *             .                 *
       `           *                        *           .     .
HOW TO PLAY:     `     .     *           `                 *       `
   .        .      `      *                            `           .  `
  `   -                      .                    -              .  `
  The goal of the game is to spawn more drones.
.     *        `  .                 -            `       .        ,
  Right now there are only four drones.      *     .           `      .
 .     `         *             .   `   .  `   .        `  .        -
  I need to create various instances of each of the four drone classes.
    . `      .                -   .    -     `           *  
  How do I do this?     .            *             .                  *
 `      `                   *                  *       . `          .
   .        .      `       *      -                     *         .  `
.     `         *                       *     `             *         
  -       You win if you can help me figure this out.     *         .
       `           *    .                   *                    .    
   *         -                       `             *                  `
  `        .      `         .                         *         .  
.     `      `                       *     `             *           -
   ,       .       .      `                            .        .     .
 .     `      .        .  `     *             .               `  .
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                              ____                                   
                             / __ \                                  
                            / /  \ \                                 
                            \ \  / /                                 
                             \/  \/                                  
                           opensource                                
                                                                     
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


  I N S T A L L A T I O N :



1.  First install the Gosu gem for Ruby.

          $ sudo gem install gosu

    Detailed Gosu Install Instructions by OS:
       mac     -  https://github.com/jlnr/gosu/wiki/Getting-Started-on-OS-X
       linux   -  https://github.com/jlnr/gosu/wiki/Getting-Started-on-Linux
       windows -  https://github.com/jlnr/gosu/wiki/Getting-Started-on-Windows

       # On Ubuntu with rvm I ended up using 'rvm all do gem install gosu'
       # For some reason, 'rvm gem install gosu' was putting the gem in the
       # wrong folder, but it worked fine with 'rvm all do'


2.  Second, clone g.git from https://github.com/MattLemmon/g.git
    This will give you everything you need to play GalaxyCraft.
    It is all there in the folder /g


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


   P L A Y I N G    G A L A X Y  C R A F T  . . .



1.  In the terminal, cd to /g/vers/g0/ and type 'ruby g0.rb'

      .../g/vers/g0$  ruby g0.rb      g0     zero version 

    The zero version is the Gosu tutorial game which comes built-in with
    the gem.

    To run the different versions, cd to the differt vers folders and ruby
    the g#.rb file. The versions are g1, g3, and g5

    g5 is included in the root, simply as 'g.rb'

      .../g/vers/g1$  ruby g1.rb           # runs  g1  first version
      .../g/vers/g3$  ruby g3.rb           # runs  g3  second version
      .../g$          ruby g.rb            # runs  g5  third version


2.  You can get a sense of how the game is evolving so far. The drones are
    pretty competitive.

    But the REAL goal of the game is to spawn more drones. To do this, we
    open 'g.rb' in a text editor.


3.  If we compare the different g#.rb files, we can see how the program has
    evolved so far.

        g0.rb overall layout   (g0)    # zero version     3 classes
           Player class
           Star class
           Window class            

        g1.rb overall layout   (g1)    # first version    4 classes
           Player class
           Drone class
           Star class
           Window class

        g3.rb overall layout   (g3)    # second version   6 classes
           Player class
           Drone class
           Drone2 class
           Drone3 class
           Star class
           Window class

        g.rb overall layout    (g5)    # third version    7 classes
           Player class
           Drone class
           Drone2 class
           Drone3 class
           Drone4 class
           Star class
           Window class

    The Star class represents a perfect example of what I am hoping to
    accomplish with the drones. There are tons of different stars in
    the game, but there is only one Star class.

    The individual stars are all spawned out of one, small class.

    This is the great challenge of the game of GalaxyCraft: figuring
    out how to use the Drone classes to spawn multiple drones, similar
    to the Star class.


4.  Feel free to have fun with the program. Perhaps you would like to
    create a fifth Drone class? Or perhaps you'd like to create a
    new skin pack? Make any mods you want.


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


   L O N G   T E R M   G A M E P L A Y



Short-term goal:

   - Spawn more drones.


Medium-term goals:

   - Improve the version management system.

   - Add a beep sound when drones get stars.

   - Add a music soundtrack.

   - Make it so that the drones themselves automatically spawn new
     drones. In a word, get the drones to reproduce.

   - Make the overall map much, much bigger, with many, many more drones.

   - Investigate the possibility of making drones bump off of each other.


Long-term goals:

   - Make the drones fight against each other for survival.

   - Using stars as food, see what happens when drones compete for resources.

   - Create random variations, at birth of drones, which are inherited by
     offspring, and which affect ability to gather food.

   - Use extensive git forking to create many different versions of the
     program, and test all different types of parameters.

   - Have an adequate version management system to be able to cycle through
     different versions and observe changes.

   - Create save states.

   - Create Ant class drones with ability to communicate with pheremone
     trails.

   - Set food maximum consumption for Drone classes.

   - Give some drones the ability to transport food.

   - Observe artifical life.


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



    Thank you sincerely to jlnr for providing Gosu. It is awesome.



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

HOW TO SPAWN DRONES FROM DRONE CLASS?

  I feel like I might need to use something like:
     @drones = Array.new

  along with something like:
     if @drones.size < 10 then
       @drones.push(Drone.new(@drone))
     end

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~