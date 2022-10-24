# smart-stats

## Setup

```
bundle
```

## Running the tests

```
ruby tests/integration_test.rb
```

## Developer Log

1. Project setup:
  - Tried to keep the dependencies to a minimum so setup with minitest
1. Created an integration test using stripped down, valid test data based on the web server log
  - Runs the actual command line version and reads the raw output
  - Checks for valid returns so any script errors will be easy to spot in the test output
2. Implemented a single file with very rough code until the integration test passed
  - Helped to understand the core parts of the parsing that would need to be done
  - Drove out any issues with test setup
