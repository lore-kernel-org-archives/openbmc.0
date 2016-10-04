Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3spGkV1DChzDrLT
 for <openbmc@lists.ozlabs.org>; Tue,  4 Oct 2016 22:23:30 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u94BNBiW122573
 for <openbmc@lists.ozlabs.org>; Tue, 4 Oct 2016 07:23:28 -0400
Received: from e28smtp07.in.ibm.com (e28smtp07.in.ibm.com [125.16.236.7])
 by mx0a-001b2d01.pphosted.com with ESMTP id 25v7fje15x-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 04 Oct 2016 07:23:27 -0400
Received: from localhost
 by e28smtp07.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Tue, 4 Oct 2016 16:53:24 +0530
Received: from d28dlp01.in.ibm.com (9.184.220.126)
 by e28smtp07.in.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 4 Oct 2016 16:53:22 +0530
Received: from d28relay09.in.ibm.com (d28relay09.in.ibm.com [9.184.220.160])
 by d28dlp01.in.ibm.com (Postfix) with ESMTP id A01D5E0024
 for <openbmc@lists.ozlabs.org>; Tue,  4 Oct 2016 16:52:54 +0530 (IST)
Received: from d28av07.in.ibm.com (d28av07.in.ibm.com [9.184.220.146])
 by d28relay09.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u94BNLWe29098076
 for <openbmc@lists.ozlabs.org>; Tue, 4 Oct 2016 16:53:21 +0530
Received: from d28av07.in.ibm.com (localhost [127.0.0.1])
 by d28av07.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u94BNJAd008953
 for <openbmc@lists.ozlabs.org>; Tue, 4 Oct 2016 16:53:20 +0530
Received: from gwshan ([9.192.182.193])
 by d28av07.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 u94BNHTj008870; Tue, 4 Oct 2016 16:53:17 +0530
Received: by gwshan (Postfix, from userid 1000)
 id 26231943193; Tue,  4 Oct 2016 22:23:29 +1100 (AEDT)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH v3 4.7 0/8] NCSI Improvement and Fixes
Date: Tue,  4 Oct 2016 22:23:18 +1100
X-Mailer: git-send-email 2.1.0
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16100411-0052-0000-0000-000003150A78
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16100411-0053-0000-0000-00000F12A1E5
Message-Id: <1475580206-27370-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-10-04_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1610040200
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
X-List-Received-Date: Tue, 04 Oct 2016 11:23:30 -0000

The changes included in this series has been merged to linux.net
("next" branch). It's expected to be upstream shortly.

Joel, It's applied to 4.7 branch only. I will backport some of
the fixes to 4.4 and post them together with some fixes specific
to 4.4 later.

Gavin Shan (8):
  net/ncsi: Avoid unused-value build warning from ia64-linux-gcc
  net/ncsi: Introduce NCSI_RESERVED_CHANNEL
  net/ncsi: Don't probe on the reserved channel ID (0x1f)
  net/ncsi: Rework request index allocation
  net/ncsi: Allow to extend NCSI request properties
  net/ncsi: Rework the channel monitoring
  net/ncsi: Introduce ncsi_stop_dev()
  net/faraday: Stop NCSI device on shutdown

 drivers/net/ethernet/faraday/ftgmac100.c |   2 +
 include/net/ncsi.h                       |   5 +
 net/ncsi/internal.h                      |  22 +++-
 net/ncsi/ncsi-aen.c                      |  37 ++++--
 net/ncsi/ncsi-cmd.c                      |   2 +-
 net/ncsi/ncsi-manage.c                   | 198 ++++++++++++++++++++-----------
 net/ncsi/ncsi-rsp.c                      |   4 +-
 7 files changed, 180 insertions(+), 90 deletions(-)

-- 
2.1.0
