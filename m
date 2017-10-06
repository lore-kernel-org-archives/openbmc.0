Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7Xzv22XlzDqhg
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 13:06:03 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9624pjW105691
 for <openbmc@lists.ozlabs.org>; Thu, 5 Oct 2017 22:06:00 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ddsap45e2-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Oct 2017 22:06:00 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 5 Oct 2017 20:05:59 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 5 Oct 2017 20:05:58 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9625wrp62849272; Thu, 5 Oct 2017 19:05:58 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 476D9C6037;
 Thu,  5 Oct 2017 20:05:58 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.85.157.182])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id 51734C603C;
 Thu,  5 Oct 2017 20:05:57 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v4 00/31] drivers: fsi: client fixes and
 refactor
Date: Thu,  5 Oct 2017 21:05:22 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17100602-0020-0000-0000-00000CCF29E6
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007847; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000235; SDB=6.00927057; UDB=6.00466443; IPR=6.00707311; 
 BA=6.00005623; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017415; XFM=3.00000015;
 UTC=2017-10-06 02:05:59
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17100602-0021-0000-0000-00005E670C94
Message-Id: <1507255553-13301-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-06_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=84 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710060029
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
X-List-Received-Date: Fri, 06 Oct 2017 02:06:03 -0000

From: "Edward A. James" <eajames@us.ibm.com>

This series refactors the FSI client device drivers. It adds a number of fixes
discovered from bugs over the past several months. Most critically, it fixes
various race conditions in the unbind/remove pathway of the occ-hwmon, occ,
and sbefifo drivers.

Apologies for spamming the list with so many patches...

Changes since v3:
 * switch checks for OCC client NULL to the common read/write/close functions.
 * add helper function for ugly wait_event_interruptible in OCC read().
 * removed useless check for cancel in occ open().

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

 drivers/fsi/fsi-sbefifo.c   | 311 +++++++++++++++++++++------------------
 drivers/fsi/occ.c           | 345 ++++++++++++++++++++++++++------------------
 drivers/hwmon/occ/p9_sbe.c  |  47 +++---
 include/linux/fsi-sbefifo.h |   6 +-
 include/linux/occ.h         |  20 ++-
 5 files changed, 426 insertions(+), 303 deletions(-)

-- 
1.8.3.1
