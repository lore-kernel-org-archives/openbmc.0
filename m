Return-Path: <sam@mendozajonas.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=mendozajonas.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="QxQSxx/M"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="lakmQwXK"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42r76b4kFgzF3J6
 for <openbmc@lists.ozlabs.org>; Thu,  8 Nov 2018 13:49:43 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 70BFB2202C;
 Wed,  7 Nov 2018 21:49:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 07 Nov 2018 21:49:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 s=fm1; bh=7zGaLz7HQK8HBIwdkfhpaWhqIglc54Ism5j6RhMgnwA=; b=QxQSx
 x/M0F/oGSmglW3guJldinNiS/L6cZd5Ko8UZXQFxH2e4FmHJx0hXHMhizscGp4KA
 VpgoN1MzrXQIqJyCBN5qIlPNgduU6RnLZvsrImkLY+YvGAEdGzFF7HfORbXi5sVQ
 iUZcb6vQow+403EoPoTn7deL0pJTqrCQBEJVBEbrA1yeSgm8ui1vB+EY1mbJEj4F
 2wsCg+j1Ivi+bJIqpf1CbMI5aLEV5yRnYdE84rAgoDrUODb8KzbI6v0+Bg+S+Qx1
 Gti+BNEhCDW93FulX/oCQIRRJaX11YsA7KrnFe92+R8DiX0CeNAHAF95TlxlcJk5
 73PHb5wW/tXN+oHfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=7zGaLz7HQK8HBIwdkfhpaWhqIglc54Ism5j6RhMgnwA=; b=lakmQwXK
 1DhoVm2JQ0NKdouf1bwDe1gSg94CMApiFTk/9Ztk1bN3/EIgjvP0g7Le/YgxoGH3
 +/XozmBQIWfbzuY3QZs05DDyjV1Y7WfR6AjqCFeXLiOOcEVuSz03rlyNmyDYjCRZ
 T5+0noNgDowEyP+dLrWszOb6CegYE2i3Wfp7XNiwhzFpJYdGRQDPCvDI4oyEz9zZ
 aqQvtC/fKpwEigEd20xz8c+0oBMMrvongmEZmLkHViSi1dCYRHmIM76QcrB12Mf2
 Jx7KxXtvK3mFdx+OG1tjllr7Wx1eVFGL2be/EbqLZJQCOqH5huuqzq4SFMsVNPl+
 clJHqzUts1Q46Q==
X-ME-Sender: <xms:RaTjW670MO7YRe9bYqmvkHvv8gkkV2-XXiiGS69js7ghZRqkFmBneQ>
X-ME-Proxy: <xmx:RaTjW3OHcbYHNIHmjvStgVdIdhn4v25Al3aYL7j8tI2laF1rLTyk2w>
 <xmx:RaTjWyL0VHpOpoC96BcpkmFN_5bED5-R69_7ix2qI270AzFm2M7xXQ>
 <xmx:RaTjW4HHtBxjHdxpStzOkQi7u8uN6qe4LZlX2WxALKm2lCfP1nkQNQ>
 <xmx:RaTjW6RV6VYo2FDiKFSgqDLG54250HPQetFJ6cSAzna4nlFq32KpqQ>
 <xmx:RaTjW0G6Em3ywLfO4-pwG_iI-Pm9vG8Tnzqw6zoxodUHcTAsSWk_ag>
 <xmx:RaTjW_GAmbaIzafudy2DJKWREsIMtp1_78U98dIetOgWZMhy2db8jg>
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0F007102F2;
 Wed,  7 Nov 2018 21:49:38 -0500 (EST)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: netdev@vger.kernel.org
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 "David S . Miller" <davem@davemloft.net>, Justin.Lee1@Dell.com,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH net-next v3 3/6] net/ncsi: Don't deselect package in suspend
 if active
Date: Thu,  8 Nov 2018 13:49:06 +1100
Message-Id: <20181108024909.9897-4-sam@mendozajonas.com>
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
X-List-Received-Date: Thu, 08 Nov 2018 02:49:44 -0000

When a package is deselected all channels of that package cease
communication. If there are other channels active on the package of the
suspended channel this will disable them as well, so only send a
deselect-package command if no other channels are active.

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
---
 net/ncsi/ncsi-manage.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 02421d1a22c9..b8b4e765a04c 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -440,12 +440,14 @@ static void ncsi_request_timeout(struct timer_list *t)
 static void ncsi_suspend_channel(struct ncsi_dev_priv *ndp)
 {
 	struct ncsi_dev *nd = &ndp->ndev;
-	struct ncsi_package *np = ndp->active_package;
-	struct ncsi_channel *nc = ndp->active_channel;
+	struct ncsi_package *np;
+	struct ncsi_channel *nc, *tmp;
 	struct ncsi_cmd_arg nca;
 	unsigned long flags;
 	int ret;
 
+	np = ndp->active_package;
+	nc = ndp->active_channel;
 	nca.ndp = ndp;
 	nca.req_flags = NCSI_REQ_FLAG_EVENT_DRIVEN;
 	switch (nd->state) {
@@ -521,6 +523,15 @@ static void ncsi_suspend_channel(struct ncsi_dev_priv *ndp)
 		if (ret)
 			goto error;
 
+		NCSI_FOR_EACH_CHANNEL(np, tmp) {
+			/* If there is another channel active on this package
+			 * do not deselect the package.
+			 */
+			if (tmp != nc && tmp->state == NCSI_CHANNEL_ACTIVE) {
+				nd->state = ncsi_dev_state_suspend_done;
+				break;
+			}
+		}
 		break;
 	case ncsi_dev_state_suspend_deselect:
 		ndp->pending_req_num = 1;
-- 
2.19.1
