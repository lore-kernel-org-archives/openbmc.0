Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3str4v4HBCzDsrV
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 08:40:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=deVUvsf6; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id e12so2264174oib.3
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 14:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=N5NyQzJ6e/fsN4DqXJuw05apVoemhSyo9MmjGC3YLog=;
 b=deVUvsf6VCNQ99jDGRY9XUJIAzLNIaHb8+EnHxWEmH2UE0jmJ7VlSPeXqhKWSedqRO
 +qbjxPcICmUv+1CDy1bj0pKjglekdLL66LE/pfQEXfj8Md6eEnF9SJLHZy5PFYLE0OKF
 DXwXiD6OHzpylYAXQD7PuVjn96wYOgBYVULK9jeqJLC+JyJmmqwZiwsTcCNnRHL0fzI1
 prLSCQlBF4Kt+tHzm4xEJFfwRENHFlWRHKskC6qwaZPjf9Zxuxf0G/VtQwr+eXRTylod
 glEcda7/6qPJ4RD8qZa8LSNvWnVc6yqHxlTClg0Hpn6TYcoZholVvVtG/sB9OQu2yGWB
 Ibvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=N5NyQzJ6e/fsN4DqXJuw05apVoemhSyo9MmjGC3YLog=;
 b=DJR3h4RNccoRTZ2yGFn9mYk8+CLcChKNjOYXVo6/3ordofT8jL9LJXP8ISxUuVk+4i
 73U+W3UTb+EbnQcOWO7qP7xa4VNdPsMHreObwB5tUfzvSMx/Vx56ao1oOXuNso9qW0O9
 T0UutymqDd5hu7TEAWJ+LmeyBpdi4FWCVuVF8+6j3Efqc+GKPfCq/0nQV/0g3MNQ2N3t
 th7FcK07R7+nXvjVlmbuGRfgfU27YmlsfycisaqUaEC+ATwZIlJLI6GZfZWUvbySPCxZ
 MjfJ/aJkWTdoxgGtn5RiuffFb+Tht9aInTuVrRfk4NjOqoBzKfpEg8g13N1O7zdFvwST
 SKkw==
X-Gm-Message-State: AA6/9RnDz+T67EOXOysK4hlF+9w4BZnTFPU4ZeN50Dv2A2rYUywI9OzQq0y3ivwhUYr4kQ==
X-Received: by 10.202.207.67 with SMTP id f64mr4384869oig.58.1476222013915;
 Tue, 11 Oct 2016 14:40:13 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id h91sm1811153oth.40.2016.10.11.14.40.13
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Tue, 11 Oct 2016 14:40:13 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v3 08/18] fsi: Add empty master scan
Date: Tue, 11 Oct 2016 16:39:53 -0500
Message-Id: <1476222003-99697-9-git-send-email-christopher.lee.bostic@gmail.com>
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
