$directory = "./Preference.cfg" # �ļ�·����û����������������

# Windows Forms
Add-Type -AssemblyName System.Windows.Forms

# ����ui ��ȡ��������
$form = New-Object System.Windows.Forms.Form
$form.Text = "���������CS2���֡��(�粻��֡����0����)"
$form.Size = New-Object System.Drawing.Size(400, 200)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$form.MaximizeBox = $false
$form.MinimizeBox = $false

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10, 20)
$label.Size = New-Object System.Drawing.Size(400, 20)
$label.Text = "���������CS2֡������(�粻��֡����0����)��"

$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(10, 50)
$textBox.Size = New-Object System.Drawing.Size(300, 20)

$button = New-Object System.Windows.Forms.Button
$button.Location = New-Object System.Drawing.Point(100, 90)
$button.Size = New-Object System.Drawing.Size(75, 23)
$button.Text = "ȷ��"
$button.Add_Click({
        $form.Close()
    })

$form.Controls.Add($label)
$form.Controls.Add($textBox)
$form.Controls.Add($button)

$form.Topmost = $true
$form.Add_Shown({ $textBox.Select() })
$result = $form.ShowDialog()

# ����
if ([int]::TryParse($textBox.Text, [ref]$null)) {
    $fps = [int]$textBox.Text
    if ($fps -lt 64 -and $fps -gt 0) {
        [System.Windows.Forms.MessageBox]::Show("������Ч��������0������64��9999֮�����ֵ��", "����", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        exit 1
    }
    if ($fps -lt 0 -or $fps -gt 9999) {
        [System.Windows.Forms.MessageBox]::Show("������Ч��������0������64��9999֮�����ֵ��", "����", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        exit 1
    }
}
else {
    [System.Windows.Forms.MessageBox]::Show("��������Ч�����֡�", "����", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
    exit 1
}


# ��ȡ
$fileContent = Get-Content -Path $directory -Raw -Encoding UTF8

# �޸�
$newCsrmFpsMaxCommand = "alias CSRM_fps_max fps_max $fps`n"
$csrmFpsMaxPattern = '(?m)^\s*alias\s+CSRM_fps_max\s+fps_max\s+(\d+)\s*$'
$newfileContent = $fileContent -replace $csrmFpsMaxPattern, $newCsrmFpsMaxCommand

# д��
$utf8NoooooooooBom = New-Object System.Text.UTF8Encoding $false
[System.IO.File]::WriteAllText($directory, $newfileContent, $utf8NoooooooooBom)

# ������ʾ
[System.Windows.Forms.MessageBox]::Show("�ɹ���", "���", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)