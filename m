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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40n9tl5kV8zF1nZ
 for <openbmc@lists.ozlabs.org>; Fri, 18 May 2018 11:43:43 +1000 (AEST)
Received: from pasglop.ozlabs.ibm.com (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w4I1hFPa016874;
 Thu, 17 May 2018 20:43:22 -0500
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13] hwmon/occ: Silence probe error message when
 host is shutdown
Date: Fri, 18 May 2018 11:43:11 +1000
Message-Id: <20180518014311.20781-1-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.0
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
X-List-Received-Date: Fri, 18 May 2018 01:43:44 -0000

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/hwmon/occ/p9_sbe.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
index 27886897a3d6..9a1d3ae56d69 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -110,6 +110,7 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
 static int p9_sbe_occ_probe(struct platform_device *pdev)
 {
 	struct occ *occ;
+	int rc;
 	struct p9_sbe_occ *ctx = devm_kzalloc(&pdev->dev,
 						     sizeof(*ctx),
 						     GFP_KERNEL);
@@ -126,7 +127,12 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
 	occ->poll_cmd_data = 0x20;		/* P9 OCC poll data */
 	occ->send_cmd = p9_sbe_occ_send_cmd;
 
-	return occ_setup(occ, "p9_occ");
+	rc = occ_setup(occ, "p9_occ");
+
+	/* Host is shutdown, don't spew errors */
+	if (rc == -ESHUTDOWN)
+		rc = -ENODEV;
+	return rc;
 }
 
 static int p9_sbe_occ_remove(struct platform_device *pdev)
-- 
2.17.0
