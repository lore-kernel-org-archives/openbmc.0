Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgBZ82SsGzDq5d
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 17:51:28 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467273035457861.0859432738557;
 Thu, 30 Jun 2016 00:50:35 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: George Keishing <gkeishin@in.ibm.com>
Subject: [PATCH openbmc-test-automation] PreTag Test Automation Basic Code
 clean-up needed #9
Date: Thu, 30 Jun 2016 02:50:33 -0500
Message-Id: <20160630075033.15101-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160630075033.15101-1-openbmc-patches@stwcx.xyz>
References: <20160630075033.15101-1-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jun 2016 07:51:28 -0000

From: George Keishing <gkeishin@in.ibm.com>

---
 tests/security/test_ssl.robot  | 2 --
 tests/test_association.robot   | 1 -
 tests/test_bootpolicy.robot    | 2 --
 tests/test_eventlog.robot      | 2 +-
 tests/test_fan.robot           | 4 ++++
 tests/test_power_restore.robot | 2 --
 6 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/tests/security/test_ssl.robot b/tests/security/test_ssl.robot
index 7bcab5e..57d7d5e 100644
--- a/tests/security/test_ssl.robot
+++ b/tests/security/test_ssl.robot
@@ -5,8 +5,6 @@ Suite Teardown    Delete All Sessions
 Resource          ../../lib/rest_client.robot
 Resource          ../../lib/resource.txt
 
-Library           RequestsLibrary.RequestsKeywords
-
 *** Test Cases ***
 Test SSL Connection
     [Documentation]     This testcase is for testing the SSL connection to the
diff --git a/tests/test_association.robot b/tests/test_association.robot
index b4422d5..5931afe 100755
--- a/tests/test_association.robot
+++ b/tests/test_association.robot
@@ -4,7 +4,6 @@ Documentation          This suite is used for testing eventlog association.
 Resource        ../lib/rest_client.robot
 Resource        ../lib/utils.robot
 
-Library         BuiltIn
 Library         Collections
 Library         SSHLibrary
 
diff --git a/tests/test_bootpolicy.robot b/tests/test_bootpolicy.robot
index b6528c7..19637eb 100644
--- a/tests/test_bootpolicy.robot
+++ b/tests/test_bootpolicy.robot
@@ -11,8 +11,6 @@ Suite Teardown  Close All Connections
 
 
 *** Variables ***
-${SYSTEM_SHUTDOWN_TIME}       ${5}
-${WAIT_FOR_POWER_OPERATION}   30sec
 
 *** Test Cases ***
 
diff --git a/tests/test_eventlog.robot b/tests/test_eventlog.robot
index 660d449..d6666d5 100644
--- a/tests/test_eventlog.robot
+++ b/tests/test_eventlog.robot
@@ -117,7 +117,7 @@ deleting log after obmc-phosphor-event.service restart
     ${resp} =    openbmc post request     ${deluri}    data=${NIL}
     should be equal as strings      ${resp.status_code}     ${HTTP_OK}
 
-makeing new log after obmc-phosphor-event.service restart
+making new log after obmc-phosphor-event.service restart
     [Documentation]     This is for testing event creation after the
     ...                 event service is restarted.
     Open Connection And Log In
diff --git a/tests/test_fan.robot b/tests/test_fan.robot
index 2f593b5..dfb9502 100644
--- a/tests/test_fan.robot
+++ b/tests/test_fan.robot
@@ -4,3 +4,7 @@ Suite Teardown    Delete All Sessions
 Resource          ../lib/rest_client.robot
 
 *** Test Cases ***
+Test place holder dummy
+   [Documentation]   Dummy Test case. We can't have an empty test case in
+   ...               the testcase directory.
+   Log    This is a dummy test case.. Ignore
diff --git a/tests/test_power_restore.robot b/tests/test_power_restore.robot
index d0e27d5..15fff11 100644
--- a/tests/test_power_restore.robot
+++ b/tests/test_power_restore.robot
@@ -10,8 +10,6 @@ Resource        ../lib/utils.robot
 
 Library         SSHLibrary
 
-[Documentation]       Data Driven Tests
-
 
 ***test cases***
 
-- 
2.9.0
