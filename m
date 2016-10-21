Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0RpK05MDzDvYW
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:47:04 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u9L0i6da102755
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 20:47:02 -0400
Received: from e23smtp05.au.ibm.com (e23smtp05.au.ibm.com [202.81.31.147])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2675yfdnjh-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 20:47:01 -0400
Received: from localhost
 by e23smtp05.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Fri, 21 Oct 2016 10:46:59 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp05.au.ibm.com (202.81.31.211) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 21 Oct 2016 10:46:56 +1000
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id ADF462BB0054
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:46:55 +1100 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u9L0kt5o4850032
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:46:55 +1100
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u9L0ktbZ017834
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:46:55 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u9L0ktsJ017830; Fri, 21 Oct 2016 11:46:55 +1100
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id 0B98AA019B;
 Fri, 21 Oct 2016 11:46:55 +1100 (AEDT)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id F1572E3C5C;
 Fri, 21 Oct 2016 11:46:54 +1100 (AEDT)
Received: by gwshan (Postfix, from userid 1000)
 id CC61694212E; Fri, 21 Oct 2016 11:47:46 +1100 (AEDT)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH 4.4 0/9] net/ncsi: Backport fixes to dev-4.4
Date: Fri, 21 Oct 2016 11:47:37 +1100
X-Mailer: git-send-email 2.1.0
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16102100-0016-0000-0000-000001E15A56
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16102100-0017-0000-0000-000005AD50C0
Message-Id: <1477010866-15126-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-10-20_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=3
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1610210011
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
X-List-Received-Date: Fri, 21 Oct 2016 00:47:05 -0000

This backports patches that has been merged to upstream or Dave's
git repo (branch "net") that should arrive upstream shortly. The
first patch is exceptional because the changes included in it has
been in dev-4.7 and upstream from beginning.

Joel, please help merging it to dev-4.4 if the series looks sane
to you.

Gavin Shan (9):
  net/ncsi: Remove unused parameters for ncsi_free_req()
  net/ncsi: Introduce NCSI_RESERVED_CHANNEL
  net/ncsi: Don't probe on the reserved channel ID (0x1f)
  net/ncsi: Rework request index allocation
  net/ncsi: Allow to extend NCSI request properties
  net/ncsi: Avoid if statements in ncsi_suspend_dev()
  net/ncsi: Fix stale link state of inactive channels on failover
  net/ncsi: Choose hot channel as active one if necessary
  net/ncsi: Improve HNCDSC AEN handler

 net/ncsi/internal.h    |  12 +++-
 net/ncsi/ncsi-aen.c    |   6 +-
 net/ncsi/ncsi-cmd.c    |   6 +-
 net/ncsi/ncsi-manage.c | 182 +++++++++++++++++++++++++++++++++----------------
 net/ncsi/ncsi-rsp.c    |   2 +-
 5 files changed, 142 insertions(+), 66 deletions(-)

-- 
2.1.0
