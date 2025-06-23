@echo off
REM Batch script to run Trinity Catholic Media Pinterest RSS Creator with custom path option

setlocal

REM Set default project path
set "DEFAULT_PATH=C:\trinity-catholic-media"

REM Use default if no input provided
set "PROJECT_PATH=%DEFAULT_PATH%"

Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

REM Change directory to the project path
cd /d "%PROJECT_PATH%" 2>nul || (
    echo Error: Could not navigate to directory: %PROJECT_PATH%
    pause
    exit /b 1
)

REM Check if the virtual environment exists
if not exist ".venv\Scripts\activate.bat" (
    echo Virtual environment not found at %PROJECT_PATH%\.venv\Scripts\activate.bat
    echo Please ensure the virtual environment exists in the project directory.
    pause
    exit /b 1
)

REM Activate the virtual environment
call ".venv\Scripts\activate.bat"

REM Check if activate was successful
if errorlevel 1 (
    echo Failed to activate virtual environment
    pause
    exit /b 1
)

REM Run the Streamlit application
echo Running Streamlit application from: %PROJECT_PATH%\pinterest-rss-creator\app.py
streamlit run "pinterest-rss-creator\app.py"

REM Keep the window open after execution
pause
endlocal