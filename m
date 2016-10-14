Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3swhjd3vT7zDt4q
 for <openbmc@lists.ozlabs.org>; Sat, 15 Oct 2016 09:15:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=g0Uglg7m; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id i85so4554484pfa.0
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 15:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UuEsOFpIQim/epT06DtDjjKnMnHo9+FHgQaDiJv1MZ0=;
 b=g0Uglg7m+9QIaVGHTwWZQp66l2kHzHCZoBwTQNnijM2GpGHE1mwcAw4DC/+Y/XtvB5
 ofMN/MNxancioquLDe14A9VTQ/8M8u6JmuSDHt4IHVvPRCu5G14F1QNQ55Vg6ENpe2lJ
 6ihVGqlt0HnglokX4aqQjetIk8z6OBDRqeaAihPMS9IXneOdbNHr4rkHD01m5lvcYBXV
 HB2/sxY4VA69o/YKDXw++LIMF5FBeTOUEVKE/jGwV97edmiXoQluqwh5jaK/tqfFhH5V
 Z1eGUekRFxmX2NkOyg/TfJi1ZrqLrByC/XPYzaWvQbmhiaVBgaKEfmmG/EsaoE51jPr8
 2Oxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UuEsOFpIQim/epT06DtDjjKnMnHo9+FHgQaDiJv1MZ0=;
 b=HhVYojS4vqqhNr9Lec2oZN65MNkPcdtR5Wiukde5E37TJVhhWFwIvRYnjStbDPJ6Dl
 XXtWMfZr95C/D9Cgk7doD1Y8ahud5jlFh0jQFigINcY/Z0+Wiq4YoVRgK9pOvPH9fgNQ
 FRXXcwP3EzbrD5eb3QFrZQiZETHHJtqM9dvp5qCJ3hvove38uAtqx34BDwlo9czSy3Hy
 Nsk7HHABsxQGFhlJovis8ugtl4r7wB8ydZXGUMT1JGjF7e4hPDtsqStVewuiu0YHJzme
 8KyevubfNvGJ8bAJHKiaWoSUiNc+3e3nOwibYZUvAq8jwVhdIvkaBNjDK1VkM2Hiy3bR
 XLUQ==
X-Gm-Message-State: AA6/9RnfaE3P++RRyo7iJ1llKFNLeymYJJHBWJ2SgonxNNC9QIL8L01X9tZmA+cHdk0tJQ==
X-Received: by 10.99.37.196 with SMTP id l187mr17617037pgl.91.1476483300005;
 Fri, 14 Oct 2016 15:15:00 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id p7sm29848874paa.3.2016.10.14.15.14.59
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Fri, 14 Oct 2016 15:14:59 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v4 09/20] fsi: Add crc4 helpers
Date: Fri, 14 Oct 2016 17:14:31 -0500
Message-Id: <1476483282-85971-10-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Fri, 14 Oct 2016 22:15:02 -0000

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
