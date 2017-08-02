Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xN4Sj5w9GzDqxC
 for <openbmc@lists.ozlabs.org>; Thu,  3 Aug 2017 06:25:41 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v72KO1BX062238
 for <openbmc@lists.ozlabs.org>; Wed, 2 Aug 2017 16:25:39 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c3mbqv0a3-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 02 Aug 2017 16:25:39 -0400
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 2 Aug 2017 14:25:38 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 2 Aug 2017 14:25:36 -0600
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v72KPZ7p9830822; Wed, 2 Aug 2017 13:25:35 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A82606A03B;
 Wed,  2 Aug 2017 14:25:35 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id 628B36A03D;
 Wed,  2 Aug 2017 14:25:35 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, bjwyman@gmail.com, mspinler@linux.vnet.ibm.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v3 0/5] drivers/hwmon/pmbus: Add IBM power
 supply hwmon driver
Date: Wed,  2 Aug 2017 15:25:29 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17080220-8235-0000-0000-00000C0A1FCE
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007472; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000216; SDB=6.00896632; UDB=6.00448563; IPR=6.00676819; 
 BA=6.00005506; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016502; XFM=3.00000015;
 UTC=2017-08-02 20:25:37
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080220-8236-0000-0000-00003D0A5DE5
Message-Id: <1501705534-27606-1-git-send-email-eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Wed, 02 Aug 2017 20:25:42 -0000
X-List-Received-Date: Wed, 02 Aug 2017 20:25:42 -0000

From: "Edward A. James" <eajames@us.ibm.com>

This series adds a hwmon pmbus driver for the IBM power supply. The core
monitoring functionality is provided by pmbus. The driver also exports some
sysfs entries for raw status register access.

The driver should be probed automatically, so I added it to the witherspoon
device-tree.

Edward A. James (5):
  drivers/hwmon/pmbus: Add IBM power supply hwmon driver
  drivers/hwmon/pmbus: ibmps: Add non-hwmon attributes
  Documentation: hwmon: Add IBM power supply documentation
  Documentation: ABI: Add IBM power supply sysfs documentation
  ARM: dts: aspeed: witherspoon: Add IBM power supply to I2C bus

 Documentation/ABI/testing/sysfs-driver-ibmps     |  49 +++++
 Documentation/hwmon/ibmps                        |  53 +++++
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts |  10 +
 drivers/hwmon/pmbus/Kconfig                      |  10 +
 drivers/hwmon/pmbus/Makefile                     |   1 +
 drivers/hwmon/pmbus/ibmps.c                      | 242 +++++++++++++++++++++++
 6 files changed, 365 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-ibmps
 create mode 100644 Documentation/hwmon/ibmps
 create mode 100644 drivers/hwmon/pmbus/ibmps.c

-- 
1.8.3.1
