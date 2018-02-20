Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="e/hviMkl"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="WSMitojT"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zlnSs3Tg9zF0cG
 for <openbmc@lists.ozlabs.org>; Tue, 20 Feb 2018 15:19:41 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 61CFA20BF9;
 Mon, 19 Feb 2018 23:19:39 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 19 Feb 2018 23:19:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=tmmSSCkUJfBtEyPdd
 1qEzyB64bS1p0NODE0nzyVK5Xw=; b=e/hviMkljanTU82lg6YTmhDQAfLeROT1n
 xYtfqpvBq+jOkY2Y4ypevybCGk7ltuvJ4xYWBJA5NRlAsDr6+kLNzmoud3BzNfEZ
 FgxatRAAqHWP8sYDElnrmlt69fjXkig85alD94N+RyAPkMPayTcSNi3TnBsu6igL
 cThFT6y4F0vuLPLd+evQKrR9L0CRrF5+OH1/Zl7bjR4LE9IkvcraUZCMlw3M5kxF
 s4HKJ8i+NcrLGIJqwYCZtrO1MS2wVFU6w38DAxdVvpVhDZWMehCERgSbTTiaHi0m
 BVqSE8aRRIiBmou5Zdcchb9bTTRawRblc6fJDBEkjUsBPbauoIgZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=tmmSSCkUJfBtEyPdd1qEzyB64bS1p0NODE0nzyVK5Xw=; b=WSMitojT
 5Fmm9WClzDPdjrtJ4SL8MEnlGE1NmiMJbyGaGY7WcQep7s0Dn0HgcyQHH9agt2iB
 CTDIetIKYDJrGNudr7EvTsq+IDo4eOdiR5L44OodBUVoTtaFiM3P3Ob1QaGyVA8T
 lZpc+m4ALZAequKnqnXsqXJZ48N1YC+UUJaNLS275XsPFPtU+t+OjVRfk/VEGC7Y
 hETuxRfojqoZ0QTvAfwFo+xDBvvTb08rhT1BT7ugrJqwcrXQqMsdtm1sN8fSbNrK
 LODhlbpnLaQJJWqk81wgquMqGzhKC3XVnPgug9eWvF5rqRv1flRdNZRp1R2hoYEx
 1oX8KtdFjvtEAQ==
X-ME-Sender: <xms:26GLWpHUZkAozH4FHNDiOcHfRq0K1cXfye2V0yWz0KcRuYYEqFD76Q>
Received: from dave.aj.id.au (ppp118-210-154-2.bras1.adl6.internode.on.net
 [118.210.154.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id F3D327E140;
 Mon, 19 Feb 2018 23:19:36 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au, jk@ozlabs.org, eajames@linux.vnet.ibm.com,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 07/16] fsi: sbefifo: don't delete canceled xfrs
 in write
Date: Tue, 20 Feb 2018 14:48:35 +1030
Message-Id: <20180220041844.13228-8-andrew@aj.id.au>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180220041844.13228-1-andrew@aj.id.au>
References: <20180220041844.13228-1-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 20 Feb 2018 04:19:41 -0000

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
index ef4a141dee2a..041704806ae4 100644
--- a/drivers/fsi/fsi-sbefifo.c
+++ b/drivers/fsi/fsi-sbefifo.c
@@ -707,7 +707,10 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
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
