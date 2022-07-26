
Feature: Basic

# The secrects can be used in the payload with the following syntax #(mysecretname)
Background:
* def goSecret = karate.properties['goSecret']


Scenario: go-latest

	Given url karate.properties['testURL']

	And path '/'
	And header Direktiv-ActionID = 'development'
	And header Direktiv-TempDir = '/tmp'
	And request
	"""
	{
		"commands": [
		{
			"command": "go version",
			"silent": true,
			"print": false,
		}
		]
	}
	"""
	When method POST
	Then status 200
		And match $ ==
	"""
	{
	"go": [
	{
		"result": "#notnull",
		"success": true
	}
	]
	}
	"""
	
Scenario: go-older

	Given url karate.properties['testURL']

	And path '/'
	And header Direktiv-ActionID = 'development'
	And header Direktiv-TempDir = '/tmp'
	And request
	"""
	{
		"commands": [
		{
			"command": "go1.17 version",
			"silent": true,
			"print": false,
		}
		]
	}
	"""
	When method POST
	Then status 200
		And match $ ==
	"""
	{
	"go": [
	{
		"result": "#notnull",
		"success": true
	}
	]
	}
	"""