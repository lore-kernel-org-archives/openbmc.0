Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from e23smtp03.au.ibm.com (e23smtp03.au.ibm.com [202.81.31.145])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 0AA601A0341
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2016 13:51:10 +1100 (AEDT)
Received: from localhost
 by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Wed, 24 Feb 2016 12:51:07 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Wed, 24 Feb 2016 12:51:06 +1000
X-IBM-Helo: d23dlp03.au.ibm.com
X-IBM-MailFrom: gwshan@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 81AC93578052
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2016 13:51:05 +1100 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u1O2ovc01048994
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2016 13:51:05 +1100
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u1O2oWoE002053
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2016 13:50:32 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u1O2oWpf000898; Wed, 24 Feb 2016 13:50:32 +1100
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id 7796CA01B8;
 Wed, 24 Feb 2016 13:49:37 +1100 (AEDT)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id 69696E39CE;
 Wed, 24 Feb 2016 13:49:37 +1100 (AEDT)
Received: by gwshan (Postfix, from userid 1000)
 id 2BA2E941B5C; Wed, 24 Feb 2016 13:49:37 +1100 (AEDT)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, cyrilbur@gmail.com,
 Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH] net/ncsi: Fix race condition dropping response packet
Date: Wed, 24 Feb 2016 13:49:36 +1100
Message-Id: <1456282176-26532-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.1.0
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16022402-0009-0000-0000-0000030A7AC1
X-Mailman-Approved-At: Sat, 27 Feb 2016 03:54:26 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Feb 2016 02:51:10 -0000

The pair of NCSI command/response are associated with NCSI request.
There is one field in the struct (@nr_timer_enabled) that indicates
the timer associated with the NCSI request has been enabled. That
also implicitly indicates the NCSI request packet has been sent out
successfully. Any received NCSI responses that don't have the
accompanying NCSI request will be dropped. We could possibly run
into race condition in ncsi_xmit_cmd(): dev_queue_xmit() is called
to send the NCSI request packet, then we receive it's response
packet before nr->nr_timer_enabled is set to true. That leads to
the NCSI response packet is dropped and NCSI interface can't be
brought up successfully.

This fixes the issue by setting the flag (nr->nr_timer_enabled) to
true before ncsi_xmit_cmd() is called.

Reported-by: Cyril Bur <cyrilbur@gmail.com>
Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
Tested-by: Cyril Bur <cyrilbur@gmail.com>
---
 net/ncsi/ncsi-cmd.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
index b8503e1..8f75828 100644
--- a/net/ncsi/ncsi-cmd.c
+++ b/net/ncsi/ncsi-cmd.c
@@ -359,12 +359,6 @@ int ncsi_xmit_cmd(struct ncsi_cmd_arg *nca)
 		eh->h_source[i] = 0xff;
 	}
 
-	/* Send NCSI packet */
-	skb_get(nr->nr_cmd);
-	ret = dev_queue_xmit(nr->nr_cmd);
-	if (ret)
-		goto out;
-
 	/* Start the timer for the request that might not have
 	 * corresponding response. I'm not sure 1 second delay
 	 * here is enough. Anyway, NCSI is internal network, so
@@ -373,6 +367,13 @@ int ncsi_xmit_cmd(struct ncsi_cmd_arg *nca)
 	nr->nr_timer_enabled = true;
 	mod_timer(&nr->nr_timer, jiffies + 1 * HZ);
 
+
+	/* Send NCSI packet */
+	skb_get(nr->nr_cmd);
+	ret = dev_queue_xmit(nr->nr_cmd);
+	if (ret)
+		goto out;
+
 	return 0;
 out:
 	ncsi_free_req(nr, false, false);
-- 
2.1.0
