Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3swhjb3DyqzDt4d
 for <openbmc@lists.ozlabs.org>; Sat, 15 Oct 2016 09:14:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=CLvyoTwu; 
 dkim-atps=neutral
Received: by mail-pf0-x242.google.com with SMTP id s8so7955322pfj.2
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 15:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fVUf1lGwd2x2CFxR4ngY0qQnUGy2NkuV9NfPR7uwWLo=;
 b=CLvyoTwuOjqIVlHrL87yUt/00oS5qFHliTPZLFQno6ZTJczFz3iz5Eg79hReFrlR2A
 K6/qC/toWAsWIC8rpCKXbXRa+y9F/QBa/2w6KnsWt4fgM0clDzPSikWdcTqWex2xNswo
 fwFGGeQtPf4pZJINevHlUhRnmJPlcdZA8Z6270srOxPZstXysMRxD/guUujksVDrIvWd
 s3wxaMEmBLrT7kNORTMqda7LvAv+9/cC4GLxdSDY8cLpoyDzJzrlEYEGs90QI5/pQ1ca
 ZUx9Q7G0Nn8wOgOCcqMAX2NPOA5oI6ENeisD4EdoP592UbSd0O2RlTgYJBH/Tun5B/BQ
 e+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fVUf1lGwd2x2CFxR4ngY0qQnUGy2NkuV9NfPR7uwWLo=;
 b=LKCZrrN0E07eeCHkv+CInX4Q1Mj3LaXH0fxrNgwngaUQEaNGFQ/D7glDR87RIFmn0W
 ZcgpxS+el7SonSev13HLHGC5a+3XH7nq+K871rkbQrbPzVQMl2o8Du3t++tOWeX0ZosC
 uj/6cgcv4UwM2kdFi8+ib0n3vYybr+Gjk2cAz/6MFHk2bs9FVs13D26bNj5hbJO549hR
 PMPStnCdmAy5f7d2KdMWajwYuE5OrSc4ZG1H6zYgpxlUlzGKUvj0iT/7MB2yco0r7owA
 39NMqXnl6hqycj5ZKH5BBexSUs+Ej3Jf1BC8kEx1ZY5o1kKRYhwvjcM/ZFPxJk7lWXLf
 0QfQ==
X-Gm-Message-State: AA6/9RlT4jmo/w+AjbaxNnsCvY9cil44OTdMk4ekuPymvbOC/fTbZBA/JLdpew0S+D3zkw==
X-Received: by 10.99.208.21 with SMTP id z21mr994385pgf.125.1476483297918;
 Fri, 14 Oct 2016 15:14:57 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id p7sm29848874paa.3.2016.10.14.15.14.56
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Fri, 14 Oct 2016 15:14:57 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v4 07/20] fsi: Add slave defintion
Date: Fri, 14 Oct 2016 17:14:29 -0500
Message-Id: <1476483282-85971-8-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Fri, 14 Oct 2016 22:15:00 -0000

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
