Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMXsc2b7lzDvjC
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 13:41:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="oqrtrNf9"; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id f201so16439704oib.0
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 18:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=69B5JPfYxtvbK7JkpgcOB4Kygt1nLMlYFqA15uvpC1U=;
 b=oqrtrNf9oOD2PYdy9BFAK/OcSAIue8OM8IyWuetNTb+WYPXyx2dmfX9AGjzUr33Dur
 2CF4io8vquJBGrpryb80bN9IUQJkrb1A4tHzjBzlrKn/ZxEqHuhFO7B2yL1Q2J3iw66w
 yHyJamTKyvk7ImiUhuQzeW0785P/4X0A6DxsSvNwHWEO6UJR+z1DHNdho+Zth7fUuX0n
 eaIekhV1rOPdUzbNHBBFQ2dBgp6Ws4QnVNooXA35MoBfYqdy3KQxw9KhGXdTnawqXjg0
 Ph1Ljg0lI+5Umk8yf0hX5FTym5+GqNoUlLHEcVBler5xjH+wdmd8VZdQjqxPIVo/tPnu
 jArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=69B5JPfYxtvbK7JkpgcOB4Kygt1nLMlYFqA15uvpC1U=;
 b=bo5PnIMrtUzw3Mwe+HU1Q6octYe0GH8fRE7zC/jrgNPf0icSJJ2bvAWEgGDHi19xRq
 kS4k147pjOiKKTveHzjbMK6c9Ngl8zBi6lUjHiK0eG0vMrrlOyf7TJiUPsYOYKTgt4SH
 BR3rkutbA7kbf7mD58A2wQcJEdxIZHYYyNqNi+BliqMgDwU5uwsS4b+USSOj9HWGZiPX
 TOmGjBLmZ2mbyX7Lf2W9V8NeG5Q0LzbwFmnsiA6vZl0cgorcZz4qRpHMn/b3eZz7KXW6
 EJip+SG6MqXWUuyC9PYNOOmTfr5slJpK6KdPSnssI9AR+hdVmZAppE+/0AoHeGSrb9dm
 uc8w==
X-Gm-Message-State: AKaTC01LLJ0PmUzAB/VfbgeVKbCqWcTaPwk2FeODptAhdbf0hVxNgPHOTxGXsI/wsSB42A==
X-Received: by 10.157.63.199 with SMTP id i7mr7933850ote.63.1479696066633;
 Sun, 20 Nov 2016 18:41:06 -0800 (PST)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id 73sm6432307otf.16.2016.11.20.18.41.05
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 20 Nov 2016 18:41:06 -0800 (PST)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org, gustavo.padovan@collabora.co.uk,
 gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch, jthumshirn@suse.de,
 dan.j.williams@intel.com, sre@kernel.org, clg@kaod.org,
 k.kozlowski@samsung.com
Cc: jk@ozlabs.org, joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 benh@kernel.crashing.org, alistair@popple.id.au,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux 09/19] fsi: Add crc4 helpers
Date: Sun, 20 Nov 2016 20:40:38 -0600
Message-Id: <1479696048-75851-10-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1479696048-75851-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1479696048-75851-1-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailman-Approved-At: Mon, 21 Nov 2016 13:57:36 +1100
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
X-List-Received-Date: Mon, 21 Nov 2016 02:41:08 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Add some helpers for the crc checks for the slave configuration table.
This works 4-bits-at-a-time, using a simple table approach.

We will need this in the FSI core code, as well as any master
implementations that need to calculate CRCs in software.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 drivers/fsi/fsi-core.c   | 21 +++++++++++++++++++++
 drivers/fsi/fsi-master.h | 21 +++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 9744a55..b8d53d5 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -34,6 +34,27 @@ struct fsi_slave {
 
 #define to_fsi_slave(d) container_of(d, struct fsi_slave, dev)
 
+/* crc helpers */
+static const uint8_t crc4_tab[] = {
+	0x0, 0x7, 0xe, 0x9, 0xb, 0xc, 0x5, 0x2,
+	0x1, 0x6, 0xf, 0x8, 0xa, 0xd, 0x4, 0x3,
+};
+
+uint8_t fsi_crc4(uint8_t c, uint64_t x, int bits)
+{
+	int i;
+
+	/* Align to 4-bits */
+	bits = (bits + 3) & ~0x3;
+
+	/* Calculate crc4 over four-bit nibbles, starting at the MSbit */
+	for (i = bits; i >= 0; i -= 4)
+		c = crc4_tab[c ^ ((x >> i) & 0xf)];
+
+	return c;
+}
+EXPORT_SYMBOL_GPL(fsi_crc4);
+
 /* FSI slave support */
 static int fsi_slave_init(struct fsi_master *master,
 		int link, uint8_t slave_id)
diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
index e75a810..cafb433 100644
--- a/drivers/fsi/fsi-master.h
+++ b/drivers/fsi/fsi-master.h
@@ -34,4 +34,25 @@ struct fsi_master {
 extern int fsi_master_register(struct fsi_master *master);
 extern void fsi_master_unregister(struct fsi_master *master);
 
+/**
+ * crc4 helper: Given a starting crc4 state @c, calculate the crc4 vaue of @x,
+ * which is @bits in length. This may be required by master implementations
+ * that do not provide their own hardware checksums.
+ *
+ * The crc4 is performed on 4-bit chunks (which is all we need for FSI
+ * calculations). Typically, we'll want a starting state of 0:
+ *
+ *  c = fsi_crc4(0, msg, len);
+ *
+ * To crc4 a message that includes a single start bit, initialise crc4 state
+ * with:
+ *
+ *  c = fsi_crc4(0, 1, 1);
+ *
+ * Then update with message data:
+ *
+ *  c = fsi_crc4(c, msg, len);
+ */
+uint8_t fsi_crc4(uint8_t c, uint64_t x, int bits);
+
 #endif /* DRIVERS_FSI_MASTER_H */
-- 
1.8.2.2
