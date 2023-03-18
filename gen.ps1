$pth = ".\list.json"
$rdme = ".\README.md"
"" | Out-File -FilePath $pth
"" | Out-File -FilePath $rdme
function PrintFilename {
	param (
		$dir,
		$isfirst
	)
	$cnt = 0
	# Write-Host "#" $dir
	foreach ($i in Get-ChildItem -path $dir) {
		if ($i -is [System.IO.FileInfo]) {
			# Write-Host "! " $dir "\" $i
			if ($isfirst -eq 0){
				Write-Output "," >> $pth
			}
			$cnt += 1
			Write-Output ('"' + $dir + '\' + $i.name + '"').replace('\', '/') >> $pth
		} else {
			$cnt += (PrintFilename -dir ($dir + '\' + $i.name) -isfirst $isfirst)
		}
		$isfirst = 0
	}
	$cnt
}

Write-Output "[" >> $pth
Write-Output ("currently " + (PrintFilename -dir ".\pic" -isfirst 1) + " files") >> $rdme
Write-Output "]" >> $pth
Pause
