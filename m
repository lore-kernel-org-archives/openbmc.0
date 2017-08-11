Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xTXkv3ywGzDr2m
 for <openbmc@lists.ozlabs.org>; Sat, 12 Aug 2017 03:56:55 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7BHtTZW038697
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 13:56:52 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c9fts3wey-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 13:56:52 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 11 Aug 2017 13:56:50 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 11 Aug 2017 13:56:47 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7BHullc24641564; Fri, 11 Aug 2017 17:56:47 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AED81B2054;
 Fri, 11 Aug 2017 13:54:13 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP id 448BFB2052;
 Fri, 11 Aug 2017 13:54:13 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, bjwyman@gmail.com, mspinler@linux.vnet.ibm.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v5 0/4] hwmon: (pmbus): Add IBM Common Form
 Factor (CFF) power supply driver
Date: Fri, 11 Aug 2017 12:56:41 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17081117-0040-0000-0000-0000038E5924
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007526; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000220; SDB=6.00900858; UDB=6.00451050; IPR=6.00681061; 
 BA=6.00005523; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016647; XFM=3.00000015;
 UTC=2017-08-11 17:56:49
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17081117-0041-0000-0000-00000782876A
Message-Id: <1502474205-1557-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-11_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708110279
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
X-List-Received-Date: Fri, 11 Aug 2017 17:56:57 -0000

From: "Edward A. James" <eajames@us.ibm.com>

This series adds a hwmon pmbus driver for a POWER System power supply. The
core monitoring functionality is provided by pmbus.

These devices should be auto-probed on the I2C bus, so I added them to the
witherspoon device tree.

Changes since v4:
 * Rename the driver again...
 * Change compatible property; we can't have any '-' in the compatible
   property because pmbus will use that string for hwmon registration name,
   which disallows that character.
 * Remove debugfs bool from pmbus_driver_info
 * Add comment about returning rc when reading STATUS_MFR_SPECIFIC fails.

Edward A. James (4):
  dt-bindings: i2c: Document the IBM CCF power supply version 1
  hwmon: (pmbus): Add IBM Common Form Factor (CFF) power supply driver
  Documentation: hwmon: Document the IBM CFF power supply
  ARM: dts: aspeed: Witherspoon: Add power supplies to i2c bus

 .../devicetree/bindings/i2c/ibm,cffps1.txt         |  21 +++
 Documentation/hwmon/ibm-cffps                      |  54 ++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts   |  10 ++
 drivers/hwmon/pmbus/Kconfig                        |  10 ++
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/ibm-cffps.c                    | 151 +++++++++++++++++++++
 6 files changed, 247 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/ibm,cffps1.txt
 create mode 100644 Documentation/hwmon/ibm-cffps
 create mode 100644 drivers/hwmon/pmbus/ibm-cffps.c

-- 
1.8.3.1
