Return-Path: <sam@mendozajonas.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=mendozajonas.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="SFOH/YWj"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="SkNWDPY2"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42r76W11RvzF3J9
 for <openbmc@lists.ozlabs.org>; Thu,  8 Nov 2018 13:49:38 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id AD31621EA7;
 Wed,  7 Nov 2018 21:49:36 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 07 Nov 2018 21:49:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 s=fm1; bh=NL+32wVtcjs7GiiFBDwt62Rxwd070G7nnndBlq1038g=; b=SFOH/
 YWjUECwbDqj4OV94YFs2giNmHhYndHjHlXdqiNq0/azwKBvdLTiUa6mTQW0Pq1xy
 MoA4CLdZ9mpAbpdinISqeB6lZoTp/aLetI3GCI3vaREG4xhvMNtfApygXcKNWZa8
 IyULMHSbqnz09xQyum6VyIzj3tjEwHym68SFVpo1V54b63vlNslxUvY+6/uE1rZe
 Pm1Gr4vwS/UIuzZRtDk3fNQoWDMrCVojJ2AacsT8S0/Yk1MKJROINyQyFE4/W+M7
 GJ5X0OJIt1It4mmQ3kqxIzlp4GWXEFlbVc1+97jZss3+C30ZBrwsMU9taEkGiqG6
 7Ii8IcZsSpB7shD2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=NL+32wVtcjs7GiiFBDwt62Rxwd070G7nnndBlq1038g=; b=SkNWDPY2
 tutQ5oFtTdQy8e0vnc/ot9fxbYc9NOKvZ+7kN2MRojqchAfCTJZJqHwc3uk2Bsrc
 eyIBPCU0yU/B/k7ZcNtX2JReuPznIw43puwHQYLJX1jjP9xHuarfn0kziPvlC9d+
 zRSd+zU0nlm9T6ZKLb+O62Cvn15T+BUJTOwIBrPQcc4QhzOV6s+ibAuk8i9S9hnB
 SOxcSoonD3JyJXYrNxIqNX1ZFh/bpQIch4lVOB23lMZDC6ynpoh0/9+w2CrTOGli
 AjFVfD+FGcTGD4jjBErWPhujIUR3t5idMMZUpTF5qlbfwaVrPXIzbS/mZBAsKKU4
 tnSgO6yqhEsvhQ==
X-ME-Sender: <xms:QKTjW2TB69c6qZFSK8VAn3OonX3Z9h2kNhL9Dv5cLl5GQKpZ_40zYA>
X-ME-Proxy: <xmx:QKTjW6-P1FyxqNuRXqwUkCLNSdmwvBTvC_dOI3YSiwv9OS1wwcPOUw>
 <xmx:QKTjW4NK2jAkXzRlJbZwmYbLnt3waTf-EDk5jmlHVoHwJt9MiEAr7Q>
 <xmx:QKTjWypfbdT2wtood15YcYMN13iwYS36GBLIe9AXeOKWdDE1xGhF-A>
 <xmx:QKTjW36OQKQvq68zThPeKD3-UPTMYpu5IRKpWbe719l8kK7wdEX7JQ>
 <xmx:QKTjWyEnKsBw8DCGgZy7JVNiB75liMKBctPMZ3ynZyKDon1_NuF1fg>
 <xmx:QKTjW6geV4GnQK_JGevUuB2USiSMkoqJTv09Qj-Yb2EuWzTr-XQNtw>
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id D9123103A3;
 Wed,  7 Nov 2018 21:49:33 -0500 (EST)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: netdev@vger.kernel.org
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 "David S . Miller" <davem@davemloft.net>, Justin.Lee1@Dell.com,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH net-next v3 1/6] net/ncsi: Don't enable all channels when HWA
 available
Date: Thu,  8 Nov 2018 13:49:04 +1100
Message-Id: <20181108024909.9897-2-sam@mendozajonas.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181108024909.9897-1-sam@mendozajonas.com>
References: <20181108024909.9897-1-sam@mendozajonas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Nov 2018 02:49:41 -0000

NCSI hardware arbitration allows multiple packages to be enabled at once
and share the same wiring. If the NCSI driver recognises that HWA is
available it unconditionally enables all packages and channels; but that
is a configuration decision rather than something required by HWA.
Additionally the current implementation will not failover on link events
which can cause connectivity to be lost unless the interface is manually
bounced.

Retain basic HWA support but remove the separate configuration path to
enable all channels, leaving this to be handled by a later
implementation.

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
---
 net/ncsi/ncsi-aen.c    |  3 +--
 net/ncsi/ncsi-manage.c | 50 ++++--------------------------------------
 2 files changed, 5 insertions(+), 48 deletions(-)

