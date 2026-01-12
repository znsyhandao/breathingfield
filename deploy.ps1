# BreathingField Auto Deploy Script
Write-Host "=== BreathingField Deployment ===" -ForegroundColor Cyan

# Settings
$repoUrl = "git@github.com:znsyhandao/breathingfield.git"
$siteUrl = "https://znsyhandao.github.io/breathingfield/"

# 1. Clean and init
Write-Host "1. Initializing Git repository..." -ForegroundColor Yellow
Remove-Item -Path .git -Recurse -Force -ErrorAction SilentlyContinue
git init

# 2. Connect to GitHub
Write-Host "2. Connecting to GitHub..." -ForegroundColor Yellow
git remote add origin $repoUrl

# 3. Add files
Write-Host "3. Adding files..." -ForegroundColor Yellow
git add .

# 4. Commit
Write-Host "4. Committing changes..." -ForegroundColor Yellow
git commit -m "Deploy BreathingField v1.0 - $(Get-Date -Format 'yyyy-MM-dd HH:mm')"

# 5. Push
Write-Host "5. Pushing to GitHub..." -ForegroundColor Yellow
git branch -M main
git push -u origin main --force

# 6. Done
Write-Host "鉁?DEPLOY COMPLETE!" -ForegroundColor Green
Write-Host "馃敆 Website: $siteUrl" -ForegroundColor Cyan
Write-Host ""
Write-Host "Please configure GitHub Pages:" -ForegroundColor Yellow
Write-Host "1. Go to: https://github.com/znsyhandao/breathingfield/settings/pages" -ForegroundColor White
Write-Host "2. Source: Deploy from a branch" -ForegroundColor White
Write-Host "3. Branch: main, Folder: / (root)" -ForegroundColor White
Write-Host "4. Click Save" -ForegroundColor White

# Open browser
Start-Process $siteUrl
