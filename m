Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="pho81jlR"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="eXLtiMex"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40krB74d4pzF2Kj
 for <openbmc@lists.ozlabs.org>; Mon, 14 May 2018 16:18:55 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3C14F20A41;
 Mon, 14 May 2018 02:18:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 14 May 2018 02:18:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=7HBqqCuYwYh+QGMZF
 RxOA4m3sqUTuxHjXlHOZ13GMOI=; b=pho81jlRfcsNiMEHmAMcAayYBDHXOH+Ae
 +zMtLAY366X/YHqW3hGcnWGNQ6a543TDKmmE1uAt5e/ZHJtOljXa6mY92pwY6LfN
 IG47Xu5xzEImQHJrqivypcyqRlFIE2pMo6QCQ5Ui7cHwChc9S2H3dxZytX7F6C2s
 dzX0I2q0VBGc1mNI9CHDTRrIK0Iv01GnvsyemK7sJMGxsyWDbIwSgq2M+8bSzJjc
 +U+mmR6TrcX2q5khA//T92J6nvpWtz0+ISASkQm7cwPOT7poZWre4Ywuco4R+Vfp
 eZygsk6dHkzjQCq6ifqGAsRC2VLYEvoZWA0el4EP6wuyXJeFnxWcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=7HBqqCuYwYh+QGMZFRxOA4m3sqUTuxHjXlHOZ13GMOI=; b=eXLtiMex
 UOgNK2OvOjUIqdUhMC7M9NdjbAy0GY/S4M9itNUNevTNlth/pfIxGoe6iebHFJEs
 YYT+GWvYuyGYmFFbr4W9QTdZhWcCI4BZRJA3miDCzM4t5XxAxJJh5G5AeA7cDK+l
 h2T2AweiDJcWrusS8hPna9aGwl7QYEdpQdnvIdkaX9IoUJj9Leif2WwplnRzlYw7
 6jgTdwS8bOfr4QHhXe1nnWJjTYAPoVlYpcO/ZKat40u3yEiHCqTxm+GM8rWQWSJh
 DhTRG9VpdR6wjYuYNztT3ZchIHmszkeL6Lz12POSFCkvaEpRsyG03bzDxQq1HqSP
 /s0bMmgm47rpzA==
X-ME-Sender: <xms:TSr5WnlzkIf34x3e7G4IrVCQ50XmCn2ynqXJlplCXraLavK1XvPtZQ>
Received: from dave.aj.id.au (ppp118-210-26-60.bras1.adl4.internode.on.net
 [118.210.26.60])
 by mail.messagingengine.com (Postfix) with ESMTPA id D4FE610260;
 Mon, 14 May 2018 02:18:50 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, eajames.ibm@gmail.com,
 benh@kernel.crashing.org, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 1/2] fsi: sbefifo: Unpack
 !sbefifo_xfr_rsp_pending(client) test
Date: Mon, 14 May 2018 15:48:08 +0930
Message-Id: <20180514061809.11487-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180514061809.11487-1-andrew@aj.id.au>
References: <20180514061809.11487-1-andrew@aj.id.au>
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
X-List-Received-Date: Mon, 14 May 2018 06:18:56 -0000

Currently a read() on a non-blocking SBEFIFO file-descriptor will return
EAGAIN despite the entire response having been read out of the device on
a prior read. This is broken if userspace performs partial reads due to
undersizing its destination buffer relative to the (unknowable) response
size.

This change doesn't fix the bug, rather lays the ground-work for the fix
by reworking the EAGAIN handling in sbefifo_read_common().

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/fsi/fsi-sbefifo.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index cc9b9e36ac72..afb5ff48aa3b 100644
--- a/drivers/fsi/fsi-sbefifo.c
+++ b/drivers/fsi/fsi-sbefifo.c
@@ -89,6 +89,7 @@ struct sbefifo_xfr {
 	struct list_head client;
 	struct list_head xfrs;
 	unsigned long flags;
+#define SBEFIFO_XFR_INIT		0
 #define SBEFIFO_XFR_WRITE_DONE		1
 #define SBEFIFO_XFR_RESP_PENDING	2
 #define SBEFIFO_XFR_COMPLETE		3
@@ -292,16 +293,21 @@ static struct sbefifo_xfr *sbefifo_enq_xfr(struct sbefifo_client *client)
 	return xfr;
 }
 
-static bool sbefifo_xfr_rsp_pending(struct sbefifo_client *client)
+static bool sbefifo_xfr_test(struct sbefifo_client *client, uint8_t idx)
 {
 	struct sbefifo_xfr *xfr = list_first_entry_or_null(&client->xfrs,
 							   struct sbefifo_xfr,
 							   client);
 
-	if (xfr && test_bit(SBEFIFO_XFR_RESP_PENDING, &xfr->flags))
-		return true;
+	if (!xfr)
+		return false;
 
-	return false;
+	/* No flags set indicates no action has been attempted on the xfr */
+	if (!idx)
+		return !xfr->flags;
+
+	/* Otherwise some bit will have been set, so test it */
+	return test_bit(idx, &xfr->flags);
 }
 
 static struct sbefifo_client *sbefifo_new_client(struct sbefifo *sbefifo)
@@ -626,8 +632,20 @@ static ssize_t sbefifo_read_common(struct sbefifo_client *client,
 	if ((len >> 2) << 2 != len)
 		return -EINVAL;
 
-	if ((client->f_flags & O_NONBLOCK) && !sbefifo_xfr_rsp_pending(client))
-		return -EAGAIN;
+	if (client->f_flags & O_NONBLOCK) {
+		/* Performing a read before completing a write */
+		if (sbefifo_xfr_test(client, SBEFIFO_XFR_INIT))
+			return -EAGAIN;
+
+		if (sbefifo_xfr_test(client, SBEFIFO_XFR_WRITE_DONE))
+			return -EAGAIN;
+
+		if (sbefifo_xfr_test(client, SBEFIFO_XFR_COMPLETE))
+			return -EAGAIN;
+
+		if (sbefifo_xfr_test(client, SBEFIFO_XFR_CANCEL))
+			return -EAGAIN;
+	}
 
 	sbefifo_get_client(client);
 	if (wait_event_interruptible(sbefifo->wait,
-- 
2.17.0
