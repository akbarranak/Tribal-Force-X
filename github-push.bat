@echo off
echo GitHub Push Utility
echo -------------------

REM Check if git is installed
where git >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo Error: Git is not installed or not in your PATH.
    exit /b 1
)

REM Check if we're in a git repository
git rev-parse --is-inside-work-tree >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo Error: Not in a git repository.
    exit /b 1
)

REM Get current branch
for /f "tokens=*" %%a in ('git rev-parse --abbrev-ref HEAD') do set BRANCH=%%a
echo Current branch: %BRANCH%

REM Add all changes
echo Adding all changes...
git add .

REM Get commit message from user
set /p COMMIT_MESSAGE=Enter commit message: 

REM Commit changes
echo Committing changes...
git commit -m "%COMMIT_MESSAGE%"
if %ERRORLEVEL% NEQ 0 (
    echo Error: Failed to commit changes.
    exit /b 1
)

REM Push to remote
echo Pushing to remote repository...
git push origin %BRANCH%
if %ERRORLEVEL% NEQ 0 (
    echo Error: Failed to push to remote repository.
    echo This could be due to:
    echo - No remote repository configured
    echo - No internet connection
    echo - Authentication issues
    echo - Remote branch is ahead of local branch
    echo Try running 'git pull' first if there are remote changes.
    exit /b 1
)

echo Success! Changes pushed to GitHub.
pause