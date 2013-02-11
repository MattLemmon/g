~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  *       .    `         .       .       -     `     .              `  
       `           *           `     '       .           -        .
  `          *             .                   *           .          .
 .   G A L A X Y C R A F T             .      `         .
<<<<<<< HEAD
  -       `       .       .  g12.4                   `           * `    
         *            .             c o s m i c   s o u p        `
=======
  -       `       .       .   g9                   `           * `    
         *            .            c o s m i c   s o u p        `
>>>>>>> 924c68b241eb9628ed782a62872ba7f9018e88ce
   ,        .      `       *                     .                  `
.     `         -              -        *     `     powered by gosu
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
  `   -                      .                    .               `
  We have successfully spawned more drones from the Drone class!     .
.     *        `  .  -                  `       `       .        
  We have gotten the drones to compete with each other for survival!
 .     `        '                   `      `   .        `  .        
  They now starve to death and die if they don't get enough food.
    . `      .                -   .    -     `                     .
  We have succeeded in getting the drones to mate!       .           *    
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
                                                         requires Ruby

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


1.  FIRST, install the Gosu gem.

          $ sudo gem install gosu

    Follow the detailed Gosu install instructions:

         # On mac, scroll down past the C++ instructions, and follow the Ruby
           instructions. 

       mac     -  https://github.com/jlnr/gosu/wiki/Getting-Started-on-OS-X
       linux   -  https://github.com/jlnr/gosu/wiki/Getting-Started-on-Linux
       windows -  https://github.com/jlnr/gosu/wiki/Getting-Started-on-Windows


       # On Ubuntu with rvm I ended up using 'rvm all do gem install gosu'
         For some reason, 'rvm gem install gosu' was putting the gem in the
         wrong folder, but it worked fine with 'rvm all do'
         I had to install some dependency packages as well.


2.  SECOND, copy g.git from https://github.com/MattLemmon/g.git
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
<<<<<<< HEAD
      ...                          # g4, g5, etc....
=======
      /.../g$  ruby g3.rb          # runs g4 version
      /.../g$  ruby g5.rb          # runs g5 version
      /.../g$  ruby g6.rb          # runs g6 version
      /.../g$  ruby g7.rb          # Jon wins
      /.../g$  ruby g9_mjl.rb      # hot drone lovin

2.  You can get a sense of how the game is evolving so far. The drones are
    getting pretty competitive, especially Drone 3. Can you keep the drones
    from getting more stars than you?...

    But the REAL goal of the game is to spawn more drones.


3.  If we compare the different g#.rb files in a text editor, we can see 
    how the code has grown and evolved so far.
>>>>>>> 924c68b241eb9628ed782a62872ba7f9018e88ce

    The game is evolving.


2.  In g5, the game gets starts to get a little difficult. The drones are
    pretty competitive, especially Drone 3. Can you keep the drones from
    getting more stars than you?...

    In g7, we finally had success spawning more drones from the Drone class.
      (Special thanks to Jon!)
    In g8, we got them to spawn when they eat.
    In g9, the spawns have a random speed mutation. They evolve.
    In g11.1, different colored drones compete with each other.
    In g12,1, we begin experimenting with sexual reproduction.


3.  Now we need to create a welcome screen, where the player can choose to
    complete a mission.


4.  Forking is encouraged!


5.  Gosu reference materials are included for convenient access in
    '/g/vers/gosu_lib'
    This saves you the trouble of having to dig all the way down into
    the gem folder when you want to review documentation.




~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


                L O N G   T E R M   G A M E P L A Y


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Short-term goals:

   - Create a Welcome Screen.

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

   - Make the drones fight against each other for survival.   (Completed.)

   - Using stars as food, see what happens when drones compete for resources.
                                                              (Completed.)
   - Create random variations, at birth of drones, which are inherited by
     offspring, and which affect ability to gather food.      (Completed.)

   - Use extensive git forking to create many different versions of the
     program, and test all different types of parameters.

   - Have an adequate version management system to be able to cycle through
     different versions and observe changes.    (Welcome Screen pending...)

   - Create Ant class drones with ability to communicate with pheromone
     trails.

   - Give some drones the ability to transport food.

   - Create Predator class, which eats other drones.          (Pending...)

   - Create save states.

   - Observe artificial life.                                 (Completed.)




~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


HOW TO CREATE A WELCOME SCREEN?

     I have no idea....


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



    Thank you sincerely to jlnr for providing Gosu. It is awesome.



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


                    W I N N E R S '   C I R C L E


                                Jon



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~