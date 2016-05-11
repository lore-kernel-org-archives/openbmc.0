Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r4LxW0QzzzDqKD
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2016 13:21:18 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1462936876649674.4231128311021;
 Tue, 10 May 2016 20:21:16 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken Lai <ken1029@gmail.com>
Subject: [PATCH skeleton v10 20/22] Revert "Add I2C-6 lm75 outlet temperature
 sensor"
Date: Tue, 10 May 2016 22:20:50 -0500
Message-Id: <1462936852-25327-21-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1462936852-25327-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1462936852-25327-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 11 May 2016 03:21:20 -0000

From: Ken Lai <ken1029@gmail.com>

This reverts commit 0428fb4215889eaa151f63b4e904bdc61551295f.
---
 bin/Barreleye.py           |  5 -----
 objects/hwmons_barreleye.c | 15 +++++++--------
 2 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/bin/Barreleye.py b/bin/Barreleye.py
index 86a5a97..ffe515d 100755
--- a/bin/Barreleye.py
+++ b/bin/Barreleye.py
@@ -633,11 +633,6 @@ HWMON_CONFIG = {
                         'in14_input' : { 'object_path' : 'voltage/P1V35_CPU1_BUF3','poll_interval' : 10000,'scale' : 1,'units' : '' },
 		}
          },
-	'6-0048' : {
-		'names' : {
-                        'temp1_input' : { 'object_path' : 'temperature/outlet','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
-		}
-	},
 	'3-0050' : {
 		'names' : {
 			'caps_curr_powercap' : { 'object_path' : 'powercap/curr_cap','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
diff --git a/objects/hwmons_barreleye.c b/objects/hwmons_barreleye.c
index 9cc555b..5acde7c 100644
--- a/objects/hwmons_barreleye.c
+++ b/objects/hwmons_barreleye.c
@@ -20,19 +20,18 @@ typedef struct {
   int fd;
 } HWMON;
 
-#define  NUM_HWMONS 8
+#define  NUM_HWMONS 7
 
 // TODO: Don't hardcode
 //Hardcoded for barreleye
 HWMON hwmons[NUM_HWMONS] = { 
 	(HWMON){"/sys/class/hwmon/hwmon0/temp1_input","temperature/ambient",3000,"C",1000},
-	(HWMON){"/sys/class/hwmon/hwmon1/temp1_input","temperature/outlet",5000,"C",1000},
-	(HWMON){"/sys/class/hwmon/hwmon2/pwm1","speed/fan0",30000,"",1},
-	(HWMON){"/sys/class/hwmon/hwmon2/pwm2","speed/fan1",30000,"",1},
-	(HWMON){"/sys/class/hwmon/hwmon2/pwm3","speed/fan2",30000,"",1},
-	(HWMON){"/sys/class/hwmon/hwmon3/pwm1","speed/fan3",30000,"",1},
-	(HWMON){"/sys/class/hwmon/hwmon3/pwm2","speed/fan4",30000,"",1},
-	(HWMON){"/sys/class/hwmon/hwmon3/pwm3","speed/fan5",30000,"",1},
+	(HWMON){"/sys/class/hwmon/hwmon1/pwm1","speed/fan0",30000,"",1},
+	(HWMON){"/sys/class/hwmon/hwmon1/pwm2","speed/fan1",30000,"",1},
+	(HWMON){"/sys/class/hwmon/hwmon1/pwm3","speed/fan2",30000,"",1},
+	(HWMON){"/sys/class/hwmon/hwmon2/pwm1","speed/fan3",30000,"",1},
+	(HWMON){"/sys/class/hwmon/hwmon2/pwm2","speed/fan4",30000,"",1},
+	(HWMON){"/sys/class/hwmon/hwmon2/pwm3","speed/fan5",30000,"",1},
 };
 bool is_hwmon_valid(HWMON* hwmon)
 {
-- 
2.8.1
