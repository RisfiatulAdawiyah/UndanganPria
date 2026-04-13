# ============================================
# SCRIPT: Change Theme to Navy Blue & Bronze
# ============================================
# Script ini mengubah tema dari Emerald Green & Gold
# menjadi Navy Blue & Bronze untuk undangan mempelai pria

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  CHANGING THEME TO NAVY BLUE & BRONZE" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Backup files
Write-Host "[1/4] Creating backups..." -ForegroundColor Yellow
Copy-Item "src/index.css" "src/index.css.backup" -Force
Copy-Item "tailwind.config.ts" "tailwind.config.ts.backup" -Force
Write-Host "✓ Backups created" -ForegroundColor Green
Write-Host ""

# Read CSS file
Write-Host "[2/4] Processing CSS file..." -ForegroundColor Yellow
$css = Get-Content "src/index.css" -Raw

# Replace Emerald Green with Navy Blue
$css = $css -replace 'rgba\(26, 95, 79', 'rgba(30, 58, 95'
$css = $css -replace 'rgba\(22, 77, 63', 'rgba(25, 50, 80'
$css = $css -replace 'rgba\(30, 110, 92', 'rgba(44, 79, 124'
$css = $css -replace '#1a5f4f', '#1e3a5f'
$css = $css -replace '#164d3f', '#193250'
$css = $css -replace '#1e6e5c', '#2c4f7c'

# Replace Gold with Bronze
$css = $css -replace 'rgba\(255, 215, 0', 'rgba(205, 127, 50'
$css = $css -replace '#FFD700', '#CD7F32'
$css = $css -replace '#FFA500', '#B8860B'
$css = $css -replace '#FFED4E', '#DAA520'

# Replace CSS variables
$css = $css -replace '--background: 160 70% 25%;', '--background: 210 55% 25%;'
$css = $css -replace '--card: 160 60% 20%;', '--card: 210 50% 20%;'
$css = $css -replace '--popover: 160 60% 20%;', '--popover: 210 50% 20%;'
$css = $css -replace '--primary: 160 70% 25%;', '--primary: 210 55% 25%;'
$css = $css -replace '--secondary: 170 60% 40%;', '--secondary: 210 50% 33%;'
$css = $css -replace '--muted: 160 50% 30%;', '--muted: 210 45% 30%;'
$css = $css -replace '--accent: 45 100% 55%;', '--accent: 30 60% 50%;'
$css = $css -replace '--accent-foreground: 160 70% 15%;', '--accent-foreground: 210 55% 15%;'
$css = $css -replace '--border: 45 90% 60%;', '--border: 30 50% 55%;'
$css = $css -replace '--input: 45 90% 60%;', '--input: 30 50% 55%;'
$css = $css -replace '--ring: 45 100% 55%;', '--ring: 30 60% 50%;'

# Replace custom tokens
$css = $css -replace '--minang-green: 160 70% 25%;', '--navy-blue: 210 55% 25%;'
$css = $css -replace '--minang-green-dark: 160 70% 20%;', '--navy-blue-dark: 210 55% 20%;'
$css = $css -replace '--minang-green-light: 160 65% 35%;', '--navy-blue-light: 210 50% 33%;'
$css = $css -replace '--minang-teal: 170 60% 40%;', '--deep-blue: 210 50% 33%;'
$css = $css -replace '--gold: 45 100% 55%;', '--bronze: 30 60% 50%;'
$css = $css -replace '--gold-light: 48 100% 65%;', '--bronze-light: 30 65% 60%;'
$css = $css -replace '--gold-dark: 42 95% 45%;', '--bronze-dark: 43 76% 38%;'

# Replace pattern names
$css = $css -replace 'Minangkabau', 'Geometric'
$css = $css -replace 'bg-batik', 'bg-geometric'

# Save CSS
$css | Out-File "src/index.css" -Encoding UTF8 -NoNewline
Write-Host "✓ CSS file updated" -ForegroundColor Green
Write-Host ""

# Update Tailwind config
Write-Host "[3/4] Processing Tailwind config..." -ForegroundColor Yellow
$tailwind = Get-Content "tailwind.config.ts" -Raw
$tailwind = $tailwind -replace 'gold:', 'bronze:'
$tailwind = $tailwind -replace '"gold-light":', '"bronze-light":'
$tailwind = $tailwind -replace '"gold-dark":', '"bronze-dark":'
$tailwind = $tailwind -replace 'deep-green', 'navy-blue'
$tailwind = $tailwind -replace 'soft-green', 'deep-blue'
$tailwind | Out-File "tailwind.config.ts" -Encoding UTF8 -NoNewline
Write-Host "✓ Tailwind config updated" -ForegroundColor Green
Write-Host ""

# Summary
Write-Host "[4/4] Theme change complete!" -ForegroundColor Yellow
Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  THEME SUCCESSFULLY CHANGED!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Color Scheme:" -ForegroundColor White
Write-Host "  Primary: Navy Blue (#1e3a5f)" -ForegroundColor Blue
Write-Host "  Accent: Bronze (#CD7F32)" -ForegroundColor DarkYellow
Write-Host ""
Write-Host "Next steps:" -ForegroundColor White
Write-Host "  1. Run: npm run dev" -ForegroundColor Gray
Write-Host "  2. Check the preview in browser" -ForegroundColor Gray
Write-Host "  3. Adjust colors if needed" -ForegroundColor Gray
Write-Host ""
Write-Host "Backup files created:" -ForegroundColor White
Write-Host "  - src/index.css.backup" -ForegroundColor Gray
Write-Host "  - tailwind.config.ts.backup" -ForegroundColor Gray
Write-Host ""
