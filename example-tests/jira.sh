#!/bin/bash

#
# Import Robot Framework test results to Jira using XRay REST API.
# https://docs.getxray.app/display/XRAY/Import+Execution+Results+-+REST#ImportExecutionResultsREST-RobotFrameworkXMLresults
#

# Setup query parameters for  the reques
QUERY="projectKey=${JIRA_PROJECT}"
if [[ x"${JIRA_TEST_PLAN}" != "x" ]]; then QUERY="${QUERY}&testPlanKey=${JIRA_TEST_PLAN}"; fi
if [[ x"${JIRA_TEST_EXECUTION}" != "x" ]]; then QUERY="${QUERY}&testExecKey=${JIRA_TEST_EXECUTION}"; fi
if [[ x"${JIRA_REVISION}" != "x" ]]; then QUERY="${QUERY}&revision=${JIRA_REVISION}"; fi
if [[ x"${JIRA_ENVIRONMENT}" != "x" ]]; then QUERY="${QUERY}&testEnvironments=${JIRA_ENVIRONMENT}"; fi

TOKEN=$(curl --location "${XRAY_URL}/api/v1/authenticate" \
    --header 'Content-Type: application/json' \
    --data "{\"client_id\":\"${JIRA_CLIENT_ID}\",\"client_secret\":\"${JIRA_CLIENT_SECRET}\"}" | sed 's/"//g')

# Import the results to Jira using XRay REST API
curl --fail -H "Content-Type: text/xml" -X POST -H "Authorization: Bearer ${TOKEN}" \
    --data @"test-results/output.xml" "${XRAY_URL}/api/v1/import/execution/robot?${QUERY}"
