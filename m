Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3swhjZ2MBtzDt4Y
 for <openbmc@lists.ozlabs.org>; Sat, 15 Oct 2016 09:14:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=lkkqfnNy; 
 dkim-atps=neutral
Received: by mail-pf0-x242.google.com with SMTP id 128so7976267pfz.1
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 15:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=F1U4XBGP0KLyjRnKBHYd+H3y8aMkGUlIxMDeUqjVd6c=;
 b=lkkqfnNyLiaRjB1Ofw5glX9rKYSyAMt+mEl9JTmyJ8MpoP5KM1EalcdNhEm7bLoW3V
 gN265Q809fdKpGwa0I+1ft3DslSf5d5NrBpRBXy2a5eZEpcyaFB24/W0cKeRr+CLdmTo
 ppFavrnJZy37LkgCJETcftwDrQpSut+rGr+m+B08jcUfvnTyoUJ1ElBT2iERrVY8B+yF
 76ExvjUCEsUqH4+PaGmLHxsWCUmq3cT9/IgxhyNLCKBT+JV2RGjyXfTCFnaAtJFB4/2h
 K98gdgChNiMCo1xcAGRu7sulbwy01eQAHPkE+NCcLE5+VjRK7I1edlkN8hNNvQx7gnwx
 Kztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=F1U4XBGP0KLyjRnKBHYd+H3y8aMkGUlIxMDeUqjVd6c=;
 b=O5Lh8q3u+uuUHeQwLw/h8dOEyBfqnnzczy6D2kygkGaP/76/3MOaOvJlgr5v9L/T7g
 V3WjodoKw9S722hxiFtgc7El3YNG7kuIMbIKmKDouHv3KyzWHfAQ3OK7QVCW1dHfdUXf
 4dzH/YJRSZotMv9oyqMSinjVePNsl1x/AGGcHcZ/KLr9Y170RgL1lvBnZaBJwY4xZIdX
 W+5MD7MA5qdpwonrZsaEeOlsUTiQlHBZ9uJlc9Kh6jKwy5gCDihEl1IbnaUkl+Kfm130
 kRQHSbGaDcqnSiUoCWHiwW6SPFhrWWLfFbMN1rCqJP9pfKp7nvvzFJUMN1DBEIlpBKwo
 Smqg==
X-Gm-Message-State: AA6/9RluMZp23Nlg83U6M4U49RAUZKTUOzPqQHZF3rhQFmEWaikhQdodJikiHnQ8yfLq9w==
X-Received: by 10.99.114.92 with SMTP id c28mr17989757pgn.19.1476483296796;
 Fri, 14 Oct 2016 15:14:56 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id p7sm29848874paa.3.2016.10.14.15.14.55
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Fri, 14 Oct 2016 15:14:56 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v4 06/20] fsi: enable debug
Date: Fri, 14 Oct 2016 17:14:28 -0500
Message-Id: <1476483282-85971-7-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Fri, 14 Oct 2016 22:14:58 -0000

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
