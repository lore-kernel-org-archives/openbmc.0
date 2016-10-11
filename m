Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3str4t71J7zDsrT
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 08:40:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=s7w6Cbt+; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id e12so2264166oib.3
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 14:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fVUf1lGwd2x2CFxR4ngY0qQnUGy2NkuV9NfPR7uwWLo=;
 b=s7w6Cbt+aGIsQnMqlF8FoYxnDIYEJZEepCEcZtyusG3ZsgJwEHxR+2iQaSHwX7L7R4
 UYJPsS+j9vHcKBF0QvcPTy9kciHHCDLJbVdUDwD295NwJ2GH7zMzMmfnBp7YyC4Ktwkq
 IAHpnRq1bFCSeAJdLWAbsb8LF0S0NuutAYd0NVZeqDoDECOFvKaSJG3Km9M1+Te9m0gw
 Lxq9i6GwVlzvClI1s5iCQ5odxf2PBIf3zqqE9fWKLRZjJXjEyCGgNzaMjjlT3cp1tdmA
 yk9eGJee3wlWTfhgTzBZK4BIBRTc+kRTHTepwA1joJlaAHCrJRHt4J5Nogo9SgPsJN/h
 TdtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fVUf1lGwd2x2CFxR4ngY0qQnUGy2NkuV9NfPR7uwWLo=;
 b=RhSQPH5DUy/7xRdiJvcUIMmXHbViMyiyxAECEj9xYD73lxcjnrYFIYlitEXlgnfdYn
 QIq9qee/0xi9km/2eFztXiTcQqR6Q5yhFLxC2fTEAIHVRrLVgwm5QFDpcB+yQUsV5Lom
 Zo3ix0O2dtCv8ZqyRFk4di8h3KyKRlwE205pSj6bplTd+bD8qsV4kbXd1ZE/wCosiyBw
 bquI7FyHRxj354P5kJeMAduIzo7cMrS7gz9ybkn09ccHf1KKINrHcKeXXYv908IAAJsL
 mEiQfHo+fjnAVvD9GYdk2vnwmFz787jPYFjCwLBYjyGv5zwxPrYEkpX1bj5BbAA3nu4F
 QO7w==
X-Gm-Message-State: AA6/9RnJBmqFZJ3rsYfoMan5CH03Nii45ar/bVTZIgqHk+M8IQ/i059M+CMdnGv4ytJFfw==
X-Received: by 10.202.57.215 with SMTP id g206mr3907161oia.97.1476222013293;
 Tue, 11 Oct 2016 14:40:13 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id h91sm1811153oth.40.2016.10.11.14.40.12
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Tue, 11 Oct 2016 14:40:13 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v3 07/18] fsi: Add slave defintion
Date: Tue, 11 Oct 2016 16:39:52 -0500
Message-Id: <1476222003-99697-8-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Tue, 11 Oct 2016 21:40:15 -0000

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
