param(
    [string]$buildType = "release"
)

$filePath = "web\index.html"
$content = Get-Content $filePath -Raw

# Expressão regular para encontrar a seção da tag <base>
$regex = '<!--base-begin-->[\s\S]*?<!--base-end-->'

# Texto a ser inserido dependendo do tipo de build
$newBaseTag = if ($buildType -eq "debug") { '<base href="/">' } else { '<base href="./">' }

# Substitui a seção com a nova tag <base>
$newContent = $content -replace $regex, "<!--base-begin-->$newBaseTag<!--base-end-->"

# Salva o conteúdo modificado
$newContent | Set-Content $filePath

# Executa flutter run ou build
if ($buildType -eq "debug") {
    Write-Host "Building for WEB Release..."
} else {
    Write-Host "Building for release..."
    flutter clean
    flutter pub get
    flutter build web --release --build-name=web-release --build-number=1.0.0.0
}