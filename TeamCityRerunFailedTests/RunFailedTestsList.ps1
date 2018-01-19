$user = "admin"
$password = ""
$teamCityHost = "http://test.net/"
$pair = "$($user):$($password)"

$encodedCreds = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($pair))
$basicAuthValue = "Basic $encodedCreds"
$headers = @{
    "Authorization" = $basicAuthValue;
    "Accept" = "application/xml";
    "Content-Type" = "application/xml";
}

$buildId = "CrmAutomationTests_RunFailedTestList"
$body = "<build><buildType id=""$buildId""/></build>"
$api = "$($teamCityHost)httpAuth/app/rest/buildQueue"
$response = Invoke-WebRequest -Uri $api -Headers $headers -Method POST -Body $body
if(200 -ne $response.StatusCode){
  exit 1
}
