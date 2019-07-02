#!/bin/bash

SCRIPT_DIRECTORY=$(cd `dirname $0` && pwd)

# --------------------------------------------------------------------------------------------
# IDEA RUN CONFIGURATIONS
# --------------------------------------------------------------------------------------------
DIRECTORY="$(dirname "$0")/../.idea/runConfigurations"
mkdir -p ${DIRECTORY}

# clean_maven
FILE=${DIRECTORY}/clean_maven.xml
echo '<component name="ProjectRunConfigurationManager">'                                                                           > ${FILE}
echo '  <configuration default="false" name="clean-maven" type="BashConfigurationType" factoryName="Bash" nameIsGenerated="true">' >> ${FILE}
echo '    <module name="confluence-redirect-plugin" />'                                                                            >> ${FILE}
echo '    <option name="INTERPRETER_OPTIONS" value="" />'                                                                          >> ${FILE}
echo '    <option name="INTERPRETER_PATH" value="/bin/bash" />'                                                                    >> ${FILE}
echo '    <option name="PROJECT_INTERPRETER" value="false" />'                                                                     >> ${FILE}
echo '    <option name="WORKING_DIRECTORY" value="" />'                                                                            >> ${FILE}
echo '    <option name="PARENT_ENVS" value="true" />'                                                                              >> ${FILE}
echo '    <option name="SCRIPT_NAME" value="$PROJECT_DIR$/script/clean-maven.sh" />'                                               >> ${FILE}
echo '    <option name="PARAMETERS" value="" />'                                                                                   >> ${FILE}
echo '    <method v="2" />'                                                                                                        >> ${FILE}
echo '  </configuration>'                                                                                                          >> ${FILE}
echo '</component>'                                                                                                                >> ${FILE}

# confluence_debug
FILE=${DIRECTORY}/confluence_debug.xml
touch ${FILE}
echo '<component name="ProjectRunConfigurationManager">'                                                          > ${FILE}
echo '  <configuration default="false" name="confluence:debug" type="MavenRunConfiguration" factoryName="Maven">' >> ${FILE}
echo '    <MavenSettings>'                                                                                        >> ${FILE}
echo '      <option name="myGeneralSettings" />'                                                                  >> ${FILE}
echo '      <option name="myRunnerSettings" />'                                                                   >> ${FILE}
echo '      <option name="myRunnerParameters">'                                                                   >> ${FILE}
echo '        <MavenRunnerParameters>'                                                                            >> ${FILE}
echo '          <option name="profiles">'                                                                         >> ${FILE}
echo '            <set />'                                                                                        >> ${FILE}
echo '          </option>'                                                                                        >> ${FILE}
echo '          <option name="goals">'                                                                            >> ${FILE}
echo '            <list>'                                                                                         >> ${FILE}
echo '              <option value="confluence:debug" />'                                                          >> ${FILE}
echo '              <option value="-Datlassian.dev.mode=false" />'                                                >> ${FILE}
echo '            </list>'                                                                                        >> ${FILE}
echo '          </option>'                                                                                        >> ${FILE}
echo '          <option name="pomFileName" value="pom.xml" />'                                                    >> ${FILE}
echo '          <option name="profilesMap">'                                                                      >> ${FILE}
echo '            <map />'                                                                                        >> ${FILE}
echo '          </option>'                                                                                        >> ${FILE}
echo '          <option name="resolveToWorkspace" value="false" />'                                               >> ${FILE}
echo '          <option name="workingDirPath" value="$PROJECT_DIR$" />'                                           >> ${FILE}
echo '        </MavenRunnerParameters>'                                                                           >> ${FILE}
echo '      </option>'                                                                                            >> ${FILE}
echo '    </MavenSettings>'                                                                                       >> ${FILE}
echo '    <method v="2" />'                                                                                       >> ${FILE}
echo '  </configuration>'                                                                                         >> ${FILE}
echo '</component>'                                                                                               >> ${FILE}

