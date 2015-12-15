Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 67F111A1149
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 09:21:00 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1450218055379898.054594654385;
 Tue, 15 Dec 2015 14:20:55 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid 2/2] support correct methods in test
Date: Tue, 15 Dec 2015 16:20:53 -0600
Message-Id: <1450218053-12108-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1450218053-12108-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1450218053-12108-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 15 Dec 2015 22:21:00 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 testit.C | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/testit.C b/testit.C
index 7ea5d5d..a0cd2c1 100644
--- a/testit.C
+++ b/testit.C
@@ -109,11 +109,11 @@ void testprep(void) {
 
 int main() {
 
-    testprep(); check_results(updateSensorRecordFromSSRAESC(testrec_bootprogress), "value", "FW Progress, Docking station attachment");
-    testprep(); check_results(updateSensorRecordFromSSRAESC(testrec_sensor1), "present", "True");
-    testprep(); check_results(updateSensorRecordFromSSRAESC(testrec_sensor2), "present", "False");
-    testprep(); check_results(updateSensorRecordFromSSRAESC(testrec_procfailed), "fault", "False");
-    testprep(); check_results(updateSensorRecordFromSSRAESC(testrec_bootcount), "value", "3");
+    testprep(); check_results(updateSensorRecordFromSSRAESC(testrec_bootprogress), "setValue", "FW Progress, Docking station attachment");
+    testprep(); check_results(updateSensorRecordFromSSRAESC(testrec_sensor1), "setPresent", "True");
+    testprep(); check_results(updateSensorRecordFromSSRAESC(testrec_sensor2), "setPresent", "False");
+    testprep(); check_results(updateSensorRecordFromSSRAESC(testrec_procfailed), "setFault", "False");
+    testprep(); check_results(updateSensorRecordFromSSRAESC(testrec_bootcount), "setValue", "3");
     testprep(); check_results(updateSensorRecordFromSSRAESC(testrec_invalidnumber), "", "");
 
 	return 0;
-- 
2.6.3
