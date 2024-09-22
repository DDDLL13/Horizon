# ���ÿ���̨����ΪUTF-8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# ������־
$VerbosePreference = "Continue"

$currentDirectory = Get-Location
$sourceFile = Join-Path -Path $currentDirectory -ChildPath "resource.zip"
if (-Not (Test-Path -Path $sourceFile)) {
    throw "��ǰĿ¼��δ�ҵ� resource.zip �ļ�"
}

$process = Get-Process -Name "�������羺��ƽ̨" -ErrorAction Stop
$processPath = ($process | Select-Object -First 1).Path
$directory = Split-Path $processPath -Parent

$targetFile = Join-Path -Path $directory -ChildPath "plugin\resource\resource.zip"
$targetDirectory = Split-Path $targetFile -Parent
if (-Not (Test-Path -Path $targetDirectory)) {
    New-Item -Path $targetDirectory -ItemType Directory -Force
}

Copy-Item -Path $sourceFile -Destination $targetFile -Force
if (-Not (Test-Path -Path $targetFile)) {
    throw "�ļ�����ʧ��: $targetFile"
}

$zipFilePath2 = ".\resource.zip"
$destinationFolder2 = "..\..\resource"
if (-not (Test-Path $destinationFolder2)) {
    New-Item -Path $destinationFolder2 -ItemType Directory
}

Expand-Archive -Path $zipFilePath2 -DestinationPath $destinationFolder2 -Force

Write-Verbose "Installation completed"
# ������ʾ
$finalMessage = "��װ��ɣ����ؿ���Ϸ����ԡ�`n`n"
if ($feedbackMessage) {
    $finalMessage += "������`n$feedbackMessage"
}

$result = [System.Windows.Forms.MessageBox]::Show($finalMessage, "��װ���", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)