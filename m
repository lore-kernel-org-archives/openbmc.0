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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40w12H6Y8czDqGD
 for <openbmc@lists.ozlabs.org>; Tue, 29 May 2018 14:28:55 +1000 (AEST)
Received: from pasglop.ozlabs.ibm.com (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w4T4SY0s015630;
 Mon, 28 May 2018 23:28:35 -0500
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 1/3] hwmon: occ: Display info about the OCC
 code level and sensors found
Date: Tue, 29 May 2018 14:28:31 +1000
Message-Id: <20180529042833.11158-1-benh@kernel.crashing.org>
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
X-List-Received-Date: Tue, 29 May 2018 04:28:56 -0000

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/hwmon/occ/common.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 88c32915b8bf..365bf207cf0d 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -1296,7 +1296,7 @@ static void occ_sysfs_notify(struct occ *occ)
 /* only need to do this once at startup, as OCC won't change sensors on us */
 static void occ_parse_poll_response(struct occ *occ)
 {
-	unsigned int i, offset = 0, size = 0;
+	unsigned int i, offset = 0, size = 0, old_offset;
 	struct occ_sensor *sensor;
 	struct occ_sensors *sensors = &occ->sensors;
 	struct occ_response *resp = &occ->resp;
@@ -1305,8 +1305,12 @@ static void occ_parse_poll_response(struct occ *occ)
 	struct occ_poll_response_header *header = &poll->header;
 	struct occ_sensor_data_block *block = &poll->block;
 
+	dev_info(occ->bus_dev, "OCC found, code level: %.16s\n",
+		 header->occ_code_level);
+
 	for (i = 0; i < header->num_sensor_data_blocks; ++i) {
 		block = (struct occ_sensor_data_block *)((u8 *)block + offset);
+		old_offset = offset;
 		offset = (block->header.num_sensors *
 			  block->header.sensor_length) + sizeof(block->header);
 		size += offset;
@@ -1317,6 +1321,10 @@ static void occ_parse_poll_response(struct occ *occ)
 			return;
 		}
 
+		dev_dbg(occ->bus_dev, " %04x..%04x: %.4s (%d sensors)\n",
+			old_offset, offset - 1, block->header.eye_catcher,
+			block->header.num_sensors);
+
 		/* match sensor block type */
 		if (strncmp(block->header.eye_catcher, "TEMP", 4) == 0)
 			sensor = &sensors->temp;
@@ -1338,6 +1346,8 @@ static void occ_parse_poll_response(struct occ *occ)
 		sensor->version = block->header.sensor_format;
 		sensor->data = &block->data;
 	}
+	dev_dbg(occ->bus_dev, "Max resp size: %d+%d=%d\n",
+		 size, sizeof(*header), size + sizeof(*header));
 }
 
 int occ_setup(struct occ *occ, const char *name)
-- 
2.17.0
