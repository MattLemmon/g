~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  *       .    `         .       .       -     `     .              `  
       `           *           `     '       .           -        .
  `          *             .                   *           .          .
 .   G A L A X Y C R A F T             .      `         .
`         `       .       .    g13                   `           * `    
         *            .               c o s m i c   s o u p     `
   ,        .      `       *                     .                  `
.     `         -              -        *     `     powered by gosu
  *       .              .            *             .                *
       `      *               `             *           .     .
  `        .       .             .      ,      `       *           .
   ,        `            `        .        .      `            .     .
.      `      `        .   `   *         `    -             .-`  .
    GalaxyCraft is a game         .        .      .     .            `  
 `  for studying artificial     .    .             `               .
  . life and evolution            `      .   `           `      .   `    
.      .           `      .   `                           *           
   ,        .    .       `        .        .      `            .      .
 .     `                  `                  .               `  .
HOW TO PLAY:     `     .     *           `                 *       `
   .        .      `      *         .                   `             
  `   -                      .                    .               `
  We have successfully spawned more drones from the Drone class!     .
.     *        `  .  -                  `       `       .        
  We have gotten the drones to compete with each other for survival!
 .     `        '                   `      `   .        `  .        
  They now starve to death and die if they don't get enough food.
    . `      .                -   .    -     `                     .
  We have succeeded in getting the drones to mate!       .           *    
   `                    .                     `              .     
  Now we need an interface which can access the different versions.
 `      `                    .                 .              .    
   .        .      `       *      -                  -            .   `
.     `         *                       *     `             `            
  -       You win if you can help create a Welcome Screen.         `  .
       `                .                   .                         
   *         -        ,       -      '     .        *         '  
  `        .     *          .    .      ,      `       *           .
.      .           `      .   `     *                     *           
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

    Down Arrow added in g5
    'S' added in g8
    'D' added in g12.2

  The real control is the text editor.


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


                     I N S T A L L A T I O N
                                                    requires Ruby Gems

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


1.  FIRST, install the Gosu gem.

        $ sudo gem install gosu

    Following are the detailed Gosu install instructions:

        #  On mac, scroll down past the C++ instructions, and follow the
        #  Ruby instructions. 

      mac     -  https://github.com/jlnr/gosu/wiki/Getting-Started-on-OS-X
      linux   -  https://github.com/jlnr/gosu/wiki/Getting-Started-on-Linux
      windows -  https://github.com/jlnr/gosu/wiki/Getting-Started-on-Windows

        #  On Ubuntu with rvm I ended up using 'rvm all do gem install gosu'
        #  For some reason, 'rvm gem install gosu' was putting the gem in
        #  wrong folder, but it worked fine with 'rvm all do'
        #  I had to install some dependency packages as well.


2.  SECOND, copy g.git from https://github.com/MattLemmon/g.git

    This will give you everything you need to start playing GalaxyCraft.




~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


               P L A Y I N G   G A L A X Y C R A F T 


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


1.  In the terminal, cd to /g and type 'ruby g0.rb'

      /.../g$  ruby g0.rb          # runs g0  zero version 

    The zero version is the Gosu tutorial game which comes built-in with
    the gem.

      /.../g$  ruby g1.rb          # runs g1 version
      /.../g$  ruby g2.rb          # runs g2 version
      /.../g$  ruby g3.rb          # runs g3 version
      ...                          # g4, g5, etc....


2.  MINI-GAMES:

      g5:   Try to get more points than the drones.

      g8:   Try to get at least 150,000 points.
            Hard challenge: try to get 200,000 points on g8.

      g9:   Observe how the slow drones die and the fast drones survive,
            resulting in "survival of the fittest," and continual
            increases in speed.

      g11:  Try to guess whether grey or white will win.

      g13:  Try to guess whether grey or white will win.

    The game is evolving.


3.  VERSION NOTES:

    In g5, the drones are pretty competitive, especially Drone 3.

    In g7, we finally had success spawning more drones from the Drone class.
                                               (Special thanks to Jon!)
    In g8, we got the drones to spawn when they eat.

    In g9, the spawns have a random speed mutation. They evolve.

    In g11, different colored drones compete with each other.

    In g12, we begin experiment with sexual reproduction.

    g9_mjl and g10 have different algorithms than the other versions.

    Additional sub-versions, and previous READMEs, are included in the 'vers' folder.


4.  Now we need to create a welcome screen, where the player has the
    option of loading different versions.


5.  Forking is encouraged!


6.  Gosu reference materials are included for convenient access in

                            g/gosu/

    This saves you the trouble of having to dig all the way down into
    the gem folder when you want to review documentation.




~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


                L O N G   T E R M   G A M E P L A Y


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Short-term goals:

   - Create a Welcome Screen.

   - Get Drones to mate.                                      (Completed.)

   - Spawn more drones.                                       (Completed.)


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

   - Make the drones fight against each other for survival.   (Completed.)

   - Using stars as food, see what happens when drones compete for resources.
                                                              (Completed.)
   - Create random variations, at birth of drones, which are inherited by
     offspring, and which affect ability to gather food.      (Completed.)

   - Use extensive git forking to create many different versions of the
     program, and test all different types of parameters.

   - Have an adequate version management system to be able to cycle through
     different versions and observe changes.
                                               (Welcome Screen pending...)

   - Create Ant class drones with ability to communicate with pheromone
     trails.

   - Give some drones the ability to transport food.

   - Create Predator class, which eats other drones.          (Pending...)

   - Create save states.

   - Observe artificial life.                                 (Completed.)




~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


HOW TO CREATE A WELCOME SCREEN?

     I have no idea...

     I think we might need to create a separate ruby file which accesses
     the g#.rb files.


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



    Thank you sincerely to jlnr for providing Gosu. It is awesome.



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


                    W I N N E R S '   C I R C L E

                                Mike

                                Jon


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~