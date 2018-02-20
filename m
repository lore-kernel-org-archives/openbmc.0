Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="sEkaFgio"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="giY212PV"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zlnSg749wzF0WY
 for <openbmc@lists.ozlabs.org>; Tue, 20 Feb 2018 15:19:31 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0B07F20E45;
 Mon, 19 Feb 2018 23:19:30 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 19 Feb 2018 23:19:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=LaIMh2oIaxmGh5KlW
 pEvQf20zu8wnDZc/cuPL7brFpY=; b=sEkaFgioH+wEpJq9oGhtAYK+rvFWF4sNF
 O39YDJbCMAbDYkvNg0AI4r8jf6HpWcTK8JKj1yQuRQxw6qEwY4dPwlOw6IQdOFlM
 Xq8lrTIPfJdiiVfL+B0VE1XmoDJUIeYbH+Qc/c7xso90iPxg3YuD5HZF0O49yieF
 R/lNE4KS8HSiiZYVJauYXZwW/0hkBg0SWTXMnZ007IHCY/qs/KYJT1dFnLeVsULP
 ofF3z3I5xLHDOT1RnCmbb1JuXh3pThJo/UoTcDFiyK7jp7JKzg8mvwdX7S9E+4LX
 OrHEX88x+stWIXpmgXbsgIWZ4TuYDDTF85CNhNWBTm3QmfYEKCsIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=LaIMh2oIaxmGh5KlWpEvQf20zu8wnDZc/cuPL7brFpY=; b=giY212PV
 P1v5Q02v3IrYKLlrjpu+waQKtxY5NF+rKMURhjqmFUl0hEdPnKdlMCibo/bRJG++
 L6PxshyXM7+qJdfxmW8rS19zfsjmNtwRYyIN06MJ4YZQSNYaJff8PlDLkjC712FN
 w45QfZnVDk0141ZiG2vTgtOrRnLCFPwxvtwAX9zClVMHQ2SfhnVs00rl+un0S045
 r8qRujjSlM3pc23+gnBeRt+UGlwBVe186wUehBhz/i8SAhH1eDKTc97Vcbs8Hag1
 cR7hsTNsOorQGSWexQ7Qf6wh9yby263aJeRUMqZaHyX+QFUlaIAV3gIx4b52Br23
 H1o9zXLFeHpZFg==
