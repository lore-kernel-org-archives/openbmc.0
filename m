Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3swhjp2kK1zDt4c
 for <openbmc@lists.ozlabs.org>; Sat, 15 Oct 2016 09:15:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=b+VY8z4a; 
 dkim-atps=neutral
Received: by mail-pf0-x242.google.com with SMTP id r16so7968266pfg.3
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 15:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5YP5Ho3AIAJxxVvHz/1BcGvH5SRnXeLMP0QQok3p9So=;
 b=b+VY8z4a4rT8902W0XRwdZ/d7lfROyW+iDFvT7jlTPBVZd3kdhZxNTOEtqk+Vg7ZUL
 yVtyhzeaVo/22RrogTtfQevdNR8fkQ5iwOe277BaT0qyjYsEPcg/E0Dr69bNWN6qb0W0
 kCBC7ukVxtCebBMtssZAnE0MwM+Q0o12EkQLe/AiAvyHgXEud000PoQ8pWdJei2VMny6
 aipsfIhs5Gop2lewvCxrK7rab2twKQ/2dSSHFlTIvy6OSWc2yFzPLcwaeHdWnLRv1lU9
 BkreT3lkU1KHe14fP4wpNUtIzcpKv7v9L99TSxWigDrkUSNmsqP6Qhe5n3iYmNDyD7ss
 KHgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5YP5Ho3AIAJxxVvHz/1BcGvH5SRnXeLMP0QQok3p9So=;
 b=ZqNDPCDUJFPDa0HbiHvlRKFiDQ2rIpmzbfxTfoXWR+hgmmPd1iQSoX9G9EqOiT54oO
 aF6gDCeMtkgIKSNu6OwWmZYkE44/qFlRf5bC7ARd7mPBO5pM9JggxyBLTGAhevcvtDgx
 AwbXU5CbGDJ207A/5z61uIf6fwA8+CjZ6nbvuA31oM8q/WpsjRf8iLm2POjcBMOMjT6l
 aHk8r7dZ+B+ZJXXoupTwb4tYjRdpXh5nFGiJ2+yGy6QA+QfJsN9dRylUTnIMnxKkrn/u
 GmTh3QHTOy4aAM+L2yYw3zEViTvd5wIIO2vptFvAX6vG1YmtCA7w6ngo7DqIUd3bDN22
 K37g==
X-Gm-Message-State: AA6/9RkydoLFUFIJzdtV5E/qpwG/KiS0sxbe7nd90VMP9Zvm1hWnD2es0KeVTfJRYER8bQ==
X-Received: by 10.99.126.11 with SMTP id z11mr17990769pgc.46.1476483308611;
 Fri, 14 Oct 2016 15:15:08 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id p7sm29848874paa.3.2016.10.14.15.15.07
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Fri, 14 Oct 2016 15:15:08 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux v4 17/20] drivers/fsi: Set slave SMODE to init
 communications
Date: Fri, 14 Oct 2016 17:14:39 -0500
Message-Id: <1476483282-85971-18-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1476483282-85971-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1476483282-85971-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Fri, 14 Oct 2016 22:15:10 -0000

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

Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 drivers/fsi/fsi-core.c | 92 ++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 89 insertions(+), 3 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 0195373..185aff4 100644
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
+#define	FSI_SMODE_ECRC		0x20000000      /* Enable hdware CRC check */
+#define	FSI_SMODE_SID_SHIFT	24		/* ID shift */
+#define	FSI_SMODE_SID_MASK	3		/* ID mask */
+#define	FSI_SMODE_ED_SHIFT	20		/* Echo delay shift */
+#define	FSI_SMODE_ED_MASK	0xf		/* Echo delay mask */
+#define	FSI_SMODE_SD_SHIFT	16		/* Send delay shift */
+#define	FSI_SMODE_SD_MASK	0xf		/* Send delay mask */
+#define	FSI_SMODE_LBCRR_SHIFT	8		/* Clock rate ratio shift */
+#define	FSI_SMODE_LBCRR_MASK	0xf		/* Clock rate ratio mask */
+
 /* FSI endpoint-device support */
 int fsi_device_read(struct fsi_device *dev, uint32_t addr, void *val,
 		size_t size)
@@ -132,6 +152,30 @@ static bool check_crc4_u32(uint32_t x)
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
 static int fsi_slave_read(struct fsi_slave *slave, uint32_t addr,
 		void *val, size_t size)
 {
@@ -238,6 +282,22 @@ static void fsi_slave_release(struct device *dev)
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
@@ -245,6 +305,21 @@ static int fsi_slave_init(struct fsi_master *master,
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
+		dev_warn(master->dev, "can't set smode on slave%02x:%02x: %d\n",
+				link, slave_id, rc);
+		return -ENODEV;
+	}
+
 	rc = master->read(master, link, slave_id, 0, &chip_id, sizeof(chip_id));
 	if (rc) {
 		dev_warn(master->dev, "can't read slave %02x:%02x: %d\n",
@@ -301,15 +376,26 @@ static int fsi_master_link_enable(struct fsi_master *master, int link)
 static int fsi_master_break(struct fsi_master *master, int link)
 {
 	int rc;
+	uint32_t smode;
 
 	if (!master->send_break)
 		return -EINVAL;
 
-	rc =  master->send_break(master, link);
-	if (rc)
+	rc = master->send_break(master, link);
+	if (rc) {
 		dev_info(master->dev, "break failed with:%d\n", rc);
+		return rc;
+	}
+	/* Verify can read slave at default ID location */
+	rc = master->read(master, link, 3, FSI_SLAVE_BASE + FSI_SMODE,
+			&smode, sizeof(smode));
 
-	return rc;
+	/* If read fails then nothing on other end of link */
+	if (rc)
+		return -ENODEV;
+
+	dev_dbg(master->dev, "smode at ID 3 after break:%08x\n", smode);
+	return 0;
 }
 
 static int fsi_master_scan(struct fsi_master *master)
-- 
1.8.2.2
