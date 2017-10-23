Return-Path: <sam@mendozajonas.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="lOa+qSD1"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="kI7mjw/L"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yL5451FDczDqXj
 for <openbmc@lists.ozlabs.org>; Mon, 23 Oct 2017 16:46:13 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 3274420C8D
 for <openbmc@lists.ozlabs.org>; Mon, 23 Oct 2017 01:46:11 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute2.internal (MEProxy); Mon, 23 Oct 2017 01:46:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=date:from:in-reply-to:message-id:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Z69a8+
 QP2+yAWGxzg5cuMJl2VQ5i6/IIefAo7wUIIMc=; b=lOa+qSD1f2ttL1e5imPBaU
 nnWpaJ/XH158XE2VqvvqubLpB7ZCTR+33hqPKVR86z8idODBX5s8OsY1ZMeG+3kv
 gEtP1TA3xbdo9zrXgodOTFmKw/+GaHh3MiXb6imN73qkPCjHW0mIY/Ps4XgPR+l6
 ZyUwDFb16WTZflYhesYsCcI3J6A6WHPqX0i0PqbgdUw5Vulm0AjOPNACXYCB/HOH
 u7Cm95kVDseXXguowk0VyNWVjuoE4wVT+YoKsRe2vg+DFt7szFcbYlAmjgOQquHu
 q/WqT4nUjiZ/+KkVURLmvEjom2XuLC3koFhvog3R3GJLL08SnFg35YSYkUZiNZxg
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=Z69a8+QP2+yAWGxzg5cuMJl2VQ5i6/IIefAo7wUIIMc=; b=kI7mjw/L
 ApDMyp8kftn4uQ71OJ4M9q1sJfuPGADtvz26eslFbRTl70GAM0JBGJbs0LdQhsvx
 X9sZ8d84iZEj47QleVwcf0QNPadKqQTp9dn9FbBp0NQdZ5xMqW3FwGHJUXdsPIzJ
 aNAdonSSuOEiLseshvKD6fj/Ljbs9JnuzdwAVSpZ12X33fSfSG+KGvUqO8cB8gNS
 GRJYui/mv8Isa5i5M9ph/lUDMgiU3Shn0jVlU5IxUdARL36UuU/Wz9d56cB/5hmH
 YUum9gbpItI+ydvRqEcHmfWxIw/6HL3ZV5eAx/YEnJaKTh4nfU5rV5Q9ZhqSHIoT
 lHqqAb+IZ/qfUw==
X-ME-Sender: <xms:I4LtWXROulaUKfJawHOOxjG74cQ0AiPoAXhLy9hcQJG5lTauxBfaKg>
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4D55C7F919
 for <openbmc@lists.ozlabs.org>; Mon, 23 Oct 2017 01:46:10 -0400 (EDT)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 4/7] net/ncsi: Stop monitor if channel times out or is inactive
Date: Mon, 23 Oct 2017 16:45:54 +1100
Message-Id: <20171023054557.29013-5-sam@mendozajonas.com>
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
X-List-Received-Date: Mon, 23 Oct 2017 05:46:13 -0000

ncsi_channel_monitor() misses stopping the channel monitor in several
places that it should, causing a WARN_ON_ONCE() to trigger when the
monitor is re-started later, eg:

[  459.040000] WARNING: CPU: 0 PID: 1093 at net/ncsi/ncsi-manage.c:269 ncsi_start_channel_monitor+0x7c/0x90
[  459.040000] CPU: 0 PID: 1093 Comm: kworker/0:3 Not tainted 4.10.17-gaca2fdd #140
[  459.040000] Hardware name: ASpeed SoC
[  459.040000] Workqueue: events ncsi_dev_work
[  459.040000] [<80010094>] (unwind_backtrace) from [<8000d950>] (show_stack+0x20/0x24)
[  459.040000] [<8000d950>] (show_stack) from [<801dbf70>] (dump_stack+0x20/0x28)
[  459.040000] [<801dbf70>] (dump_stack) from [<80018d7c>] (__warn+0xe0/0x108)
[  459.040000] [<80018d7c>] (__warn) from [<80018e70>] (warn_slowpath_null+0x30/0x38)
[  459.040000] [<80018e70>] (warn_slowpath_null) from [<803f6a08>] (ncsi_start_channel_monitor+0x7c/0x90)
[  459.040000] [<803f6a08>] (ncsi_start_channel_monitor) from [<803f7664>] (ncsi_configure_channel+0xdc/0x5fc)
[  459.040000] [<803f7664>] (ncsi_configure_channel) from [<803f8160>] (ncsi_dev_work+0xac/0x474)
[  459.040000] [<803f8160>] (ncsi_dev_work) from [<8002d244>] (process_one_work+0x1e0/0x450)
[  459.040000] [<8002d244>] (process_one_work) from [<8002d510>] (worker_thread+0x5c/0x570)
[  459.040000] [<8002d510>] (worker_thread) from [<80033614>] (kthread+0x124/0x164)
[  459.040000] [<80033614>] (kthread) from [<8000a5e8>] (ret_from_fork+0x14/0x2c)

This also updates the monitor instead of just returning if
ncsi_xmit_cmd() fails to send the get-link-status command so that the
monitor properly times out.

Fixes: e6f44ed6d04d3 "net/ncsi: Package and channel management"

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
(cherry picked from commit 0795fb2021f07969949f523ea33c39785bfae9d6)
---
 net/ncsi/ncsi-manage.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 24bf3f100d48..5bef2cb5a825 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -199,11 +199,15 @@ static void ncsi_channel_monitor(unsigned long data)
 	monitor_state = nc->monitor.state;
 	spin_unlock_irqrestore(&nc->lock, flags);
 
-	if (!enabled || chained)
+	if (!enabled || chained) {
+		ncsi_stop_channel_monitor(nc);
 		return;
+	}
 	if (state != NCSI_CHANNEL_INACTIVE &&
-	    state != NCSI_CHANNEL_ACTIVE)
+	    state != NCSI_CHANNEL_ACTIVE) {
+		ncsi_stop_channel_monitor(nc);
 		return;
+	}
 
 	switch (monitor_state) {
 	case NCSI_CHANNEL_MONITOR_START:
@@ -214,12 +218,9 @@ static void ncsi_channel_monitor(unsigned long data)
 		nca.type = NCSI_PKT_CMD_GLS;
 		nca.req_flags = 0;
 		ret = ncsi_xmit_cmd(&nca);
-		if (ret) {
+		if (ret)
 			netdev_err(ndp->ndev.dev, "Error %d sending GLS\n",
 				   ret);
-			return;
-		}
-
 		break;
 	case NCSI_CHANNEL_MONITOR_WAIT ... NCSI_CHANNEL_MONITOR_WAIT_MAX:
 		break;
@@ -230,6 +231,8 @@ static void ncsi_channel_monitor(unsigned long data)
 			ndp->flags |= NCSI_DEV_RESHUFFLE;
 		}
 
+		ncsi_stop_channel_monitor(nc);
+
 		spin_lock_irqsave(&nc->lock, flags);
 		nc->state = NCSI_CHANNEL_INVISIBLE;
 		spin_unlock_irqrestore(&nc->lock, flags);
-- 
2.14.2
