Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wdd1R1csZzDq5x
 for <openbmc@lists.ozlabs.org>; Thu,  1 Jun 2017 16:37:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LtRyPJ+E"; 
 dkim-atps=neutral
Received: by mail-pf0-x244.google.com with SMTP id n23so6840895pfb.3
 for <openbmc@lists.ozlabs.org>; Wed, 31 May 2017 23:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=50uAsJup4YBG+fPYGnQW6SqaDEk8lALsw03jlZYU5b0=;
 b=LtRyPJ+E0jlwGPZO1yKXlIdHe66x2sYYg/U8F/rERUh9hirXsWNcz+UXKQpopyYlTv
 oN28wOQIHTkkvS4889hphRrdxxfXrNcvEDS9k7qoYzSknnTfu6tAPqP8YIIV0leNVeMi
 pnEKJVr2P+ZOH9YTqZZIS955YKfXQ57ixe7zYZ9lRB4FHtXhz96gUbyGr4MNTg8nWQXp
 YERy3XpxYB/dS6JJbp1M4VVINa7X+I29fySyfAT2y3/oAhoPuhOfBTTtH2/ACS6/Y7cD
 l6ueHesjj1crstFf+4TVum4AFPNjdpLdrUH8iQ6Y3c4KPweahruFao+dYKwkQgjM0sG6
 xZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=50uAsJup4YBG+fPYGnQW6SqaDEk8lALsw03jlZYU5b0=;
 b=Nzim8HuD446T3ZIkC5gHX5Y2fEMuoCt2YyqHgR22CsNB2CQ6A+Xw8xiyGwCyDhXITc
 i1sSQ3VLjEjwZaM8ttf9tshuHyCJ7XmAYw7Ldve7xRvb0xLRAGN7dS3F2qHMB60jF1Ue
 4Q9kvLHt5eTNx1iVh0W6nrJQ6BvCkHplrMDmutCtEGrr2DCAr9ILY1agxyQmd3IZhV2G
 teqaLzEDG1UwNYnkdEPW4hWNq6UndnySHHQXj0F6Y0Xp0UuOsu1S9Iegh5hfGDP1rZ3z
 vkwzFZlyJp1ZUkVL5jw0+EpCi1wV50rED3dC+g5+pBtGOI49vUQYLeVxz+dLyC/egRK2
 eilg==
X-Gm-Message-State: AODbwcDeOGFutV7/kPsbq3LPlifZNuDBkv0np6Kx34MwEvRGV1R1n9Ru
 NMlsoYevNcLvMTjy6VQ=
X-Received: by 10.98.13.220 with SMTP id 89mr34624657pfn.112.1496299033127;
 Wed, 31 May 2017 23:37:13 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id r90sm31600843pfl.82.2017.05.31.23.37.10
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 31 May 2017 23:37:12 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Thu, 01 Jun 2017 16:07:07 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.10] i2c: fsi: Fix unused variable warning
Date: Thu,  1 Jun 2017 16:07:03 +0930
Message-Id: <20170601063703.3083-1-joel@jms.id.au>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Thu, 01 Jun 2017 06:37:15 -0000

When there is no status bit to handle we return the uninitialised rc
variable, causing this warning:

drivers/i2c/busses/i2c-fsi.c: In function ‘fsi_i2c_xfer’:
drivers/i2c/busses/i2c-fsi.c:410:7: warning: ‘rc’ may be used uninitialized in
this function [-Wmaybe-uninitialized]
    if (rc < 0)
       ^
drivers/i2c/busses/i2c-fsi.c:358:6: note: ‘rc’ was declared here
  int rc;
      ^~

Instead return zero, but also print a warning as this looks like an
error, as  we have checked the I2C_FSI_STAT register for
I2C_STAT_ANY_RESP, but none of the status bits were set.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/i2c/busses/i2c-fsi.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index 4689479acf5e..b4eb1028a2ae 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -355,12 +355,12 @@ static int fsi_i2c_read_fifo(struct fsi_i2c_port *port, struct i2c_msg *msg,
 static int fsi_i2c_handle_status(struct fsi_i2c_port *port,
 				 struct i2c_msg *msg, u32 status)
 {
-	int rc;
-	u8 fifo_count;
 	struct fsi_i2c_master *i2c = port->master;
-	u32 dummy = 0;
+	u8 fifo_count;
+	int rc;
 
 	if (status & I2C_STAT_ERR) {
+		u32 dummy = 0;
 		rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_ERR, &dummy);
 		if (rc)
 			return rc;
@@ -387,9 +387,12 @@ static int fsi_i2c_handle_status(struct fsi_i2c_port *port,
 			rc = -ENODATA;
 		else
 			rc = msg->len;
+		return rc;
 	}
 
-	return rc;
+	dev_warn(&port->adapter.dev, "no status to handle\n");
+
+	return 0;
 }
 
 static int fsi_i2c_wait(struct fsi_i2c_port *port, struct i2c_msg *msg,
-- 
2.11.0
