Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A31C21A03D5
 for <openbmc@lists.ozlabs.org>; Fri, 27 Nov 2015 17:50:41 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448607036591964.3148986198883;
 Thu, 26 Nov 2015 22:50:36 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken <ken.sk.lai@mail.foxconn.com>
Subject: [PATCH skeleton v6 06/19] Workarounf for fan PWM 100%
Date: Fri, 27 Nov 2015 01:50:18 -0500
Message-Id: <1448607031-24374-7-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1448607031-24374-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448607031-24374-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 27 Nov 2015 06:50:42 -0000

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
