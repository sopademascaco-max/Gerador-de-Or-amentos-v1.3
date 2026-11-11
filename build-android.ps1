$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
if (-not $env:BRIEFCASE_HOME) { $env:BRIEFCASE_HOME='C:\Users\Public\Documents\GeradorOrcamentoTools' }
if (Test-Path 'work\git\cmd') { $env:PATH=(Join-Path $PSScriptRoot 'work\git\cmd')+';'+$env:PATH }
if (-not (Test-Path 'build\geradororcamento\android\gradle')) {
    & .\.venv\Scripts\briefcase.exe create android
    if ($LASTEXITCODE) { throw 'Falha na criação Android.' }
}
& .\.venv\Scripts\briefcase.exe update android --update-resources --no-input
if ($LASTEXITCODE) { throw 'Falha na atualização Android.' }
& .\.venv\Scripts\python.exe tools/prepare_android.py
if ($LASTEXITCODE) { throw 'Falha na preparação Android.' }
& .\.venv\Scripts\briefcase.exe package android -p apk --no-input
if ($LASTEXITCODE) { throw 'Falha na compilação Android.' }
& .\.venv\Scripts\python.exe tools/sign_android.py
if ($LASTEXITCODE) { throw 'Falha na assinatura Android.' }
