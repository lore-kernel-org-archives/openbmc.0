Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E4C201A0A93
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 14:54:14 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446177249236497.00290469933884;
 Thu, 29 Oct 2015 20:54:09 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyril.bur@au1.ibm.com>
Subject: [PATCH btbridge v3 1/4] Remove logic to check for message resends.
Date: Thu, 29 Oct 2015 22:54:02 -0500
Message-Id: <1446177245-24974-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446177245-24974-1-git-send-email-patches@stwcx.xyz>
References: <1446177245-24974-1-git-send-email-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Oct 2015 03:54:15 -0000

From: Cyril Bur <cyril.bur@au1.ibm.com>

The current logic causes problems and needs to be more sophisticated, more
sophistication has no place at this level and can handled be at a later
stage of processing.
---
 btbridged.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/btbridged.c b/btbridged.c
index f9c5703..932355a 100644
--- a/btbridged.c
+++ b/btbridged.c
@@ -77,8 +77,6 @@ struct bt_queue {
 
 struct btbridged_context{
 	int debug;
-	uint8_t last_seq;
-	int started;
 	struct pollfd fds[TOTAL_FDS];
 	struct sd_bus *bus;
 	struct bt_queue *bt_q;
@@ -488,21 +486,6 @@ static int dispatch_bt(struct btbridged_context *context)
 			goto out1;
 		}
 
-		/*
-		 * If the host sent us a retry, the seq number will not have
-		 * incremented. Drop the message otherwise we might send duplicate
-		 * responses.
-		 * This should deal with when last_seq is 0xff with overflow back
-		 * to zero.
-		 */
-		if (data[2] != context->last_seq + 1 && context->started) {
-			MSG_ERR("Received a retry from the host, dropping seq 0x%02x vs 0x%02x\n", data[2], context->last_seq);
-			r = 0;
-			goto out1;
-		}
-		context->started = 1;
-		context->last_seq = data[2];
-
 		new = bt_q_enqueue(context, data);
 		if (!new) {
 			r = -ENOMEM;
@@ -587,7 +570,6 @@ int main(int argc, char *argv[]) {
 		{0,         0,           0,        0}
 	};
 
-	context.started = 0;
 	context.debug = 0;
 	context.bt_q = NULL;
 
-- 
2.6.0
