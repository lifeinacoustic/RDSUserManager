cls

@ECHO off
 :: Author: 
 :: Date: 9-23-2020
 :: Version: 1.5

@ECHO ****<Insert Program Name>****
ECHO.
:start
ECHO 1 - Remote Assistance
ECHO 2 - Logoff a user
ECHO 3 - Exit

ECHO.
set /p M="What would you like to do? "
ECHO.

if %M%==1 GOTO REMOTE
if %M%==2 GOTO LOGOFF
if %M%==3 exit


::*****************************************************
:REMOTE

quser /server:<server>
ECHO.
set /p session="What Session ID would you like? "  
ECHO.

::------------------
:: Validation
::-----------------
if '%session%' == '' ( GOTO start )
if %session% LSS 1 ( 
	echo Invalid ID
	GOTO start
)
if %session% GTR 999 ( 
	echo Invalid ID
	GOTO start
)
::---------------

mstsc /v:<server> /shadow:%session% /control
GOTO start
::*****************************************************


::*****************************************************
:LOGOFF

quser /server:<server>
ECHO.
set /p session="What Session ID would you like to logoff? " 
ECHO.

::------------------
:: Validation
::-----------------
if '%session%' == '' ( GOTO start )
if %session% LSS 1 ( 
	echo Invalid ID
	GOTO start
)
if %session% GTR 999 (
	echo Invalid ID
	GOTO start
)
::---------------


logoff %session% /server:<server>
pause
ECHO.
GOTO start
::*****************************************************
