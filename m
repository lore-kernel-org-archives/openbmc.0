Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0PgG5jjMzDvY9
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 10:10:49 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u9KN9Guf143570
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 19:10:47 -0400
Received: from e23smtp03.au.ibm.com (e23smtp03.au.ibm.com [202.81.31.145])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2675yh311x-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 19:10:47 -0400
Received: from localhost
 by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Fri, 21 Oct 2016 09:10:44 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 21 Oct 2016 09:10:43 +1000
Received: from d23relay06.au.ibm.com (d23relay06.au.ibm.com [9.185.63.219])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id CC4FB2BB0045
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 10:10:42 +1100 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
 by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u9KNAgDT18022542
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 10:10:42 +1100
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u9KNAgNl015061
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 10:10:42 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u9KNAgI0015055; Fri, 21 Oct 2016 10:10:42 +1100
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id 03B4AA019B;
 Fri, 21 Oct 2016 10:10:42 +1100 (AEDT)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id EC14FE3C5C;
 Fri, 21 Oct 2016 10:10:41 +1100 (AEDT)
Received: by gwshan (Postfix, from userid 1000)
 id CD5A99417E9; Fri, 21 Oct 2016 10:11:33 +1100 (AEDT)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH 4.7 0/4] net/ncsi: Backport fixes from linux.net
Date: Fri, 21 Oct 2016 10:11:28 +1100
X-Mailer: git-send-email 2.1.0
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16102023-0008-0000-0000-000000D3527A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16102023-0009-0000-0000-000008512B94
Message-Id: <1477005092-20632-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-10-20_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1610200409
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
X-List-Received-Date: Thu, 20 Oct 2016 23:10:51 -0000

Those patches have been put into Dave's git repo (branch "net") and should
be merged to upstream shortly. This backports them to 4.7. Joel, please
help merging them if possible, thanks!

Gavin Shan (4):
  net/ncsi: Avoid if statements in ncsi_suspend_channel()
  net/ncsi: Fix stale link state of inactive channels on failover
  net/ncsi: Choose hot channel as active one if necessary
  net/ncsi: Improve HNCDSC AEN handler

 net/ncsi/internal.h    |   2 +
 net/ncsi/ncsi-aen.c    |  18 +++++--
 net/ncsi/ncsi-manage.c | 126 +++++++++++++++++++++++++++++++++++++------------
 3 files changed, 112 insertions(+), 34 deletions(-)

-- 
2.1.0
