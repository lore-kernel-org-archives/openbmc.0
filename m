Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6WrV4j0MzDvQZ
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 09:10:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=LuXuNa0I; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id v84so2661341oie.2
 for <openbmc@lists.ozlabs.org>; Sun, 30 Oct 2016 15:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cOnLtDNTnFAJuIBmhhuaxetBpovbqa+zV2kwB7sGCb0=;
 b=LuXuNa0I6OHUzUzCa1IJrEgT4frlRpB3TkkIYgUUzLdozyaM3zQP6cSm4wqYLJdKj7
 f/xul4GSMM7vudTfUyn4dD0H21u5j1a/Oyhj4seefDkW6FYR7S320B0gZcoVNCakIOmm
 F8pw+H/Vv/HvILqTtOzWA11hMs8FF20IX/uM8y0OoyRuH0Tq22V8+FSyHHjuxAA200BL
 Lck7G+zjloGl72kLTpoxXlkoeUvyF1vbx06eaebnNcYpTwz+VOTfTtT628lSQgQTo8d7
 Y4836QLnRn6rtCDoipsoEnf0+3h7NyrqNexy+Zjm34ALQ4rRIARvr61bUnFyZu4UcgtM
 ehHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=cOnLtDNTnFAJuIBmhhuaxetBpovbqa+zV2kwB7sGCb0=;
 b=PbhTwGhnoOYx1GM+JRPkcJHUEqFf5+oV3NuS19yqHLkFkoa72ZP35CXIps629hBYLN
 0VaWaI+V8mGwr22nzdlYT4facLey3AhnSWm/qbU+m4wXFDSBaRBelCyReL35iH0jXrk0
 rqzCCzurqUG7K1MtZI15zr7JiDHmufqnQtV8ZYSavSpZe6DZbBX4GFSHyb+1c0VS4xLQ
 xHoW6eUI4wp7iWNOkoWGs5cWTz1CmtBTnMwjMlST83nE43B0nlMZf+cd1TqxDGp3aMyo
 JTwi3SCH4sRvz1AvjxMt7yl3m1ziDELMer0nagXWahTJxQ3KfDwHjC/yYMVo5GBleOMP
 Tk7A==
X-Gm-Message-State: ABUngvfSL5aeHHnF3z8zA+uC65wyubDJyfLG/sLAXxhAPFaTULzrYSwO8Q+9NTCSBhgy+g==
X-Received: by 10.202.172.202 with SMTP id v193mr8171019oie.87.1477865400960; 
 Sun, 30 Oct 2016 15:10:00 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id q59sm7585484ota.20.2016.10.30.15.09.59
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 30 Oct 2016 15:10:00 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux v6 13/18] drivers/fsi: Minor updates to FSI core
Date: Sun, 30 Oct 2016 17:09:15 -0500
Message-Id: <1477865379-11566-14-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Sun, 30 Oct 2016 22:10:03 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Added some export symbols for fsi_device_read/write for FSI
client drivers.  Removed the byte swapping done on CFAM config
word reads - already in proper order.  Removed fsi_crc4 checks,
they were incorectly reporting bad crc's.  Need to evaluate
what is wrong with the method of calculation.

Add missing assignment of slave to fsi_device during scan.

Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 drivers/fsi/fsi-core.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 565c7e3..95e867e 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -64,6 +64,7 @@ int fsi_device_read(struct fsi_device *dev, uint32_t addr, void *val,
 
 	return fsi_slave_read(dev->slave, dev->addr + addr, val, size);
 }
+EXPORT_SYMBOL_GPL(fsi_device_read);
 
 int fsi_device_write(struct fsi_device *dev, uint32_t addr, const void *val,
 		size_t size)
@@ -76,6 +77,7 @@ int fsi_device_write(struct fsi_device *dev, uint32_t addr, const void *val,
 
 	return fsi_slave_write(dev->slave, dev->addr + addr, val, size);
 }
+EXPORT_SYMBOL_GPL(fsi_device_write);
 
 int fsi_device_peek(struct fsi_device *dev, void *val)
 {
@@ -171,16 +173,15 @@ static int fsi_slave_scan(struct fsi_slave *slave)
 					"error reading slave registers\n");
 			return -1;
 		}
-
-		conf = be32_to_cpu(conf);
-
+/* todo: fix crc calc problems */
+#if 0
 		if (!check_crc4_u32(conf)) {
 			dev_warn(&slave->dev,
 				"crc error in slave register at 0x%04x\n",
 					i);
 			return -1;
 		}
-
+#endif
 		slots = (conf & FSI_SLAVE_CONF_SLOTS_MASK)
 			>> FSI_SLAVE_CONF_SLOTS_SHIFT;
 		version = (conf & FSI_SLAVE_CONF_VERSION_MASK)
@@ -199,6 +200,7 @@ static int fsi_slave_scan(struct fsi_slave *slave)
 			if (!dev)
 				return -ENOMEM;
 
+			dev->slave = slave;
 			dev->engine_type = type;
 			dev->version = version;
 			dev->unit = i;
@@ -252,11 +254,10 @@ static int fsi_slave_init(struct fsi_master *master,
 		return -ENODEV;
 	}
 
-	chip_id = be32_to_cpu(chip_id);
 	if (!check_crc4_u32(chip_id)) {
 		dev_warn(master->dev, "slave %02x:%02x: invalid chip id CRC!\n",
 				link, slave_id);
-		return -EIO;
+		/* todo, fix crc calc issues.  Just warn for now */
 	}
 
 	pr_debug("fsi: found chip %08x at %02x:%02x:%02x\n",
-- 
1.8.2.2
