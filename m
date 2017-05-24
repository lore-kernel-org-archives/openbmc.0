Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wY1Nf1WSGzDqdM
 for <openbmc@lists.ozlabs.org>; Thu, 25 May 2017 04:37:53 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v4OITSpV000641
 for <openbmc@lists.ozlabs.org>; Wed, 24 May 2017 14:37:44 -0400
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2anfe58ey5-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 24 May 2017 14:37:43 -0400
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 24 May 2017 12:37:43 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 24 May 2017 12:37:41 -0600
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v4OIbeZp15401402; Wed, 24 May 2017 11:37:40 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B669DBE053;
 Wed, 24 May 2017 12:37:40 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP id 04BD0BE03A;
 Wed, 24 May 2017 12:37:39 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com, joel@jms.id.au,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v2 0/2] drivers: fsi: Add OCC driver
Date: Wed, 24 May 2017 13:37:33 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17052418-0028-0000-0000-000007A8D2B1
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007112; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00865073; UDB=6.00429505; IPR=6.00644853; 
 BA=6.00005372; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015568; XFM=3.00000015;
 UTC=2017-05-24 18:37:43
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17052418-0029-0000-0000-000035E6BB5E
Message-Id: <1495651055-30057-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-24_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705240088
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
X-List-Received-Date: Wed, 24 May 2017 18:37:54 -0000

From: "Edward A. James" <eajames@us.ibm.com>

This patch series adds a driver to communicate with the POWER processor
On-Chip Controller (OCC), from a service processor. Communication is performed
via the SBEFIFO driver, which required a new in-kernel API.

The patch series includes device-tree updates to instantiate devices for the
OCC driver from the SBEFIFO driver.

An application to test the OCC driver can be found at
https://github.com/eddiejames/occtest

Changes since v1:
 * Add sequencing and checksum calculation to the command buffer
 * Fix size check on response

Edward A. James (2):
  drivers: fsi: sbefifo: Add in-kernel API
  drivers: fsi: sbefifo: Add OCC driver

 drivers/fsi/Kconfig         |   9 +
 drivers/fsi/Makefile        |   1 +
 drivers/fsi/fsi-sbefifo.c   | 161 ++++++++---
 drivers/fsi/occ.c           | 640 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/fsi-sbefifo.h |  30 +++
 5 files changed, 811 insertions(+), 30 deletions(-)
 create mode 100644 drivers/fsi/occ.c
 create mode 100644 include/linux/fsi-sbefifo.h

-- 
1.8.3.1
