#!/bin/sh

set -e

if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <artifactoryContextUrl> <developerConnection>"
    exit 1
fi

ARTIFACTORY_CONTEXT_URL=$1
DEVELOPER_CONNECTION=$2

get_version_from_maven() {
    echo "$(atlas-mvn help:evaluate -Dexpression=project.version -q -DforceStdout | tail -n 1)"
}

atlas-mvn build-helper:parse-version versions:set '-DnewVersion=\${parsedVersion.majorVersion}.\${parsedVersion.minorVersion}.\${parsedVersion.incrementalVersion}' versions:commit
version=$(get_version_from_maven)
echo ${version} > release.version
git add pom.xml && git commit -m "[skip ci] release v${version}"
atlas-mvn clean deploy scm:tag \
    "-DaltReleaseDeploymentRepository=artifactory.libs-release-local::$ARTIFACTORY_CONTEXT_URL/libs-release-local" \
    "-DaltSnapshotDeploymentRepository=artifactory.libs-snapshot-local::$ARTIFACTORY_CONTEXT_URL/libs-snapshot-local" \
    "-Ddeveloper.connection=scm:git:$DEVELOPER_CONNECTION" \
    -Pci
atlas-mvn build-helper:parse-version versions:set '-DnewVersion=\${parsedVersion.majorVersion}.\${parsedVersion.minorVersion}.\${parsedVersion.nextIncrementalVersion}-SNAPSHOT' versions:commit
version=$(get_version_from_maven)
git add pom.xml && git commit -m "[skip ci] set development version ${version}" && git push
