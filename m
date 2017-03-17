Return-Path: <joel.stan@gmail.com>
Received: from mail-pg0-x241.google.com (mail-pg0-x241.google.com
 [IPv6:2607:f8b0:400e:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vkqDJ51LwzDqXk
 for <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2017 13:34:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="h7tZUOu8"; 
 dkim-atps=neutral
Received: by mail-pg0-x241.google.com with SMTP id y17so8030308pgh.0
 for <openbmc@lists.ozlabs.org>; Thu, 16 Mar 2017 19:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=9f1bIvuCUqfD/FP6ebSS0Og4cRcaMsUnjckneKiuewk=;
 b=h7tZUOu8MR4/HNTzbETY80nMyzI9wAYPOgtKQcyrR2tY6XiwU4OhRCMrUJKDjBl+nQ
 FvPyQsWxDh+74Poyg1RdP0sy50LX1WLU6bRd9wJDMV7ltd78RkCEJZOOGTBBNAP3D7ZG
 lTftSDxomEopaKjD6CHUTqHgT7I4zk7T/S6F5UbUroY2Lo3qhTxGRaSixWs7tL2b2BDg
 NF7L57ScBSKXfVBiIU35yrkoAtBtE1bHOrt65ZXp5hHHJPpHX3zzG5ts6TLmV4X2kCxz
 J94pP2m+NvFHPYYIgkbhnMzn12+WA3MW/VFxXA1ShK711PqIRdbwE0hw7vANa0LLY2+a
 VEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=9f1bIvuCUqfD/FP6ebSS0Og4cRcaMsUnjckneKiuewk=;
 b=M7Ar4TjF6rMsFI03ntjrDzoESd2y2Q2mDA3+hFhwbjw5ZHQzjQkqZvYERi46ICPnkS
 iU8WDehvFL/4oCvPkZ4U6OWGR/HXVAQtA2z4pEogQYzU9NG0H7NnyLxbZbgmo9hXx+m5
 ytsu+8pYlW/IDp5U5zY6QaUY721PJZEm+SQuOkJ7nLqSq9hxaB2cfjpZapOu/DohxExG
 7bjStTAsPe8NEpp7XwJJvid93N+z2D4Me0WZVeExNEeAx/BeUTlErzIW0/a++j6AZ5Dp
 nsbQqM9fMczgzu68UXHfVtT9VxDa1FITr0ooVLnatwxkh990poi5n2VvJ9e7VdXGJ2XV
 5k4Q==
X-Gm-Message-State: AFeK/H2i9Z0J3IZu8sGhdNmWfp8ahxEy8J9m+Qo0vHr6i0FKe6WpsYWmO/oRhgjcSdIdyw==
X-Received: by 10.99.101.199 with SMTP id z190mr13129951pgb.219.1489718062494; 
 Thu, 16 Mar 2017 19:34:22 -0700 (PDT)
Received: from aurora.jms.id.au (103-232-208-205.nat.sa.cust.uniti.network.
 [103.232.208.205])
 by smtp.gmail.com with ESMTPSA id r71sm12918620pfa.104.2017.03.16.19.34.19
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 16 Mar 2017 19:34:21 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Fri, 17 Mar 2017 13:04:15 +1030
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: "Edward A . James" <eajames@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.7] fsi: i2c: Remove noisy printks
Date: Fri, 17 Mar 2017 13:04:11 +1030
Message-Id: <20170317023411.13045-1-joel@jms.id.au>
X-Mailer: git-send-email 2.11.0
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
X-List-Received-Date: Fri, 17 Mar 2017 02:34:25 -0000

These create a lot of noise in the kernel log. Hide them behind dev_dbg.

  PROBE    eng[00f5112c]
  Adding ports[0x0000000000007fff] to eng[0x00f5112c]
  bus[0000000f] created
  bus[00000010] created
  bus[00000011] created
  bus[00000012] created
  bus[00000013] created
  bus[00000014] created
  bus[00000015] created
  bus[00000016] created
  bus[00000017] created
  bus[00000018] created
  bus[00000019] created
  bus[0000001a] created
  bus[0000001b] created
  bus[0000001c] created
  bus[0000001d] created
  RESUME   eng[00f5112c]
  iic_boe_reset
  iic_boe_eng_init: P8/Z7PLUS mode
  clean port busy port_busy[0001ffff]
  iic_boe_eng_init: P8/Z7PLUS mode

Signed-off-by: Joel Stanley <joel@jms.id.au>
---

Tested on Romulus

 drivers/fsi/i2c/iic-boe.c  | 12 ++++++------
 drivers/fsi/i2c/iic-fsi.c  | 12 ++++++------
 drivers/fsi/i2c/iic-mstr.c |  6 ++----
 3 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/fsi/i2c/iic-boe.c b/drivers/fsi/i2c/iic-boe.c
index e7196c0115b1..5b90a856c4fd 100644
--- a/drivers/fsi/i2c/iic-boe.c
+++ b/drivers/fsi/i2c/iic-boe.c
@@ -697,23 +697,23 @@ int iic_boe_eng_init(iic_eng_t* eng, iic_ffdc_t** ffdc)
 	clk_div = IIC_BOE_HZ2DIV(eng->bus_speed, IIC_BOE_DFLT_SPEED);
 	if(!clk_div)
 	{
-		IFLDi(2, "eng[%08x], max speed = %ld\n", 
+		dev_dbg(eng->dev, "eng[%08x], max speed = %ld\n", 
 				eng->id, eng->bus_speed / 5);
 	}
 	if(clk_div & ~IIC_BOE_MAX_CLKDIV)
 		clk_div = IIC_BOE_MAX_CLKDIV;
-	IFLDd(3, "eng[%08x] speed[%ld] divisor[%ld]\n", eng->id,
+	dev_dbg(eng->dev, "eng[%08x] speed[%ld] divisor[%ld]\n", eng->id,
 			IIC_BOE_DIV2HZ(eng->bus_speed, clk_div), clk_div);
 
 	if(test_bit(IIC_ENG_Z7PLUS, &eng->flags) ||
 	   test_bit(IIC_ENG_P8_Z8_CENTAUR, &eng->flags))
 	{
-		IFLDi(0, "iic_boe_eng_init: P8/Z7PLUS mode\n");
+		dev_dbg(eng->dev, "iic_boe_eng_init: P8/Z7PLUS mode\n");
 		mode = IIC_BOE_Z7_MK_CLKDIV(clk_div);
 	}
 	else
 	{
-		IFLDi(0, "iic_boe_eng_init: Normal mode\n");
+		dev_dbg(eng->dev, "iic_boe_eng_init: Normal mode\n");
 		mode = IIC_BOE_MK_CLKDIV(clk_div);
 	}
 
@@ -1362,7 +1362,7 @@ int iic_boe_reset(iic_eng_t* eng, int type, iic_ffdc_t** ffdc)
 
 	IENTER();
 	/* issue an immediate reset i2c command */
-	IFLDi(0, "iic_boe_reset\n");
+	dev_dbg(eng->dev, "iic_boe_reset\n");
 	rc = iic_writew(eng, IIC_BOE_RESET_I2C, 0, ffdc);
 	if(rc)
 		goto exit;
@@ -1413,7 +1413,7 @@ int iic_boe_reset(iic_eng_t* eng, int type, iic_ffdc_t** ffdc)
 				ffdc);
 		if (rc)
 			goto exit;
-		IFLDi(1, "clean port busy port_busy[%08lx]\n", port_busy);
+		dev_dbg(eng->dev, "clean port busy port_busy[%08lx]\n", port_busy);
 	}
 
 	/* Test for stuck lines */
diff --git a/drivers/fsi/i2c/iic-fsi.c b/drivers/fsi/i2c/iic-fsi.c
index 1f85e91232fd..5592a1441c54 100644
--- a/drivers/fsi/i2c/iic-fsi.c
+++ b/drivers/fsi/i2c/iic-fsi.c
@@ -195,7 +195,7 @@ int iic_add_ports(iic_eng_t* eng, uint64_t ports)
 
 	IENTER();
 
-	IFLDi(3, "Adding ports[0x%08x%08x] to eng[0x%08x]\n",
+	dev_dbg(eng->dev, "Adding ports[0x%08x%08x] to eng[0x%08x]\n",
 	      (uint32_t)(ports >> 32),
 	      (uint32_t)ports,
 	      eng->id);
@@ -271,7 +271,7 @@ int iic_del_ports(iic_eng_t* eng, uint64_t ports)
 
 	IENTER();
 
-	IFLDi(3, "removing ports[0x%08x%08x] from eng[0x%08x]",
+	dev_dbg(eng->dev, "removing ports[0x%08x%08x] from eng[0x%08x]",
 	      (uint32_t)(ports >> 32),
 	      (uint32_t)ports,
 	      eng->id);
@@ -333,7 +333,7 @@ int iic_fsi_probe(struct device *dev)
 	set_bit(IIC_ENG_BLOCK, &eng->flags); //block until resumed
 	eng->id = 0x00F5112C;
 	eng->idx = ida_simple_get(&iic_ida, 1, INT_MAX, GFP_KERNEL);
-	IFLDi(1, "PROBE    eng[%08x]\n", eng->id);
+	dev_dbg(dev, "PROBE    eng[%08x]\n", eng->id);
 	eng->ra = &fsi_reg_access;
 	IFLDd(1, "vaddr=%#08lx\n", eng->base);
 	eng->dev = dev;
@@ -414,7 +414,7 @@ int iic_fsi_remove(struct device* dev)
 
 	iic_fsi_suspend(dev); //ignore rc
 
-	IFLDi(1, "REMOVE   eng[%08x]\n", eng->id);
+	dev_dbg(dev, "REMOVE   eng[%08x]\n", eng->id);
 
 	/* Clean up device files immediately, don't wait for ref count */
 	iic_del_ports(eng, IIC_FSI_PORTS);
@@ -451,7 +451,7 @@ int iic_fsi_suspend(struct device *dev)
 		goto error;
 	}
 
-	IFLDi(2, "SUSPEND  eng[%08x]\n", eng->id);
+	dev_dbg(dev,"SUSPEND  eng[%08x]\n", eng->id);
 
 	/* Prohibit new engine operations until resumed*/
 	set_bit(IIC_ENG_BLOCK, &eng->flags);
@@ -504,7 +504,7 @@ int iic_fsi_resume(struct device *dev)
 		goto error;
 	}
 
-	IFLDi(1, "RESUME   eng[%08x]\n", eng->id);
+	dev_dbg(eng->dev, "RESUME   eng[%08x]\n", eng->id);
 
 	eng->bus_speed = 20833333;
 	IFLDd(1, "eng->bus_speed=%ld\n", eng->bus_speed);
diff --git a/drivers/fsi/i2c/iic-mstr.c b/drivers/fsi/i2c/iic-mstr.c
index f968c2040dc3..a5881fb795f4 100644
--- a/drivers/fsi/i2c/iic-mstr.c
+++ b/drivers/fsi/i2c/iic-mstr.c
@@ -2157,7 +2157,7 @@ iic_bus_t*  iic_create_bus(struct class* classp, iic_eng_t* eng,
 		goto exit_class_add;
 	}
 
-	IFLDi(1, "bus[%08lx] created\n", bus->bus_id);
+	dev_dbg(bus->class_dev, "bus[%08lx] created\n", bus->bus_id);
 	goto exit;
 
 	device_destroy(classp, bus->devnum);
@@ -2180,7 +2180,7 @@ void iic_delete_bus(struct class* classp, iic_bus_t* bus)
 	{
 		goto exit;
 	}
-	IFLDi(1, "cleanup bus[%08lx]\n", bus->bus_id);
+	dev_dbg(bus->class_dev, "cleanup bus[%08lx]\n", bus->bus_id);
 	device_destroy(classp, bus->devnum);
 	cdev_del(&bus->cdev);
 	kfree(bus);
@@ -2195,7 +2195,6 @@ static int __init iic_init(void)
 	int rc = 0;
 
 	IENTER();
-	printk("IIC: base support loaded  ver. %s\n", iic_mstr_version);
 	IEXIT(rc);
 	return rc;
 }
@@ -2203,7 +2202,6 @@ static int __init iic_init(void)
 static void __exit iic_exit(void)
 {
 	IENTER();
-	printk("IIC: base support unloaded.\n");
 	IEXIT(0);
 }
 
-- 
2.11.0
