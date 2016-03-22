Return-Path: <joel@jms.id.au>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qTZqY5VJfzDq6X
 for <openbmc@lists.ozlabs.org>; Tue, 22 Mar 2016 12:29:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=JroVlASV; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id n5so32887870pfn.1
 for <openbmc@lists.ozlabs.org>; Mon, 21 Mar 2016 18:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=t1iZRbMu98PCOh9lrf+UpWc3oNLrx7yABoL/tIThEEg=;
 b=JroVlASV8FBZh7Mq1aCuLXDR1QFcbBg7EvZQvp7Inx/CTZpTW4IlqmvZQkqu12zW9M
 i6sZo8k+oIpSHcUvopBbO5oq9GqTIPZHk9UVfuW8nm4vEZ7dxZfHDaIbR2aVLHmw8OCS
 vBdLLrHhvKfDsheQfh6PRjc91prOt4JvWjI+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=t1iZRbMu98PCOh9lrf+UpWc3oNLrx7yABoL/tIThEEg=;
 b=SHqpLuUX8abNn385OUV6tS148toQjE7a1gwKZpnrppoj/epnVNxVP6RnURfUvLY2UK
 LZf2u8V9e8/7OwV7/SQhutFsHWSgzukIJb/U3vFraj7JQLZSFszYf4sOEeH1c8ggP8TT
 K1NicjtG4lOYVsvu0+qsCzE9Sz5uypj3ouV+t8harBc9AEWGJMrf6v2tPerANY4+0WBj
 ZcXhYFErtu4PnJtSh8EasF/H/08AHc4+KZ39cqkNEUNDlYF3xuiSS0e1W21EnWv78XLO
 +BP5RdpzfoAMXP7YFUZ9dVYDim0qnKd0MRztfbaBr+SxfVZuar+0wsgWvrLgNlysz/lQ
 LX5A==
X-Gm-Message-State: AD7BkJKyGeYDuO0PHq+Kt9jnzt+hpPR8IB/uPBL8rflpcyUNthVJugtnOoJiVajaoCq9kA==
X-Received: by 10.66.102.106 with SMTP id fn10mr50708291pab.60.1458610167311; 
 Mon, 21 Mar 2016 18:29:27 -0700 (PDT)
Received: from icarus.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id r88sm43531742pfi.9.2016.03.21.18.29.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Mar 2016 18:29:26 -0700 (PDT)
Received: by icarus.jms.id.au (Postfix, from userid 1000)
 id 3113C100317; Tue, 22 Mar 2016 11:59:21 +1030 (ACDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 1/2] hwmon/adm1275: Add device tree support
Date: Tue, 22 Mar 2016 11:59:18 +1030
Message-Id: <1458610159-11814-1-git-send-email-joel@jms.id.au>
X-Mailer: git-send-email 2.7.3
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Mar 2016 01:29:30 -0000

This adds a of_device_id table so we can probe the driver using the
device tree.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/hwmon/pmbus/adm1275.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index 3baa4f4a8c5e..1476a127dbdb 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -22,6 +22,7 @@
 #include <linux/slab.h>
 #include <linux/i2c.h>
 #include <linux/bitops.h>
+#include <linux/of.h>
 #include "pmbus.h"
 
 enum chips { adm1075, adm1275, adm1276, adm1278, adm1293, adm1294 };
@@ -344,6 +345,19 @@ static const struct i2c_device_id adm1275_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, adm1275_id);
 
+#ifdef CONFIG_OF
+static const struct of_device_id adm1275_of_match[] = {
+	{ .compatible = "adi,adm1075" },
+	{ .compatible = "adi,adm1275" },
+	{ .compatible = "adi,adm1276" },
+	{ .compatible = "adi,adm1278" },
+	{ .compatible = "adi,adm1293" },
+	{ .compatible = "adi,adm1294" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, adm1275_of_match);
+#endif
+
 static int adm1275_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
@@ -598,6 +612,7 @@ static int adm1275_probe(struct i2c_client *client,
 static struct i2c_driver adm1275_driver = {
 	.driver = {
 		   .name = "adm1275",
+		   .of_match_table = of_match_ptr(adm1275_of_match),
 		   },
 	.probe = adm1275_probe,
 	.remove = pmbus_do_remove,
-- 
2.7.3
