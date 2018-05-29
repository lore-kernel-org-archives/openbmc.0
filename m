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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40w12K4DxNzDqGD
 for <openbmc@lists.ozlabs.org>; Tue, 29 May 2018 14:28:57 +1000 (AEST)
Received: from pasglop.ozlabs.ibm.com (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w4T4SY0t015630;
 Mon, 28 May 2018 23:28:37 -0500
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 2/3] hwmon: occ: Avoid displaying an error when
 host is down
Date: Tue, 29 May 2018 14:28:32 +1000
Message-Id: <20180529042833.11158-2-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180529042833.11158-1-benh@kernel.crashing.org>
References: <20180529042833.11158-1-benh@kernel.crashing.org>
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
X-List-Received-Date: Tue, 29 May 2018 04:28:58 -0000

Instead display a much less scary informational message as
this can happen in normal circumstances.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/hwmon/occ/common.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 365bf207cf0d..0673af00a99b 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -1359,7 +1359,10 @@ int occ_setup(struct occ *occ, const char *name)
 
 	/* no need to lock */
 	rc = occ_poll(occ);
-	if (rc < 0) {
+	if (rc == -ESHUTDOWN) {
+		dev_info(occ->bus_dev, "Host is not ready\n");
+		return rc;
+	} else if (rc < 0) {
 		dev_err(occ->bus_dev, "failed to get OCC poll response: %d\n",
 			rc);
 		return rc;
-- 
2.17.0
