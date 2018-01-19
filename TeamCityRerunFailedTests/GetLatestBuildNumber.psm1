$url = "http://test.net/guestAuth/app/rest/buildTypes/id:CrmAutomationTests_RunAllTests/builds"
function GetLatestBuildNumber () {
  $xml = [xml](invoke-RestMethod -Uri $url -Method GET)
  $xpath = "/builds/build[1]"
  $latestBuild = Select-xml -xpath $xpath -xml $xml
  
  $number =  $latestBuild.Node.GetAttribute("number")
  return $number  
}

function GetLatestBuildId () {
  $xml = [xml](invoke-RestMethod -Uri $url -Method GET)
  $xpath = "/builds/build[1]"
  $latestBuild = Select-xml -xpath $xpath -xml $xml
  
  $number =  $latestBuild.Node.GetAttribute("id")
  return $number  
}
