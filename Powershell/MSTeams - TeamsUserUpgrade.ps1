#Obtain SfB Powershell connector from https://www.microsoft.com/en-us/download/details.aspx?id=39366

#Connect to Teams PS Management
$sfboSession = New-CsOnlineSession
Import-PSSession $sfboSession

#Run through CSV list of email address, convert to TeamsOnly mode
$TeamsUsers = import-csv "c:\WorkingFiles\teamsusers.csv"
$TeamsUsers | foreach{Grant-CsTeamsUpgradePolicy -PolicyName UpgradeToTeams -Identity $_.userprincipalname}
$TeamsUsers | foreach{Grant-CsTeamsInteropPolicy -PolicyName DisallowOverrideCallingTeamsChatTeams -Identity $_.userprincipalname}
