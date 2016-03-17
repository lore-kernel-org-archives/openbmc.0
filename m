Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qQWzW6RpfzDqVw
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2016 13:10:47 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458180643502589.3429034912259;
 Wed, 16 Mar 2016 19:10:43 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton v2] skeleton: Add dbus objects for adm1278 hwmon
 sensors
Date: Wed, 16 Mar 2016 21:10:41 -0500
Message-Id: <1458180641-13347-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1458180641-13347-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1458180641-13347-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 17 Mar 2016 02:10:48 -0000

From: Yi Li <adamliyi@msn.com>

Add dbus object for adm1278 Vout and Iout sensors.
The object name will subject to change after review.

Signed-off-by: Yi Li <adamliyi@msn.com>
---
 bin/Barreleye.py | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/bin/Barreleye.py b/bin/Barreleye.py
index 09fefa0..0db7470 100755
--- a/bin/Barreleye.py
+++ b/bin/Barreleye.py
@@ -717,5 +717,23 @@ HWMON_CONFIG = {
 		'101' :  { 'object_path' : 'temperature/membuf7','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
 		}
 	},
+	'4-0010' :  {
+		'names' : {
+			'curr1_input' : { 'object_path' : 'HSCA/Iout','poll_interval' : 5000,'scale' : 1,'units' : 'mA' },
+			'in2_input' : { 'object_path' : 'HSCA/Vout','poll_interval' : 5000,'scale' : 1,'units' : 'mV' },
+		}
+	},
+	'5-0010' :  {
+		'names' : {
+			'curr1_input' : { 'object_path' : 'HSCB/Iout','poll_interval' : 5000,'scale' : 1,'units' : 'mA' },
+			'in2_input' : { 'object_path' : 'HSCB/Vout','poll_interval' : 5000,'scale' : 1,'units' : 'mV' },
+		}
+	},
+	'6-0010' :  {
+		'names' : {
+			'curr1_input' : { 'object_path' : 'HSCC/Iout','poll_interval' : 5000,'scale' : 1,'units' : 'mA' },
+			'in2_input' : { 'object_path' : 'HSCC/Vout','poll_interval' : 5000,'scale' : 1,'units' : 'mV' },
+		}
+	},
 }
 
-- 
2.7.1
