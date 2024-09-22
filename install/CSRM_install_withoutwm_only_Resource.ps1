# ���ÿ���̨����ΪUTF-8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# ������־
$VerbosePreference = "Continue"

# �����Ҫ�ĳ��򲢳�ʼ������
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()
Add-Type @"
    using System;
    using System.Runtime.InteropServices;
    public class KeyboardHelper {
        [DllImport("user32.dll")]
        public static extern short GetKeyState(int nVirtKey);
    }
"@

Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class Win32 {
    [DllImport("kernel32.dll")]
    public static extern IntPtr GetConsoleWindow();

    [DllImport("user32.dll")]
    public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);
}
"@

# ȫ�ֱ���
$script:isBinding = $false
$script:currentBindingButton = $null

# �����󶨿ؼ�UI����
$script:bindingControlHeight = 28
$script:bindingControlWidth = 110
$script:bindingControlHorizontalSpacing = 5
$script:bindingControlVerticalSpacing = 5

$currentDirectory = Get-Location
$sourceFile = Join-Path -Path $currentDirectory -ChildPath "resource.zip"
if (-Not (Test-Path -Path $sourceFile)) {
    throw "��ǰĿ¼��δ�ҵ� resource.zip �ļ�"
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