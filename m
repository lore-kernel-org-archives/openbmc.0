Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sq7M46hJTzDrPG
 for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2016 07:54:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=rNCxHKR3; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id d132so3133117oib.2
 for <openbmc@lists.ozlabs.org>; Wed, 05 Oct 2016 13:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fVUf1lGwd2x2CFxR4ngY0qQnUGy2NkuV9NfPR7uwWLo=;
 b=rNCxHKR3Dx6FyanPkomuEf7av2EmTTGep15UDOkR8VQlt0Kd/lwQbgmGTj03BcgDrA
 so4cryEJyjT1Xb7JxpLWnIREUEg/2iHDcpRdZQLvbw3SFQi5FzEIWJuYKY5Tu6PNq4sM
 YYufqVmQCAN1442szi/k191zUvZJHMeGvSZqONhFU7ODwkzuo8VMCJl8/CF0FuL9FN97
 k5lCYkfhdtY7jKMlS1v7w+f72EXyB2Uu34fSX9QHrxHRQ756c01mvIecG3DY7icFoSE8
 ohiwoeNl9UI6YSpTcB6XT2YAfpYgT9LYP0WaEs0Zl+NGF08zCZUbks66A2yLarUq2fIl
 6buQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fVUf1lGwd2x2CFxR4ngY0qQnUGy2NkuV9NfPR7uwWLo=;
 b=lg+kqt8GtKF/+xH5uhgfOR+tgEAHP5O01jredZzNkb3g/CJ3rANQLdIw1CdxVguh5n
 QaJweNzmkCuwZiBIqpdXzKS219EGBOBVPZJ2xYTJoRLUJDJX2tp25muC0+0kKEejRQwe
 vCOSsm9nmHL7CPrUkMC5Irj9gJbdOmnIFGzev/icG099TXTvAniksdR8KU4ANptt4had
 eviADS6ipc3W29mi4TFcPPPSctMGMlDXG6n+uxErvVmKqPBpaMY1u8y7r82gg7D/fxbT
 EOv6yLb7+ccJjWeVxwCQHblCXtOTknU6N2Bk5RYh7NvWwkioB/z7lUrLdTD0dhN/VOsU
 mKuQ==
X-Gm-Message-State: AA6/9Rk83bshufmBU+Ll4fOd9vOKkzeSgwOedL/cqc3zMDCIOrMznw4vkeqhpJNtE9QMYA==
X-Received: by 10.157.2.101 with SMTP id 92mr6686064otb.227.1475700879269;
 Wed, 05 Oct 2016 13:54:39 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id i18sm3206459oib.12.2016.10.05.13.54.38
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 05 Oct 2016 13:54:38 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux 07/15] fsi: Add slave defintion
Date: Wed,  5 Oct 2016 15:54:20 -0500
Message-Id: <1475700868-75737-8-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1475700868-75737-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1475700868-75737-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Wed, 05 Oct 2016 20:54:41 -0000

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
