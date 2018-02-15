Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="HcJ+3wJ9"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="IqLgDsqg"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zhwkm2zrZzF0lx
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 23:36:48 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 53F6020DC7;
 Thu, 15 Feb 2018 07:36:46 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 15 Feb 2018 07:36:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=t993+9qTIjj7Ut4S7
 VRo2hU9s/a0hdUmCfe49vXOZMk=; b=HcJ+3wJ9tp24jxjeWr/5C0R6XIluZKRgM
 b+l9+FRDqNve4/zNUUNztjHElhSgHt6FNdLE/ynpM/DDJFgmgAYdokyXO4g9L3gt
 cPoHq7phfWVoIz8g2PpET5BlZUrZmn72Na1axCDyt7Uzbfz7e/tXqF5XdVlq1sk+
 Nq9e1vp1zGqlreCBTVBYqqFfu382k80c0klBlYtpaMvgU7RdfX8P/qLUB30Rcti6
 4dzxGBxzw/dtIjZKBhSu2N+AoH8WApO85Lcx/UqysW/2XBcxQSuyY9y/c+qJZHVS
 mHz5eHIYSfwQVgWZ7wKYP0Gu5bGLlk/RTJAFV2WVTW1Ob7oVm+cRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=t993+9qTIjj7Ut4S7VRo2hU9s/a0hdUmCfe49vXOZMk=; b=IqLgDsqg
 AJNNP86PPASTIZVuaJM6ZfNWRqK68u7vdhOfh3D9TpOs45gp7AjsppEZY1b94Gai
 arTdvfFj1MpkiaF2ujp/Y9XFWGL5laCwdsnNkLQeU8oZyM1Yt8o72gUl7djzbld2
 0M2p2UHwGHKzhZkj6fOERet/DZRLzaZqJ3ePsBgLgd9xhRuha49d3+b/wpMxhmTD
 Y/1m8xmz1GlY3Zq4G8Ev6FFii2Xo3SDyRlbRykDW3EnjLlc6ZKqH05vmo7ENvmJX
 n0FPurfwc+3xFOKLlEno7vI0rc7E0jWEXbu6TUz/cgSfu1CdSa9700wa2HNhktKa
 lpQ/S2rgKUHQOA==
X-ME-Sender: <xms:3n6FWkX80hanwiYQGmmvFBpJMT5l3xCGWoo_37oCe9gBvBTEflvu8A>
Received: from dave.aj.id.au (ppp118-210-154-2.bras1.adl6.internode.on.net
 [118.210.154.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5C89C7E1DE;
 Thu, 15 Feb 2018 07:36:43 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au, jk@ozlabs.org, eajames@linux.vnet.ibm.com,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 05/16] fsi: sbefifo: don't delete canceled xfrs
 in write
Date: Thu, 15 Feb 2018 23:05:55 +1030
Message-Id: <20180215123606.25777-6-andrew@aj.id.au>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180215123606.25777-1-andrew@aj.id.au>
References: <20180215123606.25777-1-andrew@aj.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Feb 2018 12:36:49 -0000
X-List-Received-Date: Thu, 15 Feb 2018 12:36:49 -0000

From: Eddie James <eajames@linux.vnet.ibm.com>

The write function was deleting canceled transfers before they had a
change to run and complete. This results in not acking the EOT and not
reading the rest of the data left in the FIFO for the canceled transfer.
This is the cause of the EBADMSG errors found in the OCC driver, as the
next op reads the data left over.

Fix it by just checking the first entry of the list instead of
iterating and canceling.

Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
---
 drivers/fsi/fsi-sbefifo.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index e15cd10bad8c..5829e6aba9d3 100644
--- a/drivers/fsi/fsi-sbefifo.c
+++ b/drivers/fsi/fsi-sbefifo.c
@@ -709,7 +709,10 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
 	n = sbefifo_buf_nbwriteable(&client->wbuf);
 
 	spin_lock_irq(&sbefifo->lock);
-	xfr = sbefifo_next_xfr(sbefifo);	/* next xfr to be executed */
+ 
+	/* next xfr to be executed */
+	xfr = list_first_entry_or_null(&sbefifo->xfrs, struct sbefifo_xfr,
+				       xfrs);
 
 	if ((client->f_flags & O_NONBLOCK) && xfr && n < len) {
 		spin_unlock_irq(&sbefifo->lock);
-- 
2.14.1
