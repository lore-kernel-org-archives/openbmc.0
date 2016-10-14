Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3swhjc3SLMzDt4k
 for <openbmc@lists.ozlabs.org>; Sat, 15 Oct 2016 09:15:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=aEF/GA+i; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id i85so4554466pfa.0
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 15:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=N5NyQzJ6e/fsN4DqXJuw05apVoemhSyo9MmjGC3YLog=;
 b=aEF/GA+iEdq/7rql1F4x3xTQR+TfY0dth0iu8WdzGcWNCO3I5iPFDIK2+AafHCjIIw
 ELp+/PTxfdUAHL702vmGsq2gL8dK+0wJO3tHfTEqE7R0o3EUJV5dA/nEeB9dD2DMVofc
 HfFQs+ii2LQRVFwmyYPnQHjeKjj0AaSjdb2iEigvxj+VYG8bsRUzRcs68mTCrykZlp1R
 hTlgAM58l6oMr1fEZV7oo8Ptx+LFaoak6WpIC6r1fEX2m2m7SSGnd/p1V/3LREMbr3OT
 8O2qYEXQbwTSuGLgx+q/gmQk9VX7PBzeQkvlcQ62Ct23RQKZfWwibCai2vi8QMv0DN7y
 qFmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=N5NyQzJ6e/fsN4DqXJuw05apVoemhSyo9MmjGC3YLog=;
 b=FVphuSFQN+d9djtUqYrDH04C8ZOLKdvI22AbvhzBsEO+HyhmzuN2cZTvP3m6A+QWrj
 DRMHr26fHMTCVPpD/zJILPIpGld1QTbwbeMtZT43e9XPNRGhKif2Xva0GxPYKE6SEQBB
 8Xh9Qdker+wY6kd03/JwukuneofcHGS/nYJrkdxJ0JtNGSXNGz9FsGaJYjSlws4EK5Kx
 QYNnj5HGen4apOAcvsmneQvX/7Rz6eYF0DrhCgR9vrRnF5tfGYLz91mj56ATgYjnE4wX
 /S0Srffcr+UEvBOv9i9uSGhLwVAiQdnpadA9lGuOL1IoUi0lA+lXzZVdLI3ShqMdNyUY
 Tb9A==
X-Gm-Message-State: AA6/9RmwUePkuYUGdjYBV4oKRbBwpCXhq9CwlpRgL2CLm9lil9Hax7Ng1xqf9pxlttdN+g==
X-Received: by 10.99.116.76 with SMTP id e12mr17963526pgn.20.1476483298935;
 Fri, 14 Oct 2016 15:14:58 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id p7sm29848874paa.3.2016.10.14.15.14.57
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Fri, 14 Oct 2016 15:14:58 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v4 08/20] fsi: Add empty master scan
Date: Fri, 14 Oct 2016 17:14:30 -0500
Message-Id: <1476483282-85971-9-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Fri, 14 Oct 2016 22:15:01 -0000

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
