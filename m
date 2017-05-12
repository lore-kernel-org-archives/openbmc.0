Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wPgJD5rTzzDqcm
 for <openbmc@lists.ozlabs.org>; Sat, 13 May 2017 05:38:36 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v4CJcWjA062370
 for <openbmc@lists.ozlabs.org>; Fri, 12 May 2017 15:38:32 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2adk6arbkm-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 12 May 2017 15:38:32 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 12 May 2017 13:38:26 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 12 May 2017 13:38:23 -0600
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v4CJcNRA8520148; Fri, 12 May 2017 12:38:23 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 44FEA6E03D;
 Fri, 12 May 2017 13:38:23 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP id DB03D6E035;
 Fri, 12 May 2017 13:38:22 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 0/3] drivers: fsi: Add OCC driver with SBEFIFO
 in-kernel API
Date: Fri, 12 May 2017 14:38:17 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17051219-0020-0000-0000-00000BEDFFB7
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007052; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000211; SDB=6.00859642; UDB=6.00426138; IPR=6.00639225; 
 BA=6.00005345; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015432; XFM=3.00000015;
 UTC=2017-05-12 19:38:24
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17051219-0021-0000-0000-00005C4BF5C9
Message-Id: <1494617900-32369-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-12_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705120367
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
X-List-Received-Date: Fri, 12 May 2017 19:38:37 -0000

From: "Edward A. James" <eajames@us.ibm.com>

This patch series adds a driver to communicate with the POWER processor
On-Chip Controller (OCC), from a service processor. Communication is performed
via the SBEFIFO driver, which required a new in-kernel API.

The patch series includes device-tree updates to instantiate devices for the
OCC driver from the SBEFIFO driver.

An application to test the OCC driver can be found at
https://github.com/eddiejames/occtest

Edward A. James (3):
  drivers: fsi: sbefifo: Add in-kernel API
  drivers: fsi: sbefifo: Add OCC driver
  dts: aspeed: witherspoon: Add FSI devices

 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts |  46 ++
 drivers/fsi/Kconfig                              |   9 +
 drivers/fsi/Makefile                             |   1 +
 drivers/fsi/fsi-sbefifo.c                        | 161 ++++--
 drivers/fsi/occ.c                                | 625 +++++++++++++++++++++++
 include/linux/fsi-sbefifo.h                      |  30 ++
 6 files changed, 842 insertions(+), 30 deletions(-)
 create mode 100644 drivers/fsi/occ.c
 create mode 100644 include/linux/fsi-sbefifo.h

-- 
1.8.3.1
