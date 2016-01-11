Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5D86C1A0D01
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 03:51:03 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452531055774182.17562684929385;
 Mon, 11 Jan 2016 08:50:55 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc-test-automation 29/60] OpenBMC REST Testing
Date: Mon, 11 Jan 2016 10:49:55 -0600
Message-Id: <1452531026-13715-30-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Jan 2016 16:51:04 -0000

From: Manjunath A Kumatagi <mkumatag@in.ibm.com>

---
 lib/rest_client.robot     |  11 ++
 requirements.txt          |   2 +-
 tests/test_obmcrest.robot | 283 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 295 insertions(+), 1 deletion(-)

diff --git a/lib/rest_client.robot b/lib/rest_client.robot
index 5cd71b2..02a7a11 100644
--- a/lib/rest_client.robot
+++ b/lib/rest_client.robot
@@ -70,6 +70,8 @@ OpenBMC Get Request
 OpenBMC Post Request
     [Arguments]    ${uri}    &{kwargs}
     ${base_uri}=    Catenate    SEPARATOR=    ${DBUS_PREFIX}    ${uri}
+    ${headers}=     Create Dictionary   Content-Type=application/json
+    set to dictionary   ${kwargs}       headers     ${headers}
     Log Request    method=Post    base_uri=${base_uri}    args=&{kwargs}
     Initialize OpenBMC
     ${ret}=    Post Request    openbmc    ${base_uri}    &{kwargs}
@@ -85,6 +87,15 @@ OpenBMC Put Request
     Log Response    ${ret}
     [Return]    ${ret}
 
+OpenBMC Delete Request
+    [Arguments]    ${uri}    &{kwargs}
+    ${base_uri}=    Catenate    SEPARATOR=    ${DBUS_PREFIX}    ${uri}
+    Log Request    method=Delete    base_uri=${base_uri}    args=&{kwargs}
+    Initialize OpenBMC
+    ${ret}=    Put Request    openbmc    ${base_uri}    &{kwargs}
+    Log Response    ${ret}
+    [Return]    ${ret}
+
 Initialize OpenBMC
     Create Session    openbmc    ${AUTH_URI}
 
diff --git a/requirements.txt b/requirements.txt
index 8434d52..1459b74 100644
--- a/requirements.txt
+++ b/requirements.txt
@@ -1,4 +1,4 @@
 robotframework
 requests
-robotframework-requests
+robotframework-requests>=0.3.9
 robotframework-sshlibrary
\ No newline at end of file
diff --git a/tests/test_obmcrest.robot b/tests/test_obmcrest.robot
index 382107f..50fe6b2 100644
--- a/tests/test_obmcrest.robot
+++ b/tests/test_obmcrest.robot
@@ -28,3 +28,286 @@ Get a null Property
     Should Be Equal As Strings    ${resp.status_code}    ${HTTP_NOT_FOUND}
     ${jsondata}=    To Json    ${resp.content}
     Should Be Equal     ${jsondata['data']['description']}      The specified property cannot be found: ''is_fru''
