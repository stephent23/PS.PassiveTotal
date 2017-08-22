#
# Module loader for PS.PassiveTotal
#
# Author: Stephen Tate
# Created: 06-AUG-2017
#


# Private functions
[Array]$Private = 'Get-PTConfig',
                  'Get-PTUsername',
                  'Get-PTAPIKey',
                  'Get-PTAuthentication'

if ($Private.Count -ge 1) {
  $Private | ForEach-Object {
    . "$($PSScriptRoot)/private/$_.ps1"
  }
}


# Public functions
[Array]$Public = 'Get-PTWhoIs',
                 'Search-PTWhoIs'

if ($Public.Count -ge 1) {
  $Public | ForEach-Object {
    . "$($PSScriptRoot)/public/$_.ps1"
  }
}
