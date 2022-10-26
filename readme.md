# smart-stats

Smart stats is an example project to demonstrate my approach development.

The idea is simple: take a sample web server log file and output some statistics. The aim is to produce a well-modelled, well-tested script that is built for future change and expansion.


## Setup

```
bundle
```

## Running

```
$ ruby parser.rb data/webserver.log

[Total visits by page]

/about/2 90
/contact 89
/index   82
/about   81
/help_page/1 80
/home    78

[Unique visits by page]

/index   23
/home    23
/contact 23
/help_page/1 23
/about/2 22
/about   21

Found errors on the following lines:

Line 16: "fsdafd ffdasfsd"
```

Try with a larger file (50k lines):
```
ruby parser.rb data/large.log
```

## Running the tests

Run all the tests
```
rake test
```

Run an individual test

```
ruby tests/integration_test.rb
ruby tests/reports/unique_visits_test .rb
```

## Linting

```
rake rubocop
```

## Approach

The commit history shows a broad overview of how I iterated on the code. 

I started by creating an integration test and a very rough prototype to figure out the logic needed and potential issues ([a1e08](https://github.com/stevebartholomew/smart-stats/commit/e78ab2b916728acc549bbfd0a2edee5e7e3a1e08))

I then identified the core objects and layers - I wanted to have a clear flow from `Log -> Reports -> Renderer`. From there I started extracting the "report" code from the prototype into objects, driving the interfaces with tests ([fa299](https://github.com/stevebartholomew/smart-stats/commit/c517673dd4eeca17ca9a39a6c31e673ca8afa299))

After that I worked the same process for logs ([196d1](https://github.com/stevebartholomew/smart-stats/commit/3e07ca5e595fea2048b6c760f2be4fd9a57196d1)) and renderers, along with a basic CLI class ([5e943](https://github.com/stevebartholomew/smart-stats/commit/c7bff3e0cd6ca09f8dd7f8bed1007bc5eaf5e943))


### Overall goals

* Build for change: don't make it hard to add new features like new log columns, reports, or output types
* Reduce frustration: where possible, gracefully report issues in parsing instead of blowing up
* Readability: make the flow through the code obvious

### Things I like

* Separation of layers
* Object creation is light-weight
* Handles large-ish files performantly

### Things I'm not sure about

* Probably should have used rspec instead of hand-rolling test config and reacquainting with minitest
* Not sure the meta programming in `LogFile::Parsers.line` is worth it but it is contained and is cleaner than the long form
* The actual validation of parsed data in `LogFile` is basic - although it's simple to understand and iterate on

### Improvements

* HTML renderer
* CLI options e.g. disabling error output
* Localisation