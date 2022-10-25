# smart-stats

## Setup

```
bundle
```

## Running the tests

### Run all the tests

```
rake test
```

### Run an individual test

```
ruby tests/integration_test.rb
ruby tests/reports/unique_visits_test .rb
```

## Linting

```
rake rubocop
```

## Developer Log

### Aims

* Build for change: don't make it hard to add new features like new log columns, reports, or output types
* Reduce frustration: where possible, gracefully report issues in parsing instead of blowing up
* Readability: make the flow through the code obvious

## Things I like

* Separation of layers

## Things I don't like

## Log

* Project setup:
  - Tried to keep the dependencies to a minimum so setup with minitest
* Created an integration test using stripped down, valid test data based on the web server log
  - Runs the actual command line version and reads the raw output
  - Checks for valid returns so any script errors will be easy to spot in the test output
* Implemented a single file with very rough code until the integration test passed
  - Helped to understand the core parts of the parsing that would need to be done
  - Drove out any issues with test setup
* Sketched out basic objects and structure
  - Aiming for clear layers - LogFile => Report => Renderer
* Wrote tests for two report types UniqueVisits & TotalVisits
  - Extracted code from single file into separate classes - green tests - started refactor
* Added error cases to integration spec
* Setup rubocop
