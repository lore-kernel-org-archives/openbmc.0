Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3srtt20NLFzDrWS
 for <openbmc@lists.ozlabs.org>; Sun,  9 Oct 2016 04:39:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=xug45qxz; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id r132so5441490oig.1
 for <openbmc@lists.ozlabs.org>; Sat, 08 Oct 2016 10:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fVUf1lGwd2x2CFxR4ngY0qQnUGy2NkuV9NfPR7uwWLo=;
 b=xug45qxzSx7EyweHco+xqVx/2jENfiPnTIxnhOGeHW2Tc7kFnGpCRgdOii0U4fnUTD
 ftr0zg8TIj24GD/jZ8BFScAf6fW8XZnkg7pnFY6aznRwedERzCM2axP6s3KKYYslQKzg
 5PUE5NQsOA5hwsjDRiKeLrqVBZClQErQ5AA7xTR8IRWDgK0j5yuG0rK8DSc+GkkmBbnU
 zgtGw5Nv8w69p6Lt9C35anCRdhM7UzhKCeg0Hz7VJycP3onOubIK3qNIXuvye2YiYLia
 PTvtEWgc/SKsmctc7TkWl5HTJvDegHJZ+jtOHhnBrKiS6tys8nThkZEeJgHb21OdDi3u
 nCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fVUf1lGwd2x2CFxR4ngY0qQnUGy2NkuV9NfPR7uwWLo=;
 b=O9i0SxzuyD5bXnsa5Z2Efd0TycZ1bBHjqmqogMeCAp/rBUsfJej/nAuGZjxhgenvTY
 4P7PjiHEIB+b3Zz2H+JePJY15tM6jj8k4zfpzmbDii4q0kbyekVzIcRU6sobKzo2DHN7
 x2VXuJQt9h4B8AwUXErvHn/iicfxOHNThyXu7Q4LvHNanlK4u2fyD7oI0IVLAhfW08Go
 KKWsdGUAE7hK1bfraFJYOt9bCa6fcOyeDr1wf/XNkZRuZhqhuiysYS2kxN+9l0Lns0MK
 eP/AOvPGxrqbO7x6IdBhkAh//CZuj+92QAiTowy8aIQ26VqwT7Q3jnwQfvfVGTq/qHqK
 iPXQ==
X-Gm-Message-State: AA6/9RmJrChmjJG9tEDg3VUscDP4T+GrZUDJUG/mYYd3qYaFTzBUfTXqTPqSjHMqrOKWHw==
X-Received: by 10.157.10.48 with SMTP id 45mr7301572otg.123.1475948344405;
 Sat, 08 Oct 2016 10:39:04 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id g17sm8025290otd.38.2016.10.08.10.39.03
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sat, 08 Oct 2016 10:39:04 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v2 07/17] fsi: Add slave defintion
Date: Sat,  8 Oct 2016 12:38:43 -0500
Message-Id: <1475948333-55960-8-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Sat, 08 Oct 2016 17:39:06 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Add the initial fsi slave device, which is private to the core code.
This will be a child of the master, and parent to endpoint devices.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/fsi/fsi-core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index db1a1ce..7df4291 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -23,6 +23,15 @@
 
 static atomic_t master_idx = ATOMIC_INIT(-1);
 
+struct fsi_slave {
+	struct device		dev;
+	struct fsi_master	*master;
+	int			link;
+	uint8_t			id;
+};
+
+#define to_fsi_slave(d) container_of(d, struct fsi_slave, dev)
+
 /* FSI master support */
 
 int fsi_master_register(struct fsi_master *master)
-- 
1.8.2.2
