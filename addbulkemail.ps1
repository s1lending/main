#Created 8/11/2015 by Eric Neudorfer
#Make sure licenses are present first
#Create csv file with headers 
#FirstName	LastName	DisplayName	UserPrincipalName	UsageLocation


Connect-MsolService

Import-Csv -Path "C:\Users\eric\Documents\add users.csv" | ForEach-Object { New-MsolUser -FirstName $_.FirstName -LastName $_.LastName -DisplayName $_.DisplayName -UserPrincipalName $_.UserPrincipalName  -UsageLocation $_.UsageLocation } | Export-Csv -Path "C:\Users\eric\Documents\LogNewAssignments.csv"
  
  #-LicenseAssignment 'synergyonelending:standardpack'
  
Send-Mailmessage -Credential s1lending_it@s1lending.com -SmtpServer smtp.office365.com -to it@s1lending.com -from s1lending_it@s1lending.com -subject "TEST New Users " -UseSsl "New Users" -Port "587" -Attachments "C:\Users\eric\Documents\LogNewAssignments.csv" 
