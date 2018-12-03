@echo off
title Plant Simulator
color 2a
goto A

::::BgetDescription#plant simulator game. grow some weeds.
::::BgetAuthor#howk
::::BgetCategory#game
:A
echo.
echo.           
echo.              =====================================================        
echo.              Years greatest simulator...
echo.                               The one that everypody has waited...
echo.
echo.             ##  #    #  ### ###      ## ### # # # # #    #  ###  #  ##  
echo.             # # #   # # # #  #      #    #  ### # # #   # #  #  # # # # 
echo.             ##  #   ### # #  #       #   #  ### # # #   ###  #  # # ##  
echo.             #   #   # # # #  #        #  #  # # # # #   # #  #  # # # # 
echo.             #   ### # # # #  #      ##  ### # # ### ### # #  #   #  # # 
echo.
echo.
echo.
echo.                            #####    ###      #    #####     ©
echo.                           #     #  #   #    ##   #     # 
echo.                                 # #     #  # #         # 
echo.                            #####  #     #    #    #####  
echo.                           #       #     #    #         # 
echo.                           #        #   #     #   #     # 
echo.                           #######   ###    #####  ##### 
echo.
echo.
echo.              =====================================================
echo.
pause
goto MENU

:MENU
cls
echo.
echo.
echo.              Hello and welcome to play...
echo.                            PLANT SIMULATOR 2013
echo.
echo.              First tell me your name.
echo.
set /p name=Your name:
echo.              
echo.              So this is your name:%name%
echo.
echo.              1 yes
echo.              2 no
echo.
set /p input=

if %input%==1 goto START
if %input%==2 goto MENU
if %input%==i_like_secrets goto SECRET
goto ERROR1

:ERROR1
cls
echo.
echo.              Try again!
echo.
goto MENU

:SECRET
cls
echo.
echo.
echo.              Nothing else but the clock...
echo.                    %date% %time%

:START
cls
echo.
echo.
echo.              Let's start...
pause
goto B

:B
cls
echo.
echo.
echo.              Task 1
echo.              Plant the flower
echo.
pause 
goto C

