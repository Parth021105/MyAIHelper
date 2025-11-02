# Create simple colored PNG icons for Chrome extension
# This creates solid color squares as placeholders

Add-Type -AssemblyName System.Drawing

function Create-Icon {
    param($size, $filename)
    
    $bitmap = New-Object System.Drawing.Bitmap($size, $size)
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    
    # Create gradient brush (purple gradient)
    $rect = New-Object System.Drawing.Rectangle(0, 0, $size, $size)
    $brush = New-Object System.Drawing.Drawing2D.LinearGradientBrush(
        $rect,
        [System.Drawing.Color]::FromArgb(255, 102, 126, 234),  # #667eea
        [System.Drawing.Color]::FromArgb(255, 118, 75, 162),   # #764ba2
        45
    )
    
    # Draw rounded rectangle (filled)
    $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $graphics.FillRectangle($brush, 0, 0, $size, $size)
    
    # Add emoji-like text (robot face approximation)
    $font = New-Object System.Drawing.Font("Segoe UI Emoji", [int]($size * 0.5), [System.Drawing.FontStyle]::Regular)
    $textBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::White)
    $stringFormat = New-Object System.Drawing.StringFormat
    $stringFormat.Alignment = [System.Drawing.StringAlignment]::Center
    $stringFormat.LineAlignment = [System.Drawing.StringAlignment]::Center
    
    $graphics.DrawString("🤖", $font, $textBrush, $size/2, $size/2, $stringFormat)
    
    # Save
    $bitmap.Save($filename, [System.Drawing.Imaging.ImageFormat]::Png)
    
    $graphics.Dispose()
    $bitmap.Dispose()
    
    Write-Host "Created $filename"
}

$publicPath = "C:\projects\cheat\vite-project\public"
Create-Icon 16 "$publicPath\icon16.png"
Create-Icon 48 "$publicPath\icon48.png"
Create-Icon 128 "$publicPath\icon128.png"

Write-Host "`nIcons created successfully!" -ForegroundColor Green