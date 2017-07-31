Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xLrGg0MF2zDr6m
 for <openbmc@lists.ozlabs.org>; Tue,  1 Aug 2017 06:12:42 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6VK9L0c114408
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 16:12:40 -0400
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2c26e0ex9h-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 16:12:40 -0400
Received: from localhost
 by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 31 Jul 2017 14:12:39 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 31 Jul 2017 14:12:36 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6VKCaTM27852868; Mon, 31 Jul 2017 13:12:36 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 23FED13603A;
 Mon, 31 Jul 2017 14:12:36 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.80.232.39])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 5E2B0136048;
 Mon, 31 Jul 2017 14:12:35 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, mspinler@linux.vnet.ibm.com, bjwyman@gmail.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v2 0/5] drivers/hwmon/pmbus: Add IBM P17531
 driver
Date: Mon, 31 Jul 2017 15:12:27 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17073120-0024-0000-0000-000016F43117
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007460; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00895667; UDB=6.00447984; IPR=6.00675855; 
 BA=6.00005503; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016469; XFM=3.00000015;
 UTC=2017-07-31 20:12:38
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17073120-0025-0000-0000-00004C171A0C
Message-Id: <1501531952-490-1-git-send-email-eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Mon, 31 Jul 2017 20:12:43 -0000
X-List-Received-Date: Mon, 31 Jul 2017 20:12:43 -0000

From: "Edward A. James" <eajames@us.ibm.com>

This series adds a hwmon pmbus driver for the IBM P17531 power supply. The core
monitoring functionality is provided by pmbus. The driver also exports some
sysfs entries for raw status register access.

The driver should be probed automatically, so I added it to the witherspoon
device-tree.

Edward A. James (5):
  drivers/hwmon/pmbus: Add IBM P17531 driver
  drivers/hwmon/pmbus: p17531: Add non-hwmon attributes
  ARM: dts: aspeed: witherspoon: Add P17531 power supply to I2C bus
  Documentation: hwmon: Add P17531 documentation
  Documentation: ABI: Add P17531 sysfs documentation

 Documentation/ABI/testing/sysfs-driver-p17531    |  49 +++++
 Documentation/hwmon/p17531                       |  53 +++++
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts |  10 +
 drivers/hwmon/pmbus/Kconfig                      |  10 +
 drivers/hwmon/pmbus/Makefile                     |   1 +
 drivers/hwmon/pmbus/p17531.c                     | 245 +++++++++++++++++++++++
 6 files changed, 368 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-p17531
 create mode 100644 Documentation/hwmon/p17531
 create mode 100644 drivers/hwmon/pmbus/p17531.c

-- 
1.8.3.1
