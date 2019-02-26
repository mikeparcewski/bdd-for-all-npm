# BDD For All NPM Wrapper

This is a simple NPM wrapper for the [BDD For All](https://github.com/Accenture/bdd-for-all) library, while we work on a NodeJS port.

## Installing

Please note, since this is a simple wrapper for the JAVA application, you will need JAVA 8 (minimum) in your path.

### Windows

```sbtshell
$ npm install bdd-for-all -g 
```

### Mac/Linux

```sbtshell
$ npm install bdd-for-all -g
```

## Usage

This program requires a base configuration file and feature file(s) at a minimum to execute.  There is a sample in the [samples/](samples/) of each.  For simple run...

Let's start by creating a configuration file...

* Create a file called `Sample.conf` and paste the following.  This provides the URL you'll be hitting for your tests...
  ```json
  bddcore {
  
    request {
  
      server {
        host = "http://www.example.com"
      }
  
    }
  
  }
  ```
  > Learn more about the configuration options at https://github.com/Accenture/bdd-for-all/blob/develop/docs/CONFIGURATION.md
* Next, we let's create a sample feature file called `Sample.feature`
  ```gherkin
  Feature: Testing out the basic step definitions for JSON
  
    Scenario: Domain override (BS1)
      Given I am a JSON API consumer
        And I am executing test "BS1"
       When I request GET "/"
       Then I should get a status code of 200
  ```
* Now we can run the command...
  ```sbtshell
  $ bdd-for-all -Dconfig.file=Sample.conf -p html:reports/html/ -p json:reports/cucumber.json Sample.feature
  ```

As we look at the options above we have...

* Path to the configuration file we just created
* Next we use the `-p` options (for plugin) to produce two reports to disk html and json (can be used in your DevOps pipelines)
* Finally we have the path to the feature file, this could even be a directory with multiple files

### Command Line Options

There are more options available, you can always get this by running...

```sbtshell
$ bdd-for-all -h
```

We use the cucumber runner command line tool.

```sbtshell
Options:

  --threads COUNT                        Number of threads to run tests under.
                                         Defaults to 1.
  -g, --glue PATH                        Where glue code (step definitions, hooks
                                         and plugins) are loaded from.
  -p, --[add-]plugin PLUGIN[:PATH_OR_URL]
                                         Register a plugin.
                                         Built-in formatter PLUGIN types: junit,
                                         html, pretty, progress, json, usage, rerun,
                                         testng. Built-in summary PLUGIN types:
                                         default_summary, null_summary. PLUGIN can
                                         also be a fully qualified class name, allowing
                                         registration of 3rd party plugins.
                                         --add-plugin does not clobber plugins of that
                                         type defined from a different source.
  -t, --tags TAG_EXPRESSION              Only run scenarios tagged with tags matching
                                         TAG_EXPRESSION.
  -n, --name REGEXP                      Only run scenarios whose names match REGEXP.
  -d, --[no-]dry-run                    Skip execution of glue code.
  -m, --[no-]monochrome                 Don't colour terminal output.
  -s, --[no-]strict                     Treat undefined and pending steps as errors.
      --snippets [underscore|camelcase]  Naming convention for generated snippets.
                                         Defaults to underscore.
  -v, --version                          Print version.
  -h, --help                             You're looking at it.
  --i18n LANG                            List keywords for in a particular language
                                         Run with "--i18n help" to see all languages
  --junit,OPTION[,OPTION]*               Pass the OPTION(s) to the JUnit module.
                                         Use --junit,-h or --junit,--help to print the
                                         options of the JUnit module.
  -w, --wip                              Fail if there are any passing scenarios.

Feature path examples:
  <path>                                 Load the files with the extension ".feature"
                                         for the directory <path>
                                         and its sub directories.
  <path>/<name>.feature                  Load the feature file <path>/<name>.feature
                                         from the file system.
  classpath:<path>/<name>.feature        Load the feature file <path>/<name>.feature
                                         from the classpath.
  <path>/<name>.feature:3:9              Load the scenarios on line 3 and line 9 in
                                         the file <path>/<name>.feature.
  @<path>/<file>                         Parse <path>/<file> for feature paths generated
                                         by the rerun formatter.
```

Remember to check out the docs at https://github.com/Accenture/bdd-for-all