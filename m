Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 133A01A15FF
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jan 2016 14:50:31 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1453434628484486.82309762782427;
 Thu, 21 Jan 2016 19:50:28 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyrilbur@gmail.com>
Subject: [PATCH linux 1/2] ncsi: Fix not releasing lock in ncsi_rcv_rsp()
Date: Thu, 21 Jan 2016 21:50:26 -0600
Message-Id: <1453434627-22282-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1453434627-22282-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1453434627-22282-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Fri, 22 Jan 2016 03:50:32 -0000

From: Cyril Bur <cyrilbur@gmail.com>

---
 net/ncsi/ncsi-rsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
index 32df105..295f0f8 100644
--- a/net/ncsi/ncsi-rsp.c
+++ b/net/ncsi/ncsi-rsp.c
@@ -1154,7 +1154,6 @@ int ncsi_rcv_rsp(struct sk_buff *skb, struct net_device *dev,
 
 	nr->nr_rsp = skb;
 	if (!nr->nr_timer_enabled) {
-		spin_unlock_irqrestore(&ndp->ndp_req_lock, flags);
 		ret = -ENOENT;
 		goto out;
 	}
@@ -1163,6 +1162,7 @@ int ncsi_rcv_rsp(struct sk_buff *skb, struct net_device *dev,
 	ret = nrh->nrh_handler(nr);
 
 out:
+	spin_unlock_irqrestore(&ndp->ndp_req_lock, flags);
 	ncsi_free_req(nr, true, false);
 	return ret;
 }
-- 
2.6.4
