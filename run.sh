#!/bin/bash

set -x

PROJECT_KEY="${PROJECT_KEY:-ConsoleApplication1}"
PROJECT_NAME="${PROJECT_NAME:-ConsoleApplication1}"
PROJECT_VERSION="${PROJECT_VERSION:-1.0}"
SONAR_HOST="${HOST:-http://localhost:9000}"
SONAR_LOGIN_KEY="${LOGIN_KEY:-admin}"
SONAR_COVERAGE_PATH="${SONAR_COVERAGE_PATH}"

mono /opt/sonar-scanner-msbuild/SonarScanner.MSBuild.exe begin /d:sonar.host.url=$SONAR_HOST /d:sonar.login=$SONAR_LOGIN_KEY /d:sonar.cs.opencover.reportsPaths=$SONAR_COVERAGE_PATH /k:$PROJECT_KEY /n:"$PROJECT_NAME" /v:$PROJECT_VERSION
sh OMCRecallHandler.Tests/scripts/code-coverage
mono /opt/sonar-scanner-msbuild/SonarScanner.MSBuild.exe end /d:sonar.login=$SONAR_LOGIN_KEY
