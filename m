Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-it0-x244.google.com (mail-it0-x244.google.com
 [IPv6:2607:f8b0:4001:c0b::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sznhk6mKSzDvWT
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 10:09:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=gluygyQ5; 
 dkim-atps=neutral
Received: by mail-it0-x244.google.com with SMTP id k64so3167833itb.0
 for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2016 16:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Ygi5TsbirL4LnCmPFZgpzprNlNLOY1EnRj4y1VKW2Kc=;
 b=gluygyQ5FfPRnwBzgWzYr8U591IrODB+NdRAiCmKvRVl1HiLy27jgXy5bFDj9rw5Dk
 hc82CJ2nLZdT+1ROKFfuAduzEKHSdL8x8n0NvDyGsXtgZk/zeMuGM4CtEfKQkgJ971vG
 VGoT7XFQwXh+XW7pScvgUAl0k0SW92Yr9l7unaSd5u2BKl6Aw0DsU8ZmGknsj9tcc0Af
 mTDqrL/UoRj6fN142aV8nh7IMxT36yMl1cxFTgPbCf3k86EGr6xlL10Y+BANpBpngZ6b
 0jH4WWW/vtquP2EqWSNhRJP+SFA5sc6RdZy/MmMdCjsoWeaZESb6TcHmi0qsZrkXhrZW
 hK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Ygi5TsbirL4LnCmPFZgpzprNlNLOY1EnRj4y1VKW2Kc=;
 b=Uu4VRDiXsO2Sk3pyo8lj7elS47kv8lu0Lb/vNedrIBQ2riRD9CYTaBN5euLY1YELKe
 ijFZRnKre5S58ZDqjGziBDrNVg4Vh9oPK9TMDv4JOcp8iz8T2c1Ptqw9Fyc2D1clNc8z
 eRhripcI46NyOd3YeBv05nndB/ImWUYpgZSbkXFLx5UWXJRKD9sZlbOJ+kZWl09V+OFZ
 n/w/8TV3bgcfcUK9mNr5pyB2Sig6dKeZ19cc1PfQ9ylz49XI+tXjNFyC1ATpdARoiQ4U
 PQI6NBhllmfFr4odk9/c/+eqiJfBQFs5WyRp4HUcyJK/w7uA6H5OqX5ntoI+xPYzWVZX
 6o8g==
X-Gm-Message-State: AA6/9Rl6JCeC4mNG+wWdkeChJ8LrAffQTz3x4iqfvNRcsdmJTA5dycjdBsFJwmI/XYZT0Q==
X-Received: by 10.202.76.151 with SMTP id z145mr6215513oia.8.1476918597225;
 Wed, 19 Oct 2016 16:09:57 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id n196sm15487618oig.8.2016.10.19.16.09.56
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 19 Oct 2016 16:09:56 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v5 09/18] fsi: Add crc4 helpers
Date: Wed, 19 Oct 2016 18:09:37 -0500
Message-Id: <1476918586-13475-10-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Wed, 19 Oct 2016 23:09:59 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Add some helpers for the crc checks for the slave configuration table.
This works 4-bits-at-a-time, using a simple table approach.

We will need this in the FSI core code, as well as any master
implementations that need to calculate CRCs in software.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/fsi/fsi-core.c   | 25 +++++++++++++++++++++++++
 drivers/fsi/fsi-master.h | 21 +++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 9744a55..2d22320 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -34,6 +34,31 @@ struct fsi_slave {
 
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
+
+static bool check_crc4_u32(uint32_t x)
+{
+	return fsi_crc4(0, x, 32) == 0;
+}
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
