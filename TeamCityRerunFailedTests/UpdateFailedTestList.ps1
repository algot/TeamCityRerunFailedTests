Import-Module .\CsvParser.psm1
Import-Module .\DownloadLatestBuildResults.psm1

$testResultsFile = "results.csv"
$testListStorage = "\\test\TestLists\failedTests.txt"

DownloadLatestBuildResult

$testNamesCleaned = ParseCsv($testResultsFile)

$testNamesCleaned | Out-File $testListStorage
