~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  *       .    `         .       .       -     `     .              `  
       `           *           `     '       .           -        .
  `          *             .                   *           .          .
 .   G A L A X Y C R A F T             .      `         .
  -       `       .       .   g5                   `           * `    
         *            .            c o s m i c   s o u p        `
   ,        .      `       *                     .                  `
.     `         -              -        *     `    powered by gosu
  *       .              .            *             .                *
       `      *                             *           .     .
  `        .      .         .    .      ,      `       *           .
   ,        `    .       `        .        .      `            .      .
.      `      `        .   `   *         `    -               `  .
    GalaxyCraft is a game         .        .      .     .            `  
 `  for studying artificial     .    .             `               .
  . life and evolution            `      .   `           `      .   `    
.      .           `      .   `                           *           
   ,        .    .       `        .        .      `            .      .
 .     `                  `                  .               `  .
HOW TO PLAY:     `     .     *           `                 *       `
   .        .      `      *         .                   `             
  `   -                      .                    .             .  `
  The real goal of the game is to spawn more drones.       `         .
.     *        `  .  -                  `       `       .        ,
  Right now there are only four drones.      *     .           `      .
 .     `         *             .   `   .  `   .        `  .        -
  We need to create extra instances of each of the four drone classes.
    . `      .                -   .    -     `           *         .
  How do we do this?     .            *             .           *    
 `      `                   *                  *              .    
   .        .      `       *      -                  -            .   `
.     `         *                       *     `          *            
  -       You win if you can help me figure this out.            `  .
       `           *    .                   *            `            
   *         -                       `              *         '        
  `        .      `         .    .      ,      `       *           .
.      .           `      .   `                           *           
   -        .    .       `        .        .      `            .      .
 .     `      `        .  `              `    .               `  .
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

                              ____                       
                             / __ \                         
                            / /  \ \                        
                            \ \  / /                        
                             \/  \/                         
                           opensource                       
                                                          share alike

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


  CONTROLS:

    Arrow Keys
    Space Bar added in g1

  The real control is the text editor.


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


                     I N S T A L L A T I O N
                                                         requires Ruby

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


1.  First, install the Gosu gem.

          $ sudo gem install gosu

    Follow the detailed Gosu install instructions:
       mac     -  https://github.com/jlnr/gosu/wiki/Getting-Started-on-OS-X
       linux   -  https://github.com/jlnr/gosu/wiki/Getting-Started-on-Linux
       windows -  https://github.com/jlnr/gosu/wiki/Getting-Started-on-Windows

       # On Ubuntu with rvm I ended up using 'rvm all do gem install gosu'
       # For some reason, 'rvm gem install gosu' was putting the gem in the
       # wrong folder, but it worked fine with 'rvm all do'
       # I had to install some dependency packages as well.


2.  Second, clone g.git from https://github.com/MattLemmon/g.git
    This will give you everything you need to start playing GalaxyCraft.




~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


               P L A Y I N G    G A L A X Y C R A F T 


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


1.  In the terminal, cd to /g and type 'ruby g0.rb'

      /.../g$  ruby g0.rb           # runs g0  zero version 

    The zero version is the Gosu tutorial game which comes built-in with
    the gem.

      /.../g$  ruby g1.rb          # runs g1 version
      /.../g$  ruby g2.rb          # runs g2 version
      /.../g$  ruby g3.rb          # runs g3 version
      /.../g$  ruby g3.rb          # runs g4 version
      /.../g$  ruby g5.rb          # runs g5 version


2.  You can get a sense of how the game is evolving so far. The drones are
    getting pretty competitive, especially Drone 3. Can you keep the drones
    from getting more stars than you?...

    But the REAL goal of the game is to spawn more drones.


3.  If we compare the different g#.rb files in a text editor, we can see 
    how the code has grown and evolved so far.

        g0.rb               3 classes
           Player class
           Star class
           Window class            

        g1.rb               4 classes
           Player class
           Drone class
           Star class
           Window class

        g3.rb               6 classes
           Player class
           Drone class
           Drone2 class
           Drone3 class
           Star class
           Window class

        g4.rb               7 classes
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

    This is the great challenge of the game of GalaxyCraft - figuring
    out how to use the Drone classes to spawn multiple drones, similar
    to the Star class.


4.  Feel free to have fun with the program. Perhaps you would like to
    create a fifth Drone class? Or perhaps you'd like to create a
    new skin pack? Make any mods you want. You can easily change the
    background image, the drone images, etc.


5.  Play around with Gosu. The tutorials and reference materials are
    included for convenient access in    '/g/vers/gosu_lib'
    This saves you the trouble of having to dig all the way down into
    the gem folder when you want to review documentation.




~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


                L O N G   T E R M   G A M E P L A Y


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Short-term goal:

   - Spawn more drones.


Medium-term goals:

   - Improve the version management system.

   - Add a sound effect when drones eat stars.

   - Add a music soundtrack.

   - Make it so that the drones themselves automatically spawn new
     drones. In a word, get the drones to reproduce.

   - Add drone character animations.

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

   - Create Ant class drones with ability to communicate with pheromone
     trails.

   - Give some drones the ability to transport food.

   - Create Predator class, which eats other drones.

   - Create save states.

   - Observe artificial life.




~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


HOW TO SPAWN DRONES FROM DRONE CLASS?


  I feel like I might need to use something like:
    @drones = Array.new

  along with something like:
    if @drones.size < 10 then
      @drones.push(Drone.new(@drone))
    end

  as well as:
    @drones.each { |drone| drone.draw }


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



    Thank you sincerely to jlnr for providing Gosu. It is awesome.



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~