diff --git a/net/ncsi/ncsi-aen.c b/net/ncsi/ncsi-aen.c
index 25e483e8278b..65f47a648be3 100644
--- a/net/ncsi/ncsi-aen.c
+++ b/net/ncsi/ncsi-aen.c
@@ -86,8 +86,7 @@ static int ncsi_aen_handler_lsc(struct ncsi_dev_priv *ndp,
 	    !(state == NCSI_CHANNEL_ACTIVE && !(data & 0x1)))
 		return 0;
 
-	if (!(ndp->flags & NCSI_DEV_HWA) &&
-	    state == NCSI_CHANNEL_ACTIVE)
+	if (state == NCSI_CHANNEL_ACTIVE)
 		ndp->flags |= NCSI_DEV_RESHUFFLE;
 
 	ncsi_stop_channel_monitor(nc);
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index bfc43b28c7a6..d4e6e0f99097 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -113,10 +113,8 @@ static void ncsi_channel_monitor(struct timer_list *t)
 	default:
 		netdev_err(ndp->ndev.dev, "NCSI Channel %d timed out!\n",
 			   nc->id);
-		if (!(ndp->flags & NCSI_DEV_HWA)) {
-			ncsi_report_link(ndp, true);
-			ndp->flags |= NCSI_DEV_RESHUFFLE;
-		}
+		ncsi_report_link(ndp, true);
+		ndp->flags |= NCSI_DEV_RESHUFFLE;
 
 		ncsi_stop_channel_monitor(nc);
 
@@ -1050,35 +1048,6 @@ static bool ncsi_check_hwa(struct ncsi_dev_priv *ndp)
 	return false;
 }
 
-static int ncsi_enable_hwa(struct ncsi_dev_priv *ndp)
-{
-	struct ncsi_package *np;
-	struct ncsi_channel *nc;
-	unsigned long flags;
-
-	/* Move all available channels to processing queue */
-	spin_lock_irqsave(&ndp->lock, flags);
-	NCSI_FOR_EACH_PACKAGE(ndp, np) {
-		NCSI_FOR_EACH_CHANNEL(np, nc) {
-			WARN_ON_ONCE(nc->state != NCSI_CHANNEL_INACTIVE ||
-				     !list_empty(&nc->link));
-			ncsi_stop_channel_monitor(nc);
-			list_add_tail_rcu(&nc->link, &ndp->channel_queue);
-		}
-	}
-	spin_unlock_irqrestore(&ndp->lock, flags);
-
-	/* We can have no channels in extremely case */
-	if (list_empty(&ndp->channel_queue)) {
-		netdev_err(ndp->ndev.dev,
-			   "NCSI: No available channels for HWA\n");
-		ncsi_report_link(ndp, false);
-		return -ENOENT;
-	}
-
-	return ncsi_process_next_channel(ndp);
-}
-
 static void ncsi_probe_channel(struct ncsi_dev_priv *ndp)
 {
 	struct ncsi_dev *nd = &ndp->ndev;
@@ -1156,10 +1125,7 @@ static void ncsi_probe_channel(struct ncsi_dev_priv *ndp)
 		 */
 		if (!ndp->active_package) {
 			ndp->flags |= NCSI_DEV_PROBED;
-			if (ncsi_check_hwa(ndp))
-				ncsi_enable_hwa(ndp);
-			else
-				ncsi_choose_active_channel(ndp);
+			ncsi_choose_active_channel(ndp);
 			return;
 		}
 
@@ -1592,7 +1558,6 @@ EXPORT_SYMBOL_GPL(ncsi_register_dev);
 int ncsi_start_dev(struct ncsi_dev *nd)
 {
 	struct ncsi_dev_priv *ndp = TO_NCSI_DEV_PRIV(nd);
-	int ret;
 
 	if (nd->state != ncsi_dev_state_registered &&
 	    nd->state != ncsi_dev_state_functional)
@@ -1604,14 +1569,7 @@ int ncsi_start_dev(struct ncsi_dev *nd)
 		return 0;
 	}
 
-	if (ndp->flags & NCSI_DEV_HWA) {
-		netdev_info(ndp->ndev.dev, "NCSI: Enabling HWA mode\n");
-		ret = ncsi_enable_hwa(ndp);
-	} else {
-		ret = ncsi_choose_active_channel(ndp);
-	}
-
-	return ret;
+	return ncsi_choose_active_channel(ndp);
 }
 EXPORT_SYMBOL_GPL(ncsi_start_dev);
 
-- 
2.19.1
