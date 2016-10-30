Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6WrP6K8gzDvQZ
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 09:09:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=EeOkSMJ8; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id v84so2661124oie.2
 for <openbmc@lists.ozlabs.org>; Sun, 30 Oct 2016 15:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Ygi5TsbirL4LnCmPFZgpzprNlNLOY1EnRj4y1VKW2Kc=;
 b=EeOkSMJ8X3mF0adRUQRd3uHXdBivqoWQaSL6DQqtL3/YnS8RJdXrXKil686TeCLkkj
 yksHgtnJ4amtmqkUqn4iX1pkRD+HaJSyzz64BB1Vkjv2N1Sz/mxHYCCFJ2pGMkD2AKgv
 TpaV8JL5NOqa//BDYhCu7dUWILZrcx80G43pTRfPO6o4JBwU+wGhsmuW8dtaY7zE2QUX
 6/EdH8DS1PMupfV+Ne9IIRA7wIuzffpsE/iQuJ40dli5qqq2GsjvIJl93BI4oJjNs95j
 oz8fXG86NGFuh/Y4uTpf/Gzio7TOgYZ2R4t+Nv9zMVwVKr9QhvLirc1Td+LzsBt9mvxI
 8R2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Ygi5TsbirL4LnCmPFZgpzprNlNLOY1EnRj4y1VKW2Kc=;
 b=Ac6px0L4iY723a56oWokE/DuwLM0VnUOVi64Tjt+oFL+u6KGka0M4gdMCEsFGVDirF
 NhXeMl60iCnei6wr17IzDlYzMv46nI7d5r2VQhMmvqVgEnUA+2AW29vnkUzD5Y47LUGl
 UUnTtJ4u5scAteydiMGz3Ni585Xl6t+DMwt93HiDJ73XsCuWTsBRnURXCf4WaMwiJgnx
 vE7DmDhWsR0EPWN/Rfc7pmNVupDR0oI7vJKacva4XwClARozemGkbRliDn8o0Mv9c0fX
 4AyxIiKz1Ewq21lxu3ST893pP28K+l3+DHbqMJQuTr/UCH1XIqtKliVnwOD8uTQpVOqt
 kxsg==
X-Gm-Message-State: ABUngvcTPZAKEPCBUyR5Do83nNwBkPDqvwuHYZEdFHTwAshju8TpG+99cqHCm6mToWE0DA==
X-Received: by 10.202.87.198 with SMTP id l189mr22867339oib.17.1477865396182; 
 Sun, 30 Oct 2016 15:09:56 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id q59sm7585484ota.20.2016.10.30.15.09.55
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 30 Oct 2016 15:09:55 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v6 09/18] fsi: Add crc4 helpers
Date: Sun, 30 Oct 2016 17:09:11 -0500
Message-Id: <1477865379-11566-10-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Sun, 30 Oct 2016 22:09:58 -0000

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
