Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="GwUf3I+V"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="W91SVP9k"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40krBB07BTzF2L8
 for <openbmc@lists.ozlabs.org>; Mon, 14 May 2018 16:18:58 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CD0AE20E24;
 Mon, 14 May 2018 02:18:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 14 May 2018 02:18:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=qXc95ej5YSF5YLrfz
 UKqG+MEAE5640B5nSmJ1Bs64lE=; b=GwUf3I+VKtIWhdcxeI79q7veU8OBxZWRQ
 iAEi+slAXel5u12GXIZuwTez8ns4c20kAtBFHYztUCrDF9KaUVujUA75O3mxw9dt
 hBK+rgdNP9QC0RYwxGi4pQc0dT8Qw3lHCvfF0bYbIGi4IUtt/KTHtYxTkhjuszVQ
 7xnXivZcshaD9pYYIiAmMx5Qi5mCnUl+K76+BrO7qYiZWOqB78Em0+Hn5g4TI5xs
 jjfERoUriraot5k1EY3gbdOFVcD2eAaBrJ+N/Bd3LQ4Sk4oX1sTkbxbaVQIsnzYt
 ImQdUJp4bAzPaMjwtREpd73E3KC4cbyYQM4cd3OWPFf3C1u/XQ4mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=qXc95ej5YSF5YLrfzUKqG+MEAE5640B5nSmJ1Bs64lE=; b=W91SVP9k
 IskRxcmpRqdHNTFrl3ZX7bf8xOxGJpkd1NwCtRO2takOXCtObbAd+AvAL4B1PKd5
 1K91W9KD35s2kG9ztG4U3U+PqawwadU9xWfJF5ByOvt3ObmXmv8sr+M5J44JoBuL
 Yk63uuHf8waoD7C9P1adD115qzwqTrioF1a5oF3wQ4rG/rnn7Z5xhnlrRW4dAgYM
 Rk2sbS55al0Z7NwmMUjEFnjcRQZKxohZOSYtxXZHw+gT9NHkqmnatK6n3xBNVygH
 1GEyrFFmRnyBC9GZv1EVZDlWrPLQhWXRYEE9NonGcQu3+fdL3r2RC7EAAwOMbnN1
 yH5pXNM/FB756g==
X-ME-Sender: <xms:Tyr5WqLchOGFj7FdrpmABAel4jUVs0VILc3o-jARhb-XQCeiIBkLcQ>
Received: from dave.aj.id.au (ppp118-210-26-60.bras1.adl4.internode.on.net
 [118.210.26.60])
 by mail.messagingengine.com (Postfix) with ESMTPA id 94BE210260;
 Mon, 14 May 2018 02:18:53 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, eajames.ibm@gmail.com,
 benh@kernel.crashing.org, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 2/2] fsi: sbefifo: Return 0 on read() to
 indicate end of response
Date: Mon, 14 May 2018 15:48:09 +0930
Message-Id: <20180514061809.11487-3-andrew@aj.id.au>
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
X-List-Received-Date: Mon, 14 May 2018 06:18:58 -0000

Previously the driver would return EAGAIN for a read() subsequent to
last byte being read. This makes it difficult to userspace to read
messages out of the pipe without knowing the size of the response ahead
of time, which is actually impossible given the design of the hardware.

The justification for moving the SBEFIFO_XFR_COMPLETE test is as
follows:

1. Assume that the transfer has completed from the hardware perspective,
   that is, we've acknowledged the EOT flag and set SBEFIFO_XFR_COMPLETE,
   but the client (caller) has not completely read out the response data

2. The client calls through sbefifo_read_common() and hits
   wait_event_interruptible(), which calls through sbefifo_read_ready()
   to judge the state of the transfer

3. sbefifo_read_ready() reports the number of words available and tests
   for SBEFIFO_XFR_COMPLETE. Given the assumed state above this will
   cause wait_event_interruptible() to return immediately

4. The appropriate copy is performed dependent on the client and the
   relative buffer sizes

5. If the destination buffer is smaller than the remaining transfer data
   then sbefifo_buf_readnb() will return false by its ring-buffer index
   calculations, the transfer will remain the current transfer, and we
   repeat from step 2.

6. If the destination buffer is equal to or larger than the remaining
   transfer data then sbefifo_buf_readnb() will return true indicating
   the transfer has been completely drained.

7. Assuming we take 6, we go around again, repeating steps 2 and 3,
   however sbefifo_read_read() will report 0 this time around, which
   triggers the removal of the transfer from the client and transfers
   list, and returns 0 to the caller.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/fsi/fsi-sbefifo.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index afb5ff48aa3b..6f0e3f6c53d5 100644
--- a/drivers/fsi/fsi-sbefifo.c
+++ b/drivers/fsi/fsi-sbefifo.c
@@ -640,9 +640,6 @@ static ssize_t sbefifo_read_common(struct sbefifo_client *client,
 		if (sbefifo_xfr_test(client, SBEFIFO_XFR_WRITE_DONE))
 			return -EAGAIN;
 
-		if (sbefifo_xfr_test(client, SBEFIFO_XFR_COMPLETE))
-			return -EAGAIN;
-
 		if (sbefifo_xfr_test(client, SBEFIFO_XFR_CANCEL))
 			return -EAGAIN;
 	}
@@ -666,6 +663,23 @@ static ssize_t sbefifo_read_common(struct sbefifo_client *client,
 
 	n = min_t(size_t, n, len);
 
+	/* Check if we've performed the final read */
+	if (sbefifo_xfr_test(client, SBEFIFO_XFR_COMPLETE) && !n) {
+		xfr = list_first_entry_or_null(&client->xfrs,
+					       struct sbefifo_xfr, client);
+		if (!xfr) {
+			/* should be impossible to not have an xfr here */
+			WARN_ONCE(1, "no xfr in queue");
+			ret = -EPROTO;
+			goto out;
+		}
+
+		list_del(&xfr->client);
+		kfree(xfr);
+		wake_up_interruptible(&sbefifo->wait);
+		return 0;
+	}
+
 	if (ubuf) {
 		if (copy_to_user(ubuf, READ_ONCE(client->rbuf.rpos), n)) {
 			ret = -EFAULT;
@@ -690,10 +704,6 @@ static ssize_t sbefifo_read_common(struct sbefifo_client *client,
 			sbefifo_get(sbefifo);
 			if (!queue_work(sbefifo_wq, &sbefifo->work.work))
 				sbefifo_put(sbefifo);
-		} else {
-			list_del(&xfr->client);
-			kfree(xfr);
-			wake_up_interruptible(&sbefifo->wait);
 		}
 	}
 
-- 
2.17.0
