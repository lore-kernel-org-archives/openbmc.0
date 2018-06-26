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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Fhyb04bJzF1LK;
 Wed, 27 Jun 2018 09:27:02 +1000 (AEST)
Received: from pasglop.au.ibm.com (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w5QNQ6qZ022979;
 Tue, 26 Jun 2018 18:26:22 -0500
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Joel Stanley <joel@jms.id.au>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
 linux-kernel@vger.kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH 02/14] fsi: Move code around to avoid forward declaration
Date: Wed, 27 Jun 2018 09:25:53 +1000
Message-Id: <20180626232605.13420-3-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180626232605.13420-1-benh@kernel.crashing.org>
References: <20180626232605.13420-1-benh@kernel.crashing.org>
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
X-List-Received-Date: Tue, 26 Jun 2018 23:27:04 -0000

Move fsi_slave_set_smode() and its helpers to before it's
first user and remove the corresponding forward declaration.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/fsi/fsi-core.c | 94 +++++++++++++++++++++---------------------
 1 file changed, 46 insertions(+), 48 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 565218872635..2f6f9b8c75e4 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -215,7 +215,52 @@ static int fsi_slave_report_and_clear_errors(struct fsi_slave *slave)
 			&irq, sizeof(irq));
 }
 
-static int fsi_slave_set_smode(struct fsi_master *master, int link, int id);
+/* Encode slave local bus echo delay */
+static inline uint32_t fsi_smode_echodly(int x)
+{
+	return (x & FSI_SMODE_ED_MASK) << FSI_SMODE_ED_SHIFT;
+}
+
+/* Encode slave local bus send delay */
+static inline uint32_t fsi_smode_senddly(int x)
+{
+	return (x & FSI_SMODE_SD_MASK) << FSI_SMODE_SD_SHIFT;
+}
+
+/* Encode slave local bus clock rate ratio */
+static inline uint32_t fsi_smode_lbcrr(int x)
+{
+	return (x & FSI_SMODE_LBCRR_MASK) << FSI_SMODE_LBCRR_SHIFT;
+}
+
+/* Encode slave ID */
+static inline uint32_t fsi_smode_sid(int x)
+{
+	return (x & FSI_SMODE_SID_MASK) << FSI_SMODE_SID_SHIFT;
+}
+
+static uint32_t fsi_slave_smode(int id)
+{
+	return FSI_SMODE_WSC | FSI_SMODE_ECRC
+		| fsi_smode_sid(id)
+		| fsi_smode_echodly(0xf) | fsi_smode_senddly(0xf)
+		| fsi_smode_lbcrr(0x8);
+}
+
+static int fsi_slave_set_smode(struct fsi_master *master, int link, int id)
+{
+	uint32_t smode;
+	__be32 data;
+
+	/* set our smode register with the slave ID field to 0; this enables
+	 * extended slave addressing
+	 */
+	smode = fsi_slave_smode(id);
+	data = cpu_to_be32(smode);
+
+	return fsi_master_write(master, link, id, FSI_SLAVE_BASE + FSI_SMODE,
+			&data, sizeof(data));
+}
 
 static int fsi_slave_handle_error(struct fsi_slave *slave, bool write,
 				  uint32_t addr, size_t size)
@@ -569,53 +614,6 @@ static const struct bin_attribute fsi_slave_term_attr = {
 	.write = fsi_slave_sysfs_term_write,
 };
 
-/* Encode slave local bus echo delay */
-static inline uint32_t fsi_smode_echodly(int x)
-{
-	return (x & FSI_SMODE_ED_MASK) << FSI_SMODE_ED_SHIFT;
-}
-
-/* Encode slave local bus send delay */
-static inline uint32_t fsi_smode_senddly(int x)
-{
-	return (x & FSI_SMODE_SD_MASK) << FSI_SMODE_SD_SHIFT;
-}
-
-/* Encode slave local bus clock rate ratio */
-static inline uint32_t fsi_smode_lbcrr(int x)
-{
-	return (x & FSI_SMODE_LBCRR_MASK) << FSI_SMODE_LBCRR_SHIFT;
-}
-
-/* Encode slave ID */
-static inline uint32_t fsi_smode_sid(int x)
-{
-	return (x & FSI_SMODE_SID_MASK) << FSI_SMODE_SID_SHIFT;
-}
-
-static uint32_t fsi_slave_smode(int id)
-{
-	return FSI_SMODE_WSC | FSI_SMODE_ECRC
-		| fsi_smode_sid(id)
-		| fsi_smode_echodly(0xf) | fsi_smode_senddly(0xf)
-		| fsi_smode_lbcrr(0x8);
-}
-
-static int fsi_slave_set_smode(struct fsi_master *master, int link, int id)
-{
-	uint32_t smode;
-	__be32 data;
-
-	/* set our smode register with the slave ID field to 0; this enables
-	 * extended slave addressing
-	 */
-	smode = fsi_slave_smode(id);
-	data = cpu_to_be32(smode);
-
-	return fsi_master_write(master, link, id, FSI_SLAVE_BASE + FSI_SMODE,
-			&data, sizeof(data));
-}
-
 static void fsi_slave_release(struct device *dev)
 {
 	struct fsi_slave *slave = to_fsi_slave(dev);
-- 
2.17.1
