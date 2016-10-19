Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-it0-x242.google.com (mail-it0-x242.google.com
 [IPv6:2607:f8b0:4001:c0b::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sznhj43VvzDt2L
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 10:09:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=QQ+UQIVW; 
 dkim-atps=neutral
Received: by mail-it0-x242.google.com with SMTP id e203so3157322itc.1
 for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2016 16:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fVUf1lGwd2x2CFxR4ngY0qQnUGy2NkuV9NfPR7uwWLo=;
 b=QQ+UQIVWP2Y2UyklHWkHK6mMrJH82CC2K+QrfDN6o/0MTqg9FuWlPAZXoBubGzOhK5
 v3LXNl8sCYvIIPA5Ox2bDoJ7sVpracJsjq35dO0FsOUQzwmowE+FHvWgsyLDvdgu3SVi
 bKvpT7pPXhh5deTnfk4gUudD9eX6LueplHqJHyi2JHMiYcuCpcZzSDPzphlq/QnHqde5
 13jDfj3amJqk4nDV5RmxS2yKJjrCcv/gxcYx48QQ8kg8Rl+fGwmSC9Y+ABaYYrHqH76q
 hgVLoslR30rp9z3r2IxBqcVpVGeWSEER1EIhaj4DrdW8Twd8Iyw3COx1VJEYUA1m753q
 u9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fVUf1lGwd2x2CFxR4ngY0qQnUGy2NkuV9NfPR7uwWLo=;
 b=POHlOXZaM9sTzx3WGW6MkhiG/1nrVGDvK2xI5Ngow8X3M0jsrpC63rug+ML8WNLos7
 Krpke2WvqKmJ5STeZSiptfW639zyA0IK8FYK3poUxxbIm3hWhxHKBI4ma7dh0QcmyVno
 RezyMwk20RmoCuY4UK7EV3e7KbngaokUNcQR14kwlmeKi2ACz54y3XO40mkiVuQhMU/H
 X2n/+hOZkcLbq3lr9O/RBZAh5vTAmc7IYxN2+SBILPr782N9iOa0lCnaoGo/Vq3n46KG
 5UR/lViw1AqXmLRFEQStaO4hxVtv/1QNTv8eBJcjxA27Gx/63jRNfx9uf99GKZh90QXt
 INNA==
X-Gm-Message-State: AA6/9RkfvaG6a0jhO3VAmdZh5mWbOqnkjMEqhgaIkyA2HcAYpfx4H+3S0KBk9shr4OvebA==
X-Received: by 10.202.85.78 with SMTP id j75mr6379509oib.0.1476918595889;
 Wed, 19 Oct 2016 16:09:55 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id n196sm15487618oig.8.2016.10.19.16.09.55
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 19 Oct 2016 16:09:55 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v5 07/18] fsi: Add slave definition
Date: Wed, 19 Oct 2016 18:09:35 -0500
Message-Id: <1476918586-13475-8-git-send-email-christopher.lee.bostic@gmail.com>
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
