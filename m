Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 163741A09C0
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 03:50:30 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452531029184462.53978679868067;
 Mon, 11 Jan 2016 08:50:29 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: manjunath <manjunath@localhost.localdomain>
Subject: [PATCH openbmc-test-automation 02/60] added files
Date: Mon, 11 Jan 2016 10:49:28 -0600
Message-Id: <1452531026-13715-3-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Jan 2016 16:50:31 -0000

From: manjunath <manjunath@localhost.localdomain>

---
 .project              |  17 ++++++++
 .pydevproject         |   7 ++++
 lib/resource.txt      |  12 ++++++
 lib/rest_client.robot | 109 ++++++++++++++++++++++++++++++++++++++++++++++++++
 requirements.txt      |   4 ++
 tests/data.json       |   1 +
 tests/test_fan.robot  |   9 +++++
 tests/test_ssh.robot  |  55 +++++++++++++++++++++++++
 tox.ini               |  32 +++++++++++++++
 9 files changed, 246 insertions(+)
 create mode 100644 .project
 create mode 100644 .pydevproject
 create mode 100644 lib/resource.txt
 create mode 100644 lib/rest_client.robot
 create mode 100644 requirements.txt
 create mode 100755 tests/data.json
 create mode 100644 tests/test_fan.robot
 create mode 100644 tests/test_ssh.robot
 create mode 100644 tox.ini

