Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::242; helo=mail-pf0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tceh6AdJ"; 
 dkim-atps=neutral
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41WLxC6L3HzDq6t
 for <openbmc@lists.ozlabs.org>; Thu, 19 Jul 2018 14:43:10 +1000 (AEST)
Received: by mail-pf0-x242.google.com with SMTP id l9-v6so3251216pff.9
 for <openbmc@lists.ozlabs.org>; Wed, 18 Jul 2018 21:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id;
 bh=xfgb/BvLDQoHQyUKO1tm2VNLEcggcZfr3Q7JVkT9aPg=;
 b=tceh6AdJR5VeE2WzL/RKhJe8QvokgacT907N7amsO96Vrb6jxhqW7W8NFFY7I1IXU/
 v+367aJua9hrA80HHUVFFpCYkfg/CFmRD+v3nPWt7Y7CGSNQgjVWzbYkzt5zkiVOHQko
 igY2UZWE+u1+94+qzsY6dcX5Fe9lqyI15GlQYatrtoL2IHrGsaTErAVuYCh3qN3G1uRb
 jshrh+XmmrYQl8i8fUcapNHIacz0FpdanX/E5x62tsHDolsByShxBYL9+b0LtVal/qc/
 MNwpuX5xZBghNqO1302eikiMrdEN9wQ//8ImxM9DdPGNuARvVhgYHF+Wy1caAnuIyr/M
 mB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id;
 bh=xfgb/BvLDQoHQyUKO1tm2VNLEcggcZfr3Q7JVkT9aPg=;
 b=oR47dMOzmvhC2hS4BsQYSg34SSwN+2pDUBNJHYbxzByPKIEUvV4FOk2FshfzuOmTpP
 mKNo016N++ahr8AfiVWw+WDaO0sbIHvaCgVQRqpgqgtafpytsZP1EnUYke9vy6M44xlJ
 HysxUzwcWAPjwDIW0lZ8VWHxyDk9C3WXHNPQUSLGEYjdzxfhxfNnwJI2zTduxp/kSC47
 h2YgPTwMxPMZ8bK/E2L2Wp8bnQl92ApuzY10fzxxQBuUjVqTGXKXvSMxARSkqnlL2Avk
 Ej2r+anx2O0gj1ayouVTgec9t9QzFtkOv7IFpFKSFmQZMyV++Z0/i8PfQw9WFZP4kgmf
 lYfw==
X-Gm-Message-State: AOUpUlHZMZGpJzMDYQusW/JdW6UDxwaDjQnecrW9qzp6uwCBBxcPR+lT
 IKm2rKexUJQcdb26zGctXU0=
X-Google-Smtp-Source: AAOMgpf+yRtJ4LTLfDOnXYdvTYQRJNlqRxoew771v13dy5Uyw/HWR1jX6JHYs7/ECpL7sPkQx+88BA==
X-Received: by 2002:a63:7a43:: with SMTP id
 j3-v6mr8356138pgn.363.1531975388398; 
 Wed, 18 Jul 2018 21:43:08 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.19])
 by smtp.gmail.com with ESMTPSA id u17-v6sm12721073pfa.176.2018.07.18.21.43.04
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 18 Jul 2018 21:43:07 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Thu, 19 Jul 2018 14:13:01 +0930
From: Joel Stanley <joel@jms.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.17] i2c: fsi: Sync with v12 upstream submission
Date: Thu, 19 Jul 2018 14:12:58 +0930
Message-Id: <20180719044258.11706-1-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jul 2018 04:43:13 -0000

This incorporates the changes made with the recent cycles of review on
the linux-i2c mailing list.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
Eddie, I've used your latest submission to update the openbmc tree. I
think it makes sense to get it into the tree for testing as soon as
possible.

The patch was created bit removing the i2c-fsi changes, applying your
series, and then squishing it all into one patch.

 drivers/i2c/busses/i2c-fsi.c | 202 ++++++++++++++++++++---------------
 1 file changed, 113 insertions(+), 89 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index ee219c7131a0..1e2be2219a60 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -247,7 +247,7 @@ static int fsi_i2c_start(struct fsi_i2c_port *port, struct i2c_msg *msg,
 	if (stop || msg->flags & I2C_M_STOP)
 		cmd |= I2C_CMD_WITH_STOP;
 
-	cmd |= FIELD_PREP(I2C_CMD_ADDR, msg->addr >> 1);
+	cmd |= FIELD_PREP(I2C_CMD_ADDR, msg->addr);
 	cmd |= FIELD_PREP(I2C_CMD_LEN, msg->len);
 
 	return fsi_i2c_write_reg(i2c->fsi, I2C_FSI_CMD, &cmd);
@@ -326,72 +326,119 @@ static int fsi_i2c_read_fifo(struct fsi_i2c_port *port, struct i2c_msg *msg,
 	return 0;
 }
 
-static int fsi_i2c_reset_bus(struct fsi_i2c_master *i2c)
+static int fsi_i2c_get_scl(struct i2c_adapter *adap)
 {
-	int i, rc;
-	u32 mode, stat, ext, dummy = 0;
+	u32 stat = 0;
+	struct fsi_i2c_port *port = adap->algo_data;
+	struct fsi_i2c_master *i2c = port->master;
 
-	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_MODE, &mode);
-	if (rc)
-		return rc;
+	fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &stat);
 
