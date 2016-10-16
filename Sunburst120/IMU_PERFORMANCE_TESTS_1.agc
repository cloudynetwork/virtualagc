### FILE="Main.annotation"
## Copyright:    Public domain.
## Filename:     IMU_PERFORMANCE_TESTS_1.agc
## Purpose:      A module for revision 0 of BURST120 (Sunburst). It 
##               is part of the source code for the Lunar Module's
##               (LM) Apollo Guidance Computer (AGC) for Apollo 5.
## Assembler:    yaYUL
## Contact:      Ron Burkey <info@sandroid.org>.
## Website:      www.ibiblio.org/apollo/index.html
## Pages:        1062-1074
## Mod history:  2016-09-30 RSB  Created draft version.
## 		 2016-10-17 PDJ  Inputted from Sunburst scans. 

## Page 380

                BANK            44
                EBANK=          XSM                            

AOTNBIMU        CAF             ONE                             # AOT-NB-IMU FINE ALIGNMENT TEST
                TS              EROPTN                          # *** TEST CAPABILITY ***

                TC              BANKCALL                        
                CADR            IMUZERO                         # IMU ZERO ENCODER MODE
                TC              INTPRET        
                CALL
                                LATAZCHK                        # TO LOAD AZIMUTH (SM) AND LATITUDE
                CALL
                                MAKEXSMD                        # TO SET UP A STABLE MEMBER DESIRED MATRIX
                SET             CALL
                                COAROFIN                        # FOR COARSE OR FINE ALIGN MARKS
                                ERTHRVSE                        # TO CALCULATE EARTH RATE VECTOR  ##ERTHRVSE unclear on scan
                EXIT

POSLOAD         CAF             V24N30E                         # R1 0000X ENTER    POSITION 1,2, OR 3
                TC              NVSBWAIT                        # R2 00000 ENTER    00001 FOR LA3 OPTION
                TC              ENDIDLE                         
                TC              ENDTEST  
                TCF             -4
                XCH             DSPTFM1                         # DO NOT USE POSITION 3 WITH NAV BASE AT
                TS              POSITON                         # ZERO DEGREE TILT ANGLE. (GIMBAL LOCK)

                CCS             DSPTFM1         +1              
                TCF             LEMLAB                          # SPECIAL TEST TO BYPASS MARKS

                TC              POSNJUMP                        # SET UP STABLE MEMBER DESIRED COORDINATES

                TC              OPTDATA                         # TARGETS 1,2 AZIMUTH AND ELEVATION

                TC              FINDNAVB                        # COARSE ALIGN MARKS

                TC              BANKCALL
                CADR            IMUSTALL                        # INSURE IMUZERO COMPLETION
                TCF             ENDTEST

                TC              PUTPOSX                         # TO COARSE ALIGN STABLE MEMBER

                TC              GMLCKCHK                        # CHECK FOR GIMBAL LOCK BEFORE FINE ALIGN
                TC              OGCZERO                         # FOR EARTH RATE COMPENSATION

                TC              BANKCALL                        
                CADR            IMUFINE                         # FINE ALIGN MODE
                TC              BANKCALL
                CADR            IMUSTALL

## Page 381

