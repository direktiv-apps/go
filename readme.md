
# golang 1.0

Go runtime for building applications.

---
- #### Categories: build
- #### Image: gcr.io/direktiv/apps/golang 
- #### License: [Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0)
- #### Issue Tracking: https://github.com/direktiv-apps/golang/issues
- #### URL: https://github.com/direktiv-apps/golang
- #### Maintainer: [direktiv.io](https://www.direktiv.io) 
---

## About golang

This function has the latest version of go installed. Additionally the last 2 older versions are installed as well. The latest version can be used with just the 'go' command. Older versions need to be called explicitly with the version,  e.g. go1.17 build. This function has the following versions installed:

- 1.18 (default)
- 1.17 (go1.17)
- 1.16 (go1.16)

The base image is the official 'buster' Golang image on Docker hub.

### Example(s)
  #### Function Configuration
```yaml
functions:
- id: golang
  image: gcr.io/direktiv/apps/golang:1.0
  type: knative-workflow
```
   #### Basic
```yaml
- id: golang
  type: action
  action:
    function: golang
    input: 
      commands:
      - command: go version
```
   #### Run Older Version
```yaml
- id: golang
  type: action
  action:
    function: golang
    input: 
      commands:
      - command: go1.17 version
```

   ### Secrets


*No secrets required*







### Request



#### Request Attributes
[PostParamsBody](#post-params-body)

### Response
  List of executed commands.
#### Reponse Types
    
  

[PostOKBody](#post-o-k-body)
#### Example Reponses
    
```json
[
  {
    "result": "go version go1.18.3 linux/amd64",
    "success": true
  }
]
```

### Errors
| Type | Description
|------|---------|
| io.direktiv.command.error | Command execution failed |
| io.direktiv.output.error | Template error for output generation of the service |
| io.direktiv.ri.error | Can not create information object from request |


### Types
#### <span id="post-o-k-body"></span> postOKBody

  



**Properties**

| Name | Type | Go type | Required | Default | Description | Example |
|------|------|---------|:--------:| ------- |-------------|---------|
| golang | [][PostOKBodyGolangItems](#post-o-k-body-golang-items)| `[]*PostOKBodyGolangItems` |  | |  |  |


#### <span id="post-o-k-body-golang-items"></span> postOKBodyGolangItems

  



**Properties**

| Name | Type | Go type | Required | Default | Description | Example |
|------|------|---------|:--------:| ------- |-------------|---------|
| result | [interface{}](#interface)| `interface{}` | ✓ | |  |  |
| success | boolean| `bool` | ✓ | |  |  |


#### <span id="post-params-body"></span> postParamsBody

  



**Properties**

| Name | Type | Go type | Required | Default | Description | Example |
|------|------|---------|:--------:| ------- |-------------|---------|
| commands | [][PostParamsBodyCommandsItems](#post-params-body-commands-items)| `[]*PostParamsBodyCommandsItems` |  | | Array of commands. |  |
| files | [][DirektivFile](#direktiv-file)| `[]apps.DirektivFile` |  | | File to create before running commands. |  |


#### <span id="post-params-body-commands-items"></span> postParamsBodyCommandsItems

  



**Properties**

| Name | Type | Go type | Required | Default | Description | Example |
|------|------|---------|:--------:| ------- |-------------|---------|
| command | string| `string` |  | | Command to run | `go version` |
| continue | boolean| `bool` |  | | Stops excecution if command fails, otherwise proceeds with next command |  |
| print | boolean| `bool` |  | `true`| If set to false the command will not print the full command with arguments to logs. |  |
| silent | boolean| `bool` |  | | If set to false the command will not print output to logs. |  |

 
