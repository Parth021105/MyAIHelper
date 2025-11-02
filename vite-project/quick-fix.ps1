# Quick Fix Script for Chrome Extension

Write-Host "Fixing Chrome Extension..." -ForegroundColor Cyan

# Step 1: Copy files to src backup
Write-Host "`n1. Syncing files..." -ForegroundColor Yellow
Copy-Item C:\projects\cheat\vite-project\public\content.js C:\projects\cheat\vite-project\src\content\ -Force
Copy-Item C:\projects\cheat\vite-project\public\background.js C:\projects\cheat\vite-project\src\background\ -Force

Write-Host "   Files synced!" -ForegroundColor Green

# Step 2: Show next steps
Write-Host "`n2. Now do this in Chrome:" -ForegroundColor Yellow
Write-Host "   a. Go to chrome://extensions/" -ForegroundColor White
Write-Host "   b. Find AI Quiz Helper" -ForegroundColor White
Write-Host "   c. Click the REFRESH icon" -ForegroundColor White
Write-Host "   d. Open any webpage and press F12" -ForegroundColor White
Write-Host "   e. Look for messages starting with AI Helper" -ForegroundColor White

Write-Host "`n3. Check if backend is running:" -ForegroundColor Yellow
try {
    Invoke-WebRequest -Uri "http://localhost:5000/health" -Method GET -TimeoutSec 2 -ErrorAction Stop | Out-Null
    Write-Host "   Backend is running!" -ForegroundColor Green
} catch {
    Write-Host "   Backend NOT running!" -ForegroundColor Red
    Write-Host "   Run: cd C:\projects\cheat\backend; python app.py" -ForegroundColor Yellow
}

Write-Host "`n4. Test page available at:" -ForegroundColor Yellow
Write-Host "   C:\projects\cheat\vite-project\public\test.html" -ForegroundColor Cyan

Write-Host "`nExtension files updated!" -ForegroundColor Green
Write-Host "Now refresh the extension in Chrome!" -ForegroundColor Cyan
