# API Watchdog Translator Tests

This repository stores [API Watchdog specification](https://github.com/ranking-agent/api-watchdog)
tests against NCATS Translator endpoints. It functions as a central place where different groups can add tests for their Translator services to be routinely scheduled for execution.

Before submitting a PR to add new tests, please run the tests locally using the command line interface for API Watchdog.

```
api-watchdog discover your_test.watchdog.json
```

For an example of an API Watchdog test see [#1](https://github.com/ranking-agent/api-watchdog-translator-tests/pull/1).
