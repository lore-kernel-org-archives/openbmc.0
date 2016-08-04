Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s4WWS1h35zDqCZ
 for <openbmc@lists.ozlabs.org>; Thu,  4 Aug 2016 10:48:02 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u740iFqV145317
 for <openbmc@lists.ozlabs.org>; Wed, 3 Aug 2016 20:47:59 -0400
Received: from e23smtp03.au.ibm.com (e23smtp03.au.ibm.com [202.81.31.145])
 by mx0a-001b2d01.pphosted.com with ESMTP id 24kkaja3p8-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 03 Aug 2016 20:47:59 -0400
Received: from localhost
 by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Thu, 4 Aug 2016 10:47:56 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 4 Aug 2016 10:47:52 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: gwshan@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay06.au.ibm.com (d23relay06.au.ibm.com [9.185.63.219])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id 24B822BB0054
 for <openbmc@lists.ozlabs.org>; Thu,  4 Aug 2016 10:47:52 +1000 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u740lq7S29622312
 for <openbmc@lists.ozlabs.org>; Thu, 4 Aug 2016 10:47:52 +1000
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u740lpQA014314
 for <openbmc@lists.ozlabs.org>; Thu, 4 Aug 2016 10:47:51 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u740lpNE014310; Thu, 4 Aug 2016 10:47:51 +1000
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id CC598A01EE;
 Thu,  4 Aug 2016 10:47:50 +1000 (AEST)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id 8B35FE3BB7;
 Thu,  4 Aug 2016 10:47:50 +1000 (AEST)
Received: by gwshan (Postfix, from userid 1000)
 id 67103941D65; Thu,  4 Aug 2016 10:47:50 +1000 (AEST)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH dev-4.4] net/ncsi: Enable request timer before sending command
Date: Thu,  4 Aug 2016 10:47:49 +1000
X-Mailer: git-send-email 2.1.0
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16080400-0008-0000-0000-000000ACC2A1
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16080400-0009-0000-0000-000007C85542
Message-Id: <1470271669-20662-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-08-03_17:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=3
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1608040007
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
X-List-Received-Date: Thu, 04 Aug 2016 00:48:04 -0000

The response is received upon the sent command before the request's
timer is enabled under extreme situation. The response packet won't
be processed as the corresponding request (request packet and timer)
isn't complete. It leads to NCSI failure - no package detected.

This fixes the issue by enabling the timer before sending the command.
The comments about the timer has been replaced by that in upstream
kernel.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
---
The issue exists in all branches. 4.7 has the issue at least. I
suggest applying it to all other branches or 4.7 only.
---
 net/ncsi/ncsi-cmd.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
index b8503e1..d634a0e 100644
--- a/net/ncsi/ncsi-cmd.c
+++ b/net/ncsi/ncsi-cmd.c
@@ -359,20 +359,19 @@ int ncsi_xmit_cmd(struct ncsi_cmd_arg *nca)
 		eh->h_source[i] = 0xff;
 	}
 
+        /* Start the timer for the request that might not have
+         * corresponding response. Given NCSI is an internal
+         * connection a 1 second delay should be sufficient.
+         */
+	mod_timer(&nr->nr_timer, jiffies + 1 * HZ);
+	nr->nr_timer_enabled = true;
+
 	/* Send NCSI packet */
 	skb_get(nr->nr_cmd);
 	ret = dev_queue_xmit(nr->nr_cmd);
 	if (ret)
 		goto out;
 
-	/* Start the timer for the request that might not have
-	 * corresponding response. I'm not sure 1 second delay
-	 * here is enough. Anyway, NCSI is internal network, so
-	 * the responsiveness should be as fast as enough.
-	 */
-	nr->nr_timer_enabled = true;
-	mod_timer(&nr->nr_timer, jiffies + 1 * HZ);
-
 	return 0;
 out:
 	ncsi_free_req(nr, false, false);
-- 
2.1.0
