Return-Path: <joel.stan@gmail.com>
Received: from mail-pg0-x243.google.com (mail-pg0-x243.google.com
 [IPv6:2607:f8b0:400e:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x3Kyy09XfzDr47
 for <openbmc@lists.ozlabs.org>; Fri,  7 Jul 2017 00:35:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="s8b25xCD"; 
 dkim-atps=neutral
Received: by mail-pg0-x243.google.com with SMTP id d193so470531pgc.2
 for <openbmc@lists.ozlabs.org>; Thu, 06 Jul 2017 07:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=GNf6b3yM/ucBXf3KTusYVdLfcI4JoQYkTbOWXQGx35o=;
 b=s8b25xCDpn9UmrTHC9AYM7mprpIDYrmQBPuNCr6zdRFIXkowbIJJgs1VesSg7tWRcg
 VZ68aqDFAwgHPjCiXUhw9PCoAH4KnHTUbkOGMuFX7QxDYUJ7JLlgRGIa9XfNqts5zK8c
 1GjxIj3U/PjbKD8aUgao+A8mAJiZR3j/doN2iqNQnKcXKXq2LDC/9QZXWSiwtVDuHSA1
 bCn3tSkk0lm38Jxt5tWqreg6z75yMULYvhO4ngKSvCi+DDvgjAQqJA4UdX50Mk72/WCa
 qSCZNKKuPrnWbb1Nth4vl0pVKsXerpl2qSYtFc3e5XWppHdzt4Ys6nOGLiNQP8chtqPy
 9E/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=GNf6b3yM/ucBXf3KTusYVdLfcI4JoQYkTbOWXQGx35o=;
 b=ecOQbJ2J3cMn3AP4W7KCJgaUDx0rm5nNCSZKj6P4pepbBs8O4AKXjZm13L42G6gWl0
 U2nXQKOvGzs6IphVHCOgfV/cFEWpwQU6uO8rMpd7tADZLMe9Q58MnL7MMS3uaTF/3KSa
 ldL+/fCaj0xLQEDdWweHpX1GoRtpVrJE4Mc1ULCeM9Wi+1eON/6g9iciEzVBWPNXQG7R
 f7mH/E3cFea+cgQDkFxRHGFDuGZs2uYvPrY/wmAm+0B7qUgN2WR8BRAceZAW+10+HaiO
 kYPGuXL5mxuGBTlZW6rCAcuww5UhTmE1Wt+tWCIJ4xBWY3+lcPOwtFIDZtFjwWJPO+AM
 VvDw==
X-Gm-Message-State: AIVw111g+PM6totRYSbRpGUNy4mCq/HwOAPFGAlwEaMpCnfflWMcEqIJ
 toYmEmLsUDTkw6n6tjI=
X-Received: by 10.84.167.74 with SMTP id j10mr28327399plg.41.1499351719839;
 Thu, 06 Jul 2017 07:35:19 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.19])
 by smtp.gmail.com with ESMTPSA id h80sm728170pfk.80.2017.07.06.07.35.16
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 06 Jul 2017 07:35:19 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Fri, 07 Jul 2017 00:05:13 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.10 1/4] i2c: fsi: Remove ida counter
Date: Fri,  7 Jul 2017 00:05:00 +0930
Message-Id: <20170706143503.21888-2-joel@jms.id.au>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170706143503.21888-1-joel@jms.id.au>
References: <20170706143503.21888-1-joel@jms.id.au>
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
X-List-Received-Date: Thu, 06 Jul 2017 14:35:22 -0000

It's not clear what the intention is. Regardless, it is not necessary so
remove it.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/i2c/busses/i2c-fsi.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index 01816466ec86..da045777624e 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -135,7 +135,6 @@ struct fsi_i2c_master {
 	int			idx;
 	u8			fifo_size;
 	struct list_head	ports;
-	struct ida		ida;
 	wait_queue_head_t	wait;
 	struct semaphore	lock;
 };
@@ -554,7 +553,7 @@ static int fsi_i2c_probe(struct device *dev)
 	struct fsi_i2c_master *i2c;
 	struct fsi_i2c_port *port;
 	struct device_node *np;
-	int rc, idx;
+	int rc;
 	u32 port_no;
 
 	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
@@ -565,7 +564,6 @@ static int fsi_i2c_probe(struct device *dev)
 	sema_init(&i2c->lock, 1);
 	i2c->fsi = to_fsi_dev(dev);
 	i2c->idx = ida_simple_get(&fsi_i2c_ida, 1, INT_MAX, GFP_KERNEL);
-	ida_init(&i2c->ida);
 	INIT_LIST_HEAD(&i2c->ports);
 
 	/* add adapter for each i2c port of the master */
@@ -574,12 +572,6 @@ static int fsi_i2c_probe(struct device *dev)
 		if (rc || port_no > 0xFFFF)
 			continue;
 
-		/* make sure we don't overlap index with a buggy dts */
-		idx = ida_simple_get(&i2c->ida, port_no,
-				port_no + 1, GFP_KERNEL);
-		if (idx < 0)
-			continue;
-
 		port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
 		if (!port)
 			return -ENOMEM;
@@ -596,9 +588,8 @@ static int fsi_i2c_probe(struct device *dev)
 		port->adapter.nr = (i2c->idx * I2C_MASTER_NR_OFFSET) +
 			port_no;
 
-		snprintf(port->adapter.name,
-				sizeof(port->adapter.name),
-				"fsi%d_i2c%u", i2c->idx, port_no);
+		snprintf(port->adapter.name, sizeof(port->adapter.name),
+				"fsi_i2c%u", port_no);
 
 		rc = i2c_add_numbered_adapter(&port->adapter);
 		if (rc < 0)
@@ -625,8 +616,6 @@ static int fsi_i2c_remove(struct device *dev)
 		i2c_del_adapter(&port->adapter);
 	}
 
-	ida_destroy(&i2c->ida);
-
 	ida_simple_remove(&fsi_i2c_ida, i2c->idx);
 
 	return 0;
-- 
2.13.2
