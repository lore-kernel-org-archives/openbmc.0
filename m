Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x3KzD2YCNzDr47
 for <openbmc@lists.ozlabs.org>; Fri,  7 Jul 2017 00:35:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NjeAn54N"; 
 dkim-atps=neutral
Received: by mail-pf0-x242.google.com with SMTP id z6so530042pfk.3
 for <openbmc@lists.ozlabs.org>; Thu, 06 Jul 2017 07:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=Oa9ylkMWT6V2GYCkVwB5VV4tq+VswSjvumZ1YHhVWX4=;
 b=NjeAn54NNXWzutb7AqtqRZdAZvJELfPt2zFk9YIV6vNzelNOKqrwqX+E5vjjkzaLWO
 oRZ7BtS63MO+b+pNtaTBKut3cal4OqaHTz31XyDBzySpgdQLbn/3JZw62tIRuR4lYUZG
 1blh/CcO4VbFWLdcDp8IN8fd7bjoA0FFBKBkkSldg0LtUcTduNCn8L5KaXCNs2WZolK2
 2Ksq7rL4YeaqzLj8fjMRBHx06rSQq0cEvPjwuJknhIKdk/stEWMOMwQtbTrXA/kndzmF
 rDN513nqfjVfXEDrulrCWX4nkD0cxo+0LI7VY7qGuucG3yZghwFVYXKsfu88qqW7ZvTZ
 nuHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=Oa9ylkMWT6V2GYCkVwB5VV4tq+VswSjvumZ1YHhVWX4=;
 b=mxHVfiPyOlglGyymHdu8bJdFM1oLrrb9+bW2JBAMNwRYlXyBtmbdHJS+pnRrftt9GH
 yo0O4Fh2pyay20YIQzcR28CoVBJ7NCroYWMlSthdhZPNb9LI1fPnP/jke4DjBmvgkMHD
 6kUzoIdeNf0++QrXN4V4D/hQAaYXNtkdmhz8tbZfd1w6XzmlQtom53p0G+lm+bdU5MmF
 w9oo/ZYzDTSHi7i5mtLR7qRlQMmOY6gYQi/BjlzD0GfROkG7DPyNpOR3Bl3vV6bBPVCh
 kavDAX3/8YgfTdzpqWQ4H28iWGF/6cKo3qwDc7sROkxjNNqrJcrlYoKBfieOFG5qoHaz
 ct6w==
X-Gm-Message-State: AIVw111eOA/OxoPUXWBb3aiEckjuUSvDVziJtSk+wm1IlBQHDtOKW9kS
 o9wCAXtqtjZTPCep1EY=
X-Received: by 10.84.229.77 with SMTP id d13mr29433830pln.239.1499351734473;
 Thu, 06 Jul 2017 07:35:34 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.19])
 by smtp.gmail.com with ESMTPSA id z70sm514648pgz.3.2017.07.06.07.35.31
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 06 Jul 2017 07:35:33 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Fri, 07 Jul 2017 00:05:27 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.10 3/4] i2c: fsi: Remove idx counter
Date: Fri,  7 Jul 2017 00:05:02 +0930
Message-Id: <20170706143503.21888-4-joel@jms.id.au>
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
X-List-Received-Date: Thu, 06 Jul 2017 14:35:36 -0000

It is no longer used.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/i2c/busses/i2c-fsi.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index 349bea0e2a63..0c7efb667427 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -132,7 +132,6 @@
 
 struct fsi_i2c_master {
 	struct fsi_device	*fsi;
-	int			idx;
 	u8			fifo_size;
 	struct list_head	ports;
 	wait_queue_head_t	wait;
@@ -147,8 +146,6 @@ struct fsi_i2c_port {
 	u16			xfrd;
 };
 
-static DEFINE_IDA(fsi_i2c_ida);
-
 static int fsi_i2c_read_reg(struct fsi_device *fsi, unsigned int reg,
 			    u32 *data)
 {
@@ -563,7 +560,6 @@ static int fsi_i2c_probe(struct device *dev)
 	init_waitqueue_head(&i2c->wait);
 	sema_init(&i2c->lock, 1);
 	i2c->fsi = to_fsi_dev(dev);
-	i2c->idx = ida_simple_get(&fsi_i2c_ida, 1, INT_MAX, GFP_KERNEL);
 	INIT_LIST_HEAD(&i2c->ports);
 
 	/* add adapter for each i2c port of the master */
@@ -613,8 +609,6 @@ static int fsi_i2c_remove(struct device *dev)
 		i2c_del_adapter(&port->adapter);
 	}
 
-	ida_simple_remove(&fsi_i2c_ida, i2c->idx);
-
 	return 0;
 }
 
-- 
2.13.2
