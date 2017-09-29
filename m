Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y3mkQ3VbFzDqR8
 for <openbmc@lists.ozlabs.org>; Sat, 30 Sep 2017 08:41:18 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v8TMdTCs033466
 for <openbmc@lists.ozlabs.org>; Fri, 29 Sep 2017 18:41:15 -0400
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2d9xefsq7h-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 29 Sep 2017 18:41:15 -0400
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 29 Sep 2017 16:41:14 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 29 Sep 2017 16:41:12 -0600
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v8TMfCgZ64487584; Fri, 29 Sep 2017 15:41:12 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1AB16A03B;
 Fri, 29 Sep 2017 16:41:11 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.85.183.77])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id 207986A03C;
 Fri, 29 Sep 2017 16:41:10 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v2 0/9] drivers: fsi: client fixes and refactor
Date: Fri, 29 Sep 2017 17:40:59 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17092922-0028-0000-0000-0000086EF17D
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007813; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000233; SDB=6.00924260; UDB=6.00464728; IPR=6.00704398; 
 BA=6.00005613; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017330; XFM=3.00000015;
 UTC=2017-09-29 22:41:13
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17092922-0029-0000-0000-000037C06460
Message-Id: <1506724868-13010-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-09-29_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1709290322
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
X-List-Received-Date: Fri, 29 Sep 2017 22:41:19 -0000

From: "Edward A. James" <eajames@us.ibm.com>

This series refactors the FSI client device drivers. It adds a number of fixes
discovered from bugs over the past several months. Most critically, it fixes
various race conditions in the unbind/remove pathway of the occ-hwmon, occ,
and sbefifo drivers.

Changes since v1:
 * split into multiple patches.
 * add memory management patch.

Edward A. James (9):
  drivers: fsi: SBEFIFO: General clean-up
  drivers: fsi: SBEFIFO: Fix probe() and remove()
  drivers: fsi: SBEFIFO: check for xfr complete in read wait_event
  drivers: fsi: occ: General clean-up
  drivers: fsi: occ: Poll while receiving "command in progress"
  drivers: fsi: occ: Add cancel to remove() and fix probe()
  drivers: fsi: occ: Fix client memory management
  drivers/hwmon/occ: Remove repeated ops for OCC command in progress
  drivers: hwmon: occ: Cancel occ operations in remove()

 drivers/fsi/fsi-sbefifo.c   | 321 +++++++++++++++++++++++-------------------
 drivers/fsi/occ.c           | 336 ++++++++++++++++++++++++++------------------
 drivers/hwmon/occ/p9_sbe.c  |  47 ++++---
 include/linux/fsi-sbefifo.h |   6 +-
 include/linux/occ.h         |  20 ++-
 5 files changed, 421 insertions(+), 309 deletions(-)

-- 
1.8.3.1
