Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wfX2k02CXzDqJV
 for <openbmc@lists.ozlabs.org>; Sat,  3 Jun 2017 03:56:29 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v52HrtrM033266
 for <openbmc@lists.ozlabs.org>; Fri, 2 Jun 2017 13:56:27 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2au83sve8e-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 02 Jun 2017 13:56:27 -0400
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 2 Jun 2017 13:56:26 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 2 Jun 2017 13:56:24 -0400
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v52HuNZ853346354; Fri, 2 Jun 2017 17:56:23 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A3842803D;
 Fri,  2 Jun 2017 13:56:18 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id D4AA92803A;
 Fri,  2 Jun 2017 13:56:17 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, jk@ozlabs.org, bradleyb@fuzziesquirrel.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v4 0/2] drivers: fsi: Add OCC driver
Date: Fri,  2 Jun 2017 12:56:19 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17060217-0056-0000-0000-0000037B6AF7
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007160; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00869159; UDB=6.00432071; IPR=6.00649128; 
 BA=6.00005393; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015682; XFM=3.00000015;
 UTC=2017-06-02 17:56:25
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17060217-0057-0000-0000-000007B16D86
Message-Id: <1496426181-26205-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-02_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706020317
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
X-List-Received-Date: Fri, 02 Jun 2017 17:56:30 -0000

From: "Edward A. James" <eajames@us.ibm.com>

This patch series adds a driver to communicate with the POWER processor
On-Chip Controller (OCC), from a service processor. Communication is performed
via the SBEFIFO driver, which required a new in-kernel API.

An application to test the OCC driver can be found at
https://github.com/eddiejames/occtest

Changes since v3:
 * Add include file for occ driver.

Changes since v2:
 * Switch to use getSRAM/putSRAM over the SBE. This is significantly more
efficient and also circumvents the need to set up OCB channels manually.
 * Include the in-kernel API (for hwmon driver).
 * xfr struct embedded in client
 * add sequence number and checksum to command

Edward A. James (2):
  drivers: fsi: sbefifo: Add in-kernel API
  drivers: fsi: sbefifo: Add OCC driver

 drivers/fsi/Kconfig         |   6 +
 drivers/fsi/Makefile        |   1 +
 drivers/fsi/fsi-sbefifo.c   | 161 +++++++--
 drivers/fsi/occ.c           | 783 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/fsi-sbefifo.h |  30 ++
 include/linux/occ.h         |  27 ++
 6 files changed, 978 insertions(+), 30 deletions(-)
 create mode 100644 drivers/fsi/occ.c
 create mode 100644 include/linux/fsi-sbefifo.h
 create mode 100644 include/linux/occ.h

-- 
1.8.3.1
