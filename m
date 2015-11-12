Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9F0BE1A074D
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2015 22:06:26 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 144732363240023.47093632804365;
 Thu, 12 Nov 2015 02:20:32 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: adamliyi <adamliyi@msn.com>
Subject: [PATCH kernel-hwmon-occ 10/10] add Palmetto test result
Date: Thu, 12 Nov 2015 05:20:12 -0500
Message-Id: <1447323612-15427-11-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447323612-15427-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447323612-15427-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 12 Nov 2015 11:06:27 -0000

From: adamliyi <adamliyi@msn.com>

---
 README.md | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/README.md b/README.md
index 874824d..43b97e8 100644
--- a/README.md
+++ b/README.md
@@ -1,13 +1,17 @@
 # kernel-hwmon-occ
-hwmon driver for the openpower OCC. BMC uses it to read CPU sensor data via OCC (On-Chip-Controller).
+HWMON driver for the openpower OCC. BMC uses it to read CPU sensor data via OCC (On-Chip-Controller).
 It is part of openbmc.
 
-After building, a kernel module named "occ.ko" is generated.
+After building, a kernel module named "occ.ko" is generated. Currently the module is located in:
+"lib/modules/4.2.0-openbmc-20151104-1/extra/occ.ko".
 
-The driver exposed bellow HWMON interface:
+Bellow are steps tested on Palmetto:
 
-*_input: means sensor_value.
-*_label: means sensor_id
+1. root@palmetto:~# insmod occ.ko
+occ-i2c 3-0050: occ i2c driver ready: i2c addr@0x50
+occ-i2c 3-0051: occ i2c driver ready: i2c addr@0x51
+
+2. The driver exposed bellow HWMON interface:
 
 root@palmetto:~# ls /sys/class/hwmon/hwmon0/
 device        freq4_input   power2_input  temp1_input   temp4_label   temp8_input
@@ -18,3 +22,17 @@ freq2_label   power         power4_input  temp3_input   temp6_label   uevent
 freq3_input   power1_input  power4_label  temp3_label   temp7_input
 freq3_label   power1_label  subsystem     temp4_input   temp7_label
 
+*_input: means sensor_value.
+*_label: means sensor_id
+
+The OCC HWMON interface is created refering to: https://www.kernel.org/doc/Documentation/hwmon/sysfs-interface
+However, freq*_input, freq*_label, power*_label is not stardard interface documented by kernel.
+
+3. Show TEMP sensor value (Unit: millidegree Celsius)
+root@palmetto:~# cat /sys/class/hwmon/hwmon0/temp1_input
+35000
+
+4. Show TEMP sensor id:
+root@palmetto:~# cat /sys/class/hwmon/hwmon0/temp1_label
+108
+
-- 
2.6.3
