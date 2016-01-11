Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5AE821A09C0
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 03:50:53 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 145253104811928.97534748162616;
 Mon, 11 Jan 2016 08:50:48 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc-test-automation 21/60] Handle new rest client from Brad
Date: Mon, 11 Jan 2016 10:49:47 -0600
Message-Id: <1452531026-13715-22-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Jan 2016 16:50:54 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 lib/resource.txt         | 2 +-
 tests/test_sensors.robot | 7 +++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/lib/resource.txt b/lib/resource.txt
index a8b8614..9d865c3 100644
--- a/lib/resource.txt
+++ b/lib/resource.txt
@@ -9,7 +9,7 @@ Variables         ../data/variables.py
 ${OPENBMC_HOST}    9.3.164.161
 ${DBUS_PREFIX}    ${EMPTY}
 ${PORT}           ${EMPTY}
-${AUTH_URI}       http://${OPENBMC_HOST}
+${AUTH_URI}       https://${OPENBMC_HOST}
 ${OPENBMC_USERNAME}    root
 ${OPENBMC_PASSWORD}    0penBmc
 ${MACHINE_TYPE}    palmetto
diff --git a/tests/test_sensors.robot b/tests/test_sensors.robot
index a50805a..3e84e44 100644
--- a/tests/test_sensors.robot
+++ b/tests/test_sensors.robot
@@ -188,8 +188,11 @@ response Should Be Equal
 
 Read the Attribute     
     [arguments]    ${uri}    ${parm}
-    ${output} =  Read Attribute      ${uri}    ${parm}
-    set test variable    ${OUTPUT}     ${output}
+    ${output} =     Read Attribute      ${uri}    ${parm}
+    ${json} =       to json             ${output}
+    ${data} =       get from dictionary      ${json}     data
+    set test variable    ${OUTPUT}     "${data}"
+    
 
 
 Open Connection And Log In
-- 
2.6.4
