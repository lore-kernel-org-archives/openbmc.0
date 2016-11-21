Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMXsb1NYgzDvjC
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 13:41:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="xlIyzzN7"; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id v84so20145341oie.2
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 18:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=N5NyQzJ6e/fsN4DqXJuw05apVoemhSyo9MmjGC3YLog=;
 b=xlIyzzN7TOrMBMhgyMAQ1WwGY6ftpB1T1ytg1K57qQ5Z2lcYu+ZRgmtXcWbwO4+DoW
 UWN5C4NT0DC7Eu0QCpjzrKtUbyXDuWr5IKFmmYciQTn9mcbOB1HR/LJKc2zsvVCFBzmE
 J0EQzw2qovcGsvLnyHq4Tjq3aHAO5n+GKm3nbW5JgvgF87yfrP9vtIddjkI4eBSPLUbc
 3tPx5mI7xanHnuJXLVFm631sSp+TrFqcV/AFUCSz/XuASfUAdYtVCTXx1Q8FrPTslTmJ
 ckE7wRxM96jp/cBYT8OxFetW1Y4ebJvk0+/Cw0BcG7VA4yw/edmYdmM01PlO3JFY7ocu
 b5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=N5NyQzJ6e/fsN4DqXJuw05apVoemhSyo9MmjGC3YLog=;
 b=kPyfVAZdRGSb90ifJTLA/9A95eiLwOB/RlYOiMpibjkmWmNKsCio56KX/CTOv9SqLX
 Jsh1Jx5qfdn0GSRQLxhca8hrI+MRnJkLX16uTY3w1yjbrNEI9v2pIMbuJyoKjPTxemi7
 X/0e50Z+scWbUFiDTdCBv1rK4wNlptLtfTPFuV0OPiYgfP2jSqkuz+x9Yty+geAdtTii
 mZi9SUXYwjIjQ/GdgLtzqQJBtg7RnM+5XVeVIbSt/orTBT4hql2u8gNN42nbSw7tLXU4
 G3nLZOpBFKqgUWb+yMcdFjThRLXsD8McI5knbqwKuBFVte0VWgsoTJwBy+uKP/wh2083
 ywYQ==
X-Gm-Message-State: AKaTC024hdyKbI3E6TT2N41BedfxLAOzhU5OJCfKAO9IL5iGmS7pEwt9r7WcsgMIcfnxRA==
X-Received: by 10.157.15.234 with SMTP id m39mr7775697otd.67.1479696065527;
 Sun, 20 Nov 2016 18:41:05 -0800 (PST)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id 73sm6432307otf.16.2016.11.20.18.41.04
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 20 Nov 2016 18:41:05 -0800 (PST)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org, gustavo.padovan@collabora.co.uk,
 gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch, jthumshirn@suse.de,
 dan.j.williams@intel.com, sre@kernel.org, clg@kaod.org,
 k.kozlowski@samsung.com
Cc: jk@ozlabs.org, joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 benh@kernel.crashing.org, alistair@popple.id.au
Subject: [PATCH linux 08/19] fsi: Add empty master scan
Date: Sun, 20 Nov 2016 20:40:37 -0600
Message-Id: <1479696048-75851-9-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1479696048-75851-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1479696048-75851-1-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailman-Approved-At: Mon, 21 Nov 2016 13:57:36 +1100
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
X-List-Received-Date: Mon, 21 Nov 2016 02:41:07 -0000

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
