Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 955971A0A50
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2015 14:00:58 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447902044517331.0096827626685;
 Wed, 18 Nov 2015 19:00:44 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken <ken.sk.lai@mail.foxconn.com>
Subject: [PATCH skeleton v2 6/9] Workarounf for fan PWM 100%
Date: Wed, 18 Nov 2015 22:00:36 -0500
Message-Id: <1447902039-2898-7-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447902039-2898-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447902039-2898-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 19 Nov 2015 03:00:59 -0000

From: Ken <ken.sk.lai@mail.foxconn.com>

---
 bin/startup_hacks.sh | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/bin/startup_hacks.sh b/bin/startup_hacks.sh
index 5868e8a..603fc1c 100755
--- a/bin/startup_hacks.sh
+++ b/bin/startup_hacks.sh
@@ -11,3 +11,12 @@ echo 0x2e > /sys/bus/i2c/devices/i2c-6/delete_device
 echo nct7904 0x2e > /sys/bus/i2c/devices/i2c-6/new_device
 echo nct7904 0x2d > /sys/bus/i2c/devices/i2c-6/new_device
 
+echo 255 > /sys/class/hwmon/hwmon1/pwm1
+echo 255 > /sys/class/hwmon/hwmon1/pwm2
+echo 255 > /sys/class/hwmon/hwmon1/pwm3
+echo 255 > /sys/class/hwmon/hwmon1/pwm4
+
+echo 255 > /sys/class/hwmon/hwmon2/pwm1
+echo 255 > /sys/class/hwmon/hwmon2/pwm2
+echo 255 > /sys/class/hwmon/hwmon2/pwm3
+echo 255 > /sys/class/hwmon/hwmon2/pwm4
-- 
2.6.3
