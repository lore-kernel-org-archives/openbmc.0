Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6WrY03QHzDvWw
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 09:10:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Hj3kGOCQ; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id 128so1107817oih.3
 for <openbmc@lists.ozlabs.org>; Sun, 30 Oct 2016 15:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0Vd3PaUgvyxtgEs9xfxREmKiS8zrDrM48TGztQ72MvA=;
 b=Hj3kGOCQHJ/jkmKBCuRebrscMOK6da/Koks9B0jVbJ73T0fl32DDcrx7SsdHm+zPuc
 yeqMbvoVonouO8YDRnKY9agcfTT/0gXUkx7d59Tccu1spTLo/blr62ORiLefBDPgdf4A
 WS6D2psBsx3ut8fjDtsGiqScpfry08yb5+NTBm+IL6PVLLjmz0hl4tbYxF3eEY+VoW8u
 Y7LTto5WKxUMUgp4BLup6DsLvCjGus6JvSgV5Yno3yIGvzx8WPHMiBKkBljEWO3CGS+W
 Ip38grCRTlAF57mAwo/7Lv1qS/1E3OAn1JkChc7T9LT/3tdEIGkbfG+ELi98VoDgAIvt
 SzWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0Vd3PaUgvyxtgEs9xfxREmKiS8zrDrM48TGztQ72MvA=;
 b=cSlOvFa7wSlZoCDHYe3/G2g5PatuG0vK8Y4tpkxE6O4FQx/D26H6FzfkaB47fvia6W
 D/qvpUKXQi945f+deS2ar2hQNhxVHaaQz/rFzzmM5Y4BiUWLemVnNaMPMF5VGBak9XYa
 /oXM0pBqH3TK4wOaqJRI0DxN5oww6q6rh8qGzB14fANHWOPf+YgvEbhU0pCd7u31XqBI
 ONVfPwYRoE3wqZFjnxKnZFdoJ8aq7BEmB83eUkb6GSBhoqbw1WF4IeBrgX7JpPk47PeD
 FU+Lw5nztw6JzwAgXuXWUuiutA2CKE1J7ab4xCeX4xt8ddD53KHgVNXRmGu+dTTL/pyD
 tYRg==
X-Gm-Message-State: ABUngvecbYO5ZWhrdKsFVbxBk+38+ziicOy1VO+JIhL0MBtieU+1BLk0WoTFIopF1gXH7w==
X-Received: by 10.157.61.98 with SMTP id a89mr19511882otc.181.1477865403211;
 Sun, 30 Oct 2016 15:10:03 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id q59sm7585484ota.20.2016.10.30.15.10.02
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 30 Oct 2016 15:10:02 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux v6 15/18] drivers/fsi: Set slave SMODE to init
 communications
Date: Sun, 30 Oct 2016 17:09:17 -0500
Message-Id: <1477865379-11566-16-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1477865379-11566-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1477865379-11566-1-git-send-email-christopher.lee.bostic@gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 30 Oct 2016 22:10:05 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Set CFAM to appropriate ID so that the controlling master
can manage link memory ranges.  Add slave engine register
definitions.

Signed-off-by: Chris Bostic <cbostic@us.ibm.com>

---

V3 - Remove master->set_smode op and make it generic for
     all masters.

V4 - 'Change rc = func(); return rc;' code to 'return func();'

   - Change set_smode_defaults to return value instead of
     passing back via reference.

   - Rename fsi_master_set_smode to fsi_slave_set_smode

   - Pass in slave id to fsi_slave_set_smode instead of
     making assumptions internal to the function.

   - Only allow slave inits on id 0 - a todo to accommodate
     all slave ID's.

V5 - Move SMODE read at default ID out of break and into
     the caller.

V6 - Change the slave ID from 0 to 3 when setting smode to
     new value.
---
 drivers/fsi/fsi-core.c | 89 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 7fc15ab..6ac239a 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -33,6 +33,7 @@
 #define FSI_SLAVE_CONF_TYPE_SHIFT	4
 
 #define FSI_PEEK_BASE			0x410
+#define FSI_SLAVE_BASE			0x800
 
 static const int engine_page_size = 0x400;
 
