param($installPath, $toolsPath, $package, $project)

$ScriptDirectory = Split-Path $MyInvocation.MyCommand.Path
. (Join-Path $ScriptDirectory NuGetCommon.ps1)

ValidateProject $project

$aiConfigExists = DoesAIConfigExist $project
if($aiConfigExists -eq $false)
{
	ReportApplicationInsightsConfigNotFound
}

ReportInfo "The ApplicationInsights NuGet package has configured NLog trace collection in your project’s web.config or app.config file. If your project uses a separate NLog.config file, move the <extensions>, <targets>, and <rules> sections into NLog.config." "NLog configuration"