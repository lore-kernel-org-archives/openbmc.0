Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from e23smtp07.au.ibm.com (e23smtp07.au.ibm.com [202.81.31.140])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r34zB71KhzDq5v
 for <openbmc@lists.ozlabs.org>; Mon,  9 May 2016 11:48:22 +1000 (AEST)
Received: from localhost
 by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Mon, 9 May 2016 11:48:22 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp07.au.ibm.com (202.81.31.204) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 9 May 2016 11:48:20 +1000
X-IBM-Helo: d23dlp01.au.ibm.com
X-IBM-MailFrom: gwshan@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 841AD2CE8054
 for <openbmc@lists.ozlabs.org>; Mon,  9 May 2016 11:48:19 +1000 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u491mBvr7340336
 for <openbmc@lists.ozlabs.org>; Mon, 9 May 2016 11:48:19 +1000
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u491llBK009416
 for <openbmc@lists.ozlabs.org>; Mon, 9 May 2016 11:47:47 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u491ll6w008702; Mon, 9 May 2016 11:47:47 +1000
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id 7BBB0A034A;
 Mon,  9 May 2016 11:47:21 +1000 (AEST)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id 7CF36E3A5A;
 Mon,  9 May 2016 11:47:21 +1000 (AEST)
Received: by gwshan (Postfix, from userid 1000)
 id 70220942B91; Mon,  9 May 2016 11:47:21 +1000 (AEST)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH 4/8] net/ncsi: Remove ncsi_stop_dev()
Date: Mon,  9 May 2016 11:47:15 +1000
Message-Id: <1462758439-27910-5-git-send-email-gwshan@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1462758439-27910-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1462758439-27910-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16050901-0025-0000-0000-000004985A12
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
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
X-List-Received-Date: Mon, 09 May 2016 01:48:23 -0000

This drops API ncsi_stop_dev() as it does nothing.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
---
 drivers/net/ethernet/faraday/ftgmac100.c | 6 ------
 include/net/ncsi.h                       | 6 ------
 net/ncsi/ncsi-manage.c                   | 5 -----
 3 files changed, 17 deletions(-)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index 2fcb7f9..87ddc97 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -1216,12 +1216,6 @@ static int ftgmac100_stop_dev(struct net_device *netdev)
 
 static int ftgmac100_stop(struct net_device *netdev)
 {
-	struct ftgmac100 *priv = netdev_priv(netdev);
-
-	/* Stop NCSI device */
-	if (priv->use_ncsi)
-		ncsi_stop_dev(priv->ndev);
-
 	return ftgmac100_stop_dev(netdev);
 }
 static int ftgmac100_hard_start_xmit(struct sk_buff *skb,
diff --git a/include/net/ncsi.h b/include/net/ncsi.h
index bf70b8d..fa50ab5 100644
--- a/include/net/ncsi.h
+++ b/include/net/ncsi.h
@@ -34,7 +34,6 @@ struct ncsi_dev *ncsi_register_dev(struct net_device *dev,
 				   void (*notifier)(struct ncsi_dev *nd));
 int ncsi_start_dev(struct ncsi_dev *nd);
 int ncsi_suspend_dev(struct ncsi_dev *nd);
-void ncsi_stop_dev(struct ncsi_dev *nd);
 void ncsi_unregister_dev(struct ncsi_dev *nd);
 #else /* !CONFIG_NET_NCSI */
 static inline struct ncsi_dev *ncsi_register_dev(struct net_device *dev,
@@ -53,11 +52,6 @@ static inline int ncsi_suspend_dev(struct ncsi_dev *nd)
 	return -ENOTTY;
 }
 
-static inline void ncsi_stop_dev(struct ncsi_dev *nd)
-{
-
-}
-
 void inline ncsi_unregister_dev(struct ncsi_dev *nd)
 {
 }
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index c32a919..05619f8 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -899,11 +899,6 @@ int ncsi_suspend_dev(struct ncsi_dev *nd)
 }
 EXPORT_SYMBOL_GPL(ncsi_suspend_dev);
 
-void ncsi_stop_dev(struct ncsi_dev *nd)
-{
-}
-EXPORT_SYMBOL_GPL(ncsi_stop_dev);
-
 void ncsi_unregister_dev(struct ncsi_dev *nd)
 {
 	struct ncsi_dev_priv *ndp = TO_NCSI_DEV_PRIV(nd);
-- 
2.1.0
