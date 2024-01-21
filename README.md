# E2E Testing with Robot Framework

This repository contain example sources for presentation of basic Robot Framework features.

[Robot Framework](https://robotframework.org/) is a popular test automation framework used mainly for automating testing of E2E and UI tests.

## Example web app

[Example web application](/example-web-app) is written in React.js. It implements very simple form with name input and submit button. Once the form is submitted the greeting with name included is displayed. [Node.js and npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm) must be installed as a prerequisity.

Start example app:

```
cd example-web-app
npm install
npm start
```

## Example Robot tests

[Example tests](/example-tests) show the very basic features of Robot Framework.

Install Robot Framework with [Python pip](https://pip.pypa.io/en/stable/installation/):

```
pip install robotframework robotframework-browser robotframework-requests
rfbrowser init
```

Run tests:

```
cd example-tests
robot -L trace --outputdir ./test-results ./tests
```

Resulting test report can be found [here](/example-tests/test-results/report.html).

There is also [example script](/example-tests/jira.sh) for Jira import of test results.