Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3C4751A1A30
 for <openbmc@lists.ozlabs.org>; Sat, 19 Dec 2015 10:40:51 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1450482045585401.414508232319;
 Fri, 18 Dec 2015 15:40:45 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken <ken.sk.lai@mail.foxconn.com>
Subject: [PATCH skeleton 14/15] remove in15_input sensor
Date: Fri, 18 Dec 2015 17:40:34 -0600
Message-Id: <1450482035-4530-15-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1450482035-4530-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1450482035-4530-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 18 Dec 2015 23:40:51 -0000

From: Ken <ken.sk.lai@mail.foxconn.com>

---
 bin/Barreleye.py | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/bin/Barreleye.py b/bin/Barreleye.py
index 93c3694..5d3d2b7 100755
--- a/bin/Barreleye.py
+++ b/bin/Barreleye.py
@@ -557,8 +557,6 @@ HWMON_CONFIG = {
                 'in12_input' : { 'object_path' : 'voltage/P1V35_CPU0_BUF1','poll_interval' : 10000,'scale' : 1,'units' : '' },
                 'in13_input' : { 'object_path' : 'voltage/P1V35_CPU0_BUF2','poll_interval' : 10000,'scale' : 1,'units' : '' },
                 'in14_input' : { 'object_path' : 'voltage/P1V35_CPU0_BUF3','poll_interval' : 10000,'scale' : 1,'units' : '' },
-                'in15_input' : { 'object_path' : 'voltage/P1V35_CPU0_BUF4','poll_interval' : 10000,'scale' : 1,'units' : '' },
-
 		}
 	},
 	'6-002e' : {
@@ -580,10 +578,9 @@ HWMON_CONFIG = {
                 'in12_input' : { 'object_path' : 'voltage/P1V35_CPU1_BUF1','poll_interval' : 10000,'scale' : 1,'units' : '' },
                 'in13_input' : { 'object_path' : 'voltage/P1V35_CPU1_BUF2','poll_interval' : 10000,'scale' : 1,'units' : '' },
                 'in14_input' : { 'object_path' : 'voltage/P1V35_CPU1_BUF3','poll_interval' : 10000,'scale' : 1,'units' : '' },
-                'in15_input' : { 'object_path' : 'voltage/P1V35_CPU1_BUF4','poll_interval' : 10000,'scale' : 1,'units' : '' },
 
 		}
-},
+         },
 	'3-0050' : {
 		'labels' : {
 		'176' :  { 'object_path' : 'temperature/cpu0/core0','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
-- 
2.6.3
