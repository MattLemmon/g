~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  *       .    `         .       .       -     `     .              `  
       `           *           `     '       .           -        .
  `          *             .                   *           .          .
 .   G A L A X Y C R A F T             .      `         .
  -       `       .       .   g9                   `           * `    
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
  We have successfully spawned more drones from the Drone class.     .
.     *        `  .  -                  `       `       .        ,
  Now we need to make the drones compete with each other for survival.
 .     `         *             .   `   .  `   .        `  .        -
  They should starve to death and die if they don't get enough food.
    . `      .                -   .    -     `           *         .
  Also, we need to find a way to make the drone spawns have different
  movement patterns.     .            *             .           *    
 `      `                   *                  *              .    
   .        .      `       *      -                  -            .   `
.     `         *                       *     `          *            
  -       You win if you can help create these changes.          `  .
       `           *    .                   .            `            
   *         -        ,       -      '     .        *         '  
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

       # On mac, scroll down past the C++ instructions, and follow the Ruby
         instructions. 

       # On Ubuntu with rvm I ended up using 'rvm all do gem install gosu'
         For some reason, 'rvm gem install gosu' was putting the gem in the
         wrong folder, but it worked fine with 'rvm all do'
         I had to install some dependency packages as well.


2.  Second, clone g.git from https://github.com/MattLemmon/g.git
    This will give you everything you need to start playing GalaxyCraft.




~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


               P L A Y I N G   G A L A X Y C R A F T 


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


1.  In the terminal, cd to /g and type 'ruby g0.rb'

      /.../g$  ruby g0.rb           # runs g0  zero version 

    The zero version is the Gosu tutorial game which comes built-in with
    the gem.

      /.../g$  ruby g1.rb          # runs g1 version
      /.../g$  ruby g2.rb          # runs g2 version
      /.../g$  ruby g3.rb          # runs g3 version
<<<<<<< HEAD:vers/README.g8.txt
      ...                          # g4, g5, etc....
=======
      /.../g$  ruby g3.rb          # runs g4 version
      /.../g$  ruby g5.rb          # runs g5 version
      /.../g$  ruby g6.rb          # runs g6 version
      /.../g$  ruby g7.rb          # Jon wins
      /.../g$  ruby g9_mjl.rb      # hot drone lovin
>>>>>>> 924c68b241eb9628ed782a62872ba7f9018e88ce:README.txt

    The game is evolving.


2.  In g5, the game gets starts to get a little difficult. The drones are
    pretty competitive, especially Drone 3. Can you keep the drones from
    getting more stars than you?...

    In g7, we finally had success spawning more drones from the Drone class.
    In g8, we got them to reproduce when they eat.


3.  Now we need to create some basic competition for survival. We need to
    make drones die if they don't get enough food, and create random
    mutations in spawns.


4.  Forking is encouraged!


5.  Gosu reference materials are included for convenient access in
    '/g/vers/gosu_lib'
    This saves you the trouble of having to dig all the way down into
    the gem folder when you want to review documentation.




~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


                L O N G   T E R M   G A M E P L A Y


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Short-term goal:

   - Spawn more drones.                          (Success! Thanks to Jon!)


Medium-term goals:

   - Improve the version management system.                   (Completed.)

   - Add a sound effect when drones eat stars.                (Pending...)

   - Add a music soundtrack.                                  (Pending...)

   - Make it so that the drones themselves automatically spawn new drones.
     In a word, get the drones to reproduce.                  (Completed.)

   - Add drone character animations.                          (Pending...)

   - Make the overall map much, much bigger, with many, many more drones.

   - Investigate the possibility of making drones bump off of each other.


Long-term goals:

   - Make the drones fight against each other for survival.   (Pending...)

   - Using stars as food, see what happens when drones compete for resources.

   - Create random variations, at birth of drones, which are inherited by
     offspring, and which affect ability to gather food.      (Pending...)

   - Use extensive git forking to create many different versions of the
     program, and test all different types of parameters.

   - Have an adequate version management system to be able to cycle through
     different versions and observe changes.

   - Create Ant class drones with ability to communicate with pheromone
     trails.

   - Give some drones the ability to transport food.

   - Create Predator class, which eats other drones.

   - Create save states.

   - Observe artificial life.                                 (Pending...)




~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


HOW TO MAKE DRONES DIE FROM STARVATION?


  We might need to use something like:

    def spawn_die(drones)
      drones.reject! do |drone|
        if drone.score < -4000 then
          true
        else
          false
        end
      end
    end


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



    Thank you sincerely to jlnr for providing Gosu. It is awesome.



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


                    W I N N E R S '   C I R C L E


                                Jon



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~