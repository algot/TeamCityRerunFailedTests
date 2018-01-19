Import-Module .\GetLatestBuildNumber

function DownloadLatestBuildResult () {
  $username = "admin"
  $password = ""
  
  $server = "http://test.net/"
  $number = GetLatestBuildNumber
  $id = GetLatestBuildId
  
  $url = $server + "get/tests/buildId/$id/CrmAutomationTests_RunAllTests_$number-tests.csv"
  
  $client = New-Object System.Net.WebClient
  $client.Credentials = new-object System.Net.NetworkCredential($username, $password)
  $client.DownloadFile($url, "$PWD\results.csv");  
}
