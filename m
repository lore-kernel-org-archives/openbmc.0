Return-Path: <benh@kernel.crashing.org>
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40n9jQ3ZHvzF294
 for <openbmc@lists.ozlabs.org>; Fri, 18 May 2018 11:35:38 +1000 (AEST)
Received: from pasglop.ozlabs.ibm.com (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w4I1Z2Vj016295;
 Thu, 17 May 2018 20:35:11 -0500
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 2/4] fsi/occ: Add Retries on checksum errors
Date: Fri, 18 May 2018 11:34:58 +1000
Message-Id: <20180518013500.18005-2-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180518013500.18005-1-benh@kernel.crashing.org>
References: <20180518013500.18005-1-benh@kernel.crashing.org>
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
X-List-Received-Date: Fri, 18 May 2018 01:35:40 -0000

Similarily to the new retry on SBE fifo errors, this adds
retries if the data we obtain from the OCC has a bad checksum.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/fsi/fsi-occ.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
index f4b2df7a3084..7a5afa78fb6b 100644
--- a/drivers/fsi/fsi-occ.c
+++ b/drivers/fsi/fsi-occ.c
@@ -652,7 +652,7 @@ static void occ_worker(struct work_struct *work)
 	struct occ_client *client;
 	struct occ *occ = container_of(work, struct occ, work);
 	struct device *sbefifo = occ->sbefifo;
-
+	int retries = 0;
 again:
 	if (occ->cancel)
 		return;
@@ -720,7 +720,10 @@ static void occ_worker(struct work_struct *work)
 	xfr->resp_data_length = resp_data_length + 7;
 
 	rc = occ_verify_checksum(resp, resp_data_length);
-
+	if (rc) {
+		if (retries++ < OCC_COMMAND_RETRIES)
+			goto again;
+	}
 done:
 	mutex_unlock(&occ->occ_lock);
 
@@ -732,6 +735,7 @@ static void occ_worker(struct work_struct *work)
 	clear_bit(XFR_IN_PROGRESS, &xfr->flags);
 	list_del(&xfr->link);
 	empty = list_empty(&occ->xfrs);
+	retries = 0;
 
 	spin_unlock_irqrestore(&occ->list_lock, flags);
 
-- 
2.17.0
