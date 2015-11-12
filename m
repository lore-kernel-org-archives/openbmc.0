Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 7AACD1A0841
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2015 22:46:08 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447327836070840.4971297894497;
 Thu, 12 Nov 2015 03:30:36 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: adamliyi <adamliyi@msn.com>
Subject: [PATCH kernel-hwmon-occ v2 08/11] add description to README.md
Date: Thu, 12 Nov 2015 06:30:09 -0500
Message-Id: <1447327812-21126-9-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447327812-21126-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447327812-21126-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 12 Nov 2015 11:46:09 -0000

From: adamliyi <adamliyi@msn.com>

---
 README.md | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/README.md b/README.md
index f417f67..874824d 100644
--- a/README.md
+++ b/README.md
@@ -1,3 +1,20 @@
 # kernel-hwmon-occ
 hwmon driver for the openpower OCC. BMC uses it to read CPU sensor data via OCC (On-Chip-Controller).
 It is part of openbmc.
+
+After building, a kernel module named "occ.ko" is generated.
+
+The driver exposed bellow HWMON interface:
+
+*_input: means sensor_value.
+*_label: means sensor_id
+
+root@palmetto:~# ls /sys/class/hwmon/hwmon0/
+device        freq4_input   power2_input  temp1_input   temp4_label   temp8_input
+freq1_input   freq4_label   power2_label  temp1_label   temp5_input   temp8_label
+freq1_label   name          power3_input  temp2_input   temp5_label   temp9_input
+freq2_input   of_node       power3_label  temp2_label   temp6_input   temp9_label
+freq2_label   power         power4_input  temp3_input   temp6_label   uevent
+freq3_input   power1_input  power4_label  temp3_label   temp7_input
+freq3_label   power1_label  subsystem     temp4_input   temp7_label
+
-- 
2.6.3
