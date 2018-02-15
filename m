Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ijUnms9I"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="m0JMu2L1"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zhwkd0VLSzF0ZK
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 23:36:38 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D863620D96;
 Thu, 15 Feb 2018 07:36:36 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 15 Feb 2018 07:36:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=+le2qUtFVnfFxnF2m
 wrpOuGuow8g42cOjs+z4eKGZyY=; b=ijUnms9IUPMl0Ra+mWCtUwYXT7GaY4IlF
 t4IDgiZX0Dnx8VR2uwLtWCnDzA4ih+3bZWz0bhdDJM42pwtg1TDsUoIBw8RkhdIA
 6tQmDdj2TXXYEjQ1qJa4tTrLbOIt7VzC3uUkCQ68/DYeEx06fozhTI32HxPFHfW+
 4EstFA9iMKu0trpKM969zDddWQMPxvhU3zIdgyfBEB0Evy54TSfwflzCM1Dj7V7a
 3g+z+EvZzrPfWYMkoTcWxWjw1Qq+n741tTieFvL9FjWX/wV0fv6WPL99K77LhupH
 9sD4z7CSxUausz//Ygkp8Ae9T/Gg7vh1fBkgmcsWu2UowXSXKI2MQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=+le2qUtFVnfFxnF2mwrpOuGuow8g42cOjs+z4eKGZyY=; b=m0JMu2L1
 wadQDEIVDFSM5QlCJ2lX42EwZH+vRCB2I3hMmXlkECN7kG1uBUWbPhg9RCfGavg8
 bgnIgSS+bgxOiKaZ8NYf73eCbTAMWhmT/2Pp/RY7WdCLBUF0ERshmylqMbOjTZQH
 FDDC1aoC8lLIQvjgxFS6i70npXcYf8e5OcBUqxZ1OUYUGFcVFDe6waVxIm9pahXq
 iHJ1Ch2ikUWSzl893s5++KjsupopxOiOliPYiCfQ/Ht+cVls39Vb+7t+e7ol5RZ1
 jNJiHrDhKUZOM1rvmnzRBt51RH7etiKp0GfTLgqylEXGUB/lvqEA860/Z+VS/PHO
 X5IqsPlExt4hMA==
X-ME-Sender: <xms:1H6FWpUjAS3BzcSUzDRRZ6uVbxVTobKKUOcu_3s3RSjdxAlKxGYXUg>
Received: from dave.aj.id.au (ppp118-210-154-2.bras1.adl6.internode.on.net
 [118.210.154.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id E9EA57E542;
 Thu, 15 Feb 2018 07:36:33 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au, jk@ozlabs.org, eajames@linux.vnet.ibm.com,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 02/16] fsi: sbefifo: Add tracing of transfers
Date: Thu, 15 Feb 2018 23:05:52 +1030
Message-Id: <20180215123606.25777-3-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 15 Feb 2018 12:36:41 -0000
X-List-Received-Date: Thu, 15 Feb 2018 12:36:41 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/fsi/fsi-sbefifo.c      | 16 ++++++++
 include/trace/events/sbefifo.h | 93 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 109 insertions(+)
 create mode 100644 include/trace/events/sbefifo.h

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index 4ac9e188e683..e15cd10bad8c 100644
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
