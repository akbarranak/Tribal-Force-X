@echo off
setlocal

echo --- GitHub Upload Script ---

REM Ask if git repo is initialized
set /p initgit="Is this folder already a git repository? (y/n): "
if /i "%initgit%"=="n" (
    echo Initializing git repository...
    git init
) else (
    echo Skipping git init.
)

REM Ask for remote URL
set /p remoteurl="Enter the GitHub repository URL (e.g., https://github.com/username/repo.git): "

REM Check if remote origin exists
git remote get-url origin >nul 2>&1
if errorlevel 1 (
    echo Adding remote origin...
    git remote add origin %remoteurl%
) else (
    echo Remote origin already set.
    REM Optionally update remote origin URL if different
    for /f "tokens=*" %%i in ('git remote get-url origin') do set currenturl=%%i
    if /i not "%currenturl%"=="%remoteurl%" (
        echo Updating remote origin URL...
        git remote set-url origin %remoteurl%
    )
)

REM Ask for branch name
set /p branchname="Enter branch name to push to (default: main): "
if "%branchname%"=="" set branchname=main

REM Check if branch exists locally
git show-ref --verify --quiet refs/heads/%branchname%
if errorlevel 1 (
    echo Branch %branchname% does not exist. Creating it...
    git checkout -b %branchname%
) else (
    git checkout %branchname%
)

REM Ask for commit message
set /p commitmsg="Enter commit message: "
if "%commitmsg%"=="" set commitmsg=Initial commit

REM Add all files
git add .

REM Check if there are commits on this branch
git rev-parse --verify HEAD >nul 2>&1
if errorlevel 1 (
    REM No commits yet
    echo No commits found. Creating initial commit...
    git commit -m "%commitmsg%"
) else (
    REM Check if there are changes staged
    git diff --cached --quiet
    if errorlevel 1 (
        git commit -m "%commitmsg%"
    ) else (
        echo No changes to commit.
    )
)

REM Push branch to origin
git push -u origin %branchname%

echo.
echo Done!
pause
