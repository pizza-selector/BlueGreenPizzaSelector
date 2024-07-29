// Karma configuration file, see link for more information
// https://karma-runner.github.io/1.0/config/configuration-file.html

module.exports = function (config) {
    config.set({
      basePath: '',
      frameworks: ['jasmine', '@angular-devkit/build-angular'],
      plugins: [
        require('karma-jasmine'),
        require('karma-chrome-launcher'),
        require('karma-jasmine-html-reporter'),
        require('karma-junit-reporter'),
        require('karma-spec-reporter'),
        require('karma-coverage'),
        require('@angular-devkit/build-angular/plugins/karma'),
      ],
      client: {
        jasmine: {
          random: false
        },
        clearContext: false // leave Jasmine Spec Runner output visible in browser
      },
      reporters: ['spec', 'kjhtml', 'junit', 'coverage'],
      preprocessors: {
        'src/**/*.ts': ['coverage']
      },
      coverageReporter: {
        dir: 'reports',
        reporters: [
          {type: 'cobertura', subdir: 'coverage'},
          {type: 'lcov', subdir: 'coverage'}
        ]
      },
      specReporter: {
        maxLogLines: 5,         // limit number of lines logged per test
        suppressErrorSummary: true,  // do not print error summary
        suppressFailed: false,  // do not print information about failed tests
        suppressPassed: false,  // do not print information about passed tests
        suppressSkipped: true,  // do not print information about skipped tests
        showSpecTiming: false // print the time elapsed for each spec
      },
      junitReporter: {
        outputDir: 'reports',
      },
      port: 9876,
      colors: true,
      logLevel: config.LOG_INFO,
      autoWatch: true,
      browsers: ['Chrome', 'ChromeHeadless', 'ChromeHeadlessCI'],
      customLaunchers: {
        ChromeHeadlessCI: {
          base: 'ChromeHeadless',
          flags: ['--no-sandbox', '--disable-extensions']
        }
      },
      singleRun: false,
      restartOnFileChange: true
    });
    process.env.TZ = 'UTC';
  };