@@ -52,6 +53,25 @@ static int fsi_slave_read(struct fsi_slave *slave, uint32_t addr,
 static int fsi_slave_write(struct fsi_slave *slave, uint32_t addr,
 		const void *val, size_t size);
 
+/*
+ * FSI slave engine control register offsets
+ */
+#define	FSI_SMODE			0x0	/* R/W: Mode register */
+
+/*
+ * SMODE fields
+ */
+#define	FSI_SMODE_WSC			0x80000000	/* Warm start done */
+#define	FSI_SMODE_ECRC			0x20000000	/* Hw CRC check */
+#define	FSI_SMODE_SID_SHIFT		24		/* ID shift */
+#define	FSI_SMODE_SID_MASK		3		/* ID Mask */
+#define	FSI_SMODE_ED_SHIFT		20		/* Echo delay shift */
+#define	FSI_SMODE_ED_MASK		0xf		/* Echo delay mask */
+#define	FSI_SMODE_SD_SHIFT		16		/* Send delay shift */
+#define	FSI_SMODE_SD_MASK		0xf		/* Send delay mask */
+#define	FSI_SMODE_LBCRR_SHIFT		8		/* Clk ratio shift */
+#define	FSI_SMODE_LBCRR_MASK		0xf		/* Clk ratio mask */
+
 /* FSI endpoint-device support */
 int fsi_device_read(struct fsi_device *dev, uint32_t addr, void *val,
 		size_t size)
@@ -134,6 +154,31 @@ static bool check_crc4_u32(uint32_t x)
 }
 
 /* FSI slave support */
+
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
 static int fsi_slave_read(struct fsi_slave *slave, uint32_t addr,
 		void *val, size_t size)
 {
@@ -240,6 +285,22 @@ static void fsi_slave_release(struct device *dev)
 	kfree(slave);
 }
 
+static uint32_t set_smode_defaults(struct fsi_master *master)
+{
+	return FSI_SMODE_WSC | FSI_SMODE_ECRC
+		| fsi_smode_echodly(0xf) | fsi_smode_senddly(0xf)
+		| fsi_smode_lbcrr(1);
+}
+
+static int fsi_slave_set_smode(struct fsi_master *master, int link, int id)
+{
+	uint32_t smode = set_smode_defaults(master);
+
+	smode |= fsi_smode_sid(id);
+	return master->write(master, link, 3, FSI_SLAVE_BASE + FSI_SMODE,
+			&smode, sizeof(smode));
+}
+
 static int fsi_slave_init(struct fsi_master *master,
 		int link, uint8_t slave_id)
 {
@@ -247,6 +308,21 @@ static int fsi_slave_init(struct fsi_master *master,
 	uint32_t chip_id;
 	int rc;
 
+	/*
+	 * todo: Due to CFAM hardware issues related to BREAK commands we're
+	 * limited to only one CFAM per link.  Once issues are resolved this
+	 * restriction can be removed.
+	 */
+	if (slave_id > 0)
+		return 0;
+
+	rc = fsi_slave_set_smode(master, link, slave_id);
+	if (rc) {
+		dev_warn(master->dev, "can't set smode on slave:%02x:%02x %d\n",
+				link, slave_id, rc);
+		return -ENODEV;
+	}
+
 	rc = master->read(master, link, slave_id, 0, &chip_id, sizeof(chip_id));
 	if (rc) {
 		dev_warn(master->dev, "can't read slave %02x:%02x: %d\n",
@@ -310,6 +386,7 @@ static int fsi_master_break(struct fsi_master *master, int link)
 static int fsi_master_scan(struct fsi_master *master)
 {
 	int link, slave_id, rc;
+	uint32_t smode;
 
 	for (link = 0; link < master->n_links; link++) {
 		rc = fsi_master_link_enable(master, link);
@@ -324,6 +401,18 @@ static int fsi_master_scan(struct fsi_master *master)
 				"Break to link:%d failed with:%d\n", link, rc);
 			continue;
 		}
+		/*
+		 * Verify can read slave at default ID location. If fails
+		 * there must be nothing on other end of link
+		 */
+		rc = master->read(master, link, 3, FSI_SLAVE_BASE + FSI_SMODE,
+				&smode, sizeof(smode));
+		if (rc) {
+			dev_dbg(master->dev,
+				"Read link:%d smode default id failed:%d\n",
+				link, rc);
+			continue;
+		}
 
 		for (slave_id = 0; slave_id < FSI_N_SLAVES; slave_id++)
 			fsi_slave_init(master, link, slave_id);
-- 
1.8.2.2
