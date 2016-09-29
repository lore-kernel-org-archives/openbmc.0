Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3skxzp0JHgzDsWf
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 11:38:29 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u8T1bhPr054483
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 21:38:27 -0400
Received: from e23smtp03.au.ibm.com (e23smtp03.au.ibm.com [202.81.31.145])
 by mx0b-001b2d01.pphosted.com with ESMTP id 25rrtrtbm4-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 21:38:27 -0400
Received: from localhost
 by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Thu, 29 Sep 2016 11:38:24 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 29 Sep 2016 11:38:22 +1000
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id D32842BB0054
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 11:38:21 +1000 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u8T1cLPj49807472
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 11:38:21 +1000
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u8T1cL6m032364
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 11:38:21 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u8T1cL3p032356; Thu, 29 Sep 2016 11:38:21 +1000
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id F0CD6A01B7;
 Thu, 29 Sep 2016 11:38:20 +1000 (AEST)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id B7863E3C36;
 Thu, 29 Sep 2016 11:38:20 +1000 (AEST)
Received: by gwshan (Postfix, from userid 1000)
 id AC6A9942E0A; Thu, 29 Sep 2016 11:38:51 +1000 (AEST)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH v2 4.7 0/8] NCSI Fixes
Date: Thu, 29 Sep 2016 11:38:43 +1000
X-Mailer: git-send-email 2.1.0
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16092901-0008-0000-0000-000000CA4F0B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16092901-0009-0000-0000-0000082CF61D
Message-Id: <1475113131-18048-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-09-28_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609020000
 definitions=main-1609290026
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
X-List-Received-Date: Thu, 29 Sep 2016 01:38:30 -0000


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
 net/ncsi/internal.h                      |  22 ++--
 net/ncsi/ncsi-aen.c                      |  19 ++--
 net/ncsi/ncsi-cmd.c                      |   2 +-
 net/ncsi/ncsi-manage.c                   | 166 ++++++++++++++++++-------------
 net/ncsi/ncsi-rsp.c                      |  17 +---
 7 files changed, 137 insertions(+), 96 deletions(-)

-- 
2.1.0
