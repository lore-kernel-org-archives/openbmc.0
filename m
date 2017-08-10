Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xT32t6hlbzDr0G
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 08:39:02 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7AMY94e023317
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 18:39:00 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2c8tbwrkp4-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 18:39:00 -0400
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 10 Aug 2017 18:38:59 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 10 Aug 2017 18:38:58 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7AMcwS631129742; Thu, 10 Aug 2017 22:38:58 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E056AE03B;
 Thu, 10 Aug 2017 18:39:15 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id A94CCAE034;
 Thu, 10 Aug 2017 18:39:14 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, cbostic@linux.vnet.ibm.com, bjwyman@gmail.com,
 mspinler@linux.vnet.ibm.com, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v4 0/4] hwmon: (pmbus): Add POWER System power
 supply driver
Date: Thu, 10 Aug 2017 17:38:52 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17081022-0056-0000-0000-000003B4FDFE
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007521; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000219; SDB=6.00900486; UDB=6.00450827; IPR=6.00680687; 
 BA=6.00005522; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016634; XFM=3.00000015;
 UTC=2017-08-10 22:38:59
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17081022-0057-0000-0000-000007EB2B57
Message-Id: <1502404736-23655-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-10_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708100352
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
X-List-Received-Date: Thu, 10 Aug 2017 22:39:03 -0000

From: "Edward A. James" <eajames@us.ibm.com>

This series adds a hwmon pmbus driver for a POWER System power supply. The
core monitoring functionality is provided by pmbus.

This series depends on the pmbus core extensions for debugfs recently submitted
to the mailing list:
http://patchwork.ozlabs.org/patch/800350/
http://patchwork.ozlabs.org/patch/800351/
http://patchwork.ozlabs.org/patch/800352/
http://patchwork.ozlabs.org/patch/800353/

These devices should be auto-probed on the I2C bus, so I added them to the
witherspoon device tree.

Edward A. James (4):
  dt-bindings: i2c: Document the IBM POWER system power supply device
  hwmon: (pmbus): Add POWER system power supply driver
  Documentation: hwmon: Add POWER system power supply documentation
  ARM: dts: aspeed: Witherspoon: Add power supplies to i2c bus

 .../devicetree/bindings/i2c/ibm,power-ps.txt       |  21 +++
 Documentation/hwmon/powerps                        |  54 ++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts   |  10 ++
 drivers/hwmon/pmbus/Kconfig                        |  10 ++
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/powerps.c                      | 144 +++++++++++++++++++++
 6 files changed, 240 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/ibm,power-ps.txt
 create mode 100644 Documentation/hwmon/powerps
 create mode 100644 drivers/hwmon/pmbus/powerps.c

-- 
1.8.3.1
