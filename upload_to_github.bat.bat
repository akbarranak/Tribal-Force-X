@echo off
setlocal

REM DEBUG: pause at start so you can see it launched
REM Remove this line later if not needed
pause

REM Force script to run in folder where .bat is located
cd /d "%~dp0"
echo Working in directory: %cd%
echo.

REM Check if git is installed
where git >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Git is not installed or not in PATH.
    pause
    exit /b 1
)

REM Check if inside git repo, else init
git rev-parse --is-inside-work-tree >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo Git repository not found. Initializing git repository...
    git init
) else (
    echo Git repository detected.
)

echo.

REM Check for remote origin URL
git remote get-url origin >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    set /p REMOTE_URL=Enter GitHub repository URL (e.g. https://github.com/user/repo.git): 
    if "%REMOTE_URL%"=="" (
        echo ERROR: No remote URL provided. Exiting.
        pause
        exit /b 1
    )
    git remote add origin %REMOTE_URL%
) else (
    for /f "tokens=*" %%i in ('git remote get-url origin') do set REMOTE_URL=%%i
    echo Remote origin: %REMOTE_URL%
)

echo.

REM Get current branch or ask for branch name
for /f "tokens=*" %%a in ('git rev-parse --abbrev-ref HEAD 2^>nul') do set BRANCH=%%a
if "%BRANCH%"=="HEAD" (
    set /p BRANCH=Enter branch name to create/use (default: main): 
    if "%BRANCH%"=="" set BRANCH=main
    git checkout -b %BRANCH%
) else (
    echo Current branch detected: %BRANCH%
)

echo.

REM Stage all changes
echo Adding all changes...
git add .

REM Get commit message
set /p COMMIT_MESSAGE=Enter commit message: 
if "%COMMIT_MESSAGE%"=="" set COMMIT_MESSAGE=Update files

REM Commit changes, ignore if nothing to commit
echo Committing changes...
git commit -m "%COMMIT_MESSAGE%" 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo No changes to commit.
)

echo.

REM Pull remote changes first to avoid push conflicts
echo Pulling remote changes...
git pull origin %BRANCH% --allow-unrelated-histories
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Pull failed. Please resolve conflicts manually.
    pause
    exit /b 1
)

echo.

REM Push changes
echo Pushing to remote...
git push origin %BRANCH%
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Push failed. Try 'git pull' manually and fix conflicts.
    pause
    exit /b 1
)

echo.
echo Success! All changes pushed.
pause
