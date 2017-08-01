Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xLycq6YSdzDsS0
 for <openbmc@lists.ozlabs.org>; Tue,  1 Aug 2017 10:58:51 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v710wcww001925
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 20:58:49 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2c26yy6r4r-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 20:58:49 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 31 Jul 2017 20:58:49 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 31 Jul 2017 20:58:47 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v710wkAi23986322; Tue, 1 Aug 2017 00:58:46 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B9426AC040;
 Mon, 31 Jul 2017 20:59:00 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.85.136.69])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 57053AC03A;
 Mon, 31 Jul 2017 20:59:00 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.12 08/10] Documentation: hwmon: Add OCC
 documentation
Date: Mon, 31 Jul 2017 19:58:25 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1501549107-22323-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1501549107-22323-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17080100-2213-0000-0000-000002029DA0
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007462; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00895763; UDB=6.00448041; IPR=6.00675950; 
 BA=6.00005503; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016472; XFM=3.00000015;
 UTC=2017-08-01 00:58:48
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080100-2214-0000-0000-00005711154A
Message-Id: <1501549107-22323-9-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-31_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708010012
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Aug 2017 00:58:52 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Document the hwmon interface for the OCC.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 Documentation/hwmon/occ | 74 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/hwmon/occ

diff --git a/Documentation/hwmon/occ b/Documentation/hwmon/occ
new file mode 100644
index 0000000..dcae911
--- /dev/null
+++ b/Documentation/hwmon/occ
@@ -0,0 +1,74 @@
+Kernel driver occ-hwmon
+=======================
+
+Supported chips:
+  * POWER8
+  * POWER9
+
+Author: Eddie James <eajames@us.ibm.com>
+
+Description
+-----------
+
+This driver supports hardware monitoring for the On-Chip Controller (OCC)
+embedded on POWER processors. The OCC is a device that collects and aggregates
+sensor data from the processor and the system. The OCC can provide the raw
+sensor data as well as perform thermal and power management on the system.
+
+The P8 version of this driver is a client driver of I2C. It may be probed
+manually if an "ibm,p8-occ-hwmon" compatible device is found under the
+appropriate I2C bus node in the device-tree.
+
+The P9 version of this driver is a client driver of the FSI-based OCC driver.
+It will be probed automatically by the FSI-based OCC driver. Please see the
+device-tree bindings documentation for that driver for details on probing
+an OCC device (Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt).
+
+Sysfs entries
+-------------
+
+The following attributes are supported. All attributes are read-only unless
+specified.
+
+temp[1-n]_label		OCC sensor id.
+temp[1-n]_input		Measured temperature in millidegrees C.
+[with temperature sensor version 2+]
+    temp[1-n]_fru_type		Given FRU (Field Replaceable Unit) type.
+
+freq[1-n]_label		OCC sensor id.
+freq[1-n]_input		Measured frequency.
+
+power[1-n]_label	OCC sensor id.
+power[1-n]_input	Measured power in watts.
+power[1-n]_update_tag	Number of 250us samples represented in accumulator.
+power[1-n]_accumulator	Accumulation of 250us power readings.
+[with power sensor version 2+]
+    power[1-n]_function_id	Identifies what the power reading is for.
+    power[1-n]_apss_channel	Indicates APSS channel.
+
+[power version 0xa0 only]
+power1_id			OCC sensor id.
+power[1-n]_label		Sensor type, "system", "proc", "vdd", or "vdn".
+power[1-n]_input		Most recent power reading in watts.
+power[1-n]_update_tag		Number of samples in the accumulator.
+power[1-n]_accumulator		Accumulation of power readings.
+[with sensor type "system" and "proc" only]
+    power[1-n]_update_time	Time in us that the power value is read.
+
+caps1_current		Current OCC power cap in watts.
+caps1_reading		Current system output power in watts.
+caps1_norm		Power cap without redundant power.
+caps1_max		Maximum power cap.
+[caps version 1 and 2 only]
+    caps1_min		Minimum power cap.
+[caps version 3+]
+    caps1_min_hard		Hard minimum cap that can be set and held.
+    caps1_min_soft		Soft minimum cap below hard, not guaranteed.
+caps1_user		The powercap specified by the user. Will be 0 if no
+			user powercap exists. This attribute is read-write.
+[caps version 1+]
+    caps1_user_source	Indicates how the user power limit was set.
+
+extn[1-n]_label		ASCII id or sensor id.
+extn[1-n]_flags		Indicates type of label attribute.
+extn[1-n]_input		Data.
-- 
1.8.3.1