+
+get directory listing /
+    ${resp} =   openbmc get request     /
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+    ${json} =   to json     ${resp.content}
+    list should contain value           ${json['data']}         /org
+    should be equal as strings          ${json['status']}       ok
+
+get directory listing /org/
+    ${resp} =   openbmc get request     /org/
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+    ${json} =   to json         ${resp.content}
+    list should contain value           ${json['data']}     /org/openbmc
+    should be equal as strings          ${json['status']}       ok
+
+get invalid directory listing /i/dont/exist/
+    ${resp} =   openbmc get request     /i/dont/exist/
+    should be equal as strings      ${resp.status_code}     ${HTTP_NOT_FOUND}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings          ${json['status']}   error
+
+put directory listing /
+    ${resp} =   openbmc put request     /
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings          ${json['status']}   error
+
+put directory listing /org/
+    ${resp} =   openbmc put request     /org/
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings          ${json['status']}   error
+
+put invalid directory listing /i/dont/exist/
+    ${resp} =   openbmc put request     /i/dont/exist/
+    should be equal as strings      ${resp.status_code}     ${HTTP_NOT_FOUND}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings          ${json['status']}   error
+
+post directory listing /
+    ${resp} =   openbmc post request    /
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings          ${json['status']}   error
+
+post directory listing /org/
+    ${resp} =   openbmc post request    /org/
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings          ${json['status']}   error
+
+post invalid directory listing /i/dont/exist/
+    ${resp} =   openbmc post request    /i/dont/exist/
+    should be equal as strings      ${resp.status_code}     ${HTTP_NOT_FOUND}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings          ${json['status']}   error
+
+delete directory listing /
+    ${resp} =   openbmc delete request  /
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings          ${json['status']}   error
+
+delete directory listing /org/
+    ${resp} =   openbmc delete request  /
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings          ${json['status']}   error
+
+delete invalid directory listing /org/nothere/
+    ${resp} =   openbmc delete request  /org/nothere/
+    should be equal as strings      ${resp.status_code}     ${HTTP_NOT_FOUND}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings          ${json['status']}   error
+
+get list names /
+    ${resp} =   openbmc get request     /list
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+    ${json} =   to json         ${resp.content}
+    list should contain value       ${json['data']}         /org/openbmc/inventory
+    should be equal as strings      ${json['status']}       ok
+
+get list names /org/
+    ${resp} =   openbmc get request     /org/list
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+    ${json} =   to json         ${resp.content}
+    list should contain value       ${json['data']}         /org/openbmc/inventory
+    should be equal as strings      ${json['status']}       ok
+
+get invalid list names /i/dont/exist/
+    ${resp} =   openbmc get request     /i/dont/exist/list
+    should be equal as strings      ${resp.status_code}     ${HTTP_NOT_FOUND}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+put list names /
+    ${resp} =   openbmc put request     /list
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+put list names /org/
+    ${resp} =   openbmc put request     /org/list
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+put invalid list names /i/dont/exist/
+    ${resp} =   openbmc put request     /i/dont/exist/list
+    should be equal as strings      ${resp.status_code}     ${HTTP_NOT_FOUND}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+post list names /
+    ${resp} =   openbmc post request    /list
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+post list names /org/
+    ${resp} =   openbmc post request    /org/list
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+post invalid list names /i/dont/exist/
+    ${resp} =   openbmc post request    /i/dont/exist/list
+    should be equal as strings      ${resp.status_code}     ${HTTP_NOT_FOUND}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+delete list names /
+    ${resp} =   openbmc delete request  /list
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+delete list names /org/
+    ${resp} =   openbmc delete request  /list
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+delete invalid list names /org/nothere/
+    ${resp} =   openbmc delete request  /org/nothere/list
+    should be equal as strings      ${resp.status_code}     ${HTTP_NOT_FOUND}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+get names /
+    ${resp} =   openbmc get request     /enumerate
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+    ${json} =   to json         ${resp.content}
+    list should contain value       ${json['data']}         /org/openbmc/inventory
+    should be equal as strings      ${json['status']}       ok
+
+get names /org/
+    ${resp} =   openbmc get request     /org/enumerate
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+    ${json} =   to json         ${resp.content}
+    list should contain value       ${json['data']}         /org/openbmc/inventory
+    should be equal as strings      ${json['status']}       ok
+
+get invalid names /i/dont/exist/
+    ${resp} =   openbmc get request     /i/dont/exist/enumerate
+    should be equal as strings      ${resp.status_code}     ${HTTP_NOT_FOUND}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+put names /
+    ${resp} =   openbmc put request     /enumerate
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+put names /org/
+    ${resp} =   openbmc put request     /org/enumerate
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+put invalid names /i/dont/exist/
+    ${resp} =   openbmc put request     /i/dont/exist/enumerate
+    should be equal as strings      ${resp.status_code}     ${HTTP_NOT_FOUND}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+post names /
+    ${resp} =   openbmc post request    /enumerate
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+post names /org/
+    ${resp} =   openbmc post request    /org/enumerate
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+post invalid names /i/dont/exist/
+    ${resp} =   openbmc post request    /i/dont/exist/enumerate
+    should be equal as strings      ${resp.status_code}     ${HTTP_NOT_FOUND}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+delete names /
+    ${resp} =   openbmc delete request  /enumerate
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+delete names /org/
+    ${resp} =   openbmc delete request  /enumerate
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+delete invalid names /org/nothere/
+    ${resp} =   openbmc delete request  /org/nothere/enumerate
+    should be equal as strings      ${resp.status_code}     ${HTTP_NOT_FOUND}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+get method /org/openbmc/control/fan0/action/setspeed
+    ${resp} =   openbmc get request     /org/openbmc/control/fan0/action/setspeed
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+get invalid method /i/dont/exist/
+    ${resp} =   openbmc get request     /i/dont/exist/action/foo
+    should be equal as strings      ${resp.status_code}     ${HTTP_NOT_FOUND}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+put method /org/openbmc/control/fan0/action/setspeed
+    ${resp} =   openbmc put request     /org/openbmc/control/fan0/action/setspeed
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+put invalid method /i/dont/exist/
+    ${resp} =   openbmc put request     /i/dont/exist/action/foo
+    should be equal as strings      ${resp.status_code}     ${HTTP_NOT_FOUND}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+post method /org/openbmc/control/fan0/action/getspeed no args
+    ${data} =   create dictionary   data=@{EMPTY}
+    ${resp} =   openbmc post request    /org/openbmc/control/fan0/action/getspeed      data=${data}
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       ok
+
+post method /org/openbmc/control/fan0/action/setspeed invalid args
+    ${data} =   create dictionary   foo=bar
+    ${resp} =   openbmc post request    /org/openbmc/control/fan0/action/setspeed      data=${data}
+    should be equal as strings      ${resp.status_code}     ${HTTP_BAD_REQUEST}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+post method /org/openbmc/control/fan0/action/setspeed with args
+    ${SPEED}=   Set Variable    ${200}
+    @{speed_list} =   Create List     ${SPEED}
+    ${data} =   create dictionary   data=@{speed_list}
+    ${resp} =   openbmc post request    /org/openbmc/control/fan0/action/setspeed      data=${data}
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       ok
+    ${content}=     Read Attribute      /org/openbmc/control/fan0   speed
+    Should Be Equal     ${content}      ${SPEED}
+
+delete method /org/openbmc/control/fan0/action/setspeed 
+    ${resp} =   openbmc delete request  /org/openbmc/control/fan0/action/setspeed
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+delete invalid method /org/nothere/
+    ${resp} =   openbmc delete request  /org/nothere/action/foomethod
+    should be equal as strings      ${resp.status_code}     ${HTTP_NOT_FOUND}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
-- 
2.6.4
