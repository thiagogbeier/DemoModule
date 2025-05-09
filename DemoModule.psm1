#region Script Header
# NAME: DemoModule.psm1
# AUTHOR: Thiago Beier
# CONTACT: GitHub: thiagogbeier / Twitter: thiagobeier
# DATE: 2025-05-09
# VERSION: 0.1.0 - 2025-05-09 - Initial version
#
# SYNOPSIS:
#
#
# #DESCRIPTION:
#
#
# REQUIREMENTS:
#
#endregion Script Header

#Requires -Version 3.0

[cmdletbinding()]
param()

Write-Verbose $PSScriptRoot

#Get public and private function definition files.
$Functions = @( Get-ChildItem -Path $PSScriptRoot\Functions\*.ps1 -ErrorAction SilentlyContinue )
$Helpers = @( Get-ChildItem -Path $PSScriptRoot\Helpers\*.ps1 -ErrorAction SilentlyContinue )

#Dot source the files
Foreach ($Import in @($Functions + $Helpers)) {
    Try {
        Write-Verbose "Processing $($Import.Fullname)"
        . $Import.Fullname
    }
    Catch {
        Write-Error -Message "Failed to Import function $($Import.Fullname): $_"
    }
}

Export-ModuleMember -Function $Functions.Basename