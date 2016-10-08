Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3srtt41Q3dzDrWZ
 for <openbmc@lists.ozlabs.org>; Sun,  9 Oct 2016 04:39:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=ypyV/goZ; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id r132so5441512oig.1
 for <openbmc@lists.ozlabs.org>; Sat, 08 Oct 2016 10:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UuEsOFpIQim/epT06DtDjjKnMnHo9+FHgQaDiJv1MZ0=;
 b=ypyV/goZoya423TVPCMqWb04vUWN2UX5lH0JBbst4GNRs/dH1DTUFYXOp95xe9hpGu
 JqgHWiI4HRKPQKngNFrchSC1zxykCEPT32S4FzZtdqI8uX1NtOQ94hL2pv59B+BytEEU
 d4Hoqu28t8lMQExeAW0z6siF4bxC8+LUu0UGRAjbxtamEDZf55dhCWovFTH99ZJkZQf2
 5p0r5nWmwe4dyhzAvJs6M2Ch06Y995Rl031J+3DFeW65ulkg7mQtmNNtCejqowvtleGO
 22BkPZ8KSpb82SX8XxBFma6oadZPkbRlU7p4tYB65FiInPE55iskQ71f985SKMg/8p2K
 G3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UuEsOFpIQim/epT06DtDjjKnMnHo9+FHgQaDiJv1MZ0=;
 b=IDRz2851QsdUUWgRF4KWDFudWRzt6y9F/66UXUSeFTHbgaAUkd+l3pL91OLPqsxqdd
 8TNwWq0YxIev1i3YRjU2G+2BcCChe4myFlLJ3kj+4MW82MPNQk+3bNpuEzT6BZpz4Awu
 F0fxRpq8FmVemz/MkOZne/8VX0BQBO2Fxi9TIcsLOacEg8H35cR8Zmpd891+DkzBsFYR
 gBh6BOamKEU6KI07rVOgOsC3MTEKHBcNXAB1TjTpD9R/zg5AyXo/jH9wOzcbqt0bLg6R
 TEejKPVFfDE/x+b7/DXwEos9T2B0c+MEm9R5TetxxL90Vteo5vwITamAu44AnXSO6r+2
 ZVog==
X-Gm-Message-State: AA6/9RkEroUHc5DS7Y8Ne4sjq3+8w+D3SKJghkpQxn0kyRrxZFGOfRD49tiXPQ/K5lPapw==
X-Received: by 10.157.58.35 with SMTP id j32mr4063625otc.166.1475948346108;
 Sat, 08 Oct 2016 10:39:06 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id g17sm8025290otd.38.2016.10.08.10.39.05
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sat, 08 Oct 2016 10:39:05 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v2 09/17] fsi: Add crc4 helpers
Date: Sat,  8 Oct 2016 12:38:45 -0500
Message-Id: <1475948333-55960-10-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1475948333-55960-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1475948333-55960-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Sat, 08 Oct 2016 17:39:08 -0000

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
