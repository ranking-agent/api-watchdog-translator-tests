# API Watchdog Translator Tests

This repository stores [API Watchdog specification](https://github.com/ranking-agent/api-watchdog)
tests against NCATS Translator endpoints. It functions as a central place where different groups can add tests for their Translator services to be routinely scheduled for execution.

Before submitting a PR to add new tests, please run the tests locally using the command line interface for API Watchdog.

```
api-watchdog discover your_test.watchdog.json
```

A test is a JSON file containing an object with the keys

    name (str): The name of the test
    target (url): The endpoint that the test targets
    [optional] method (str): The HTTP method (GET, POST, etc.) to use when sending the request. If none is specified, it will default to POST.
    [optional] email_to (list[str]): A list of emails to send results of the test to
    expectation(Array[Expectation]): A list of requirements that the response must meet for the test to pass.
    payload (object): The json passed to the endpoint.

Each expectation is an object with the keys

    selector (jq program): A string describing a jq program that selects the one or more elements to test against
    value (Any): a value to test equality against
    validation_type (ValidationType): An API Watchdog validation type used to validate the value/response. The value/response will be implicitly converted to this type. For example, if you specify 'float' and the value is an integer it will be implicitly converted to a float.


For an example of an API Watchdog test see [#1](https://github.com/ranking-agent/api-watchdog-translator-tests/pull/1).
