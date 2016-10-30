Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6Wrq2WRgzDvNf
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 09:10:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=JlTZo0Od; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id v84so2662044oie.2
 for <openbmc@lists.ozlabs.org>; Sun, 30 Oct 2016 15:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=N5NyQzJ6e/fsN4DqXJuw05apVoemhSyo9MmjGC3YLog=;
 b=JlTZo0Od5/Kz5u2SZ2ZckWd2yNTp/FOgGhp6ZWnk1jRsVdwkpPVcXuapLEmKOfoXHA
 Xtb8U29bghhZXnYlaHZ6lonY/4zicC8GH2OcwlZuaCZ5EizQdJlSuo2YcQv5bIoX0Rpf
 bJPWIDPCw+eV8M0ii2Ps8NYMcH7lDcsc8qMuoz/J62r7n9CzVF7AQlnuxkhCPtNa3kbt
 N7X6wXx6a+hrqbTBcTJI3yuj3YXAaCietZXsmaDCh2xzzAYdxkU6y+GUFm2OzTTQFz61
 cLubOmIO+5pxWsYhqTgUWK3kcU5pqHF09z08ELa3f39+1y36vWZQJOaBaVm87/LbFepR
 QN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=N5NyQzJ6e/fsN4DqXJuw05apVoemhSyo9MmjGC3YLog=;
 b=Hvzb9zR7lt7zZ3FM+W1p8H/xVI+idND93Wb5U6Ogp4mQy5W35/q4sS8BBhtoDwFgap
 TGhdwPMLhf/6yMZExk2o3etyn7QXDArG94kHLfq3yvNbsso5Jq0fHhtiUlOLED7f+4zk
 S0ITSveBk1asgd9hC5+9yaCS6zeTrDSamLWFUVDJR1j7eTAbMXp8rMGVxi0bpOAoo630
 kIubYFcjAyr3cC/kBACgTOnv+cuprMgOXRPrzoaTYpBobqipmXOvXZO17hQWpV5bl8C3
 S14zFyMSdDlk+sdsKlZHI9aLTWeE411ECHZsstwZZ3OcHXDvAoTZLsp4fe+XBCqb0zSE
 c+QA==
X-Gm-Message-State: ABUngvfK+HHW8ksecfkHRCv+ZuhARGjBQ9bm+pd6tdT5k2mnjLU3W47pXy4YJspKoxlTcA==
X-Received: by 10.157.36.232 with SMTP id z95mr18303427ota.124.1477865417673; 
 Sun, 30 Oct 2016 15:10:17 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id q59sm7585484ota.20.2016.10.30.15.10.16
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 30 Oct 2016 15:10:16 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v6 08/18] fsi: Add empty master scan
Date: Sun, 30 Oct 2016 17:09:29 -0500
Message-Id: <1477865379-11566-28-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Sun, 30 Oct 2016 22:10:20 -0000

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
