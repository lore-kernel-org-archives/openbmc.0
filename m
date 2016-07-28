Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s0DCn4qnwzDrMP
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jul 2016 11:04:37 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u6S0sCnH003807
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jul 2016 21:04:35 -0400
Received: from e23smtp05.au.ibm.com (e23smtp05.au.ibm.com [202.81.31.147])
 by mx0a-001b2d01.pphosted.com with ESMTP id 24e27emcjj-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jul 2016 21:04:35 -0400
Received: from localhost
 by e23smtp05.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Thu, 28 Jul 2016 11:04:33 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp05.au.ibm.com (202.81.31.211) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 28 Jul 2016 11:04:25 +1000
X-IBM-Helo: d23dlp03.au.ibm.com
X-IBM-MailFrom: gwshan@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay08.au.ibm.com (d23relay08.au.ibm.com [9.185.71.33])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 18A553578053
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jul 2016 11:04:25 +1000 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u6S14PPh27721738
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jul 2016 11:04:25 +1000
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u6S14OUA009591
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jul 2016 11:04:24 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u6S14Obf009588; Thu, 28 Jul 2016 11:04:24 +1000
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id D2F01A01C3;
 Thu, 28 Jul 2016 11:04:23 +1000 (AEST)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id B842CE3BAA;
 Thu, 28 Jul 2016 11:04:23 +1000 (AEST)
Received: by gwshan (Postfix, from userid 1000)
 id 97210942C8C; Thu, 28 Jul 2016 11:04:23 +1000 (AEST)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH dev-4.7 1/2] net/faraday: Avoid PHYSTS_CHG interrupt
Date: Thu, 28 Jul 2016 11:04:21 +1000
X-Mailer: git-send-email 2.1.0
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16072801-0016-0000-0000-000001B75A4C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16072801-0017-0000-0000-000005183025
Message-Id: <1469667862-12601-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-07-27_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1607280009
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Jul 2016 01:04:38 -0000

Bit#11 in MACCR (0x50) designates the signal level for PHY link
status change. It's cleared, meaning high level enabled, by default.
However, we can see continuous interrupt (bit#6) in ISR (0x0) for it
and it's obviously a false alarm. The side effect is CPU cycles wasted
to process the false alarm.

This sets bit#11 in MACCR (0x50) to avoid the bogus interrupt.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
---
 drivers/net/ethernet/faraday/ftgmac100.c | 1 +
 drivers/net/ethernet/faraday/ftgmac100.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index e805c4d..f00911a 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -224,6 +224,7 @@ static void ftgmac100_init_hw(struct ftgmac100 *priv)
 				 FTGMAC100_MACCR_RXMAC_EN	| \
 				 FTGMAC100_MACCR_FULLDUP	| \
 				 FTGMAC100_MACCR_CRC_APD	| \
+				 FTGMAC100_MACCR_PHY_LINK_LEVEL | \
 				 FTGMAC100_MACCR_RX_RUNT	| \
 				 FTGMAC100_MACCR_RX_BROADPKT)
 
diff --git a/drivers/net/ethernet/faraday/ftgmac100.h b/drivers/net/ethernet/faraday/ftgmac100.h
index c258586..d07b6ea 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.h
+++ b/drivers/net/ethernet/faraday/ftgmac100.h
@@ -152,6 +152,7 @@
 #define FTGMAC100_MACCR_FULLDUP		(1 << 8)
 #define FTGMAC100_MACCR_GIGA_MODE	(1 << 9)
 #define FTGMAC100_MACCR_CRC_APD		(1 << 10)
+#define FTGMAC100_MACCR_PHY_LINK_LEVEL	(1 << 11)
 #define FTGMAC100_MACCR_RX_RUNT		(1 << 12)
 #define FTGMAC100_MACCR_JUMBO_LF	(1 << 13)
 #define FTGMAC100_MACCR_RX_ALL		(1 << 14)
-- 
2.1.0
