Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xLrGv5ty3zDrLV
 for <openbmc@lists.ozlabs.org>; Tue,  1 Aug 2017 06:12:55 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6VK9HWe003633
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 16:12:53 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c24sj4ke7-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 16:12:53 -0400
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 31 Jul 2017 14:12:52 -0600
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 31 Jul 2017 14:12:50 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6VKCo5K1376584; Mon, 31 Jul 2017 13:12:50 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38C9313603C;
 Mon, 31 Jul 2017 14:12:50 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.80.232.39])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 6012F136040;
 Mon, 31 Jul 2017 14:12:49 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, mspinler@linux.vnet.ibm.com, bjwyman@gmail.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v2 5/5] Documentation: ABI: Add P17531 sysfs
 documentation
Date: Mon, 31 Jul 2017 15:12:32 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1501531952-490-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1501531952-490-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17073120-8235-0000-0000-00000C072EC0
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007460; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00895668; UDB=6.00447984; IPR=6.00675855; 
 BA=6.00005503; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016469; XFM=3.00000015;
 UTC=2017-07-31 20:12:51
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17073120-8236-0000-0000-00003D026573
Message-Id: <1501531952-490-6-git-send-email-eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Mon, 31 Jul 2017 20:12:56 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 Documentation/ABI/testing/sysfs-driver-p17531 | 49 +++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-p17531

diff --git a/Documentation/ABI/testing/sysfs-driver-p17531 b/Documentation/ABI/testing/sysfs-driver-p17531
new file mode 100644
index 0000000..1645685
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-p17531
@@ -0,0 +1,49 @@
+What:		/sys/bus/i2c/devices/<dev>/clear_faults
+KernelVersion:	4.13
+Contact:	eajames@us.ibm.com
+Description:	Clears pmbus faults for this power supply.
+
+What:		/sys/bus/i2c/devices/<dev>/status_word
+KernelVersion:	4.13
+Contact:	eajames@us.ibm.com
+Description:	Displays the STATUS_WORD register.
+
+What:		/sys/bus/i2c/devices/<dev>/status_vout
+KernelVersion:	4.13
+Contact:	eajames@us.ibm.com
+Description:	Displays the STATUS_VOUT register.
+
+What:		/sys/bus/i2c/devices/<dev>/status_iout
+KernelVersion:	4.13
+Contact:	eajames@us.ibm.com
+Description:	Displays the STATUS_IOUT register.
+
+What:		/sys/bus/i2c/devices/<dev>/status_input
+KernelVersion:	4.13
+Contact:	eajames@us.ibm.com
+Description:	Displays the STATUS_INPUT register.
+
+What:		/sys/bus/i2c/devices/<dev>/status_temp
+KernelVersion:	4.13
+Contact:	eajames@us.ibm.com
+Description:	Displays the STATUS_TEMPERATURE register.
+
+What:		/sys/bus/i2c/devices/<dev>/status_cml
+KernelVersion:	4.13
+Contact:	eajames@us.ibm.com
+Description:	Displays the STATUS_CML register.
+
+What:		/sys/bus/i2c/devices/<dev>/status_other
+KernelVersion:	4.13
+Contact:	eajames@us.ibm.com
+Description:	Displays the STATUS_OTHER register.
+
+What:		/sys/bus/i2c/devices/<dev>/status_mfr
+KernelVersion:	4.13
+Contact:	eajames@us.ibm.com
+Description:	Displays the STATUS_MFR_SPECIFIC register.
+
+What:		/sys/bus/i2c/devices/<dev>/status_fan
+KernelVersion:	4.13
+Contact:	eajames@us.ibm.com
+Description:	Displays the STATUS_FAN register.
-- 
1.8.3.1
