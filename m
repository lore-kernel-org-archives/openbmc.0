Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="LJyfH381"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="TJCnQ+V7"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zhwkk12TyzF0ng
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 23:36:45 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 12F4C20DB8;
 Thu, 15 Feb 2018 07:36:43 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 15 Feb 2018 07:36:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=T4TG1JBDKG3bRGuvP
 JzlGZxC8bw/ScWZ1DNQ2e8OGmo=; b=LJyfH381cAyajvNfkDL/MCmTbkchJqaZO
 eVMYafdPeM75UsPQhbnshT4JMCO/BqyLHzW+j+T/A1RaBFx673051dK1xpg7K87e
 FohggUBMK39PIRcbUWxQy1RDh4NhzKCii/C1V5tTu2Xczw1qlbHz5acLpp6vDQvJ
 Ek6ppto+ezs07O7XaZ1oYgnos5/33nHL78qoDHBkbCsifxb66Vevw8HSbL8Qhq7N
 L765yUP7sW6Npq8WcetxBaQPCRXIdkstIt6Bbnew3BBiSXBIA9vy74oQPiBwtdEV
 OUEh5Esj5F0rrQyG/W9baECl6vkqpH4EtSVm58ONF3kVjwDd5kduA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=T4TG1JBDKG3bRGuvPJzlGZxC8bw/ScWZ1DNQ2e8OGmo=; b=TJCnQ+V7
 fUoxC5q2KKwftYfDaMxrzV6JlYPAA6nxl1bAYeLrwvJNCl+t+9oFrRD/y71pDy5x
 3mh14/hFOiuc59rPHlGY9Zzzg+iXQBwUDEN087DzmVtGi6ndNLPj6n/szb2RpRSi
 lXk2pdh32fpewoPGvDTguCsWjZX9g3bRwo7rzXpWz5DbIAEba+2BEIgMSVkIq9m/
 KemXPM3hEDg4lhy1gsPZhMSFE1Ybb0BNMYZPMj0NbnxV0XCs7h6201LGsMdpkiTb
 ZziNhBiacdKBIp3lR7VglGXGF31URavtZzebL/GJcWlV0EpmhkL8QzDQoM71jXCg
 o8eGuzs/msa/8g==
X-ME-Sender: <xms:2n6FWmFhnuusDtYR2OA13o8fV9HAkkfQWpYEnPa_X9xT9DGuR139DA>
Received: from dave.aj.id.au (ppp118-210-154-2.bras1.adl6.internode.on.net
 [118.210.154.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4BDFD7E1DE;
 Thu, 15 Feb 2018 07:36:40 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au, jk@ozlabs.org, eajames@linux.vnet.ibm.com,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 04/16] fsi: occ: Add tracepoints
Date: Thu, 15 Feb 2018 23:05:54 +1030
Message-Id: <20180215123606.25777-5-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 15 Feb 2018 12:36:47 -0000
X-List-Received-Date: Thu, 15 Feb 2018 12:36:47 -0000

The OCC driver uses a workqueue to manage calls through to the SBEFIFO, which
in turn uses a timer callback to execute FIFO transfers. To ease observation of
end-to-end interactions e.g. from userspace `cat`ing an OCC hwmon attribute,
add tracing to book-end SBEFIFO transfers. This provides some perspective on
the time taken for a single OCC operation to take place.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/fsi/occ.c          |  9 +++++
 include/trace/events/occ.h | 86 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 95 insertions(+)
 create mode 100644 include/trace/events/occ.h

diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
index adc64f3fcd0a..2313b6235ba3 100644
--- a/drivers/fsi/occ.c
+++ b/drivers/fsi/occ.c
@@ -30,6 +30,9 @@
 #include <linux/wait.h>
 #include <linux/workqueue.h>
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/occ.h>
+
 #define OCC_SRAM_BYTES		4096
 #define OCC_CMD_DATA_BYTES	4090
 #define OCC_RESP_DATA_BYTES	4089
@@ -131,6 +134,8 @@ static int occ_enqueue_xfr(struct occ_xfr *xfr)
 
 	spin_unlock_irq(&occ->list_lock);
 
+	trace_occ_enq_xfer(client, xfr);
+
 	if (empty)
 		queue_work(occ_wq, &occ->work);
 
@@ -275,6 +280,7 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
 
 done:
 	spin_unlock_irq(&client->lock);
+	trace_occ_read_complete(client, xfr);
 	occ_put_client(client);
 	return rc;
 }
@@ -305,6 +311,7 @@ static ssize_t occ_write_common(struct occ_client *client,
 	occ_get_client(client);
 	xfr = &client->xfr;
 
+	trace_occ_write_begin(client, xfr);
 	spin_lock_irq(&client->lock);
 
 	if (test_bit(CLIENT_XFR_PENDING, &client->flags)) {
@@ -633,6 +640,7 @@ static void occ_worker(struct work_struct *work)
 	set_bit(XFR_IN_PROGRESS, &xfr->flags);
 
 	spin_unlock_irq(&occ->list_lock);
+	trace_occ_worker_xfer_begin(client, xfr);
 	mutex_lock(&occ->occ_lock);
 
 	start = jiffies;
@@ -695,6 +703,7 @@ static void occ_worker(struct work_struct *work)
 	spin_unlock_irq(&occ->list_lock);
 
 	wake_up_interruptible(&client->wait);
+	trace_occ_worker_xfer_complete(client, xfr);
 	occ_put_client(client);
 
 	if (!empty)
diff --git a/include/trace/events/occ.h b/include/trace/events/occ.h
new file mode 100644
index 000000000000..81395ca32ee0
--- /dev/null
+++ b/include/trace/events/occ.h
@@ -0,0 +1,86 @@
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM occ
+
+#if !defined(_TRACE_TIMER_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_OCC_H
+
+#include <linux/tracepoint.h>
+#include <linux/occ.h>
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
