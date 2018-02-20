Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="dr80DTQ8"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="jVrjOwIm"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zlnSl1sNLzF0bT
 for <openbmc@lists.ozlabs.org>; Tue, 20 Feb 2018 15:19:35 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 49B8520BF9;
 Mon, 19 Feb 2018 23:19:33 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 19 Feb 2018 23:19:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=+NrUmj4g8Hx1h0row
 PZ1ReMZq4IOmsd6sXn3PvttsUY=; b=dr80DTQ86YcGAWniu27eV477axUZHs2wc
 8TjqIsqlpS/ZymjWSoPO/hxOvLMxZ2ToUtl+H4i3t/pkIVB6G3NviJDpzds3Wkmv
 skagwtMHQb58S04TYYMz7l7+3FGL1nfO2J3AShI05LXzetgzt2GG3YuWNIUwYVmm
 BudAHbsinx4tchAe6e0UrWIPPC3/QznadPlolmtDPw7YpD7fKRQxp1TOvwPyjBH6
 4C6UGZSoIhJitSZ6A2uGw30gbyYMuy2U666IDcqo9VxDoda2I1mA6xTaQNDi2cNj
 uO9G1ENFcGAnCTNhaziyduTuGE8T+BFdr4x8vIb1sFTWO320TFlkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=+NrUmj4g8Hx1h0rowPZ1ReMZq4IOmsd6sXn3PvttsUY=; b=jVrjOwIm
 qj7LPuFfFWNlKKV8r7V9Slype/Z/DeKkcoa7retBQ8Ncd/D911YnmmdWb8Mqqmtk
 vgH+vzaJBgTqDQAN4NLxh/MGOpdle9wDEUEfYVdjBiRMkW+KBzUbROJcc45G/Lv8
 nV7wwxUzqkLQAHBpEg2e8WBMVOMvasoT+iE/5fiVCH1eAdQn+0KZWm02t3q/i35T
 5jnjrAog5EDXp5haUYde7IFn8p9SC/SAKonnzHPVTpFXlzQaW0SaqdTd2LKlPbdb
 ioyPal5rRszKMlY8juhj7cznbFbSXyi/Qgq53dA/49E7kVW7gozb8rAFIMZmdCJM
 yKJOPuhsOlmqyw==
X-ME-Sender: <xms:1aGLWlIftl6F5vdAQn7I18xqtFbxFW-5w0g1WEyiszfpOBIg46gYuA>
Received: from dave.aj.id.au (ppp118-210-154-2.bras1.adl6.internode.on.net
 [118.210.154.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6E1A27E0DF;
 Mon, 19 Feb 2018 23:19:30 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au, jk@ozlabs.org, eajames@linux.vnet.ibm.com,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 05/16] fsi: gpio: Trace busy count
Date: Tue, 20 Feb 2018 14:48:33 +1030
Message-Id: <20180220041844.13228-6-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 20 Feb 2018 04:19:35 -0000

An observation from trace output of the existing FSI tracepoints was that the
remote device was sometimes reporting as busy. Add a new tracepoint reporting
the busy count in order to get a better grip on how often this is the case,

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/fsi/fsi-master-gpio.c          |  3 +++
 include/trace/events/fsi_master_gpio.h | 16 ++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 3f487449a277..2a49b167effe 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -401,6 +401,9 @@ static int poll_for_response(struct fsi_master_gpio *master,
 		break;
 	}
 
+	if (busy_count > 0)
+		trace_fsi_master_gpio_poll_response_busy(master, busy_count);
+
 	/* Clock the slave enough to be ready for next operation */
 	clock_zeros(master, FSI_GPIO_PRIME_SLAVE_CLOCKS);
 	return rc;
diff --git a/include/trace/events/fsi_master_gpio.h b/include/trace/events/fsi_master_gpio.h
index 11b36c119048..48e83e5755f4 100644
--- a/include/trace/events/fsi_master_gpio.h
+++ b/include/trace/events/fsi_master_gpio.h
@@ -63,6 +63,22 @@ TRACE_EVENT(fsi_master_gpio_break,
 	)
 );
 
+
+TRACE_EVENT(fsi_master_gpio_poll_response_busy,
+	TP_PROTO(const struct fsi_master_gpio *master, int busy),
+	TP_ARGS(master, busy),
+	TP_STRUCT__entry(
+		__field(int,	master_idx)
+		__field(int,	busy)
+	),
+	TP_fast_assign(
+		__entry->master_idx = master->master.idx;
+		__entry->busy = busy;
+	),
+	TP_printk("fsi-gpio%d: device reported busy %d times",
+		__entry->master_idx, __entry->busy)
+);
+
 #endif /* _TRACE_FSI_MASTER_GPIO_H */
 
 #include <trace/define_trace.h>
-- 
2.14.1
