var reporter = require('cucumber-html-reporter');

var options = {
    theme: 'hierarchy',
    jsonFile: 'report.json',
    output: 'report.html',
    reportSuiteAsScenarios: true,
    scenarioTimestamp: true,
    launchReport: true,
    metadata: {
        "App Version": "1.0.0",
        "Test Environment": "Dev",
        "Parallel": "Scenarios",
        "Executed": "Remote"
    }
};

reporter.generate(options);