Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y81mt1pCJzDqlT
 for <openbmc@lists.ozlabs.org>; Sat,  7 Oct 2017 07:43:09 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v96KfFNl064856
 for <openbmc@lists.ozlabs.org>; Fri, 6 Oct 2017 16:43:07 -0400
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2deecrfqpw-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 06 Oct 2017 16:43:07 -0400
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 6 Oct 2017 14:43:05 -0600
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 6 Oct 2017 14:43:03 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v96Kh3oU66191428; Fri, 6 Oct 2017 13:43:03 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E00E136044;
 Fri,  6 Oct 2017 14:43:03 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id E4A36136040;
 Fri,  6 Oct 2017 14:43:02 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 0/2] drivers: hwmon: occ: sysfs_notify and
 presence detect
Date: Fri,  6 Oct 2017 15:42:59 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17100620-0028-0000-0000-00000876F8C9
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007851; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000235; SDB=6.00927416; UDB=6.00466659; IPR=6.00707674; 
 BA=6.00005623; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017426; XFM=3.00000015;
 UTC=2017-10-06 20:43:04
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17100620-0029-0000-0000-000037D621EB
Message-Id: <1507322581-13947-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-06_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710060289
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
X-List-Received-Date: Fri, 06 Oct 2017 20:43:10 -0000

From: "Edward A. James" <eajames@us.ibm.com>

This patch set removes the error checking for the number of OCCs present.
Instead, export a new sysfs attribute to indicate the number of OCCs present
from the master poll response. In addition, add sysfs_notify both to the new
occs_present attribute and the throttling attributes.

Edward A. James (2):
  drivers: hwmon: occ: Add occs_present attribute
  drivers: hwmon: occ: Add sysfs_notify to throttling attributes

 drivers/hwmon/occ/common.c | 49 ++++++++++++++++++++++++++++++++++------------
 drivers/hwmon/occ/common.h |  3 ---
 drivers/hwmon/occ/p8_i2c.c |  4 ----
 drivers/hwmon/occ/p9_sbe.c |  4 ----
 4 files changed, 37 insertions(+), 23 deletions(-)

-- 
1.8.3.1
