Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6Wrp2HW6zDvNy
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 09:10:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=oo0ltmEE; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id i127so8938524oia.0
 for <openbmc@lists.ozlabs.org>; Sun, 30 Oct 2016 15:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fVUf1lGwd2x2CFxR4ngY0qQnUGy2NkuV9NfPR7uwWLo=;
 b=oo0ltmEE76QVbfaRkh5nry6EtYL42HJNxQSI8BEb8OH4rfdxoCuFpWYKv3G5s0PTzf
 aEAuUqFDpLzKWever300M/rkIkiJ4yqc2teQjqYfVUa4jMMDvs2VOn61kKmM8UXfFIVr
 VVOt5BSHNRXzYHuyKee/2M3QtqOwSg8yjK6x17cXKc6M8ky3qowMvFWyEIKDVKLwUJFQ
 jcp4xRjLALObqOqPEfGABiXbpv7UomnLU3fPtNMmnrYJBYN0tuzhVY0BFhuutFltkKNx
 OLpMHETs3dQ/8854/kq157/K+7ZS2iTFSctS4uNCzef4aTw/FUweaGiHrgR+H06YTpmq
 rqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fVUf1lGwd2x2CFxR4ngY0qQnUGy2NkuV9NfPR7uwWLo=;
 b=haEZvvsQ1Ydk5SnVOIbBBt+TPYUjSyWfOOAHMs548GRubNRAqrYzwLRCyTgYirpcPD
 AGodDc10skjBaIRVwaXIM/hLgtdElzUXKf2LGRaDgZx9jj5v3HI97KAh0Bex06pK5/tr
 Ksuzbc7EOFVDPzaRPhcl03JXa0qqTfFc3eMeQhqVGuQQTn8/Y/4DEH3HWEYc9GVEY8rh
 L7RAecYnA7MZj8QGbe+ANFJzxghi0icAuNPM/TTe2GRn9g566zofw7chOnr9Ex5kmfmz
 LhONN4uHyd7j4l2mlDyPN4OAjcYLFBekJGMGTJdnh2j6nxLgd2OBnqdAee7yxhbb7nhs
 FpxA==
X-Gm-Message-State: ABUngvcVy91pMdWXqdEF1T6YJk9U8eOga2OD8bg8+K37RGiYHepakfzA6aYDbasbrMRQEA==
X-Received: by 10.202.73.141 with SMTP id w135mr22841791oia.40.1477865416634; 
 Sun, 30 Oct 2016 15:10:16 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id q59sm7585484ota.20.2016.10.30.15.10.15
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 30 Oct 2016 15:10:15 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v6 07/18] fsi: Add slave definition
Date: Sun, 30 Oct 2016 17:09:28 -0500
Message-Id: <1477865379-11566-27-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Sun, 30 Oct 2016 22:10:19 -0000

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
