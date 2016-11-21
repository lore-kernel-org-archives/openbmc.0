Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMXsZ1bSdzDvjC
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 13:41:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="i8PpeKTx"; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id m75so1348228oig.1
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 18:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fVUf1lGwd2x2CFxR4ngY0qQnUGy2NkuV9NfPR7uwWLo=;
 b=i8PpeKTx+Rt/aD+akh/lO5dtFZs0lIqDEWBUj9C7rQu+n/U2eyPtsY7E7P7ZgedoDU
 JRbKx1LuKW/+Nig3LxcGIookxM+WtFybB/KFhhytDe6rWlizC5TDhHCjZ0PdeOFStFNd
 oXiR70SPFjqOiSWoGmKTjrlxgWqfCTlkm29p2FAGcqigsYogHTjiyAsBND2fXzVoy070
 oCa0dakUravt9yMwDeoFFaGXiajAZny4e7N29BPeA0ztsm5SgXmuq6q+GIJhsWZgrkqr
 nlbVt7AqgOtgzbIxrOMjRzDJkcSL/f55LDfwpOGYbE21kKQd0oZU4K0uVmz8Xz4fFbUJ
 guZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fVUf1lGwd2x2CFxR4ngY0qQnUGy2NkuV9NfPR7uwWLo=;
 b=QFtbZSq2Pv/nQSwz6WCGDTonvSWBOgQzUbUHCY9eh6WWj+grGTY8J/wTQDHUwNlCIc
 634tvipzHGkqd+HQL/e4O/hJrWYRHLZa1Q5Qc206AiKp7qHZGgC6vHYL0mNNyFqUv0fr
 g7E/ElxQ4x7FFZlqPLUKhPYGngSygf+9ZoPYxikSWZpR2fOd6fyjJNBwIV/RIehy0Xmw
 jXKwA3cVoGcsLZvnfhhbvB5y9zgSVUFCeIUdP/SHMK4UbFA700C1Z2aqbeb2gHSJgE3d
 eJxQpUyLiT8fiHoHScmHoMEG0iwgZNkCJaIg+FMpzsMpDUY66jOBP4L7LwG+7I0SYyas
 SGXw==
X-Gm-Message-State: AKaTC02ZfGJQuGKxGHw28nm5ocS4CL3ie9vYK+0YqqTSW1gI+5u7qCAxkg4r+4DmtyKRLw==
X-Received: by 10.157.4.229 with SMTP id 92mr7884681otm.100.1479696064557;
 Sun, 20 Nov 2016 18:41:04 -0800 (PST)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id 73sm6432307otf.16.2016.11.20.18.41.03
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 20 Nov 2016 18:41:04 -0800 (PST)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org, gustavo.padovan@collabora.co.uk,
 gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch, jthumshirn@suse.de,
 dan.j.williams@intel.com, sre@kernel.org, clg@kaod.org,
 k.kozlowski@samsung.com
Cc: jk@ozlabs.org, joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 benh@kernel.crashing.org, alistair@popple.id.au
Subject: [PATCH linux 07/19] fsi: Add slave definition
Date: Sun, 20 Nov 2016 20:40:36 -0600
Message-Id: <1479696048-75851-8-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Mon, 21 Nov 2016 02:41:06 -0000

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
