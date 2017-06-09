Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wkqpz1Q5kzDq9m
 for <openbmc@lists.ozlabs.org>; Sat, 10 Jun 2017 04:01:14 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v59HxmQi062561
 for <openbmc@lists.ozlabs.org>; Fri, 9 Jun 2017 14:01:12 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2aysy9bt9g-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 09 Jun 2017 14:01:12 -0400
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 9 Jun 2017 12:01:11 -0600
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 9 Jun 2017 12:01:08 -0600
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v59I17PS16842938; Fri, 9 Jun 2017 11:01:07 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A02EE78047;
 Fri,  9 Jun 2017 12:01:07 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id 6072778038;
 Fri,  9 Jun 2017 12:01:07 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v2 0/5] drivers: OCC: Update sensors,
 fix probing, add P8
Date: Fri,  9 Jun 2017 13:01:00 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17060918-8235-0000-0000-00000BAF8AF1
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007202; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00872403; UDB=6.00434054; IPR=6.00652472; 
 BA=6.00005406; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015762; XFM=3.00000015;
 UTC=2017-06-09 18:01:09
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17060918-8236-0000-0000-00003C34822A
Message-Id: <1497031265-29545-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-09_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706090312
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
X-List-Received-Date: Fri, 09 Jun 2017 18:01:15 -0000
X-List-Received-Date: Fri, 09 Jun 2017 18:01:15 -0000

From: "Edward A. James" <eajames@us.ibm.com>

This series refactors the OCC hwmon driver to make a number of changes and bug
fixes. It also includes bug fixes for the FSI OCC driver. This includes 3
patches that were previously sent individually on the openbmc mailing list.

Edward A. James (5):
  drivers: fsi: occ: Fix 1 byte response and rc for O_NONBLOCK
  drivers: hwmon: occ: Add new sensor versions and non-hwmon attributes
  drivers: hwmon: occ: Add P8 OCC access
  drivers: occ: hwmon and fsi probing fix
  aspeed: update power9 dts and defconfigs for OCC

 arch/arm/boot/dts/ibm-power9-cfam.dtsi |   9 +
 arch/arm/configs/aspeed_g4_defconfig   |   2 +
 arch/arm/configs/aspeed_g5_defconfig   |   1 +
 drivers/fsi/fsi-sbefifo.c              |   4 +-
 drivers/fsi/occ.c                      |  22 +-
 drivers/hwmon/Makefile                 |   2 +-
 drivers/hwmon/occ/Kconfig              |  19 +-
 drivers/hwmon/occ/Makefile             |  12 +-
 drivers/hwmon/occ/common.c             | 991 ++++++++++++++++++++++++++++++++-
 drivers/hwmon/occ/common.h             |  17 +
 drivers/hwmon/occ/p8_i2c.c             | 270 +++++++++
 drivers/hwmon/occ/p9.c                 | 350 ------------
 drivers/hwmon/occ/p9.h                 |  17 -
 drivers/hwmon/occ/p9_sbe.c             |  60 +-
 14 files changed, 1354 insertions(+), 422 deletions(-)
 create mode 100644 drivers/hwmon/occ/p8_i2c.c
 delete mode 100644 drivers/hwmon/occ/p9.c
 delete mode 100644 drivers/hwmon/occ/p9.h

-- 
1.8.3.1