:C
cls
echo.              No points yet!
echo.
echo.
echo.              Where do you want to plant the flower?
echo.                                       __
echo.                                      {  }
echo.                                     {    }
echo.                                       II
echo.                                       II                ))))
echo.                                       II               ((((
echo.                                      I  I               ))))
echo.              ~~~~~/a\~~~~~~~~~~/b\~~/    \~~~~~~~~~/c\~(((( 
echo.
set /p input=Your choice?

if %input%==a goto PLAIN
if %input%==b goto TREE
if %input%==c goto HAYS
goto ERROR2

:ERROR2
cls
echo.
echo.              Try again!
echo.
goto C

:PLAIN
cls
set /a pts=%pts%+50
echo.              Points: %pts%
echo.
echo.
echo.              Yep, that's an ideal place to seed a plant
echo.
echo.              Let's drop the seed...
echo.
pause >nul
goto ANIM

:ANIM
cls
echo. 
echo.                  ä
echo.
echo.
echo.
echo.
echo.
echo.              ~~~~~~~~~~~~~~~~/ \~~~~~~~~~~~~~~~~~~~~~~~~
echo. 

:ANIM2
cls
echo. 
echo.                  ä
echo.
echo.
echo.
echo.
echo.
echo.              ~~~~~~~~~~~~~~~~/ \~~~~~~~~~~~~~~~~~~~~~~~~
echo. 

:MORE
cls
echo. 
echo.                  ä
echo.
echo.
echo.
echo.
echo.
echo.              ~~~~~~~~~~~~~~~~/ \~~~~~~~~~~~~~~~~~~~~~~~~
echo. 

:MORE2
cls
echo. 
echo.                  ä
echo.
echo.
echo.
echo.
echo.
echo.              ~~~~~~~~~~~~~~~~/ \~~~~~~~~~~~~~~~~~~~~~~~~
echo. 

:ANIM3
cls
echo. 
echo.                  
echo.                      ä
echo.
echo.
echo.
echo.
echo.              ~~~~~~~~~~~~~~~~/ \~~~~~~~~~~~~~~~~~~~~~~~~
echo. 

:ANIM4
cls
echo. 
echo.                  
echo.                      ä
echo.
echo.
echo.
echo.
echo.              ~~~~~~~~~~~~~~~~/ \~~~~~~~~~~~~~~~~~~~~~~~~
echo. 

:MORE4
cls
echo. 
echo.                  
echo.                      ä
echo.
echo.
echo.
echo.
echo.              ~~~~~~~~~~~~~~~~/ \~~~~~~~~~~~~~~~~~~~~~~~~
echo. 

:MORE5
cls
echo. 
echo.                  
echo.                      ä
echo.
echo.
echo.
echo.
echo.              ~~~~~~~~~~~~~~~~/ \~~~~~~~~~~~~~~~~~~~~~~~~
echo. 

:ANIM5
cls
echo. 
echo.                  
echo.                      
echo.                          ä
echo.
echo.
echo.
echo.              ~~~~~~~~~~~~~~~~/ \~~~~~~~~~~~~~~~~~~~~~~~~
echo. 

:ANIM6
cls
echo. 
echo.                  
echo.                      
echo.                          ä
echo.
echo.
echo.
echo.              ~~~~~~~~~~~~~~~~/ \~~~~~~~~~~~~~~~~~~~~~~~~
echo. 

:MORE6
cls
echo. 
echo.                  
echo.                      
echo.                          ä
echo.
echo.
echo.
echo.              ~~~~~~~~~~~~~~~~/ \~~~~~~~~~~~~~~~~~~~~~~~~
echo. 

:ANIM7
cls
echo. 
echo.                  
echo.                      
echo.                          
echo.                             ä
echo.
echo.
echo.              ~~~~~~~~~~~~~~~~/ \~~~~~~~~~~~~~~~~~~~~~~~~
echo. 

:ANIM8
cls
echo. 
echo.                  
echo.                      
echo.                          
echo.                             ä
echo.
echo.
echo.              ~~~~~~~~~~~~~~~~/ \~~~~~~~~~~~~~~~~~~~~~~~~
echo. 

:MORE7
cls
echo. 
echo.                  
echo.                      
echo.                          
echo.                             ä
echo.
echo.
echo.              ~~~~~~~~~~~~~~~~/ \~~~~~~~~~~~~~~~~~~~~~~~~
echo. 

:MORE8
cls
echo. 
echo.                  
echo.                      
echo.                          
echo.                             ä
echo.
echo.
echo.              ~~~~~~~~~~~~~~~~/ \~~~~~~~~~~~~~~~~~~~~~~~~
echo. 


:ANIM9
cls
echo. 
echo.                  
echo.                      
echo.                          
echo.                             
echo.                              ä
echo.
echo.              ~~~~~~~~~~~~~~~~/ \~~~~~~~~~~~~~~~~~~~~~~~~
echo. 

:ANIM10
cls
echo. 
echo.                  
echo.                      
echo.                          
echo.                              
echo.                              ä
echo.
echo.              ~~~~~~~~~~~~~~~~/ \~~~~~~~~~~~~~~~~~~~~~~~~
echo. 

:MORE9
cls
echo. 
echo.                  
echo.                      
echo.                          
echo.                              
echo.                              ä
echo.
echo.              ~~~~~~~~~~~~~~~~/ \~~~~~~~~~~~~~~~~~~~~~~~~
echo. 

:MORE10
cls
echo. 
echo.                  
echo.                      
echo.                          
echo.                              
echo.                              ä
echo.
echo.              ~~~~~~~~~~~~~~~~/ \~~~~~~~~~~~~~~~~~~~~~~~~
echo. 

:ANIM11
cls
echo. 
echo.                  
echo.                      
echo.                          
echo.                             
echo.
echo.                               ä
echo.              ~~~~~~~~~~~~~~~~/ \~~~~~~~~~~~~~~~~~~~~~~~~
echo. 

:MORE11
cls
echo. 
echo.                  
echo.                      
echo.                          
echo.                             
echo.
echo.                               ä
echo.              ~~~~~~~~~~~~~~~~/ \~~~~~~~~~~~~~~~~~~~~~~~~
echo. 

:MORE12
cls
echo. 
echo.                  
echo.                      
echo.                          
echo.                             
echo.
echo.                               ä
echo.              ~~~~~~~~~~~~~~~~/ \~~~~~~~~~~~~~~~~~~~~~~~~
echo. 


:ANIM12
cls
echo. 
echo.                  
echo.                      
echo.                          
echo.                             
echo.
echo.                              
echo.              ~~~~~~~~~~~~~~~~/ä\~~~~~~~~~~~~~~~~~~~~~~~~
echo. 

:ANIM13
cls
echo. 
echo.                  
echo.                      
echo.                          
echo.                             
echo.
echo.
echo.              ~~~~~~~~~~~~~~~~/ä\~~~~~~~~~~~~~~~~~~~~~~~~
echo. 

:MORE13
cls
echo. 
echo.                  
echo.                      
echo.                          
echo.                             
echo.
echo.
echo.              ~~~~~~~~~~~~~~~~/ä\~~~~~~~~~~~~~~~~~~~~~~~~
echo. 

:MORE14
cls
echo. 
echo.                  
echo.                      
echo.                          
echo.                             
echo.
echo.
echo.              ~~~~~~~~~~~~~~~~/ä\~~~~~~~~~~~~~~~~~~~~~~~~
echo. 

:ANIM14
cls
echo. 
echo.                  
echo.                      
echo.                          
echo.                             
echo.
echo.                               _
echo.              ~~~~~~~~~~~~~~~~/ \~~~~~~~~~~~~~~~~~~~~~~~~
echo. 

:MORE15
cls
echo. 
echo.                  
echo.                      
echo.                          
echo.                             
echo.
echo.                               _
echo.              ~~~~~~~~~~~~~~~~/ \~~~~~~~~~~~~~~~~~~~~~~~~
echo. 

:MORE16
cls
echo. 
echo.                  
echo.                      
echo.                          
echo.                             
echo.
echo.                               _
echo.              ~~~~~~~~~~~~~~~~/ \~~~~~~~~~~~~~~~~~~~~~~~~
echo. 
goto S

:S
cls
echo.              Points: %pts%
echo.
echo.              Good work!
echo.
echo.              What do you want to do now?
echo.
echo.              1 Water the plant
echo.              2 Look at it
echo.
set /p input=Your choice?

if %input%==1 goto WATER
if %input%==2 goto LOOK

:LOOK
cls
echo.              Points: %pts%
echo.                  
echo.                      
echo.                          
echo.                             
echo.
echo.                               _
echo.              ~~~~~~~~~~~~~~~~/ \~~~~~~~~~~~~~~~~~~~~~~~~
pause >nul
goto NAN

:NAN
cls
echo.              Points: %pts%
echo.
echo.
echo.              Looks normal.
echo.
pause >nul
goto S

:WATER
cls
set /a pts=%pts%+25
echo.              Points: %pts%
echo.                  
echo.                      
echo.                          
echo.                             
echo.
echo.                              (
echo.              ~~~~~~~~~~~~~~~~/)\~~~~~~~~~~~~~~~~~~~~~~~~
goto CNT

:CNT
cls
echo.              Points: %pts%
echo.
echo.              Your next task is to wait it to grow
echo.
pause >nul
goto KAN

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_


:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_
pause
goto LAN

:LAN
cls
set /a pts=%pts%+25
echo.              Points: %pts%
echo.                             ____
echo.                            I    I
echo.                           I   O  I
echo.                            I_  _I
echo.                              (
echo.                               )
echo.                              (
echo.              ~~~~~~~~~~~~~~~~/)\~~~~~~~~~~~~~~~~~~~~~~~~
echo.
pause >nul
goto SAg

:SAg
cls
echo.              Points: %pts%
echo.
echo.              Looks great!
echo.
pause >nul
goto ASE

:ASE
cls
echo.              Points: %pts%
echo.
echo.              
echo.              Eat it!!!
echo.
pause >nul
goto EAT

:EAT
cls
set /a pts=%pts%+1000
echo.              Points: %pts%
echo.
echo.              
echo.              NOMNOMNOMNOM
echo.
echo.
pause >nul
goto LAWL

:LAWL
cls
echo.
echo.
echo.              Thank you for playing my game.
echo.
echo.                     Coded by howk
echo.
echo.              Thank you - %name%
echo.
echo.                    Your points: %pts%
pause >nul
exit

:TREE
cls
set /a pts=%pts%+25
echo.              Points: %pts%
echo.
echo.
echo.              Not the ideal place to seed a plant!
echo.
echo.              Let's drop the seed
pause >nul
goto ASDASD


:ASDASD
cls
echo.              
echo.
echo.
echo.                                    __
echo.                 ä                 {  }
echo.                                  {    }
echo.                                    II
echo.                                    II      
echo.                                    II            
echo.                                   I  I   
echo.                ~~~~~~~~~~~~~/ \~~/    \~~~~~~~~~

:ASDASD
cls
echo.              
echo.
echo.
echo.                                    __
echo.                 ä                 {  }
echo.                                  {    }
echo.                                    II
echo.                                    II      
echo.                                    II            
echo.                                   I  I   
echo.                ~~~~~~~~~~~~~/ \~~/    \~~~~~~~~~

:ASDASD
cls
echo.              
echo.
echo.
echo.                                    __
echo.                 ä                 {  }
echo.                                  {    }
echo.                                    II
echo.                                    II      
echo.                                    II            
echo.                                   I  I   
echo.                ~~~~~~~~~~~~~/ \~~/    \~~~~~~~~~

:ASDASD
cls
echo.              
echo.
echo.
echo.                                    __
echo.                                   {  }
echo.                                  {    }
echo.                       ä            II
echo.                                    II      
echo.                                    II            
echo.                                   I  I   
echo.                ~~~~~~~~~~~~~/ \~~/    \~~~~~~~~~

:ASDASD
cls
echo.              
echo.
echo.
echo.                                    __
echo.                                   {  }
echo.                                  {    }
echo.                       ä            II
echo.                                    II      
echo.                                    II            
echo.                                   I  I   
echo.                ~~~~~~~~~~~~~/ \~~/    \~~~~~~~~~

:ASDASD
cls
echo.              
echo.
echo.
echo.                                    __
echo.                                   {  }
echo.                                  {    }
echo.                       ä            II
echo.                                    II      
echo.                                    II            
echo.                                   I  I   
echo.                ~~~~~~~~~~~~~/ \~~/    \~~~~~~~~~

:ASDASD
cls
echo.              
echo.
echo.
echo.                                    __
echo.                                   {  }
echo.                                  {    }
echo.                       ä            II
echo.                                    II      
echo.                                    II            
echo.                                   I  I   
echo.                ~~~~~~~~~~~~~/ \~~/    \~~~~~~~~~

:ASDASD
cls
echo.              
echo.
echo.
echo.                                    __
echo.                                   {  }
echo.                                  {    }
echo.                                    II
echo.                         ä          II      
echo.                                    II            
echo.                                   I  I   
echo.                ~~~~~~~~~~~~~/ \~~/    \~~~~~~~~~

:ASDASD
cls
echo.              
echo.
echo.
echo.                                    __
echo.                                   {  }
echo.                                  {    }
echo.                                    II
echo.                         ä          II      
echo.                                    II            
echo.                                   I  I   
echo.                ~~~~~~~~~~~~~/ \~~/    \~~~~~~~~~

:ASDASD
cls
echo.              
echo.
echo.
echo.                                    __
echo.                                   {  }
echo.                                  {    }
echo.                                    II
echo.                         ä          II      
echo.                                    II            
echo.                                   I  I   
echo.                ~~~~~~~~~~~~~/ \~~/    \~~~~~~~~~

:ASDASD
cls
echo.              
echo.
echo.
echo.                                    __
echo.                                   {  }
echo.                                  {    }
echo.                                    II
echo.                         ä          II      
echo.                                    II            
echo.                                   I  I   
echo.                ~~~~~~~~~~~~~/ \~~/    \~~~~~~~~~

:ASDASD
cls
echo.              
echo.
echo.
echo.                                    __
echo.                                   {  }
echo.                                  {    }
echo.                                    II
echo.                                    II      
echo.                                    II            
echo.                             ä     I  I   
echo.                ~~~~~~~~~~~~~/ \~~/    \~~~~~~~~~

:ASDASD
cls
echo.              
echo.
echo.
echo.                                    __
echo.                                   {  }
echo.                                  {    }
echo.                                    II
echo.                                    II      
echo.                                    II            
echo.                             ä     I  I   
echo.                ~~~~~~~~~~~~~/ \~~/    \~~~~~~~~~


:ASDASD
cls
echo.              
echo.
echo.
echo.                                    __
echo.                                   {  }
echo.                                  {    }
echo.                                    II
echo.                                    II      
echo.                                    II            
echo.                             ä     I  I   
echo.                ~~~~~~~~~~~~~/ \~~/    \~~~~~~~~~

:ASDASD
cls
echo.              
echo.
echo.
echo.                                    __
echo.                                   {  }
echo.                                  {    }
echo.                                    II
echo.                                    II      
echo.                                    II            
echo.                             ä     I  I   
echo.                ~~~~~~~~~~~~~/ \~~/    \~~~~~~~~~

:ASDASD
cls
echo.              
echo.
echo.
echo.                                    __
echo.                                   {  }
echo.                                  {    }
echo.                                    II
echo.                                    II      
echo.                                    II            
echo.                                   I  I   
echo.                ~~~~~~~~~~~~~/ä\~~/    \~~~~~~~~~

:ASDASD
cls
echo.              
echo.
echo.
echo.                                    __
echo.                                   {  }
echo.                                  {    }
echo.                                    II
echo.                                    II      
echo.                                    II            
echo.                                   I  I   
echo.                ~~~~~~~~~~~~~/ä\~~/    \~~~~~~~~~

:ASDASD
cls
echo.              
echo.
echo.
echo.                                    __
echo.                                   {  }
echo.                                  {    }
echo.                                    II
echo.                                    II      
echo.                                    II            
echo.                                   I  I   
echo.                ~~~~~~~~~~~~~/ä\~~/    \~~~~~~~~~

:ASDASD
cls
echo.              
echo.
echo.
echo.                                    __
echo.                                   {  }
echo.                                  {    }
echo.                                    II
echo.                                    II      
echo.                                    II            
echo.                                   I  I   
echo.                ~~~~~~~~~~~~~/ä\~~/    \~~~~~~~~~

:ASDASD
cls
echo.              
echo.
echo.
echo.                                    __
echo.                                   {  }
echo.                                  {    }
echo.                                    II
echo.                                    II      
echo.                                    II            
echo.                              _    I  I   
echo.                ~~~~~~~~~~~~~/ \~~/    \~~~~~~~~~

:ASDASD
cls
echo.              
echo.
echo.
echo.                                    __
echo.                                   {  }
echo.                                  {    }
echo.                                    II
echo.                                    II      
echo.                                    II            
echo.                              _    I  I   
echo.                ~~~~~~~~~~~~~/ \~~/    \~~~~~~~~~

:ASDASD
cls
echo.              
echo.
echo.
echo.                                    __
echo.                                   {  }
echo.                                  {    }
echo.                                    II
echo.                                    II      
echo.                                    II            
echo.                              _    I  I   
echo.                ~~~~~~~~~~~~~/ \~~/    \~~~~~~~~~
goto LAL

:LAL
cls
echo.              Points: %pts%
echo.
echo.              Good work!
echo.
echo.              What do you want to do now?
echo.
echo.              1 Water the plant
echo.              2 Look at it
echo.
set /p input=Your choice?

if %input%==1 goto WASSER
if %input%==2 goto TITTA

:TITTA
cls
echo.              Points: %pts%        
echo.
echo.
echo.                                    __
echo.                                   {  }
echo.                                  {    }
echo.                                    II
echo.                                    II      
echo.                                    II            
echo.                              _    I  I   
echo.                ~~~~~~~~~~~~~/ \~~/    \~~~~~~~~~
pause >nul
goto LONDA

:LONDA
cls
echo.              Points: %pts%
echo.
echo.
echo.              Looks normal.
echo.
pause >nul
goto LAL

:WASSER
cls
set /a pts=%pts%+25
echo.              Points: %pts%
echo.                  
echo.                      
echo.                          
echo.                             
echo.
echo.                              (
echo.              ~~~~~~~~~~~~~~~~/)\~~~~~~~~~~~~~~~~~~~~~~~~
goto CNN

:CNN
cls
echo.              Points: %pts%
echo.
echo.              Your next task is to wait it to grow
echo.
pause >nul
goto nak

:nak
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_


:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_
pause
goto LAN




:HAYS
set /a pts=%pts%+10 
echo.              Points: %pts%
echo.
echo.
echo.              You could have picked a better place.
echo.
echo.              Let's drop the seed.
pause >nul
goto ASma

:ASma
cls
echo.                                       
echo.                                     
echo.              ä                      
echo.                                       
echo.                                ))))
echo.                                ((((
echo.                                 ))))
echo.              ~~~~~~~~~~~~~~/ \~((((

:ASma
cls
echo.                                       
echo.                                     
echo.              ä                      
echo.                                       
echo.                                ))))
echo.                                ((((
echo.                                 ))))
echo.              ~~~~~~~~~~~~~~/ \~((((

:ASma
cls
echo.                                       
echo.                                     
echo.              ä                      
echo.                                       
echo.                                ))))
echo.                                ((((
echo.                                 ))))
echo.              ~~~~~~~~~~~~~~/ \~((((

:ASma
cls
echo.                                       
echo.                                     
echo.              ä                      
echo.                                       
echo.                                ))))
echo.                                ((((
echo.                                 ))))
echo.              ~~~~~~~~~~~~~~/ \~((((

:ASma
cls
echo.                                       
echo.                                     
echo.              ä                      
echo.                                       
echo.                                ))))
echo.                                ((((
echo.                                 ))))
echo.              ~~~~~~~~~~~~~~/ \~((((

:ASma
cls
echo.                                       
echo.                                     
echo.                                    
echo.                  ä                     
echo.                                ))))
echo.                                ((((
echo.                                 ))))
echo.              ~~~~~~~~~~~~~~/ \~((((

:ASma
cls
echo.                                       
echo.                                     
echo.                                    
echo.                  ä                     
echo.                                ))))
echo.                                ((((
echo.                                 ))))
echo.              ~~~~~~~~~~~~~~/ \~((((

:ASma
cls
echo.                                       
echo.                                     
echo.                                    
echo.                  ä                     
echo.                                ))))
echo.                                ((((
echo.                                 ))))
echo.              ~~~~~~~~~~~~~~/ \~((((

:ASma
cls
echo.                                       
echo.                                     
echo.                                    
echo.                  ä                     
echo.                                ))))
echo.                                ((((
echo.                                 ))))
echo.              ~~~~~~~~~~~~~~/ \~((((

:ASma
cls
echo.                                       
echo.                                     
echo.                                    
echo.                  ä                     
echo.                                ))))
echo.                                ((((
echo.                                 ))))
echo.              ~~~~~~~~~~~~~~/ \~((((

:ASma
cls
echo.                                       
echo.                                     
echo.                                    
echo.                  ä                     
echo.                                ))))
echo.                                ((((
echo.                                 ))))
echo.              ~~~~~~~~~~~~~~/ \~((((

:ASma
cls
echo.                                       
echo.                                     
echo.                                    
echo.                  ä                     
echo.                                ))))
echo.                                ((((
echo.                                 ))))
echo.              ~~~~~~~~~~~~~~/ \~((((

:ASma
cls
echo.                                       
echo.                                     
echo.                                    
echo.                                       
echo.                                 ))))
echo.                       ä        ((((
echo.                                 ))))
echo.              ~~~~~~~~~~~~~~/ \~((((

:ASma
cls
echo.                                       
echo.                                     
echo.                                    
echo.                                       
echo.                                 ))))
echo.                       ä        ((((
echo.                                 ))))
echo.              ~~~~~~~~~~~~~~/ \~((((

:ASma
cls
echo.                                       
echo.                                     
echo.                                    
echo.                                       
echo.                                 ))))
echo.                       ä        ((((
echo.                                 ))))
echo.              ~~~~~~~~~~~~~~/ \~((((

:ASma
cls
echo.                                       
echo.                                     
echo.                                    
echo.                                       
echo.                                 ))))
echo.                       ä        ((((
echo.                                 ))))
echo.              ~~~~~~~~~~~~~~/ \~((((

:ASma
cls
echo.                                       
echo.                                     
echo.                                    
echo.                                       
echo.                                 ))))
echo.                       ä        ((((
echo.                                 ))))
echo.              ~~~~~~~~~~~~~~/ \~((((

:ASma
cls
echo.                                       
echo.                                     
echo.                                    
echo.                                       
echo.                                 ))))
echo.                       ä        ((((
echo.                                 ))))
echo.              ~~~~~~~~~~~~~~/ \~((((

:ASma
cls
echo.                                       
echo.                                     
echo.                                    
echo.                                       
echo.                                 ))))
echo.                       ä        ((((
echo.                                 ))))
echo.              ~~~~~~~~~~~~~~/ \~((((

:ASma
cls
echo.                                       
echo.                                     
echo.                                    
echo.                                       
echo.                                 ))))
echo.                       ä        ((((
echo.                                 ))))
echo.              ~~~~~~~~~~~~~~/ \~((((


:ASma
cls
echo.                                       
echo.                                     
echo.                                    
echo.                                       
echo.                                 ))))
echo.                                ((((
echo.                            ä    ))))
echo.              ~~~~~~~~~~~~~~/ \~((((

:ASma
cls
echo.                                       
echo.                                     
echo.                                    
echo.                                       
echo.                                 ))))
echo.                                ((((
echo.                            ä    ))))
echo.              ~~~~~~~~~~~~~~/ \~((((

:ASma
cls
echo.                                       
echo.                                     
echo.                                    
echo.                                       
echo.                                 ))))
echo.                                ((((
echo.                            ä    ))))
echo.              ~~~~~~~~~~~~~~/ \~((((

:ASma
cls
echo.                                       
echo.                                     
echo.                                    
echo.                                       
echo.                                 ))))
echo.                                ((((
echo.                            ä    ))))
echo.              ~~~~~~~~~~~~~~/ \~((((

:ASma
cls
echo.                                       
echo.                                     
echo.                                    
echo.                                       
echo.                                 ))))
echo.                                ((((
echo.                            ä    ))))
echo.              ~~~~~~~~~~~~~~/ \~((((

:ASma
cls
echo.                                       
echo.                                     
echo.                                    
echo.                                       
echo.                                 ))))
echo.                                ((((
echo.                            ä    ))))
echo.              ~~~~~~~~~~~~~~/ \~((((

:ASma
cls
echo.                                       
echo.                                     
echo.                                    
echo.                                       
echo.                                 ))))
echo.                                ((((
echo.                            ä    ))))
echo.              ~~~~~~~~~~~~~~/ \~((((

:ASma
cls
echo.                                       
echo.                                     
echo.                                    
echo.                                       
echo.                                 ))))
echo.                                ((((
echo.                            ä    ))))
echo.              ~~~~~~~~~~~~~~/ \~((((

:ASma
cls
echo.                                       
echo.                                     
echo.                                    
echo.                                       
echo.                                 ))))
echo.                                ((((
echo.                            ä    ))))
echo.              ~~~~~~~~~~~~~~/ \~((((

:ASma
cls
echo.                                       
echo.                                     
echo.                                    
echo.                                       
echo.                                 ))))
echo.                                ((((
echo.                                 ))))
echo.              ~~~~~~~~~~~~~~/ä\~((((

:ASma
cls
echo.                                       
echo.                                     
echo.                                    
echo.                                       
echo.                                 ))))
echo.                                ((((
echo.                                 ))))
echo.              ~~~~~~~~~~~~~~/ä\~((((

:ASma
cls
echo.                                       
echo.                                     
echo.                                    
echo.                                       
echo.                                 ))))
echo.                                ((((
echo.                                 ))))
echo.              ~~~~~~~~~~~~~~/ä\~((((

:ASma
cls
echo.                                       
echo.                                     
echo.                                    
echo.                                       
echo.                                 ))))
echo.                                ((((
echo.                                 ))))
echo.              ~~~~~~~~~~~~~~/ä\~((((

:ASma
cls
echo.                                       
echo.                                     
echo.                                    
echo.                                       
echo.                                 ))))
echo.                                ((((
echo.                             _   ))))
echo.              ~~~~~~~~~~~~~~/ \~((((

:ASma
cls
echo.                                       
echo.                                     
echo.                                    
echo.                                       
echo.                                 ))))
echo.                                ((((
echo.                             _   ))))
echo.              ~~~~~~~~~~~~~~/ \~((((

:ASma
cls
echo.                                       
echo.                                     
echo.                                    
echo.                                       
echo.                                 ))))
echo.                                ((((
echo.                             _   ))))
echo.              ~~~~~~~~~~~~~~/ \~((((

:ASma
cls
echo.                                       
echo.                                     
echo.                                    
echo.                                       
echo.                                 ))))
echo.                                ((((
echo.                             _   ))))
echo.              ~~~~~~~~~~~~~~/ \~((((

:ASma
cls
echo.                                       
echo.                                     
echo.                                    
echo.                                       
echo.                                 ))))
echo.                                ((((
echo.                             _   ))))
echo.              ~~~~~~~~~~~~~~/ \~((((

:ASma
cls
echo.                                       
echo.                                     
echo.                                    
echo.                                       
echo.                                 ))))
echo.                                ((((
echo.                             _   ))))
echo.              ~~~~~~~~~~~~~~/ \~((((
goto LALALAL

:LALALAL
cls
echo.              Points: %pts%
echo.
echo.              Good work!
echo.
echo.              What do you want to do now?
echo.
echo.              1 Water the plant
echo.              2 Look at it
echo.
set /p input=Your choice?

if %input%==1 goto VESI
if %input%==2 goto KATSO

:KATSO
cls
echo.                                       
echo.                                     
echo.                                    
echo.                                       
echo.                                 ))))
echo.                                ((((
echo.                             _   ))))
echo.              ~~~~~~~~~~~~~~/ \~((((
pause >nul
goto KANALA

:KANALA
cls
echo.              Points: %pts%
echo.
echo.
echo.              Looks normal.
echo.
pause >nul
goto LALALAL

:VESI
cls
echo.              Points: %pts%
echo.
echo.              Your next task is to wait it to grow
echo.
pause >nul
goto nak

:nak
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_


:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_

:KAN
cls
echo.              Points: %pts%
echo.
echo.
echo.
echo.                ,             
echo.                \    / 
echo.                 \0         
echo.                 I\/      
echo.                  I        
echo.                 / \        
echo.               _/   \_    

:SAM
cls              
echo.                Points: %pts%
echo.
echo.
echo.
echo.                     ,
echo.               \    /
echo.                  0/
echo.                 \/I
echo.                 I
echo.                / \
echo.              _/   \_
pause
goto LAN






















