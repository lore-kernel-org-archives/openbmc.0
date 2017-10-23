Return-Path: <sam@mendozajonas.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="jVb7sy/F"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="YXpfTjQd"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yL5473pcfzDqXj
 for <openbmc@lists.ozlabs.org>; Mon, 23 Oct 2017 16:46:15 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 8612320A7C
 for <openbmc@lists.ozlabs.org>; Mon, 23 Oct 2017 01:46:13 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute2.internal (MEProxy); Mon, 23 Oct 2017 01:46:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=date:from:in-reply-to:message-id:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=sk9pR2
 vXUzYWxV1wapgAqjkUU0wTWJihjLblvwz37Uw=; b=jVb7sy/FQ7jPYofcNshT3s
 og13F6pmvhfFsXL3XtlM9y9MLAo69EBudRibEsYW5XRacQ/1aVwehN2mSDd6wc45
 7JyHFgKFM6q0D2Vd8IgozSOUK4NaBiya8C60eWCN1z3sLF8Z1MIeCrDZY7WZC6mV
 gSJZbPaO33dJTbY5v2rs63VVObhJzKII6WlOTnIKv9jWuq8Cotv2y4i9OpSzaRXn
 00aUlzqduQAvAIMvWtKM0tLPaFEt+12woptmOTnMalWrWowDa1PacYMoG0iYcUxB
 Z/TrcMTWb0BNmC+vmpCgu0TzVUnWDCtrt9E4Z1BK92dpqUkrKsMwZkbmgKlmCgGA
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=sk9pR2vXUzYWxV1wapgAqjkUU0wTWJihjLblvwz37Uw=; b=YXpfTjQd
 bpNNo3tx59yCZczWrY5KcbBsLJy9+1cBhS9r+b1BxzOyWUYp6iOuPfJhLjKjJH9+
 s2tGpgbEeXOc0jW1eNIIeimzsl/7TkhltfuyciXKJC+HoLzsJjASkOVMmaqfSQ6n
 w/wG4xfzQkQ+csPKcqzq/9wO8JDZXl2AtQZ0jePvKo0MVFT28u866X8yDKTORb16
 LB2Qm5SebKz0xEvJBshnBmvMjBvpASJvTxC6rMv+SkTc0SR6UsGWo+DlrJk9aqrv
 v/NGZ4F7CGR+o2KjG5t0Ni72MJWj2DXrEraEmQsPUAwcM4TrtK/l6S+miG4/OSxR
 d9cquhE5+MeNdw==
X-ME-Sender: <xms:JYLtWRXQ7xOw_QLVZQfj7EsqYv65pye8Sq-rTerjA9rdx5JWN5BWEg>
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9FC1A7F91E
 for <openbmc@lists.ozlabs.org>; Mon, 23 Oct 2017 01:46:12 -0400 (EDT)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 6/7] net/ncsi: Enforce failover on link monitor timeout
Date: Mon, 23 Oct 2017 16:45:56 +1100
Message-Id: <20171023054557.29013-7-sam@mendozajonas.com>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171023054557.29013-1-sam@mendozajonas.com>
References: <20171023054557.29013-1-sam@mendozajonas.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Oct 2017 05:46:16 -0000

From: Gavin Shan <gwshan@linux.vnet.ibm.com>

The NCSI channel has been configured to provide service if its link
monitor timer is enabled, regardless of its state (inactive or active).
So the timeout event on the link monitor indicates the out-of-service
on that channel, for which a failover is needed.

This sets NCSI_DEV_RESHUFFLE flag to enforce failover on link monitor
timeout, regardless the channel's original state (inactive or active).
Also, the link is put into "down" state to give the failing channel
lowest priority when selecting for the active channel. The state of
failing channel should be set to active in order for deinitialization
and failover to be done.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
(cherry picked from commit 52b4c8627f9f0d882e969967a207a27a80c9c753)
---
 net/ncsi/ncsi-manage.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 8a589e611225..8cae2f233272 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -186,6 +186,7 @@ static void ncsi_channel_monitor(unsigned long data)
 	struct ncsi_channel *nc = (struct ncsi_channel *)data;
 	struct ncsi_package *np = nc->package;
 	struct ncsi_dev_priv *ndp = np->ndp;
+	struct ncsi_channel_mode *ncm;
 	struct ncsi_cmd_arg nca;
 	bool enabled, chained;
 	unsigned int monitor_state;
@@ -225,20 +226,21 @@ static void ncsi_channel_monitor(unsigned long data)
 	case NCSI_CHANNEL_MONITOR_WAIT ... NCSI_CHANNEL_MONITOR_WAIT_MAX:
 		break;
 	default:
-		if (!(ndp->flags & NCSI_DEV_HWA) &&
-		    state == NCSI_CHANNEL_ACTIVE) {
+		if (!(ndp->flags & NCSI_DEV_HWA)) {
 			ncsi_report_link(ndp, true);
 			ndp->flags |= NCSI_DEV_RESHUFFLE;
 		}
 
 		ncsi_stop_channel_monitor(nc);
 
+		ncm = &nc->modes[NCSI_MODE_LINK];
 		spin_lock_irqsave(&nc->lock, flags);
 		nc->state = NCSI_CHANNEL_INVISIBLE;
+		ncm->data[2] &= ~0x1;
 		spin_unlock_irqrestore(&nc->lock, flags);
 
 		spin_lock_irqsave(&ndp->lock, flags);
-		nc->state = NCSI_CHANNEL_INACTIVE;
+		nc->state = NCSI_CHANNEL_ACTIVE;
 		list_add_tail_rcu(&nc->link, &ndp->channel_queue);
 		spin_unlock_irqrestore(&ndp->lock, flags);
 		ncsi_process_next_channel(ndp);
-- 
2.14.2
