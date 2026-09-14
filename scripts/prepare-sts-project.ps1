[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$Destination,

    [ValidateSet('pt', 'en', 'both')]
    [string]$Language = 'both'
)

$ErrorActionPreference = 'Stop'

$skillRoot = Split-Path -Parent $PSScriptRoot
$assetsRoot = Join-Path $skillRoot 'assets'
$destinationRoot = [System.IO.Path]::GetFullPath($Destination)
$baseRoot = Join-Path $destinationRoot 'docs\sts-base'

New-Item -ItemType Directory -Force -Path $baseRoot | Out-Null

$models = @()
if ($Language -in @('pt', 'both')) { $models += 'Model_STS.pdf' }
if ($Language -in @('en', 'both')) { $models += 'Model_STS_English.pdf' }

foreach ($model in $models) {
    $source = Join-Path $assetsRoot $model
    $target = Join-Path $baseRoot $model
    if (-not (Test-Path -LiteralPath $source)) {
        throw "Baseline model not found: $source"
    }

    Copy-Item -LiteralPath $source -Destination $target -Force
    $sourceHash = (Get-FileHash -LiteralPath $source -Algorithm SHA256).Hash
    $targetHash = (Get-FileHash -LiteralPath $target -Algorithm SHA256).Hash
    if ($sourceHash -ne $targetHash) {
        throw "Hash verification failed for $model."
    }
}

$charterPath = Join-Path $destinationRoot 'DOCUMENTATION_CHARTER.md'
$languageText = switch ($Language) {
    'pt' { 'em português' }
    'en' { 'em inglês' }
    default { 'em português e inglês' }
}
$modelList = ($models | ForEach-Object { "- docs/sts-base/$_" }) -join [Environment]::NewLine
$charter = @"
# Carta de Documentação

## Status

Esta carta está ativa para este projeto.

## Modelos-base

Os modelos-base STS imutáveis abaixo constituem o manual-base e a carta-base da documentação $languageText deste projeto:

$modelList

## Regras

1. Não edite, reexporte, renomeie ou substitua os PDFs-base.
2. Crie a documentação específica do projeto em entregáveis separados.
3. Siga a sequência de seções do modelo STS selecionado e preserve a rastreabilidade entre requisitos, testes e evidências operacionais.
4. Registre decisões técnicas em ADRs e vincule a fonte de verdade de diagramas, contratos, dashboards, runbooks e testes.
5. Não inclua segredos, tokens, credenciais ou dados pessoais desnecessários na documentação.
"@

Set-Content -LiteralPath $charterPath -Value $charter -Encoding utf8

Write-Output "STS documentation base prepared at: $baseRoot"
Write-Output "Documentation charter created at: $charterPath"
Write-Output "Verified immutable model(s): $($models -join ', ')"
