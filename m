Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6WrM58vZzDvXh
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 09:09:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=JZMNsuCQ; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id 62so5825629oif.1
 for <openbmc@lists.ozlabs.org>; Sun, 30 Oct 2016 15:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fVUf1lGwd2x2CFxR4ngY0qQnUGy2NkuV9NfPR7uwWLo=;
 b=JZMNsuCQVrYUmzkDHnMkbupuepvE4hZWOBUb+LVg5qn2xlZcTO784Tg2vDfhyWFQm8
 BrygS2jHrkw5wtVCDJjBHrZ0l9xnJBgRO3s5cLWeVC2d5y6Zo+X2u0tG8v03GePwp7pu
 5bWT3G2Q1WaDm/NT56KU5B8L1sAaaUWV5bFViJOQeIl2Ms3OGXMIifATj4oJ1LEaWvaM
 PRE+dqr4+6z2tnPzhBKPRM7Fjq7FIJYsFdtkdc8utD56rw2+IOVeeGSlItl1iTZelpp8
 9VHOqdnTBZbT5xVpGRR4fP4L35+KaCFQ5TZdSUuloOfTfVlK89yLnuNnU3LGx6M1f6vZ
 VrJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fVUf1lGwd2x2CFxR4ngY0qQnUGy2NkuV9NfPR7uwWLo=;
 b=RIMUwiC273hQ2qKDUXOJTpuwMdqYEGCnkh/Ov+knz7VKE/NdEdsBr4iv3dKHkk/ykK
 kZ/DkcfXjuSwBEJbve6TZbC+hfLEk16REP7E+23haOd9fDYgwCS9U0MD+Q26lveXr2R9
 7XY+kryLALOKytrXMiPq9JXH8yXEyixGqhVu2oBFJfKuVcZqef2veXNWdsVHH/TPnrLQ
 OCECC1E9GFSwSzd70UaGiD/8ugkPHywseTtAbt3G3WSef5NB2XxNojAEmkMODGPguKWA
 d4LmLnqEZ+uwccfsMWNThz7dBgHyETAXPxn5eb9flDeztz+j+eXhETY+S9hDP7sQfwZs
 UQPw==
X-Gm-Message-State: ABUngvfetPy6vsLsU+msbXoPS7m181F8J89alyaBhdVeTm5ROvb8R+jT5YVrzoFx5PXlbA==
X-Received: by 10.202.73.141 with SMTP id w135mr22840569oia.40.1477865393913; 
 Sun, 30 Oct 2016 15:09:53 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id q59sm7585484ota.20.2016.10.30.15.09.52
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 30 Oct 2016 15:09:53 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v6 07/18] fsi: Add slave definition
Date: Sun, 30 Oct 2016 17:09:09 -0500
Message-Id: <1477865379-11566-8-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Sun, 30 Oct 2016 22:09:56 -0000

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