-	mode |= I2C_MODE_DIAG;
-	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
-	if (rc)
-		return rc;
+	return !!(stat & I2C_STAT_SCL_IN);
+}
 
-	for (i = 0; i < 9; i++) {
-		rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_SCL, &dummy);
-		if (rc)
-			return rc;
+static void fsi_i2c_set_scl(struct i2c_adapter *adap, int val)
+{
+	u32 dummy = 0;
+	struct fsi_i2c_port *port = adap->algo_data;
+	struct fsi_i2c_master *i2c = port->master;
 
-		rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_SET_SCL, &dummy);
-		if (rc)
-			return rc;
-	}
+	if (val)
+		fsi_i2c_write_reg(i2c->fsi, I2C_FSI_SET_SCL, &dummy);
+	else
+		fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_SCL, &dummy);
+}
 
-	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_SCL, &dummy);
-	if (rc)
-		return rc;
+static int fsi_i2c_get_sda(struct i2c_adapter *adap)
+{
+	u32 stat = 0;
+	struct fsi_i2c_port *port = adap->algo_data;
+	struct fsi_i2c_master *i2c = port->master;
 
-	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_SDA, &dummy);
-	if (rc)
-		return rc;
+	fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &stat);
+
+	return !!(stat & I2C_STAT_SDA_IN);
+}
+
+static void fsi_i2c_set_sda(struct i2c_adapter *adap, int val)
+{
+	u32 dummy = 0;
+	struct fsi_i2c_port *port = adap->algo_data;
+	struct fsi_i2c_master *i2c = port->master;
+
+	if (val)
+		fsi_i2c_write_reg(i2c->fsi, I2C_FSI_SET_SDA, &dummy);
+	else
+		fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_SDA, &dummy);
+}
+
+static void fsi_i2c_prepare_recovery(struct i2c_adapter *adap)
+{
+	int rc;
+	u32 mode;
+	struct fsi_i2c_port *port = adap->algo_data;
+	struct fsi_i2c_master *i2c = port->master;
 
-	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_SET_SCL, &dummy);
+	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_MODE, &mode);
 	if (rc)
-		return rc;
+		return;
+
+	mode |= I2C_MODE_DIAG;
+	fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
+}
 
-	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_SET_SDA, &dummy);
+static void fsi_i2c_unprepare_recovery(struct i2c_adapter *adap)
+{
+	int rc;
+	u32 mode;
+	struct fsi_i2c_port *port = adap->algo_data;
+	struct fsi_i2c_master *i2c = port->master;
+
+	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_MODE, &mode);
 	if (rc)
-		return rc;
+		return;
 
 	mode &= ~I2C_MODE_DIAG;
-	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
+	fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
+}
+
+static int fsi_i2c_reset_bus(struct fsi_i2c_master *i2c,
+			     struct fsi_i2c_port *port)
+{
+	int rc;
+	u32 stat, dummy = 0;
+
+	/* force bus reset, ignore errors */
+	i2c_recover_bus(&port->adapter);
+
+	/* reset errors */
+	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_ERR, &dummy);
 	if (rc)
 		return rc;
 
+	/* wait for command complete */
+	usleep_range(I2C_RESET_SLEEP_MIN_US, I2C_RESET_SLEEP_MAX_US);
+
 	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &stat);
 	if (rc)
 		return rc;
 
-	/* check for hardware fault */
-	if (!(stat & I2C_STAT_SCL_IN) || !(stat & I2C_STAT_SDA_IN)) {
-		rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_ESTAT, &ext);
-		if (rc)
-			return rc;
+	if (stat & I2C_STAT_CMD_COMP)
+		return 0;
 
-		dev_err(&i2c->fsi->dev, "bus stuck status[%08X] ext[%08X]\n",
-			stat, ext);
-	}
+	/* failed to get command complete; reset engine again */
+	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_I2C, &dummy);
+	if (rc)
+		return rc;
 
-	return 0;
+	/* re-init engine again */
+	return fsi_i2c_dev_init(i2c);
 }
 
