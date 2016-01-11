Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D471F1A0D11
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 03:51:09 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452531063688829.0725084540974;
 Mon, 11 Jan 2016 08:51:03 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc-test-automation 37/60] Use argumnet file with pyrobot
 and added instructions to READEME file.
Date: Mon, 11 Jan 2016 10:50:03 -0600
Message-Id: <1452531026-13715-38-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1452531026-13715-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452531026-13715-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Jan 2016 16:51:10 -0000

From: Manjunath A Kumatagi <mkumatag@in.ibm.com>

---
 .gitignore                     |  2 ++
 README.md                      | 18 +++++++++++-
 lib/resource.txt               |  6 ++--
 lib/rest_client.robot          |  8 +++---
 tests/test_ssh.robot           | 64 ------------------------------------------
 tools/generate_argumentfile.sh |  5 ++++
 tox.ini                        | 30 +++++++++-----------
 7 files changed, 45 insertions(+), 88 deletions(-)
 delete mode 100644 tests/test_ssh.robot
 create mode 100755 tools/generate_argumentfile.sh

diff --git a/.gitignore b/.gitignore
index 9f23ed1..8aea548 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,3 +1,5 @@
 /log.html
 /output.xml
 /report.html
+/.idea/
+/.tox/
\ No newline at end of file
diff --git a/README.md b/README.md
index f491b6c..589d693 100644
--- a/README.md
+++ b/README.md
@@ -1,2 +1,18 @@
 #openbmc-automation
-More information needs to be added.
+
+Quickstart
+----------
+
+To run openbmc-automation first you need to install the prerequisite python
+packages which will help to invoke tests through tox.
+
+1. Install the python dependencies for tox
+    $ easy_install tox pip
+
+2. Initilize the following environment variable which will used while testing
+    $ export OPENBMC_HOST=<openbmc machine ip address>
+    $ export OPENBMC_PASSWORD=<openbmc username>
+    $ export OPENBMC_USERNAME=<openbmc password>
+
+3. Run tests
+    $ tox -e tests
diff --git a/lib/resource.txt b/lib/resource.txt
index 5acddcf..c34e026 100644
--- a/lib/resource.txt
+++ b/lib/resource.txt
@@ -5,8 +5,8 @@ Library           RequestsLibrary.RequestsKeywords
 Library           OperatingSystem
 
 *** Variables ***
-${HOST}           192.168.122.100    # openbmc ip address
+${OPENBMC_HOST}           192.168.122.100    # openbmc ip address
 ${PORT}           3000
 ${AUTH_URI}       http://${HOST}:${PORT}
-${USERNAME}       root
-${PASSWORD}       abc123
+${OPENBMC_USERNAME}       root
+${OPENBMC_PASSWORD}       abc123
diff --git a/lib/rest_client.robot b/lib/rest_client.robot
index 1de2b77..45c4226 100644
--- a/lib/rest_client.robot
+++ b/lib/rest_client.robot
@@ -5,12 +5,12 @@ Library           RequestsLibrary.RequestsKeywords
 Library           OperatingSystem
 
 *** Variables ***
-${HOST}           192.168.122.100    # openbmc ip address
+${OPENBMC_HOST}           192.168.122.100    # openbmc ip address
 ${DBUS_PREFIX}    /bus/session
 ${PORT}           3000
-${AUTH_URI}       http://${HOST}:${PORT}
-${USERNAME}       root
-${PASSWORD}       abc123
+${AUTH_URI}       http://${OPENBMC_HOST}:${PORT}
+${OPENBMC_USERNAME}       root
+${OPENBMC_PASSWORD}       abc123
 # Response codes
 ${HTTP_CONTINUE}    100
 ${HTTP_SWITCHING_PROTOCOLS}    101
