#!/bin/sh

set -e

if [ "$#" -lt 6 ]; then
    echo "Usage: $0 <artifactoryContextUrl> <artifactoryUsername> <artifactoryPassword> <deployUrl> <deployUsername> <deployPassword> [versionNumber]"
    exit 1
fi

ARTIFACTORY_CONTEXT_URL=$1
ARTIFACTORY_USERNAME=$2
ARTIFACTORY_PASSWORD=$3
DEPLOY_URL=$4
DEPLOY_USERNAME=$5
DEPLOY_PASSWORD=$6
VERSION=$7

get_groupId_from_maven() {
    echo "$(atlas-mvn help:evaluate -Dexpression=project.groupId -q -DforceStdout | tail -n 1)"
}

get_artifactId_from_maven() {
    echo "$(atlas-mvn help:evaluate -Dexpression=project.artifactId -q -DforceStdout | tail -n 1)"
}

get_version_from_maven() {
    echo "$(atlas-mvn help:evaluate -Dexpression=project.version -q -DforceStdout | tail -n 1)"
}

echo "Fetching groupId from Maven"
groupId=$(get_groupId_from_maven)
echo "Fetching artifactId from Maven"
artifactId=$(get_artifactId_from_maven)

if [ "${VERSION}" = "" ]; then
    echo "Fetching version from Maven"
    VERSION=$(get_version_from_maven)
fi

# download artifact from artifactory
gavcUrl="$ARTIFACTORY_CONTEXT_URL/api/search/gavc?g=${groupId}&a=${artifactId}&v=${VERSION}"
echo "GAVC URL = ${gavcUrl}"

descriptorUrl=$(curl -s -X GET -u ${ARTIFACTORY_USERNAME}:${ARTIFACTORY_PASSWORD} "${gavcUrl}" | grep "uri" | cut -d '"' -f4 | sort -r | grep ".*[0-9]\.jar" | head -n 1)
echo "Descriptor URL = ${descriptorUrl}"

downloadUrl=$(curl -s -X GET -u ${ARTIFACTORY_USERNAME}:${ARTIFACTORY_PASSWORD} "${descriptorUrl}" | grep downloadUri | cut -d '"' -f4)
echo "Download URL = ${downloadUrl}"

echo "Downloading JAR file from Artifactory ..."
curl -X GET -u ${ARTIFACTORY_USERNAME}:${ARTIFACTORY_PASSWORD} "${downloadUrl}" -O

# install plugin via upm
fileName=${downloadUrl#*${VERSION}/}
echo "File Name = ${fileName}"
echo "Installing plugin ..."
atlas-mvn -Ddeploy.url="$DEPLOY_URL" -Ddeploy.username="$DEPLOY_USERNAME" -Ddeploy.password="$DEPLOY_PASSWORD" \
    upm:uploadPluginFile -DpluginKey="$groupId.$artifactId" -DpluginFile="$fileName"
