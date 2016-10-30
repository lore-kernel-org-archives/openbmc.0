Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6WrL3KslzDvWw
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 09:09:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=FlLw7YPz; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id 128so1107309oih.3
 for <openbmc@lists.ozlabs.org>; Sun, 30 Oct 2016 15:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=F1U4XBGP0KLyjRnKBHYd+H3y8aMkGUlIxMDeUqjVd6c=;
 b=FlLw7YPzUqR8wFWyLcaGNWGF6DRXSgGc2TB+vSg6gDSySWsAEjHtOVqYPNJphXITmV
 GWFroNSP2w46NsRkOenS3XvrFni2lGodsbTgP2EFi/WgEHhh6UzjPsgI+6GPiGL3yp88
 QEqZRJP4UT3NNhbKxKrMhoKJy9QilYRfNeg43apbHahEWtgpQQpGX6ZLj16oDAT6CDXC
 +iuKwBSDhnbEN5Z4/uCpt3mZ5hKMQiw8O0xIeJVEuOBEnImZrt0t2AQrge+5nrnhyfWy
 no2iCecZRanxH8c7CNODdlFefWFJPlhvzLKC8ERQkNqWaqcj0Fbib9FCvW+d9Sa1ZjrS
 ek2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=F1U4XBGP0KLyjRnKBHYd+H3y8aMkGUlIxMDeUqjVd6c=;
 b=NIo9H6eULPf00kBVrqSky/NBKz/oKts+cISzokjauJQ5wiSpqz6gAaWW+05Wi9Uupy
 5bIdK/HGtR4z1oE3sqU59/PdNnfmHWbELtjwyRaUw5b7F/Mu8uRNew9LdGzSXstJvN3W
 k9EEuEFuuJRwE3lpw3Z/7wZOYzD3OhPqfiSZHx9dCwMLf8IdCIw87X+FW7BJXxN03hNH
 uLNlwPY7njyGbdwugKw4yeJL1cQmRQgKXdAQkQixuCAwpVOEmymPWpEA+kHf6UrL0r3H
 7lx4mlVUckYLCphIP5b/LdpchAdwTqjIdIw0kX6MGalHM9pPApplhAOLplbT2k+NkrvU
 hIBA==
X-Gm-Message-State: ABUngvejUWAZo2HikHnlFp9OpmapjqNpm9EKIt9zVzS+MIUv2H4EhHZpVDwFqWj7U+eNCg==
X-Received: by 10.202.83.202 with SMTP id h193mr23314684oib.106.1477865392723; 
 Sun, 30 Oct 2016 15:09:52 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id q59sm7585484ota.20.2016.10.30.15.09.51
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 30 Oct 2016 15:09:52 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v6 06/18] fsi: enable debug
Date: Sun, 30 Oct 2016 17:09:08 -0500
Message-Id: <1477865379-11566-7-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Sun, 30 Oct 2016 22:09:54 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Enable debug for the fsi core during development. Remove before
submission.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/fsi/fsi-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index ce9428d..db1a1ce 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -13,6 +13,8 @@
  * GNU General Public License for more details.
  */
 
+#define DEBUG
+
 #include <linux/device.h>
 #include <linux/fsi.h>
 #include <linux/module.h>
-- 
1.8.2.2
