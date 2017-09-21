Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xys9h07f4zDqjC
 for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2017 08:44:23 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v8LMiJmv064253
 for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2017 18:44:22 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2d4jnk4e1t-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2017 18:44:21 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 21 Sep 2017 18:44:04 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 21 Sep 2017 18:44:01 -0400
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v8LMi1WG53674128; Thu, 21 Sep 2017 22:44:01 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 812A828041;
 Thu, 21 Sep 2017 18:43:54 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id 230182803A;
 Thu, 21 Sep 2017 18:43:54 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 0/3] drivers/fsi: Fixup client remove functions
Date: Thu, 21 Sep 2017 17:43:55 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17092122-0024-0000-0000-000002D60936
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007775; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000231; SDB=6.00920429; UDB=6.00462502; IPR=6.00700651; 
 BA=6.00005601; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017240; XFM=3.00000015;
 UTC=2017-09-21 22:44:02
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17092122-0025-0000-0000-000045804180
Message-Id: <1506033838-2078-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-09-21_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1709210305
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
X-List-Received-Date: Thu, 21 Sep 2017 22:44:24 -0000

From: "Edward A. James" <eajames@us.ibm.com>

This series does some refactoring for the OCC and SBEFIFO drivers and improves
the remove() functions of both drivers. There was a definite possibility of
race conditions while removing the driver previously. This patch also gets the
drivers into the same state as what will be sent upstream, and what we'll move
to for 4.13.

Also a small change to the hwmon driver for compatibility with an addition to
the OCC driver for seeing "OCC command in progress."

Edward A. James (3):
  drivers/fsi/sbefifo: refactor to upstream list state
  drivers/fsi/occ: refactor to upstream list state
  drivers/hwmon/occ: Remove repeated ops for OCC command in progress

 drivers/fsi/fsi-sbefifo.c   | 329 ++++++++++++++++++++++++--------------------
 drivers/fsi/occ.c           | 227 ++++++++++++++++++------------
 drivers/hwmon/occ/p9_sbe.c  |  14 +-
 include/linux/fsi-sbefifo.h |   6 +-
 include/linux/occ.h         |  20 ++-
 5 files changed, 336 insertions(+), 260 deletions(-)

-- 
1.8.3.1
