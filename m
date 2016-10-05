Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sq7M63bGmzDrPG
 for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2016 07:54:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=x1VsN+hM; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id d132so3133141oib.2
 for <openbmc@lists.ozlabs.org>; Wed, 05 Oct 2016 13:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UuEsOFpIQim/epT06DtDjjKnMnHo9+FHgQaDiJv1MZ0=;
 b=x1VsN+hM7heZXSSZlj0EBpmDRYqZTgALVk0UYoY00LUB4J2mwgIR7mE349NOlFGtCi
 gRbv3PFsXY1CtzzvhBSpUUHXMygBdU05PuFOIdWph8EKGpgrUF9K4tn6dww/OIwNVpfO
 ALiHbDdYFdNfm40l7S4NqkShwlIrZ09B3ROw975m607+HnD+unqc7jf/WHTXUZdYYSnG
 Tt8YKOQqALWZUK/eoyHNJEOUJptif3v2lTGJx+z1FRmGMueMEKACRn/Kcb7cI0a//an+
 7sbVm/dvBfW9X9h68zA4o4IvRkFzQILxsEKHd9wc7unxvlpxEx7M3Xt/gUDmXCEvtKYj
 BmZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UuEsOFpIQim/epT06DtDjjKnMnHo9+FHgQaDiJv1MZ0=;
 b=JCvezYtq18B3dU+maIXacJtGEmyDcM7wFy6CrWSqQKb0KzboAqpZTOeR05rej2tCq1
 HLx1cf3e7C6S3mwAoPJMDMwzRh2CXFtPSsBu/lRuQwjxYWgD4FdY/q91ZP/erSKSchZG
 n4otnUDQu5FsOgimJYZg4E2BQYmTMAvbDvCoTUicd93qMkisIRastGf57qgVdhESvRgV
 Dr5QA3qlGicXPXDlTwblXTQBMX5EZRv5bUVfccx77jCKTG74DsBHGNuej51vAjPPylM+
 A2Il1in0zZi+FsgRNLMObh21tuc/sJH0S12MEm9O0LL1TsxVAeyvbrR7KBV+dcRQ1dDe
 mSjA==
X-Gm-Message-State: AA6/9RmQWUM4NgPxmr7rDozUhPTA80X1IoNFo8GyGVmwKJwYqzze0YucGufN1v0MQwYTdQ==
X-Received: by 10.202.60.2 with SMTP id j2mr8829362oia.94.1475700880692;
 Wed, 05 Oct 2016 13:54:40 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id i18sm3206459oib.12.2016.10.05.13.54.40
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 05 Oct 2016 13:54:40 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux 09/15] fsi: Add crc4 helpers
Date: Wed,  5 Oct 2016 15:54:22 -0500
Message-Id: <1475700868-75737-10-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1475700868-75737-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1475700868-75737-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Wed, 05 Oct 2016 20:54:43 -0000

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
