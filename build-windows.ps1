$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
if (-not $env:BRIEFCASE_HOME) { $env:BRIEFCASE_HOME='C:\Users\Public\Documents\GeradorOrcamentoTools' }
if (Test-Path 'work\git\cmd') { $env:PATH=(Join-Path $PSScriptRoot 'work\git\cmd')+';'+$env:PATH }
if (-not (Test-Path 'build\geradororcamento\windows\app')) {
    & .\.venv\Scripts\briefcase.exe create windows --no-input
    if ($LASTEXITCODE) { throw 'Falha na criação Windows.' }
}
& .\.venv\Scripts\briefcase.exe update windows --no-input
if ($LASTEXITCODE) { throw 'Falha na atualização Windows.' }
& .\.venv\Scripts\briefcase.exe build windows --no-input
if ($LASTEXITCODE) { throw 'Falha na compilação Windows.' }
& .\.venv\Scripts\briefcase.exe package windows -p zip --adhoc-sign --no-input
if ($LASTEXITCODE) { throw 'Falha no pacote Windows.' }
