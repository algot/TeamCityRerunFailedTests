function ParseCsv ($inputFile) {
  
  $textToReplace = "CRM_Autotests.dll: "
  
  $inputValues = Import-Csv $inputFile
  $failed = $inputValues | Where-Object { $_.Status -eq 'Failure'}
  $testNames = $failed | Select-Object -ExpandProperty "Test Name"
  $testNamesCleaned = foreach ($test in $testNames)
  {
    $test.Replace($textToReplace, "")
  }

  return $testNamesCleaned
}