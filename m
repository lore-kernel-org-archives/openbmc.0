Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::243; helo=mail-pg0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SaCXUb6k"; 
 dkim-atps=neutral
Received: from mail-pg0-x243.google.com (mail-pg0-x243.google.com
 [IPv6:2607:f8b0:400e:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 418H5Y2CbBzF0n5
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jun 2018 13:44:17 +1000 (AEST)
Received: by mail-pg0-x243.google.com with SMTP id l65-v6so6880365pgl.8
 for <openbmc@lists.ozlabs.org>; Sun, 17 Jun 2018 20:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=0Up3Tv+nbCvxwNuSESf3VFo3MW1XdBSwKFcdHM2c8c8=;
 b=SaCXUb6k8vZrUaAGwGLCkB3qL/6jaDHHIwoGtrLcCjcewPHpHamd16xwUzUO9LJgux
 2tPWSY+Si3YLCO/IPgjAXtaTuxLKeaQXDpSGBgM2ZOhG+CLQPtadDHntmoc7SAdVgDmc
 ZM8vnTsSPtttcitPmuLZ6mVXTws8hXWkTlyJOKkTdhnZYQofhRwz6SX8cEgvNWDRvQAE
 fKVe2SDVEHv0LC0HB1mk+rDNj6Q8gIvqMTuwDOREYfLScUdb9ILGW9yEDFvlHziasa9v
 idMo2yToYv3w9dX1CabqcryJqkyz9L+fJ3CKDdsNq3OVJdpBhU6oIOEdx387JbWgdxvq
 iA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=0Up3Tv+nbCvxwNuSESf3VFo3MW1XdBSwKFcdHM2c8c8=;
 b=b4SUYoI9viMpC971Py+Xf3578Pwz74s1zNgT5YyLn7oTR4QYyXPQiiRJdF9rU94ewi
 guH4pxlSS5ZWnTxyWnkGg+1rLgOSAeJ/NsomOSz4QTjHRBB/0vlAXx0kBgxcWwmzPG6I
 ylp9C1ickIk8G6VFFmlq9eiEz7lkWv5x4iPuLRzKqEp72OTpe2nXG3t/keSuo2JL0pZo
 OBWnQxUH18Avmnqy6hK0vewP36Xg4GUlFio5uNLN10yY2IU08eMulcXMvQxFBsk1UHsP
 TZSClYPtMzNm7lzgHuivhRYkN1+Kd27b2EdummUbgqF2+qSVpv6TO5KfeORRmy9REu4y
 8GoQ==
X-Gm-Message-State: APt69E3ahwSoU/0N+aQkvV9Akey7eFhUJcwKwY/+jhFXQHF5w5pcCobg
 TArRmTDqEKSKhZqqxkwoVs28516/
X-Google-Smtp-Source: ADUXVKJAWQbddWqZrUstqgOiQe5nz9rY1ye25OsD06bVejwKQETcmWe1CpXUCV9+N0sYlLiGdd9sdA==
X-Received: by 2002:a62:f948:: with SMTP id
 g8-v6mr11652062pfm.107.1529293454997; 
 Sun, 17 Jun 2018 20:44:14 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id i4-v6sm20730939pfk.133.2018.06.17.20.44.12
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 17 Jun 2018 20:44:14 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Mon, 18 Jun 2018 13:14:09 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH 5/5] fsi: core: Fix sparse warnings
Date: Mon, 18 Jun 2018 13:13:35 +0930
Message-Id: <20180618034335.9732-6-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180618034335.9732-1-joel@jms.id.au>
References: <20180618034335.9732-1-joel@jms.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Jun 2018 03:44:17 -0000

fsi-core.c:210:9: warning: cast to restricted __be32
fsi-core.c:210:9: warning: cast to restricted __be32
fsi-core.c:210:9: warning: cast to restricted __be32
fsi-core.c:210:9: warning: cast to restricted __be32
fsi-core.c:210:9: warning: cast to restricted __be32
fsi-core.c:210:9: warning: cast to restricted __be32
fsi-core.c:210:9: warning: cast to restricted __be32
fsi-core.c:210:9: warning: cast to restricted __be32
fsi-core.c:210:9: warning: cast to restricted __be32
fsi-core.c:210:9: warning: cast to restricted __be32
fsi-core.c:210:9: warning: cast to restricted __be32
fsi-core.c:210:9: warning: cast to restricted __be32
fsi-core.c:606:15: warning: incorrect type in assignment (different base types)
fsi-core.c:606:15:    expected unsigned int [unsigned] [assigned] [usertype] smode
fsi-core.c:606:15:    got restricted __be32 [usertype] <noident>
fsi-core.c:492:28: warning: expression using sizeof(void)
fsi-core.c:520:29: warning: expression using sizeof(void)
fsi-core.c:682:19: warning: cast to restricted __be32
fsi-core.c:682:19: warning: cast to restricted __be32
fsi-core.c:682:19: warning: cast to restricted __be32
fsi-core.c:682:19: warning: cast to restricted __be32
fsi-core.c:682:19: warning: cast to restricted __be32
fsi-core.c:682:19: warning: cast to restricted __be32
fsi-core.c:706:24: warning: incorrect type in assignment (different base types)
fsi-core.c:706:24:    expected unsigned int [unsigned] [usertype] llmode
fsi-core.c:706:24:    got restricted __be32 [usertype] <noident>

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-core.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 4c03d6933646..a3f0d41f4c59 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -190,7 +190,7 @@ static int fsi_slave_calc_addr(struct fsi_slave *slave, uint32_t *addrp,
 static int fsi_slave_report_and_clear_errors(struct fsi_slave *slave)
 {
 	struct fsi_master *master = slave->master;
-	uint32_t irq, stat;
+	__be32 irq, stat;
 	int rc, link;
 	uint8_t id;
 
@@ -390,7 +390,6 @@ static struct device_node *fsi_device_find_of_node(struct fsi_device *dev)
 static int fsi_slave_scan(struct fsi_slave *slave)
 {
 	uint32_t engine_addr;
-	uint32_t conf;
 	int rc, i;
 
 	/*
@@ -404,15 +403,17 @@ static int fsi_slave_scan(struct fsi_slave *slave)
 	for (i = 2; i < engine_page_size / sizeof(uint32_t); i++) {
 		uint8_t slots, version, type, crc;
 		struct fsi_device *dev;
+		uint32_t conf;
+		__be32 data;
 
-		rc = fsi_slave_read(slave, (i + 1) * sizeof(conf),
-				&conf, sizeof(conf));
+		rc = fsi_slave_read(slave, (i + 1) * sizeof(data),
+				&data, sizeof(data));
 		if (rc) {
 			dev_warn(&slave->dev,
 				"error reading slave registers\n");
 			return -1;
 		}
-		conf = be32_to_cpu(conf);
+		conf = be32_to_cpu(data);
 
 		crc = crc4(0, conf, 32);
 		if (crc) {
@@ -597,15 +598,16 @@ static uint32_t fsi_slave_smode(int id)
 static int fsi_slave_set_smode(struct fsi_master *master, int link, int id)
 {
 	uint32_t smode;
+	__be32 data;
 
 	/* set our smode register with the slave ID field to 0; this enables
 	 * extended slave addressing
 	 */
 	smode = fsi_slave_smode(id);
-	smode = cpu_to_be32(smode);
+	data = cpu_to_be32(smode);
 
 	return fsi_master_write(master, link, id, FSI_SLAVE_BASE + FSI_SMODE,
-			&smode, sizeof(smode));
+			&data, sizeof(data));
 }
 
 static void fsi_slave_release(struct device *dev)
@@ -661,9 +663,10 @@ static struct device_node *fsi_slave_find_of_node(struct fsi_master *master,
 
 static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 {
-	uint32_t chip_id, llmode;
+	uint32_t chip_id;
 	struct fsi_slave *slave;
 	uint8_t crc;
+	__be32 data, llmode;
 	int rc;
 
 	/* Currently, we only support single slaves on a link, and use the
@@ -672,13 +675,13 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 	if (id != 0)
 		return -EINVAL;
 
-	rc = fsi_master_read(master, link, id, 0, &chip_id, sizeof(chip_id));
+	rc = fsi_master_read(master, link, id, 0, &data, sizeof(data));
 	if (rc) {
 		dev_dbg(&master->dev, "can't read slave %02x:%02x %d\n",
 				link, id, rc);
 		return -ENODEV;
 	}
-	chip_id = be32_to_cpu(chip_id);
+	chip_id = be32_to_cpu(data);
 
 	crc = crc4(0, chip_id, 32);
 	if (crc) {
-- 
2.17.1
