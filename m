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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40w12Y286BzDrJs
 for <openbmc@lists.ozlabs.org>; Tue, 29 May 2018 14:29:09 +1000 (AEST)
Received: from pasglop.ozlabs.ibm.com (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w4T4SY0u015630;
 Mon, 28 May 2018 23:28:38 -0500
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 3/3] hwmon: occ: Properly initialize sysfs
 attributes
Date: Tue, 29 May 2018 14:28:33 +1000
Message-Id: <20180529042833.11158-3-benh@kernel.crashing.org>
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
X-List-Received-Date: Tue, 29 May 2018 04:29:10 -0000

Otherwise, lockdep will complain

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/hwmon/occ/common.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 0673af00a99b..b99b2f66e3c2 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -1166,8 +1166,10 @@ static int occ_setup_sensor_attrs(struct occ *occ)
 	}
 
 	/* put the sensors in the group */
-	for (i = 0; i < num_attrs; ++i)
+	for (i = 0; i < num_attrs; ++i) {
+		sysfs_attr_init(&occ->attrs[i].sensor.dev_attr.attr);
 		occ->group.attrs[i] = &occ->attrs[i].sensor.dev_attr.attr;
+	}
 
 	return 0;
 }
-- 
2.17.0
