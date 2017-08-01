Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xLyct1YCXzDsRq
 for <openbmc@lists.ozlabs.org>; Tue,  1 Aug 2017 10:58:54 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v710wawF037340
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 20:58:52 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c2c2syps7-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 20:58:52 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 31 Jul 2017 20:58:51 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 31 Jul 2017 20:58:49 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v710wmxg25952440; Tue, 1 Aug 2017 00:58:48 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0191AC03A;
 Mon, 31 Jul 2017 20:59:02 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.85.136.69])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 60B95AC041;
 Mon, 31 Jul 2017 20:59:02 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.12 09/10] Documentation: ABI: Add occ-hwmon driver
 sysfs documentation
Date: Mon, 31 Jul 2017 19:58:26 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1501549107-22323-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1501549107-22323-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17080100-0040-0000-0000-00000388A1DB
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007462; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00895763; UDB=6.00448041; IPR=6.00675950; 
 BA=6.00005503; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016472; XFM=3.00000015;
 UTC=2017-08-01 00:58:50
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080100-0041-0000-0000-0000077CCB12
Message-Id: <1501549107-22323-10-git-send-email-eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Tue, 01 Aug 2017 00:58:54 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Detail the sysfs attributes provided by the occ-hwmon driver.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 Documentation/ABI/testing/sysfs-driver-occ-hwmon | 77 ++++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-occ-hwmon

diff --git a/Documentation/ABI/testing/sysfs-driver-occ-hwmon b/Documentation/ABI/testing/sysfs-driver-occ-hwmon
new file mode 100644
index 0000000..5563128
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-occ-hwmon
@@ -0,0 +1,77 @@
+What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_active
+Date:		July 2017
+KernelVersion:	4.14
+Contact:	eajames@us.ibm.com
+Description:
+		A read-only attribute that indicates (with a "1" or a "0",
+		respectively) whether or not this OCC is in the "active" state.
+
+What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_dvfs_ot
+Date:		July 2017
+KernelVersion:	4.14
+Contact:	eajames@us.ibm.com
+Description:
+		A read-only attribute that indicates (with a "1" or a "0",
+		respectively) whether or not this OCC has limited the processor
+		frequency due to over-temperature.
+
+What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_dvfs_power
+Date:		July 2017
+KernelVersion:	4.14
+Contact:	eajames@us.ibm.com
+Description:
+		A read-only attribute that indicates (with a "1" or a "0",
+		respectively) whether or not this OCC has limited the processor
+		frequency due to power usage.
+
+What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_error
+Date:		July 2017
+KernelVersion:	4.14
+Contact:	eajames@us.ibm.com
+Description:
+		A read-only attribute that indicates any error condition
+		observed by the OCC or detected by the driver. Reading the
+		attribute will return an integer. A negative integer indicates
+		either an error response from the OCC or bus error or other
+		error condition detected by the driver. A "0" indicates no
+		error.
+
+What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_master
+Date:		July 2017
+KernelVersion:	4.14
+Contact:	eajames@us.ibm.com
+Description:
+		A read-only attribute that indicates (with a "1" or a "0",
+		respectively) whether or not this OCC is the "master" OCC.
+
+What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_mem_throttle
+Date:		July 2017
+KernelVersion:	4.14
+Contact:	eajames@us.ibm.com
+Description:
+		A read-only attribute that indicates (with a "1" or a "0",
+		respectively) whether or not the OCC has throttled memory due
+		to over-temperature.
+
+What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_quick_drop
+Date:		July 2017
+KernelVersion:	4.14
+Contact:	eajames@us.ibm.com
+Description:
+		A read-only attribute that indicates (with a "1" or a "0",
+		respectively) whether or not this OCC has asserted the "quick
+		power drop" signal.
+
+What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_status
+Date:		July 2017
+KernelVersion:	4.14
+Contact:	eajames@us.ibm.com
+Description:
+		A read-only attribute that indicates the current OCC state. The
+		value of the attribute will be one of the following states:
+		0: Reserved
+		1: Standby
+		2: Observation
+		3: Active
+		4: Safe
+		5: Characterization
-- 
1.8.3.1
