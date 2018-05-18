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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40n9jh6RdpzF29l
 for <openbmc@lists.ozlabs.org>; Fri, 18 May 2018 11:35:52 +1000 (AEST)
Received: from pasglop.ozlabs.ibm.com (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w4I1Z2Vl016295;
 Thu, 17 May 2018 20:35:14 -0500
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 4/4] fsi/occ: Don't set driver data late
Date: Fri, 18 May 2018 11:35:00 +1000
Message-Id: <20180518013500.18005-4-benh@kernel.crashing.org>
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
X-List-Received-Date: Fri, 18 May 2018 01:35:54 -0000

Until now, the OCC driver was setting the driver data after
registering the character device and the hwmon device.

This might have been intentional, as doing so makes the initial
probe of the OCC by the hwmon device fail while the data is NULL
(provided you are lucky and the hwmon driver doesn't get bound
asynchronously). That failure used to be necessary, otherwise
the driver would try to access the SBE fifo at a time when it's
not ready, causing all sort of problems.

The new SBE fifo driver is much more robust and will return an
appropriate error code, so that (fragile) tweak is no longer
necessary.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/fsi/fsi-occ.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
index 4bda1b435ecb..170fd8020829 100644
--- a/drivers/fsi/fsi-occ.c
+++ b/drivers/fsi/fsi-occ.c
@@ -836,6 +836,8 @@ static int occ_probe(struct platform_device *pdev)
 		occ->idx = ida_simple_get(&occ_ida, 1, INT_MAX, GFP_KERNEL);
 	}
 
+	platform_set_drvdata(pdev, occ);
+
 	snprintf(occ->name, sizeof(occ->name), "occ%d", occ->idx);
 	occ->mdev.fops = &occ_fops;
 	occ->mdev.minor = MISC_DYNAMIC_MINOR;
@@ -854,8 +856,6 @@ static int occ_probe(struct platform_device *pdev)
 	if (!hwmon_dev)
 		dev_warn(dev, "failed to create hwmon device\n");
 
-	platform_set_drvdata(pdev, occ);
-
 	return 0;
 }
 
-- 
2.17.0