diff --git a/tests/test_ssh.robot b/tests/test_ssh.robot
deleted file mode 100644
index cabcea0..0000000
--- a/tests/test_ssh.robot
+++ /dev/null
@@ -1,64 +0,0 @@
-*** Settings ***
-Documentation     This example demonstrates executing commands on a remote machine
-...               and getting their output and the return code.
-...
-...               Notice how connections are handled as part of the suite setup and
-...               teardown. This saves some time when executing several test cases.
-Suite Setup       Open Connection And Log In
-Suite Teardown    Close All Connections
-Library           SSHLibrary
-
-*** Variables ***
-${HOST}           192.168.122.100
-${USERNAME}       manjunath
-${PASSWORD}       passw0rd
-
-*** Test Cases ***
-Execute Command And Verify Output
-    [Documentation]    Execute Command can be used to ran commands on the remote machine.
-    ...    The keyword returns the standard output by default.
-    ${output}=    Execute Command    echo Hello SSHLibrary!
-    Should Be Equal    ${output}    Hello SSHLibrary!
-
-Execute Command And Verify Return Code
-    [Documentation]    Often getting the return code of the command is enough.
-    ...    This behaviour can be adjusted as Execute Command arguments.
-    ${rc}=    Execute Command    echo Success guaranteed.    return_stdout=False    return_rc=True
-    Should Be Equal    ${rc}    ${0}
-
-Executing Commands In An Interactive Session
-    [Documentation]    Execute Command always executes the command in a new shell.
-    ...    This means that changes to the environment are not persisted
-    ...    between subsequent Execute Command keyword calls.
-    ...    Write and Read Until variants can be used to operate in the same shell.
-    Write    cd ..
-    Write    echo Hello from the parent directory!
-    ${output}=    Read Until    directory!
-    Should End With    ${output}    Hello from the parent directory!
-
-List all the files
-    [Documentation]    List all the files in the remote machine
-    ${output}    ${stderr}    ${rc}=    Execute Command    ls    return_stderr=True    return_rc=True
-    ${msg}=    Catenate    output:${output}    stderr:${stderr}    rc:${rc}
-    Log To Console    ${msg}
-
-File Not Found
-    [Documentation]    This testcase is for testing ls command with non existing file
-    ${output}    ${stderr}    ${rc}=    Execute Command    ls file_doesnotexist.txt    return_stderr=True    return_rc=True
-    ${msg}=    Catenate    output:${output}    stderr:${stderr}    rc:${rc}
-    Log To Console    ${msg}
-    Should Be Equal    ${rc}    ${2}
-    Should Contain    ${stderr}    No such file or directory
-
-etc passwd entry
-    [Documentation]    This testcase is for testing /etc/passwd entry
-    ${output}    ${stderr}    ${rc}=    Execute Command    grep manjunath /etc/passwd    return_stderr=True    return_rc=True
-    ${msg}=    Catenate    output:${output}    stderr:${stderr}    rc:${rc}
-    Log To Console    ${msg}
-    Should Be Equal    ${rc}    ${0}
-    Should Contain    ${output}    manjunath
-
-*** Keywords ***
-Open Connection And Log In
-    Open Connection    ${HOST}
-    Login    ${USERNAME}    ${PASSWORD}
diff --git a/tools/generate_argumentfile.sh b/tools/generate_argumentfile.sh
new file mode 100755
index 0000000..518a48f
--- /dev/null
+++ b/tools/generate_argumentfile.sh
@@ -0,0 +1,5 @@
+#!/bin/bash
+
+echo "--variable OPENBMC_HOST:$OPENBMC_HOST" > $ARG_FILE
+echo "--variable OPENBMC_USERNAME:$OPENBMC_USERNAME" >> $ARG_FILE
+echo "--variable OPENBMC_HOST:$OPENBMC_HOST" >> $ARG_FILE
diff --git a/tox.ini b/tox.ini
index fc08416..75ab527 100644
--- a/tox.ini
+++ b/tox.ini
@@ -1,32 +1,30 @@
 [tox]
 skipsdist = True
 
-[openbmcenv]
-sitepackages = False
-setenv = VIRTUAL_ENV={envdir}
-deps = setuptools
-       -r{toxinidir}/requirements.txt
-
 [testenv]
+passenv = *
+setenv = ARG_FILE={env:ARG_FILE:/tmp/argument_file.txt}
+whitelist_externals = *
 install_command = pip install -U {opts} {packages}
 deps = -r{toxinidir}/requirements.txt
 commands =
-	python -m robot.run {posargs}
+    python -m robot.run --argumentfile {env:ARG_FILE:/tmp/argument_file.txt} {posargs}
 
 [testenv:full]
-install_command = pip install -U {opts} {packages}
-deps = -r{toxinidir}/requirements.txt
+deps = {[testenv]deps}
+setenv = {[testenv]setenv}
 commands =
-	python -m robot.run .
+    python -m robot.run --argumentfile {env:ARG_FILE:/tmp/argument_file.txt} .
 
 [testenv:tests]
-install_command = pip install -U {opts} {packages}
-deps = -r{toxinidir}/requirements.txt
+deps = {[testenv]deps}
+setenv = {[testenv]setenv}
 commands =
-	python -m robot.run tests
+    bash {toxinidir}/tools/generate_argumentfile.sh
+    python -m robot.run --argumentfile {env:ARG_FILE:/tmp/argument_file.txt} tests
 
 [testenv:custom]
-install_command = pip install -U {opts} {packages}
-deps = -r{toxinidir}/requirements.txt
+deps = {[testenv]deps}
+setenv = {[testenv]setenv}
 commands =
-	python -m robot.run {posargs}
\ No newline at end of file
+    python -m robot.run --argumentfile {env:ARG_FILE:/tmp/argument_file.txt} {posargs}
\ No newline at end of file
-- 
2.6.4