diff --git a/.project b/.project
new file mode 100644
index 0000000..9b83158
--- /dev/null
+++ b/.project
@@ -0,0 +1,17 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<projectDescription>
+	<name>openbmc-automation</name>
+	<comment></comment>
+	<projects>
+	</projects>
+	<buildSpec>
+		<buildCommand>
+			<name>org.python.pydev.PyDevBuilder</name>
+			<arguments>
+			</arguments>
+		</buildCommand>
+	</buildSpec>
+	<natures>
+		<nature>org.python.pydev.pythonNature</nature>
+	</natures>
+</projectDescription>
diff --git a/.pydevproject b/.pydevproject
new file mode 100644
index 0000000..08ea93f
--- /dev/null
+++ b/.pydevproject
@@ -0,0 +1,7 @@
+<?xml version="1.0" encoding="UTF-8"?><?eclipse-pydev version="1.0"?><pydev_project>
+<pydev_pathproperty name="org.python.pydev.PROJECT_SOURCE_PATH">
+<path>/${PROJECT_DIR_NAME}</path>
+</pydev_pathproperty>
+<pydev_property name="org.python.pydev.PYTHON_PROJECT_VERSION">python 2.7</pydev_property>
+<pydev_property name="org.python.pydev.PYTHON_PROJECT_INTERPRETER">Default</pydev_property>
+</pydev_project>
\ No newline at end of file
diff --git a/lib/resource.txt b/lib/resource.txt
new file mode 100644
index 0000000..5acddcf
--- /dev/null
+++ b/lib/resource.txt
@@ -0,0 +1,12 @@
+*** Settings ***
+Library           Collections
+Library           String
+Library           RequestsLibrary.RequestsKeywords
+Library           OperatingSystem
+
+*** Variables ***
+${HOST}           192.168.122.100    # openbmc ip address
+${PORT}           3000
+${AUTH_URI}       http://${HOST}:${PORT}
+${USERNAME}       root
+${PASSWORD}       abc123
diff --git a/lib/rest_client.robot b/lib/rest_client.robot
new file mode 100644
index 0000000..1de2b77
--- /dev/null
+++ b/lib/rest_client.robot
@@ -0,0 +1,109 @@
+*** Settings ***
+Library           Collections
+Library           String
+Library           RequestsLibrary.RequestsKeywords
+Library           OperatingSystem
+
+*** Variables ***
+${HOST}           192.168.122.100    # openbmc ip address
+${DBUS_PREFIX}    /bus/session
+${PORT}           3000
+${AUTH_URI}       http://${HOST}:${PORT}
+${USERNAME}       root
+${PASSWORD}       abc123
+# Response codes
+${HTTP_CONTINUE}    100
+${HTTP_SWITCHING_PROTOCOLS}    101
+${HTTP_PROCESSING}    102
+${HTTP_OK}        200
+${HTTP_CREATED}    201
+${HTTP_ACCEPTED}    202
+${HTTP_NON_AUTHORITATIVE_INFORMATION}    203
+${HTTP_NO_CONTENT}    204
+${HTTP_RESET_CONTENT}    205
+${HTTP_PARTIAL_CONTENT}    206
+${HTTP_MULTI_STATUS}    207
+${HTTP_IM_USED}    226
+${HTTP_MULTIPLE_CHOICES}    300
+${HTTP_MOVED_PERMANENTLY}    301
+${HTTP_FOUND}     302
+${HTTP_SEE_OTHER}    303
+${HTTP_NOT_MODIFIED}    304
+${HTTP_USE_PROXY}    305
+${HTTP_TEMPORARY_REDIRECT}    307
+${HTTP_BAD_REQUEST}    400
+${HTTP_UNAUTHORIZED}    401
+${HTTP_PAYMENT_REQUIRED}    402
+${HTTP_FORBIDDEN}    403
+${HTTP_NOT_FOUND}    404
+${HTTP_METHOD_NOT_ALLOWED}    405
+${HTTP_NOT_ACCEPTABLE}    406
+${HTTP_PROXY_AUTHENTICATION_REQUIRED}    407
+${HTTP_REQUEST_TIMEOUT}    408
+${HTTP_CONFLICT}    409
+${HTTP_GONE}      410
+${HTTP_LENGTH_REQUIRED}    411
+${HTTP_PRECONDITION_FAILED}    412
+${HTTP_REQUEST_ENTITY_TOO_LARGE}    413
+${HTTP_REQUEST_URI_TOO_LONG}    414
+${HTTP_UNSUPPORTED_MEDIA_TYPE}    415
+${HTTP_REQUESTED_RANGE_NOT_SATISFIABLE}    416
+${HTTP_EXPECTATION_FAILED}    417
+${HTTP_UNPROCESSABLE_ENTITY}    422
+${HTTP_LOCKED}    423
+${HTTP_FAILED_DEPENDENCY}    424
+${HTTP_UPGRADE_REQUIRED}    426
+${HTTP_INTERNAL_SERVER_ERROR}    500
+${HTTP_NOT_IMPLEMENTED}    501
+${HTTP_BAD_GATEWAY}    502
+${HTTP_SERVICE_UNAVAILABLE}    503
+${HTTP_GATEWAY_TIMEOUT}    504
+${HTTP_HTTP_VERSION_NOT_SUPPORTED}    505
+${HTTP_INSUFFICIENT_STORAGE}    507
+${HTTP_NOT_EXTENDED}    510
+
+*** Keywords ***
+OpenBMC Get Request
+    [Arguments]    ${uri}    &{kwargs}
+    ${base_uri}=    Catenate    SEPARATOR=    ${DBUS_PREFIX}    ${uri}
+    Log Request    method=Get    base_uri=${base_uri}    args=&{kwargs}
+    Initialize OpenBMC
+    ${ret}=    Get Request    openbmc    ${base_uri}    &{kwargs}
+    Log Response    ${ret}
+    [Return]    ${ret}
+
+OpenBMC Post Request
+    [Arguments]    ${uri}    &{kwargs}
+    ${base_uri}=    Catenate    SEPARATOR=    ${DBUS_PREFIX}    ${uri}
+    Log Request    method=Post    base_uri=${base_uri}    args=&{kwargs}
+    Initialize OpenBMC
+    ${ret}=    Post Request    openbmc    ${base_uri}    &{kwargs}
+    Log Response    ${ret}
+    [Return]    ${ret}
+
+OpenBMC Put Request
+    [Arguments]    ${uri}    &{kwargs}
+    ${base_uri}=    Catenate    SEPARATOR=    ${DBUS_PREFIX}    ${uri}
+    Log Request    method=Put    base_uri=${base_uri}    args=&{kwargs}
+    Initialize OpenBMC
+    ${ret}=    Put Request    openbmc    ${base_uri}    &{kwargs}
+    Log Response    ${ret}
+    [Return]    ${ret}
+
+Initialize OpenBMC
+    Create Session    openbmc    ${AUTH_URI}
+
+Log Request
+    [Arguments]    &{kwargs}
+    ${msg}=    Catenate    SEPARATOR=    URI:    ${AUTH_URI}    ${kwargs["base_uri"]}    , method:
+    ...    ${kwargs["method"]}    , args:    ${kwargs["args"]}
+    Logging    ${msg}    console=True
+
+Log Response
+    [Arguments]    ${resp}
+    ${msg}=    Catenate    SEPARATOR=    Response code:    ${resp.status_code}    , Content:    ${resp.content}
+    Logging    ${msg}    console=True
+
+Logging
+    [Arguments]    ${msg}    ${console}=default False
+    Log    ${msg}    console=True
diff --git a/requirements.txt b/requirements.txt
new file mode 100644
index 0000000..8434d52
--- /dev/null
+++ b/requirements.txt
@@ -0,0 +1,4 @@
+robotframework
+requests
+robotframework-requests
+robotframework-sshlibrary
\ No newline at end of file
diff --git a/tests/data.json b/tests/data.json
new file mode 100755
index 0000000..7bfd886
--- /dev/null
+++ b/tests/data.json
@@ -0,0 +1 @@
+{"two": 2, "one": 1}
diff --git a/tests/test_fan.robot b/tests/test_fan.robot
new file mode 100644
index 0000000..61255e6
--- /dev/null
+++ b/tests/test_fan.robot
@@ -0,0 +1,9 @@
+*** Settings ***
+Documentation     This testsuite is for testing fan interface for openbmc
+Suite Teardown    Delete All Sessions
+Resource          ../lib/rest_client.robot
+
+*** Test Cases ***
+List all the fans
+    ${resp} =    OpenBMC Get Request    /org.openbmc.control.Fan/
+    Should Be Equal As Strings    ${resp.status_code}    ${HTTP_OK}
diff --git a/tests/test_ssh.robot b/tests/test_ssh.robot
new file mode 100644
index 0000000..0801d8a
--- /dev/null
+++ b/tests/test_ssh.robot
@@ -0,0 +1,55 @@
+*** Settings ***
+Documentation     This example demonstrates executing commands on a remote machine
+...               and getting their output and the return code.
+...
+...               Notice how connections are handled as part of the suite setup and
+...               teardown. This saves some time when executing several test cases.
+Suite Setup       Open Connection And Log In
+Suite Teardown    Close All Connections
+Library           SSHLibrary
+
+*** Variables ***
+${HOST}           192.168.122.100
+${USERNAME}       manjunath
+${PASSWORD}       passw0rd
+
+*** Test Cases ***
+Execute Command And Verify Output
+    [Documentation]    Execute Command can be used to ran commands on the remote machine.
+    ...    The keyword returns the standard output by default.
+    ${output}=    Execute Command    echo Hello SSHLibrary!
+    Should Be Equal    ${output}    Hello SSHLibrary!
+
+Execute Command And Verify Return Code
+    [Documentation]    Often getting the return code of the command is enough.
+    ...    This behaviour can be adjusted as Execute Command arguments.
+    ${rc}=    Execute Command    echo Success guaranteed.    return_stdout=False    return_rc=True
+    Should Be Equal    ${rc}    ${0}
+
+Executing Commands In An Interactive Session
+    [Documentation]    Execute Command always executes the command in a new shell.
+    ...    This means that changes to the environment are not persisted
+    ...    between subsequent Execute Command keyword calls.
+    ...    Write and Read Until variants can be used to operate in the same shell.
+    Write    cd ..
+    Write    echo Hello from the parent directory!
+    ${output}=    Read Until    directory!
+    Should End With    ${output}    Hello from the parent directory!
+
+List all the files
+    [Documentation]    List all the files in the remote machine
+    ${output}    ${stderr}    ${rc}=    Execute Command    ls    return_stderr=True    return_rc=True
+    ${msg}=    Catenate    output:${output}    stderr:${stderr}    rc:${rc}
+    Log To Console    ${msg}
+
+File Not Found
+    [Documentation]    This testcase is for testing ls command with non existing file
+    ${output}    ${stderr}    ${rc}=    Execute Command    ls file_doesnotexist.txt    return_stderr=True    return_rc=True
+    ${msg}=    Catenate    output:${output}    stderr:${stderr}    rc:${rc}
+    Should Be Equal    ${rc}    ${2}
+    Should Contain    ${stderr}    No such file or directory
+
+*** Keywords ***
+Open Connection And Log In
+    Open Connection    ${HOST}
+    Login    ${USERNAME}    ${PASSWORD}
diff --git a/tox.ini b/tox.ini
new file mode 100644
index 0000000..fc08416
--- /dev/null
+++ b/tox.ini
@@ -0,0 +1,32 @@
+[tox]
+skipsdist = True
+
+[openbmcenv]
+sitepackages = False
+setenv = VIRTUAL_ENV={envdir}
+deps = setuptools
+       -r{toxinidir}/requirements.txt
+
+[testenv]
+install_command = pip install -U {opts} {packages}
+deps = -r{toxinidir}/requirements.txt
+commands =
+	python -m robot.run {posargs}
+
+[testenv:full]
+install_command = pip install -U {opts} {packages}
+deps = -r{toxinidir}/requirements.txt
+commands =
+	python -m robot.run .
+
+[testenv:tests]
+install_command = pip install -U {opts} {packages}
+deps = -r{toxinidir}/requirements.txt
+commands =
+	python -m robot.run tests
+
+[testenv:custom]
+install_command = pip install -U {opts} {packages}
+deps = -r{toxinidir}/requirements.txt
+commands =
+	python -m robot.run {posargs}
\ No newline at end of file
-- 
2.6.4
