Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3swhjk6QZMzDt3S
 for <openbmc@lists.ozlabs.org>; Sat, 15 Oct 2016 09:15:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=SBB5ldDi; 
 dkim-atps=neutral
Received: by mail-pf0-x243.google.com with SMTP id s8so7955490pfj.2
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 15:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7KmYC1fb+GFar1qklbyw5BRzBi0T8N8ggTCNDQr/A6I=;
 b=SBB5ldDiz9craFgiF9IIszv1KZkTFTPoRiWcQaMC8726/mEgo+y6X8cpKu+xEiZeYT
 2RmOxwCNsOk15IN8KKMZsXo2p3GTDUGeivGLfisGRVlEVmAla+1jBMzvoF1Z3Kj1hcsv
 pniqAvHBMXL0+gM1TJrM1B3jDPGh+M60cZTqVHfG/S7lezcPPdDbV46zXPMdx/281yZx
 omrLO8fWXWb9583RlfHIZt0VFqBB+FN3JhxhxI62Ol3dSjXQ9mT9OIPkxXsquOp54dOS
 BsHIc86hE8k/++0BuJAYcL4CghM2Y+P/PAZq4o595tgFd91p81R/AucTfYMpYGl9Eh//
 8E1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7KmYC1fb+GFar1qklbyw5BRzBi0T8N8ggTCNDQr/A6I=;
 b=ixe6sVhZPuaHuSOv61jI1Qsjg67P+mn76DEiTTUbNfPw0M8i9JRJUgC1PHn/arGSMv
 AaoK93WlMeYXmrCREpG2ULiLIspHNfmuCYu00lINYHN/daVYeRXmuNLNBw1MLdP9R8vz
 90BVivOlmj3UhbjZfqkCseeWDP46b2HAhjvv19PpVz0Tt2ABZMYqukw1G5obOT7kFP4x
 Q/x9uu+tBrJujOjJFKQ3fb4vQF98VmALtcBB45kNSBps9+Xo5PU/GTqAGyB/BYbrH/Sk
 UFyswK87U1S6e+GHikmqxGqkHqnf5L5MYGyViaSfdPgHxhlqEkvG66JV/2JtPqbj1XYa
 Qb2w==
X-Gm-Message-State: AA6/9RmlcPfjrmI/3B3N2FVeXewZNhemPQBKXVnIhY+jzg39qmOO9jUEicbRSgSfhhLsJw==
X-Received: by 10.99.140.80 with SMTP id q16mr17911778pgn.31.1476483305330;
 Fri, 14 Oct 2016 15:15:05 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id p7sm29848874paa.3.2016.10.14.15.15.04
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Fri, 14 Oct 2016 15:15:04 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux v4 14/20] drivers/fsi: CRC Utility Updates
Date: Fri, 14 Oct 2016 17:14:36 -0500
Message-Id: <1476483282-85971-15-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Fri, 14 Oct 2016 22:15:07 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Provided by Jeremy Kerr.  Revise the CRC calculation utilities
to take variable bit length input.

Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 drivers/fsi/fsi-core.c   | 16 +++++++++-------
 drivers/fsi/fsi-master.h | 21 +++++++++++++++++++++
 2 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 10bf817..07f5034 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -111,21 +111,23 @@ static const uint8_t crc4_tab[] = {
 	0x1, 0x6, 0xf, 0x8, 0xa, 0xd, 0x4, 0x3,
 };
 
-static uint8_t crc4(uint32_t x)
+uint8_t fsi_crc4(uint8_t c, uint64_t x, int bits)
 {
-	uint8_t c = 0;
 	int i;
 
+	/* ALign to 4-bits */
+	bits = (bits + 3) & ~0x3;
+
 	/* Calculate crc4 over four-bit nibbles, starting at the MSbit */
-	for (i = 28; i >= 0; i -= 4)
+	for (i = bits; i >= 0; i -= 4)
 		c = crc4_tab[c ^ ((x >> i) & 0xf)];
 
 	return c;
 }
 
-static bool check_crc4(uint32_t x)
+static bool check_crc4_u32(uint32_t x)
 {
-	return crc4(x) == 0;
+	return fsi_crc4(0, x, 32) == 0;
 }
 
 /* FSI slave support */
@@ -171,7 +173,7 @@ static int fsi_slave_scan(struct fsi_slave *slave)
 
 		conf = be32_to_cpu(conf);
 
-		if (!check_crc4(conf)) {
+		if (!check_crc4_u32(conf)) {
 			dev_warn(&slave->dev,
 				"crc error in slave register at 0x%04x\n",
 					i);
@@ -247,7 +249,7 @@ static int fsi_slave_init(struct fsi_master *master,
 	}
 
 	chip_id = be32_to_cpu(chip_id);
-	if (!check_crc4(chip_id)) {
+	if (!check_crc4_u32(chip_id)) {
 		dev_warn(master->dev, "slave %02x:%02x: invalid chip id CRC!\n",
 				link, slave_id);
 		return -EIO;
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
