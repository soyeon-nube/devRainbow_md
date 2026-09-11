# 한글 인코딩 설정
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host "=====================================================" -ForegroundColor DarkGray
Write-Host ">>> [1/3] Rainbow 하위의 CLAUDE.md 파일 수집 중..." -ForegroundColor Cyan
Write-Host "=====================================================" -ForegroundColor DarkGray

$currentDir     = (Get-Location).Path
$sourceRootPath = (Resolve-Path ".\Rainbow").Path
$targetRootPath = Join-Path $currentDir "claude-storage"

# 1. Rainbow 하위의 모든 claude.md / CLAUDE.md 복사
$files = Get-ChildItem -Path $sourceRootPath -Recurse -File | Where-Object { $_.Name -like "*claude*.md" }

foreach ($file in $files) {
    $relSubPath = $file.FullName.Substring($sourceRootPath.Length).TrimStart('\', '/')
    $destFile   = Join-Path $targetRootPath $relSubPath
    $destDir    = Split-Path $destFile -Parent

    if (-not (Test-Path $destDir)) {
        New-Item -ItemType Directory -Force -Path $destDir | Out-Null
    }
    Copy-Item -Path $file.FullName -Destination $destFile -Force
}

# 2. .claude 설정 폴더 동기화 (존재할 경우)
$sourceClaudeDir = Join-Path $sourceRootPath ".claude"
if (Test-Path $sourceClaudeDir) {
    if (-not (Test-Path $targetRootPath)) {
        New-Item -ItemType Directory -Force -Path $targetRootPath | Out-Null
    }
    Copy-Item -Path $sourceClaudeDir -Destination $targetRootPath -Recurse -Force
}

# 3. Git 변경 사항 감지
git add -A
$changes = git status --short

if (-not $changes) {
    Write-Host "`n>>> [알림] 변경되거나 추가된 Claude 파일이 없습니다." -ForegroundColor Yellow
    Write-Host ">>> 동기화를 종료합니다.`n" -ForegroundColor DarkGray
    exit
}

# 4. 변경된 파일 목록 출력
Write-Host "`n>>> [2/3] 변경된 파일 목록:" -ForegroundColor Yellow
Write-Host "-----------------------------------------------------" -ForegroundColor DarkGray
$changes | ForEach-Object {
    $line = $_
    if ($line -match '^[AM]\s+') {
        Write-Host "  [추가/수정] $($line.Substring(2).Trim())" -ForegroundColor Green
    } elseif ($line -match '^D\s+') {
        Write-Host "  [삭제됨  ] $($line.Substring(2).Trim())" -ForegroundColor Red
    } else {
        Write-Host "  $line" -ForegroundColor Gray
    }
}
Write-Host "-----------------------------------------------------" -ForegroundColor DarkGray

# 5. 반영 여부 확인
$reply = Read-Host "`n위 변경 사항을 개인 GitHub에 커밋 및 푸시하시겠습니까? (Y/N)"
if ($reply -notmatch '^(y|Y|yes|YES)$') {
    Write-Host "`n>>> [취소] 작업을 중단했습니다. (Git에 반영되지 않았습니다.)`n" -ForegroundColor Red
    git reset > $null 2>&1
    exit
}

# 6. 커밋 및 푸시
Write-Host "`n>>> [3/3] GitHub(main)으로 커밋 및 푸시 중..." -ForegroundColor Cyan
$commitDate = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
git commit -m "Auto backup claude docs: $commitDate"
git push origin main

Write-Host "`n>>> [성공] 모든 변경 사항이 개인 Git(devRainbow_md)에 안전하게 반영되었습니다!`n" -ForegroundColor Green
