Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xN4Sv04qvzDrF3
 for <openbmc@lists.ozlabs.org>; Thu,  3 Aug 2017 06:25:50 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v72KPc5a065208
 for <openbmc@lists.ozlabs.org>; Wed, 2 Aug 2017 16:25:49 -0400
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c3mbqv0h4-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 02 Aug 2017 16:25:48 -0400
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 2 Aug 2017 14:25:48 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 2 Aug 2017 14:25:45 -0600
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v72KPjfk61341912; Wed, 2 Aug 2017 13:25:45 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 368FB6A03F;
 Wed,  2 Aug 2017 14:25:45 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id E55996A03D;
 Wed,  2 Aug 2017 14:25:44 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, bjwyman@gmail.com, mspinler@linux.vnet.ibm.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v3 4/5] Documentation: ABI: Add IBM power
 supply sysfs documentation
Date: Wed,  2 Aug 2017 15:25:33 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1501705534-27606-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1501705534-27606-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17080220-0028-0000-0000-000008211981
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007472; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000216; SDB=6.00896632; UDB=6.00448562; IPR=6.00676819; 
 BA=6.00005506; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016502; XFM=3.00000015;
 UTC=2017-08-02 20:25:47
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080220-0029-0000-0000-000036F5D985
Message-Id: <1501705534-27606-5-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-02_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708020329
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
X-List-Received-Date: Wed, 02 Aug 2017 20:25:52 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 Documentation/ABI/testing/sysfs-driver-ibmps | 49 ++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-ibmps

diff --git a/Documentation/ABI/testing/sysfs-driver-ibmps b/Documentation/ABI/testing/sysfs-driver-ibmps
new file mode 100644
index 0000000..1645685
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-ibmps
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
