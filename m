Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-it0-x243.google.com (mail-it0-x243.google.com
 [IPv6:2607:f8b0:4001:c0b::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sznhk1p4XzDt2L
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 10:09:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=PdOnpWWE; 
 dkim-atps=neutral
Received: by mail-it0-x243.google.com with SMTP id e203so3157409itc.1
 for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2016 16:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=N5NyQzJ6e/fsN4DqXJuw05apVoemhSyo9MmjGC3YLog=;
 b=PdOnpWWEv/z01EotOfIbVkrbuDspHs/xIzQ7Uf04TKpWjPBgX1LOgd7u/YniNtLPRz
 6v/5qDOqNt5t3tQYa96GkNH8+l/cXPPsRZgxl31/oEL5wGcJU6KOnkFfmlweecJaKD16
 8AHBtkC7V1yrRoZE07XM+KuTvOO+gK4vdKmOkonDwyG+9j74mpnYGwfBMCW+JPgu376M
 vxlA/hmMZJ+WqXYiMyPl/7TUFyCAoc78Ny/mHU3HX8ZzueSSj93VEjpLpRkTms46ccpv
 70qWC5MsGwkHaS6F1pYMJnoretTuiCUaLvV6GfQIGTIQX5fd4yBBduMrXdr5IE36OCej
 F4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=N5NyQzJ6e/fsN4DqXJuw05apVoemhSyo9MmjGC3YLog=;
 b=YINS/Snbm/BGln5LnuAJoyh42hX2CelshMJ6ZRbi2GZxM6r92gm6JTpJM8ElsF4eTV
 0BvYNmST8fSqrw44ket1f3ra/OYmWW31QAmRaUXIKxjawgTuqEacKZAZuHUDpIU4QXoj
 PX6Be19AAkUG2VW+SjjtQhCU+pV5aAee7oTBhHpNupxaN96c53Mt08IoPiBJFIg+BxtJ
 01YJ7oHTUjNyt6nnuZ9iD6OzXKnFYVy9QNj26/zAShqKfRs4S2GDw+rG3gC5bw/bLIf7
 nXzP2sTumMPAc4SqBV2TC/HzLuh9r8lgMDuCmvlLVuJ0kl8cXaKzMZcdnbfWzYxwkTIm
 HxxA==
X-Gm-Message-State: AA6/9RnXx/riMYF7Lzgi+BgXdHI8fmoHg5kqKf61XBeQdIgLmKe26RLkS3Ida5F2gHKyLg==
X-Received: by 10.202.71.83 with SMTP id u80mr6150082oia.84.1476918596576;
 Wed, 19 Oct 2016 16:09:56 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id n196sm15487618oig.8.2016.10.19.16.09.56
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 19 Oct 2016 16:09:56 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v5 08/18] fsi: Add empty master scan
Date: Wed, 19 Oct 2016 18:09:36 -0500
Message-Id: <1476918586-13475-9-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Wed, 19 Oct 2016 23:09:58 -0000

From: Jeremy Kerr <jk@ozlabs.org>

When a new fsi master is added, we will need to scan its links, and
slaves attached to those links. This change introduces a little shell to
iterate the links, which we will populate with the actual slave scan in
a later change.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/fsi/fsi-core.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 7df4291..9744a55 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -21,6 +21,8 @@
 
 #include "fsi-master.h"
 
+#define FSI_N_SLAVES	4
+
 static atomic_t master_idx = ATOMIC_INIT(-1);
 
 struct fsi_slave {
@@ -32,12 +34,34 @@ struct fsi_slave {
 
 #define to_fsi_slave(d) container_of(d, struct fsi_slave, dev)
 
+/* FSI slave support */
+static int fsi_slave_init(struct fsi_master *master,
+		int link, uint8_t slave_id)
+{
+	/* todo: initialise slave device, perform engine scan */
+
+	return -ENODEV;
+}
+
 /* FSI master support */
 
+static int fsi_master_scan(struct fsi_master *master)
+{
+	int link, slave_id;
+
+	for (link = 0; link < master->n_links; link++)
+		for (slave_id = 0; slave_id < FSI_N_SLAVES; slave_id++)
+			fsi_slave_init(master, link, slave_id);
+
+	return 0;
+
+}
+
 int fsi_master_register(struct fsi_master *master)
 {
 	master->idx = atomic_inc_return(&master_idx);
 	get_device(master->dev);
+	fsi_master_scan(master);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(fsi_master_register);
-- 
1.8.2.2
