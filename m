Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vTzQJ3xBVzDqGl
 for <openbmc@lists.ozlabs.org>; Fri, 24 Feb 2017 15:58:32 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1O4s7qr001064
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 23:58:30 -0500
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28t0avujj1-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 23:58:30 -0500
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 23 Feb 2017 21:58:29 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 23 Feb 2017 21:58:26 -0700
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 17BF519D8026;
 Thu, 23 Feb 2017 21:57:38 -0700 (MST)
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1O4wQP89568640; Thu, 23 Feb 2017 21:58:26 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21BD413603C;
 Thu, 23 Feb 2017 21:58:26 -0700 (MST)
Received: from Christophers-MacBook-Pro.local.com (unknown [9.81.209.80])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 5915513603A;
 Thu, 23 Feb 2017 21:58:23 -0700 (MST)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 v4 0/2] Add FSI bus error recovery
Date: Thu, 23 Feb 2017 22:58:18 -0600
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17022404-0016-0000-0000-00000643BACA
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006672; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000204; SDB=6.00826291; UDB=6.00404677; IPR=6.00603743; 
 BA=6.00005168; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014420; XFM=3.00000011;
 UTC=2017-02-24 04:58:28
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17022404-0017-0000-0000-000037AD68D9
Message-Id: <20170224045820.1961-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-24_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702240050
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
X-List-Received-Date: Fri, 24 Feb 2017 04:58:32 -0000

On detect of FSI bus errors attempt to clean up the links by sending
a break to the slave, re-init slave ID, reset hub master bridge and
break to hub links if necessary.

Christopher Bostic (2):
  drivers/fsi: Move common read/write code into shared utility
  drivers/fsi: Cleanup and retry op on error

 drivers/fsi/fsi-core.c   | 225 ++---------------------------------------------
 drivers/fsi/fsi-master.h |  57 ------------
 2 files changed, 5 insertions(+), 277 deletions(-)

-- 
1.8.2.2
