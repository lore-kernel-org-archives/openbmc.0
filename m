Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r3HFD54l0zDqBy
 for <openbmc@lists.ozlabs.org>; Mon,  9 May 2016 19:31:12 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1462786268817327.78677189120765;
 Mon, 9 May 2016 02:31:08 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: johnhcwang <hsienchiang@gmail.com>
Subject: [PATCH skeleton v7 09/21] Add I2C-6 lm75 outlet temperature sensor
Date: Mon,  9 May 2016 04:30:42 -0500
Message-Id: <1462786254-18000-10-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1462786254-18000-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1462786254-18000-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 09 May 2016 09:31:13 -0000

From: johnhcwang <hsienchiang@gmail.com>

Add lm75 outlet temperature sensor on I2C-6 for Barreleye
---
 bin/Barreleye.py           |  5 +++++
 objects/hwmons_barreleye.c | 15 ++++++++-------
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/bin/Barreleye.py b/bin/Barreleye.py
index 9cbf777..71ebf6c 100755
--- a/bin/Barreleye.py
+++ b/bin/Barreleye.py
@@ -620,6 +620,11 @@ HWMON_CONFIG = {
                         'in14_input' : { 'object_path' : 'voltage/P1V35_CPU1_BUF3','poll_interval' : 10000,'scale' : 1,'units' : '' },
 		}
          },
+	'6-0048' : {
+		'names' : {
+                        'temp1_input' : { 'object_path' : 'temperature/outlet','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		}
+	},
 	'3-0050' : {
 		'names' : {
 			'caps_curr_powercap' : { 'object_path' : 'powercap/curr_cap','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
diff --git a/objects/hwmons_barreleye.c b/objects/hwmons_barreleye.c
index 5acde7c..9cc555b 100644
--- a/objects/hwmons_barreleye.c
+++ b/objects/hwmons_barreleye.c
@@ -20,18 +20,19 @@ typedef struct {
   int fd;
 } HWMON;
 
-#define  NUM_HWMONS 7
+#define  NUM_HWMONS 8
 
 // TODO: Don't hardcode
 //Hardcoded for barreleye
 HWMON hwmons[NUM_HWMONS] = { 
 	(HWMON){"/sys/class/hwmon/hwmon0/temp1_input","temperature/ambient",3000,"C",1000},
-	(HWMON){"/sys/class/hwmon/hwmon1/pwm1","speed/fan0",30000,"",1},
-	(HWMON){"/sys/class/hwmon/hwmon1/pwm2","speed/fan1",30000,"",1},
-	(HWMON){"/sys/class/hwmon/hwmon1/pwm3","speed/fan2",30000,"",1},
-	(HWMON){"/sys/class/hwmon/hwmon2/pwm1","speed/fan3",30000,"",1},
-	(HWMON){"/sys/class/hwmon/hwmon2/pwm2","speed/fan4",30000,"",1},
-	(HWMON){"/sys/class/hwmon/hwmon2/pwm3","speed/fan5",30000,"",1},
+	(HWMON){"/sys/class/hwmon/hwmon1/temp1_input","temperature/outlet",5000,"C",1000},
+	(HWMON){"/sys/class/hwmon/hwmon2/pwm1","speed/fan0",30000,"",1},
+	(HWMON){"/sys/class/hwmon/hwmon2/pwm2","speed/fan1",30000,"",1},
+	(HWMON){"/sys/class/hwmon/hwmon2/pwm3","speed/fan2",30000,"",1},
+	(HWMON){"/sys/class/hwmon/hwmon3/pwm1","speed/fan3",30000,"",1},
+	(HWMON){"/sys/class/hwmon/hwmon3/pwm2","speed/fan4",30000,"",1},
+	(HWMON){"/sys/class/hwmon/hwmon3/pwm3","speed/fan5",30000,"",1},
 };
 bool is_hwmon_valid(HWMON* hwmon)
 {
-- 
2.8.1