-static int fsi_i2c_reset(struct fsi_i2c_master *i2c, u16 port)
+static int fsi_i2c_reset_engine(struct fsi_i2c_master *i2c, u16 port)
 {
 	int rc;
-	u32 mode, stat, dummy = 0;
+	u32 mode, dummy = 0;
 
 	/* reset engine */
 	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_I2C, &dummy);
@@ -422,34 +469,7 @@ static int fsi_i2c_reset(struct fsi_i2c_master *i2c, u16 port)
 	if (rc)
 		return rc;
 
-	/* force bus reset */
-	rc = fsi_i2c_reset_bus(i2c);
-	if (rc)
-		return rc;
-
-	/* reset errors */
-	dummy = 0;
-	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_ERR, &dummy);
-	if (rc)
-		return rc;
-
-	/* wait for command complete */
-	usleep_range(I2C_RESET_SLEEP_MIN_US, I2C_RESET_SLEEP_MAX_US);
-
-	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &stat);
-	if (rc)
-		return rc;
-
-	if (stat & I2C_STAT_CMD_COMP)
-		return rc;
-
-	/* failed to get command complete; reset engine again */
-	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_I2C, &dummy);
-	if (rc)
-		return rc;
-
-	/* re-init engine again */
-	return fsi_i2c_dev_init(i2c);
+	return 0;
 }
 
 static int fsi_i2c_abort(struct fsi_i2c_port *port, u32 status)
@@ -457,12 +477,25 @@ static int fsi_i2c_abort(struct fsi_i2c_port *port, u32 status)
 	int rc;
 	unsigned long start;
 	u32 cmd = I2C_CMD_WITH_STOP;
-	struct fsi_device *fsi = port->master->fsi;
+	u32 stat;
+	struct fsi_i2c_master *i2c = port->master;
+	struct fsi_device *fsi = i2c->fsi;
+
+	rc = fsi_i2c_reset_engine(i2c, port->port);
+	if (rc)
+		return rc;
 
-	rc = fsi_i2c_reset(port->master, port->port);
+	rc = fsi_i2c_read_reg(fsi, I2C_FSI_STAT, &stat);
 	if (rc)
 		return rc;
 
+	/* if sda is low, peform full bus reset */
+	if (!(stat & I2C_STAT_SDA_IN)) {
+		rc = fsi_i2c_reset_bus(i2c, port);
+		if (rc)
+			return rc;
+	}
+
 	/* skip final stop command for these errors */
 	if (status & (I2C_STAT_PARITY | I2C_STAT_LOST_ARB | I2C_STAT_STOP_ERR))
 		return 0;
@@ -607,26 +640,17 @@ static int fsi_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 static u32 fsi_i2c_functionality(struct i2c_adapter *adap)
 {
 	return I2C_FUNC_I2C | I2C_FUNC_PROTOCOL_MANGLING |
-		I2C_FUNC_10BIT_ADDR | I2C_FUNC_SMBUS_EMUL |
-		I2C_FUNC_SMBUS_BLOCK_DATA;
-}
-
-static int fsi_i2c_recover_bus(struct i2c_adapter *adap)
-{
-	int rc;
-	struct fsi_i2c_port *port = adap->algo_data;
-	struct fsi_i2c_master *master = port->master;
-
-	mutex_lock(&master->lock);
-
-	rc = fsi_i2c_reset(master, port->port);
-
-	mutex_unlock(&master->lock);
-	return rc;
+		I2C_FUNC_SMBUS_EMUL | I2C_FUNC_SMBUS_BLOCK_DATA;
 }
 
 static struct i2c_bus_recovery_info fsi_i2c_bus_recovery_info = {
-	.recover_bus = fsi_i2c_recover_bus,
+	.recover_bus = i2c_generic_scl_recovery,
+	.get_scl = fsi_i2c_get_scl,
+	.set_scl = fsi_i2c_set_scl,
+	.get_sda = fsi_i2c_get_sda,
+	.set_sda = fsi_i2c_set_sda,
+	.prepare_recovery = fsi_i2c_prepare_recovery,
+	.unprepare_recovery = fsi_i2c_unprepare_recovery,
 };
 
 static const struct i2c_algorithm fsi_i2c_algorithm = {
@@ -697,7 +721,7 @@ static int fsi_i2c_remove(struct device *dev)
 	struct fsi_i2c_master *i2c = dev_get_drvdata(dev);
 	struct fsi_i2c_port *port, *tmp;
 
-	list_for_each_entry_safe(port,tmp, &i2c->ports, list) {
+	list_for_each_entry_safe(port, tmp, &i2c->ports, list) {
 		list_del(&port->list);
 		i2c_del_adapter(&port->adapter);
 		kfree(port);
-- 
2.17.1
