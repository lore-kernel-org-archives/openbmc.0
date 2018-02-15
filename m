Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="KOZ8RU3A"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="AsKbCY3b"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zhwkf16zXzDqBf
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 23:36:41 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id EFBCB20DB2;
 Thu, 15 Feb 2018 07:36:39 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 15 Feb 2018 07:36:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=qivFTcyAeukiKvM6k
 +19tmY22MUu/OnDZEoiWX1XYyE=; b=KOZ8RU3AKpkdMYqyhx3M2c5fZ7cJPu9r9
 Ut/ZeQjvos6elNqnKURC9q6kVw+X3PZgerBypqA+tsN3ZLcKAkd46VsJ6pqE/uK5
 QKqrbFsMrfKWbEtwfu+mPU+yjEDpIbNFixJOcJUUd/X64pXKijQCoLdzpFEsoHeJ
 LhalqwzRFvKEiqqsRsSH9XB+T5D/rkyu4n3YAN+/7A4zT++jXJZWeaBEm/8tLcNN
 KVuXqG3JsuZEjgW1JPt7Lzoaq9zRjwuXX+BOqcydqjzWgtBG8HApfsRv1N1IhjfU
 fwl8ZoaeIa3TdG7mI7ngUU0lVdVyWa7aIxI7ywrCMbuQO4YXyR4aA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=qivFTcyAeukiKvM6k+19tmY22MUu/OnDZEoiWX1XYyE=; b=AsKbCY3b
 TyOpPq8xLP4U36jb2S8K0ISxUsXD0I1XGJewCeEqofaePqOC5WKIff99g+xfLO6k
 y4Er5HkmCG8C/0H0c5z+X185obGhsgbWAauTQN7+7nuB5BOF8t++RKiK7AXGs7Hk
 6/l34pxDJWQq22DQSx42XQZCZbD/2F9T57C+K/7k59TtovzeMTpurkSGMg/IZizd
 Id6M3TwwpbScint7h57jvmkQ5R6CLxDIcfmqvX8Zmn2HSOrtp6yMDXl8FSBuxdHl
 1S5/Y/TZ52Erm1W7KCuANDXbK4VzEHt/wjZPOjKF4iUbuR/E1AQCkfe1O7uZWeXo
 5GcEvi0mwMMtSA==
X-ME-Sender: <xms:136FWsgxNHs7PgueDtZHaxwb5QdwAR3sizg-qIC-IT2rpHqfT8j7BA>
Received: from dave.aj.id.au (ppp118-210-154-2.bras1.adl6.internode.on.net
 [118.210.154.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3F2F47E1DE;
 Thu, 15 Feb 2018 07:36:36 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au, jk@ozlabs.org, eajames@linux.vnet.ibm.com,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 03/16] fsi: gpio: Trace busy count
Date: Thu, 15 Feb 2018 23:05:53 +1030
Message-Id: <20180215123606.25777-4-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 15 Feb 2018 12:36:42 -0000
X-List-Received-Date: Thu, 15 Feb 2018 12:36:42 -0000

An observation from trace output of the existing FSI tracepoints was that the
remote device was sometimes reporting as busy. Add a new tracepoint reporting
the busy count in order to get a better grip on how often this is the case,

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/fsi/fsi-master-gpio.c          |  3 +++
 include/trace/events/fsi_master_gpio.h | 16 ++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 9e7a2ed9968f..3d31e50269fe 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -403,6 +403,9 @@ static int poll_for_response(struct fsi_master_gpio *master,
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
