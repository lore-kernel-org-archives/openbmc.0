Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="dsxMwy6E"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="nNNRmyOj"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zlnSp4f6ZzF0cS
 for <openbmc@lists.ozlabs.org>; Tue, 20 Feb 2018 15:19:38 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9307E20D52;
 Mon, 19 Feb 2018 23:19:36 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 19 Feb 2018 23:19:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=bn6GFAhd8IapXrgjO
 zUDKnLqZI/R38rDZLhdcCGqaeE=; b=dsxMwy6EAQIEUSRb4PxxUsJiOqdbFKJsR
 8fthQggFQjr7HkRKaPIyLNooMnbeZCEU8bbLJ2f5TkPz2Ii1HhW7Vk7o2jIEIHmM
 EzQqVopSmO85JGcWu4T2MyBLF7EeAxDNVzHJcogzu2SJFatzTqU9F+XIcffTnkJK
 F81AGoJcVU+uBCwGAGFHSmmXb1XUrZIkRNybg4MSOxozJJ0ipVRPB6gx/2HJPGmh
 qmBjiYsirLiiZ9ZuGoEjRNcWCvYOdEwq/WLL/kj0c6Yx2WXL1SP6gbmXVLS+Y704
 QAv6xosyo3IYfwD3dDRQ7OBbR7zRyhyBWnT8JsDZh29fT8SSHZtbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=bn6GFAhd8IapXrgjOzUDKnLqZI/R38rDZLhdcCGqaeE=; b=nNNRmyOj
 uy9LX2nCfBXN2jfY/CgmpyA3n0Q2nJwrcYvXlBhB0kUUHqH1NpoqiXZ0CM9EYoCV
 QIegozL3tbqMZ8wibqn/qC61Gh8N4X4Oa0pRM5skalIgMl2OZaGoRECRzQV9J5iJ
 /SP9S7QYXdwOkR+NSZJq4KJxv8x/H9xLFZ3eBVm2osCaYk4j1VyUcPahE40ALorY
 wcjGYKfCD8R0QwitUOgNkFr3r9kU/Q/BQVXbh4F66AM1wajuMCE+HE5xK4XgI58K
 nO0V/3H9pvhQrHiPyh2AiQkXrLdjPinnZoJgCLd74Fi4Gbeue0RRrEfaFoGAYIWM
 WHYgMUr1HsEYMQ==
X-ME-Sender: <xms:2KGLWsvYB-pRFMZg0p-D74H_7qJKyiQ_DKcOjBpGXtFls2u8PsIBCw>
Received: from dave.aj.id.au (ppp118-210-154-2.bras1.adl6.internode.on.net
 [118.210.154.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9CEA47E140;
 Mon, 19 Feb 2018 23:19:33 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au, jk@ozlabs.org, eajames@linux.vnet.ibm.com,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 06/16] fsi: occ: Add tracepoints
Date: Tue, 20 Feb 2018 14:48:34 +1030
Message-Id: <20180220041844.13228-7-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 20 Feb 2018 04:19:39 -0000

The OCC driver uses a workqueue to manage calls through to the SBEFIFO, which
in turn uses a timer callback to execute FIFO transfers. To ease observation of
end-to-end interactions e.g. from userspace `cat`ing an OCC hwmon attribute,
add tracing to book-end SBEFIFO transfers. This provides some perspective on
the time taken for a single OCC operation to take place.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/fsi/fsi-occ.c          |  9 +++++
 include/trace/events/fsi_occ.h | 86 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 95 insertions(+)
 create mode 100644 include/trace/events/fsi_occ.h

diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
index 171355023aec..7e47466d5f55 100644
--- a/drivers/fsi/fsi-occ.c
+++ b/drivers/fsi/fsi-occ.c
@@ -30,6 +30,9 @@
 #include <linux/wait.h>
 #include <linux/workqueue.h>
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/fsi_occ.h>
+
 #define OCC_SRAM_BYTES		4096
 #define OCC_CMD_DATA_BYTES	4090
 #define OCC_RESP_DATA_BYTES	4089
@@ -132,6 +135,8 @@ static int occ_enqueue_xfr(struct occ_xfr *xfr)
 
 	spin_unlock_irqrestore(&occ->list_lock, flags);
 
+	trace_occ_enq_xfer(client, xfr);
+
 	if (empty)
 		queue_work(occ_wq, &occ->work);
 
@@ -277,6 +282,7 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
 
 done:
 	spin_unlock_irqrestore(&client->lock, flags);
+	trace_occ_read_complete(client, xfr);
 	occ_put_client(client);
 	return rc;
 }
@@ -308,6 +314,7 @@ static ssize_t occ_write_common(struct occ_client *client,
 	occ_get_client(client);
 	xfr = &client->xfr;
 
+	trace_occ_write_begin(client, xfr);
 	spin_lock_irqsave(&client->lock, flags);
 
 	if (test_bit(CLIENT_XFR_PENDING, &client->flags)) {
@@ -638,6 +645,7 @@ static void occ_worker(struct work_struct *work)
 	set_bit(XFR_IN_PROGRESS, &xfr->flags);
 
 	spin_unlock_irqrestore(&occ->list_lock, flags);
+	trace_occ_worker_xfer_begin(client, xfr);
 	mutex_lock(&occ->occ_lock);
 
 	start = jiffies;
@@ -700,6 +708,7 @@ static void occ_worker(struct work_struct *work)
 	spin_unlock_irqrestore(&occ->list_lock, flags);
 
 	wake_up_interruptible(&client->wait);
+	trace_occ_worker_xfer_complete(client, xfr);
 	occ_put_client(client);
 
 	if (!empty)
diff --git a/include/trace/events/fsi_occ.h b/include/trace/events/fsi_occ.h
new file mode 100644
index 000000000000..89562436de86
--- /dev/null
+++ b/include/trace/events/fsi_occ.h
@@ -0,0 +1,86 @@
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM fsi_occ
+
+#if !defined(_TRACE_TIMER_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_OCC_H
+
+#include <linux/tracepoint.h>
+#include <linux/fsi-occ.h>
+
+TRACE_EVENT(occ_enq_xfer,
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
+	TP_printk("Client %p enqueued xfer %p", __entry->client, __entry->xfer)
+);
+
+TRACE_EVENT(occ_read_complete,
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
+	TP_printk("Client %p completed read for xfer %p",
+		__entry->client, __entry->xfer)
+);
+
+TRACE_EVENT(occ_write_begin,
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
+	TP_printk("Client %p began write for xfer %p",
+		__entry->client, __entry->xfer)
+);
+
+TRACE_EVENT(occ_worker_xfer_begin,
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
+	TP_printk("OCC worker began client %p xfer %p",
+		__entry->client, __entry->xfer)
+);
+
+TRACE_EVENT(occ_worker_xfer_complete,
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
+	TP_printk("OCC worker completed client %p xfer %p",
+		__entry->client, __entry->xfer)
+);
+
+#endif
+
+#include <trace/define_trace.h>
-- 
2.14.1
