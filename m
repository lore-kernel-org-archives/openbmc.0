Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xLrGt1dtyzDrLV
 for <openbmc@lists.ozlabs.org>; Tue,  1 Aug 2017 06:12:53 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6VK991k066694
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 16:12:51 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2c28ev8hwg-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 16:12:51 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 31 Jul 2017 14:12:50 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 31 Jul 2017 14:12:47 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6VKClVS9765344; Mon, 31 Jul 2017 13:12:47 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C19713603A;
 Mon, 31 Jul 2017 14:12:47 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.80.232.39])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 9DD5D136043;
 Mon, 31 Jul 2017 14:12:46 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, mspinler@linux.vnet.ibm.com, bjwyman@gmail.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v2 4/5] Documentation: hwmon: Add P17531
 documentation
Date: Mon, 31 Jul 2017 15:12:31 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1501531952-490-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1501531952-490-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17073120-0004-0000-0000-000012AE27DB
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007460; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00895667; UDB=6.00447984; IPR=6.00675855; 
 BA=6.00005503; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016469; XFM=3.00000015;
 UTC=2017-07-31 20:12:49
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17073120-0005-0000-0000-0000807D02F5
Message-Id: <1501531952-490-5-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-31_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1707310337
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
X-List-Received-Date: Mon, 31 Jul 2017 20:12:55 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 Documentation/hwmon/p17531 | 53 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/hwmon/p17531

diff --git a/Documentation/hwmon/p17531 b/Documentation/hwmon/p17531
new file mode 100644
index 0000000..e1fcbfc
--- /dev/null
+++ b/Documentation/hwmon/p17531
@@ -0,0 +1,53 @@
+Kernel driver p17531
+====================
+
+Supported chips:
+  * IBM P17531
+
+Author: Eddie James <eajames@us.ibm.com>
+
+Description
+-----------
+
+This driver supports the IBM P17531 power supply. This driver is a client to
+the core PMBus driver.
+
+Usage Notes
+-----------
+
+This driver should auto-detect devices. In the event that it does not, you will
+have to instantiate the devices explicitly. Please see
+Documentation/i2c/instantiating-devices for details.
+
+Sysfs entries
+-------------
+
+The following attributes are supported:
+
+curr1_alarm		Output current over-current fault.
+curr1_input		Measured output current in mA.
+curr1_label		"iout1"
+
+fan1_alarm		Fan 1 warning.
+fan1_fault		Fan 1 fault.
+fan1_input		Fan 1 speed in RPM.
+fan2_alarm		Fan 2 warning.
+fan2_fault		Fan 2 fault.
+fan2_input		Fan 2 speed in RPM.
+
+in1_alarm		Input voltage under-voltage fault.
+in1_input		Measured input voltage in mV.
+in1_label		"vin"
+in2_alarm		Output voltage over-voltage fault.
+in2_input		Measured output voltage in mV.
+in2_label		"vout1"
+
+power1_input		Measured input power in uW.
+power1_label		"pin"
+
+temp1_alarm		PSU inlet ambient temperature over-temperature fault.
+temp1_input		Measured PSU inlet ambient temp in millidegrees C.
+temp2_alarm		Secondary rectifier temp over-temperature fault.
+temp2_input		Measured secondary rectifier temp in millidegrees C.
+temp3_alarm		ORing FET temperature over-temperature fault.
+temp3_input		Measured ORing FET temperature in millidegrees C.
-- 
1.8.3.1