X-ME-Sender: <xms:0aGLWtxFlOW2YTTD-ZQ4M_HD4y1xT1vhsVniVvg1NPAcZ81_g6wZ8Q>
Received: from dave.aj.id.au (ppp118-210-154-2.bras1.adl6.internode.on.net
 [118.210.154.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7C9927E0DF;
 Mon, 19 Feb 2018 23:19:27 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au, jk@ozlabs.org, eajames@linux.vnet.ibm.com,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 04/16] fsi: sbefifo: Add tracing of transfers
Date: Tue, 20 Feb 2018 14:48:32 +1030
Message-Id: <20180220041844.13228-5-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 20 Feb 2018 04:19:32 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/fsi/fsi-sbefifo.c      | 16 ++++++++
 include/trace/events/sbefifo.h | 93 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 109 insertions(+)
 create mode 100644 include/trace/events/sbefifo.h

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index 699de6b9a4eb..ef4a141dee2a 100644
--- a/drivers/fsi/fsi-sbefifo.c
+++ b/drivers/fsi/fsi-sbefifo.c
@@ -33,6 +33,9 @@
 #include <linux/uaccess.h>
 #include <linux/wait.h>
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/sbefifo.h>
+
 /*
  * The SBEFIFO is a pipe-like FSI device for communicating with
  * the self boot engine on POWER processors.
@@ -275,6 +278,8 @@ static struct sbefifo_xfr *sbefifo_enq_xfr(struct sbefifo_client *client)
 	if (!xfr)
 		return ERR_PTR(-ENOMEM);
 
+	trace_sbefifo_enq_xfer(client, xfr);
+
 	xfr->rbuf = &client->rbuf;
 	xfr->wbuf = &client->wbuf;
 	list_add_tail(&xfr->xfrs, &sbefifo->xfrs);
@@ -303,6 +308,8 @@ static struct sbefifo_client *sbefifo_new_client(struct sbefifo *sbefifo)
 	if (!client)
 		return NULL;
 
+	trace_sbefifo_new_client(client);
+
 	kref_init(&client->kref);
 	client->dev = sbefifo;
 	sbefifo_buf_init(&client->rbuf);
@@ -343,6 +350,7 @@ static void sbefifo_release_client(struct kref *kref)
 	}
 
 	sbefifo_put(sbefifo);
+	trace_sbefifo_release_client(client);
 	kfree(client);
 }
 
@@ -393,6 +401,8 @@ static void sbefifo_poll_timer(unsigned long data)
 	if (!xfr)
 		goto out_unlock;
 
+	trace_sbefifo_begin_xfer(xfr);
+
 	rbuf = xfr->rbuf;
 	wbuf = xfr->wbuf;
 
@@ -506,6 +516,8 @@ static void sbefifo_poll_timer(unsigned long data)
 	}
 
 out:
+	trace_sbefifo_end_xfer(xfr, ret);
+
 	if (unlikely(ret)) {
 		sbefifo->rc = ret;
 		dev_err(&sbefifo->fsi_dev->dev,
@@ -612,6 +624,10 @@ static ssize_t sbefifo_read_common(struct sbefifo_client *client,
 		goto out;
 	}
 
+	trace_sbefifo_deq_xfer(client, list_first_entry_or_null(&client->xfrs,
+							   struct sbefifo_xfr,
+							   client));
+
 	n = min_t(size_t, n, len);
 
 	if (ubuf) {
diff --git a/include/trace/events/sbefifo.h b/include/trace/events/sbefifo.h
new file mode 100644
index 000000000000..4755fcb23e56
--- /dev/null
+++ b/include/trace/events/sbefifo.h
@@ -0,0 +1,93 @@
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM sbefifo
+
+#if !defined(_TRACE_TIMER_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_SBEFIFO_H
+
+#include <linux/tracepoint.h>
+#include <linux/fsi-sbefifo.h>
+
+TRACE_EVENT(sbefifo_new_client,
+	TP_PROTO(const void *client),
+	TP_ARGS(client),
+	TP_STRUCT__entry(
+		__field(const void *, client)
+	),
+	TP_fast_assign(
+		__entry->client = client;
+	),
+	TP_printk("New client: %p", __entry->client)
+);
+
+TRACE_EVENT(sbefifo_release_client,
+	TP_PROTO(const void *client),
+	TP_ARGS(client),
+	TP_STRUCT__entry(
+		__field(const void *, client)
+	),
+	TP_fast_assign(
+		__entry->client = client;
+	),
+	TP_printk("Released client: %p", __entry->client)
+);
+
+TRACE_EVENT(sbefifo_enq_xfer,
+	TP_PROTO(const void *client, const void *xfer),
+	TP_ARGS(client, xfer),
+	TP_STRUCT__entry(
+		__field(const void *, client)
+		__field(const void *, xfer)
+	),
+	TP_fast_assign(
+		__entry->client = client;
+		__entry->xfer = xfer;
+	),
+	TP_printk("Client %p enqueued transfer %p",
+		  __entry->client, __entry->xfer)
+);
+
+TRACE_EVENT(sbefifo_begin_xfer,
+	TP_PROTO(const void *xfer),
+	TP_ARGS(xfer),
+	TP_STRUCT__entry(
+		__field(const void *, xfer)
+	),
+	TP_fast_assign(
+		__entry->xfer = xfer;
+	),
+	TP_printk("Began transfer %p",
+		  __entry->xfer)
+);
+
+TRACE_EVENT(sbefifo_end_xfer,
+	TP_PROTO(const void *xfer, int ret),
+	TP_ARGS(xfer, ret),
+	TP_STRUCT__entry(
+		__field(const void *, xfer)
+		__field(int, ret)
+	),
+	TP_fast_assign(
+		__entry->xfer = xfer;
+		__entry->ret = ret;
+	),
+	TP_printk("Completed transfer %p: %d",
+		  __entry->xfer, __entry->ret)
+);
+
+TRACE_EVENT(sbefifo_deq_xfer,
+	TP_PROTO(const void *client, const void *xfer),
+	TP_ARGS(client, xfer),
+	TP_STRUCT__entry(
+		__field(const void *, client)
+		__field(const void *, xfer)
+	),
+	TP_fast_assign(
+		__entry->client = client;
+		__entry->xfer = xfer;
+	),
+	TP_printk("Client %p dequeueing transfer %p",
+		  __entry->client, __entry->xfer)
+);
+#endif
+
+#include <trace/define_trace.h>
-- 
2.14.1
