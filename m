Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-it0-x243.google.com (mail-it0-x243.google.com
 [IPv6:2607:f8b0:4001:c0b::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sznhp5vrwzDt2L
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 10:10:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=pyCv60EF; 
 dkim-atps=neutral
Received: by mail-it0-x243.google.com with SMTP id e203so3157596itc.1
 for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2016 16:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=KZNizfLoxtexziCVCF1LcxMy9rtr5Zf2n0og+yb8bIU=;
 b=pyCv60EFJ/pnsaQijvN3viJepi8f1fFqhFF4ul4d7GIc23dVWvZ4G9s3sjm6vkp12j
 YcWkRHfpmyevE66oLiRD6HKQB8PxmibOGwWDkpcxIHIRGLGn7Ca7meW1yPkRqKpiUv+4
 N5eU7IwvGpZPmNfsWqrsYsLy0R3wn4Gno16BIO6vkDg32xps2bwB058jujSIVrDD1Lib
 ChuLSYlP2ZZIQxQLsWbVeNmlfCiYxYxR9vpgAKe7Ih+0pYe9pjATXlCU8zcp81Hie9eP
 U/lpEDBN+4GGMEjSTRxxz22NxMEqlO/zRbrYUf9fsTfBEn9/twAZWbvWhaR3OdsmOUAQ
 UjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=KZNizfLoxtexziCVCF1LcxMy9rtr5Zf2n0og+yb8bIU=;
 b=iuZIrVyJoUunmG9Nv04hyAiciVw+shukzJ3VEcvZQtebUpW+HW6cdyEeJufV0VZczx
 m310GR/KvL3h5aePcTK0cV5W5br0xCOvZdUAxjJSQ6CsdjeCPD9+XrH4vjIxQPxdlEed
 G6RUL1da3cMEX25M6i1m4+wmlqM/t4eRPLT5O7qlV//dgNrjD5C58vD0gOQAlCy88Ep1
 pr5yx1QFMGPLv1GfHoP6qUNqq55Yl6bqmsRS3oIMWuAmnC6LhAv1Zg4jFGw2hOWJIKjD
 lxUKC81TKpbuQXeRl6w4aaNwfbLOWZXWfDhgyix9PywUTBHdRsNqOQFOMCq4g9E5m5hW
 qRqA==
X-Gm-Message-State: AA6/9RkpLKJudR3asYHLnRzBk/Sh/cVGPzBhNBAon5LzlkPhz2yPyLFEjeZtcN7KL3O39g==
X-Received: by 10.202.189.133 with SMTP id n127mr6220071oif.49.1476918600955; 
 Wed, 19 Oct 2016 16:10:00 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id n196sm15487618oig.8.2016.10.19.16.10.00
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 19 Oct 2016 16:10:00 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux v5 14/18] drivers/fsi: Set slave SMODE to init
 communications
Date: Wed, 19 Oct 2016 18:09:42 -0500
Message-Id: <1476918586-13475-15-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1476918586-13475-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1476918586-13475-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Wed, 19 Oct 2016 23:10:03 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Set CFAM to appropriate ID so that the controlling master
can manage link memory ranges.  Add slave engine register
definitions.

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

Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 drivers/fsi/fsi-core.c | 100 ++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 91 insertions(+), 9 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 81ed444..ed0d20f 100644
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
+#define	FSI_SMODE		0x0	/* R/W: Mode register */
+
+/*
+ * SMODE fields
+ */
+#define	FSI_SMODE_WSC		0x80000000	/* Warm start done */
+#define	FSI_SMODE_ECRC		0x20000000	/* Hardware CRC check */
+#define	FSI_SMODE_SID_SHIFT	24		/* ID shift */
+#define	FSI_SMODE_SID_MASK	3		/* ID mask */
+#define	FSI_SMODE_ED_SHIFT	20		/* Echo delay shift */
+#define	FSI_SMODE_ED_MASK	0xf		/* Echo delay mask */
+#define	FSI_SMODE_SD_SHIFT	16		/* Send delay shift */
+#define	FSI_SMODE_SD_MASK	0xf		/* Send delay mask */
+#define	FSI_SMODE_LBCRR_SHIFT	8		/* Clk ratio shift */
+#define	FSI_SMODE_LBCRR_MASK	0xf		/* Clk ratio mask */
+
 /* FSI endpoint-device support */
 int fsi_device_read(struct fsi_device *dev, uint32_t addr, void *val,
 		size_t size)
@@ -132,6 +152,31 @@ static bool check_crc4_u32(uint32_t x)
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
@@ -238,6 +283,22 @@ static void fsi_slave_release(struct device *dev)
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
+	return master->write(master, link, 0, FSI_SLAVE_BASE + FSI_SMODE,
+			&smode, sizeof(smode));
+}
+
 static int fsi_slave_init(struct fsi_master *master,
 		int link, uint8_t slave_id)
 {
@@ -245,6 +306,21 @@ static int fsi_slave_init(struct fsi_master *master,
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
@@ -300,21 +376,16 @@ static int fsi_master_link_enable(struct fsi_master *master, int link)
  */
 static int fsi_master_break(struct fsi_master *master, int link)
 {
-	int rc;
-
-	if (!master->send_break)
-		return -EINVAL;
-
-	rc = master->send_break(master, link);
-	if (rc)
-		dev_info(master->dev, "break failed with:%d\n", rc);
+	if (master->send_break)
+		return master->send_break(master, link);
 
-	return rc;
+	return -EINVAL;
 }
 
 static int fsi_master_scan(struct fsi_master *master)
 {
 	int link, slave_id, rc;
+	uint32_t smode;
 
 	for (link = 0; link < master->n_links; link++) {
 		rc = fsi_master_link_enable(master, link);
@@ -329,6 +400,17 @@ static int fsi_master_scan(struct fsi_master *master)
 				"Break to link:%d failed with:%d\n", link, rc);
 			continue;
 		}
+		/* Verify can read slave at default ID location. If fails */
+		/* then there must be nothing on other end of link */
+		rc = master->read(master, link, 3, FSI_SLAVE_BASE + FSI_SMODE,
+				&smode, sizeof(smode));
+		if (rc) {
+			dev_dbg(master->dev,
+				"Read link:%d smode default id failed:%d\n",
+				link, rc);
+			continue;
+		}
+
 		for (slave_id = 0; slave_id < FSI_N_SLAVES; slave_id++)
 			fsi_slave_init(master, link, slave_id);
 	}
-- 
1.8.2.2
