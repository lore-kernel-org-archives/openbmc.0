Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7N4y14TtzDrH3
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 06:24:49 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v95JOjYA051563
 for <openbmc@lists.ozlabs.org>; Thu, 5 Oct 2017 15:24:47 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ddqq2b0ht-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Oct 2017 15:24:46 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 5 Oct 2017 13:24:29 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 5 Oct 2017 13:24:27 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v95JOR7Z9765178; Thu, 5 Oct 2017 12:24:27 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0EC82136043;
 Thu,  5 Oct 2017 13:24:27 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id C3D53136044;
 Thu,  5 Oct 2017 13:24:26 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v3 00/31] drivers: fsi: client fixes and
 refactor
Date: Thu,  5 Oct 2017 14:23:53 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17100519-0004-0000-0000-0000130560CF
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007847; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000235; SDB=6.00926924; UDB=6.00466363; IPR=6.00707179; 
 BA=6.00005623; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017410; XFM=3.00000015;
 UTC=2017-10-05 19:24:28
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17100519-0005-0000-0000-0000845C4774
Message-Id: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-05_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=59 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710050269
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Oct 2017 19:24:50 -0000

From: "Edward A. James" <eajames@us.ibm.com>

This series refactors the FSI client device drivers. It adds a number of fixes
discovered from bugs over the past several months. Most critically, it fixes
various race conditions in the unbind/remove pathway of the occ-hwmon, occ,
and sbefifo drivers.

Changes since v2:
 * split "General clean-up" patches into many more patches
 * Change to wake_up_all() in various places
 * Set sbe pointer NULL and add check in occ-hwmon. For race safety.

Changes since v1:
 * split into multiple patches.
 * add memory management patch.

Edward A. James (31):
  drivers: fsi: sbefifo: Fix includes
  drivers: fsi: sbefifo: Use a defined reschedule length
  drivers: fsi: sbefifo: Use __be32 for big endian values
  drivers: fsi: sbefifo: white space fixes
  drivers: fsi: sbefifo: replace awkward wait_event expression
  drivers: fsi: sbefifo: remove redundant function
  drivers: fsi: sbefifo: Use goto to reduce put statements
  drivers: fsi: sbefifo: Do an earlier get_client call
  drivers: fsi: sbefifo: Remove warning and user data access check
  drivers: fsi: sbefifo: destroy the ida list on exit
  drivers: fsi: sbefifo: Fix module authors and comments
  drivers: fsi: sbefifo: Fix include guards in header file
  drivers: fsi: SBEFIFO: Fix probe() and remove()
  drivers: fsi: SBEFIFO: check for xfr complete in read wait_event
  drivers: fsi: occ: Fix includes
  drivers: fsi: occ: Fix errant kfree calls
  drivers: fsi: occ: remove unused occ_command structure
  drivers: fsi: occ: Use big-endian values
  drivers: fsi: occ: Return ENODEV if client is NULL
  drivers: fsi: occ: Remove early user buffer checking
  drivers: fsi: occ: Switch to more logical errnos
  drivers: fsi: occ: fix white space and bracket problems
  drivers: fsi: occ: Destroy the ida list on exit
  drivers: fsi: occ: Remove unnecessary platform_set_drvdata call
  drivers: fsi: occ: Add comments for clarity
  drivers: fsi: occ: Add OCC response definitions to header
  drivers: fsi: occ: Poll while receiving "command in progress"
  drivers: fsi: occ: Add cancel to remove() and fix probe()
  drivers: fsi: occ: Fix client memory management
  drivers/hwmon/occ: Remove repeated ops for OCC command in progress
  drivers: hwmon: occ: Cancel occ operations in remove()

 drivers/fsi/fsi-sbefifo.c   | 311 ++++++++++++++++++++++------------------
 drivers/fsi/occ.c           | 340 ++++++++++++++++++++++++++------------------
 drivers/hwmon/occ/p9_sbe.c  |  47 +++---
 include/linux/fsi-sbefifo.h |   6 +-
 include/linux/occ.h         |  20 ++-
 5 files changed, 423 insertions(+), 301 deletions(-)

-- 
1.8.3.1