# confluence_run
FILE=${DIRECTORY}/confluence_run.xml
touch ${FILE}
echo '<component name="ProjectRunConfigurationManager">'                                                          > ${FILE}
echo '  <configuration default="false" name="confluence:debug" type="MavenRunConfiguration" factoryName="Maven">' >> ${FILE}
echo '    <MavenSettings>'                                                                                        >> ${FILE}
echo '      <option name="myGeneralSettings" />'                                                                  >> ${FILE}
echo '      <option name="myRunnerSettings" />'                                                                   >> ${FILE}
echo '      <option name="myRunnerParameters">'                                                                   >> ${FILE}
echo '        <MavenRunnerParameters>'                                                                            >> ${FILE}
echo '          <option name="profiles">'                                                                         >> ${FILE}
echo '            <set />'                                                                                        >> ${FILE}
echo '          </option>'                                                                                        >> ${FILE}
echo '          <option name="goals">'                                                                            >> ${FILE}
echo '            <list>'                                                                                         >> ${FILE}
echo '              <option value="confluence:run" />'                                                            >> ${FILE}
echo '              <option value="-Datlassian.dev.mode=false" />'                                                >> ${FILE}
echo '            </list>'                                                                                        >> ${FILE}
echo '          </option>'                                                                                        >> ${FILE}
echo '          <option name="pomFileName" value="pom.xml" />'                                                    >> ${FILE}
echo '          <option name="profilesMap">'                                                                      >> ${FILE}
echo '            <map />'                                                                                        >> ${FILE}
echo '          </option>'                                                                                        >> ${FILE}
echo '          <option name="resolveToWorkspace" value="false" />'                                               >> ${FILE}
echo '          <option name="workingDirPath" value="$PROJECT_DIR$" />'                                           >> ${FILE}
echo '        </MavenRunnerParameters>'                                                                           >> ${FILE}
echo '      </option>'                                                                                            >> ${FILE}
echo '    </MavenSettings>'                                                                                       >> ${FILE}
echo '    <method v="2" />'                                                                                       >> ${FILE}
echo '  </configuration>'                                                                                         >> ${FILE}
echo '</component>'                                                                                               >> ${FILE}

# package
FILE=${DIRECTORY}/package.xml
touch ${FILE}
echo '<component name="ProjectRunConfigurationManager">'                                                                                               > ${FILE}
echo '  <configuration default="false" name="package" type="MavenRunConfiguration" factoryName="Maven">'                                               >> ${FILE}
echo '    <MavenSettings>'                                                                                                                             >> ${FILE}
echo '      <option name="myGeneralSettings" />'                                                                                                       >> ${FILE}
echo '      <option name="myRunnerSettings" />'                                                                                                        >> ${FILE}
echo '      <option name="myRunnerParameters">'                                                                                                        >> ${FILE}
echo '        <MavenRunnerParameters>'                                                                                                                 >> ${FILE}
echo '          <option name="profiles">'                                                                                                              >> ${FILE}
echo '            <set />'                                                                                                                             >> ${FILE}
echo '          </option>'                                                                                                                             >> ${FILE}
echo '          <option name="goals">'                                                                                                                 >> ${FILE}
echo '            <list>'                                                                                                                              >> ${FILE}
echo '              <option value="package" />'                                                                                                        >> ${FILE}
echo '            </list>'                                                                                                                             >> ${FILE}
echo '          </option>'                                                                                                                             >> ${FILE}
echo '          <option name="pomFileName" value="pom.xml" />'                                                                                         >> ${FILE}
echo '          <option name="profilesMap">'                                                                                                           >> ${FILE}
echo '            <map />'                                                                                                                             >> ${FILE}
echo '          </option>'                                                                                                                             >> ${FILE}
echo '          <option name="resolveToWorkspace" value="false" />'                                                                                    >> ${FILE}
echo '          <option name="workingDirPath" value="$PROJECT_DIR$" />'                                                                                >> ${FILE}
echo '        </MavenRunnerParameters>'                                                                                                                >> ${FILE}
echo '      </option>'                                                                                                                                 >> ${FILE}
echo '    </MavenSettings>'                                                                                                                            >> ${FILE}
echo '    <method v="2">'                                                                                                                              >> ${FILE}
echo '      <option name="RunConfigurationTask" enabled="true" run_configuration_name="clean-maven" run_configuration_type="BashConfigurationType" />' >> ${FILE}
echo '    </method>'                                                                                                                                   >> ${FILE}
echo '  </configuration>'                                                                                                                              >> ${FILE}
echo '</component>'                                                                                                                                    >> ${FILE}

# debug
FILE=${DIRECTORY}/debug.xml
touch ${FILE}
echo '<component name="ProjectRunConfigurationManager">'            > ${FILE}
echo '  <configuration default="false" name="debug" type="Remote">' >> ${FILE}
echo '    <module name="confluence-redirect-plugin" />'             >> ${FILE}
echo '    <option name="USE_SOCKET_TRANSPORT" value="true" />'      >> ${FILE}
echo '    <option name="SERVER_MODE" value="false" />'              >> ${FILE}
echo '    <option name="SHMEM_ADDRESS" />'                          >> ${FILE}
echo '    <option name="HOST" value="localhost" />'                 >> ${FILE}
echo '    <option name="PORT" value="5005" />'                      >> ${FILE}
echo '    <option name="AUTO_RESTART" value="false" />'             >> ${FILE}
echo '    <RunnerSettings RunnerId="Debug">'                        >> ${FILE}
echo '      <option name="DEBUG_PORT" value="5005" />'              >> ${FILE}
echo '      <option name="LOCAL" value="false" />'                  >> ${FILE}
echo '    </RunnerSettings>'                                        >> ${FILE}
echo '    <method v="2" />'                                         >> ${FILE}
echo '  </configuration>'                                           >> ${FILE}
echo '</component>'                                                 >> ${FILE}
