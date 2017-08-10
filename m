Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xT3395zCgzDr5b
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 08:39:17 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7AMdFvZ031855
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 18:39:15 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c903cgv3j-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 18:39:15 -0400
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 10 Aug 2017 18:39:08 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 10 Aug 2017 18:39:06 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7AMd5um51642616; Thu, 10 Aug 2017 22:39:05 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 013EAAE04B;
 Thu, 10 Aug 2017 18:39:23 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id 79034AE034;
 Thu, 10 Aug 2017 18:39:22 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, cbostic@linux.vnet.ibm.com, bjwyman@gmail.com,
 mspinler@linux.vnet.ibm.com, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v4 3/4] Documentation: hwmon: Add POWER system
 power supply documentation
Date: Thu, 10 Aug 2017 17:38:55 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1502404736-23655-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1502404736-23655-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17081022-0056-0000-0000-000003B4FE01
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007521; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000219; SDB=6.00900486; UDB=6.00450827; IPR=6.00680687; 
 BA=6.00005522; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016634; XFM=3.00000015;
 UTC=2017-08-10 22:39:07
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17081022-0057-0000-0000-000007EB2B5A
Message-Id: <1502404736-23655-4-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-10_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708100353
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
X-List-Received-Date: Thu, 10 Aug 2017 22:39:18 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 Documentation/hwmon/powerps | 54 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/hwmon/powerps

diff --git a/Documentation/hwmon/powerps b/Documentation/hwmon/powerps
new file mode 100644
index 0000000..a4fbe92
--- /dev/null
+++ b/Documentation/hwmon/powerps
@@ -0,0 +1,54 @@
+Kernel driver powerps
+=====================
+
+Supported chips:
+  * POWER system power supply
+
+Author: Eddie James <eajames@us.ibm.com>
+
+Description
+-----------
+
+This driver supports POWER system power supplies. This driver is a client
+to the core PMBus driver.
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
+power1_alarm		Input fault.
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
