Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3str4w1SkbzDsrT
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 08:40:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=WsuWJyFI; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id i127so2272030oia.0
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 14:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UuEsOFpIQim/epT06DtDjjKnMnHo9+FHgQaDiJv1MZ0=;
 b=WsuWJyFIMNeOGYF9HArQqZt60LeS4+XMpyFp6UPSYS5yDsZ+qy7BVvhooWK5XIENVG
 SWyHlcFLq7ROXQrx5rVaXPaJV7v79yjGFwldfnvn6B0H8JPQ3GMVGCyF1cG7H/IlpQOx
 +PWwZXO8Ps9IONYxwp+0z/6RUuAOhmZhT65bifhFH6jJdpAsuiMHcsDHHsuqzq3IXEmr
 6yOSBD5Yb72bUHPgWhns0SxCXp09SGlKL9oJpeCUn+LjdQYXKD5NZOT96bWfwz9HNw0O
 bw9tkodv6aYQz3XGc6EVoB1JX85r0i2ceZptiQKxm+yK9QvWg3LZv9u8YYromnHcxS0C
 NeEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UuEsOFpIQim/epT06DtDjjKnMnHo9+FHgQaDiJv1MZ0=;
 b=RmY9Uh+a34FDO0EJvm+8W4hJPpGVAN/x1A1gsh1cFBrxyIiW6+kHmcrcJsh3KL569R
 EYkgKjl5SOkK4+97W+StMMRwimX54DD4plxhUdyZDLhrINCbbWg19VbFLDzHRRthDhWf
 7hKr1eCm/671Bq0X7MdUAT6smhN0CdBM2VtMWdG889gVdMiden12BkXQUBupg4dVUNB9
 31ASiAB7VTHi8zCw175NDwRH+2/H5jkOCJdqIDX5qXNkivhniBVv1xL6DTdApk8kFpUh
 9VbnHnQTxkGrsrQ6fpEMAH09dcsOaLsSxJ9+RTVo/trxftVdk6ipU66xXRKOz6mS6Jiw
 bD0g==
X-Gm-Message-State: AA6/9RlvDxb0L0h+7G50oN1mNOJDWFxA/Odl8FhlvsokGusWLL6KjN6DqpfF3gztaRP84g==
X-Received: by 10.157.16.27 with SMTP id h27mr3012310ote.192.1476222014520;
 Tue, 11 Oct 2016 14:40:14 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id h91sm1811153oth.40.2016.10.11.14.40.14
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Tue, 11 Oct 2016 14:40:14 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v3 09/18] fsi: Add crc4 helpers
Date: Tue, 11 Oct 2016 16:39:54 -0500
Message-Id: <1476222003-99697-10-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1476222003-99697-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1476222003-99697-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Tue, 11 Oct 2016 21:40:16 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Add some helpers for the crc checks for the slave configuration table.
This works 4-bits-at-a-time, using a simple table approach.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/fsi/fsi-core.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 9744a55..24538ae 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -34,6 +34,29 @@ struct fsi_slave {
 
 #define to_fsi_slave(d) container_of(d, struct fsi_slave, dev)
 
+/* crc helpers */
+static const uint8_t crc4_tab[] = {
+	0x0, 0x7, 0xe, 0x9, 0xb, 0xc, 0x5, 0x2,
+	0x1, 0x6, 0xf, 0x8, 0xa, 0xd, 0x4, 0x3,
+};
+
+static uint8_t crc4(uint32_t x)
+{
+	uint8_t c = 0;
+	int i;
+
+	/* Calculate crc4 over four-bit nibbles, starting at the MSbit */
+	for (i = 28; i >= 0; i -= 4)
+		c = crc4_tab[c ^ ((x >> i) & 0xf)];
+
+	return c;
+}
+
+static bool check_crc4(uint32_t x)
+{
+	return crc4(x) == 0;
+}
+
 /* FSI slave support */
 static int fsi_slave_init(struct fsi_master *master,
 		int link, uint8_t slave_id)
-- 
1.8.2.2
