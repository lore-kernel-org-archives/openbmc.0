Return-Path: <joel.stan@gmail.com>
Received: from mail-pg0-x244.google.com (mail-pg0-x244.google.com
 [IPv6:2607:f8b0:400e:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vTzpc615yzDqGn
 for <openbmc@lists.ozlabs.org>; Fri, 24 Feb 2017 16:16:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="aWseLOYu"; 
 dkim-atps=neutral
Received: by mail-pg0-x244.google.com with SMTP id z128so1698153pgb.3
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 21:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=vnVB62n/dyMgxZTjPt1hdsQcInddDhGUU9UAun7w52M=;
 b=aWseLOYuCFwDFSz5oz0tNz8LrUY3ZxodQT2qEzJrS0wId7w8n0iRU1/GZdl8CUKEJ0
 /BfLBCaBqJWWQtcj1JAeQuKMC32Kj/p4gXFyMTLrTvWQ+Fv9V5MJLswodMZybZz2R53D
 D10d6MvrzzLKBLXyppdPJQVEwRqNUu47WxFjYx/YZRVsAOsTH46+RMEXwSyWgrpVfmvJ
 4EGabzvXb8egWJhX+dBx2FgUZyF9p2eqzIvoDaFBvPHdFfzBHGjBpSJY/C5l1Y8kOOwC
 xVW04C/pLZnmaSBu2iAklm0UuU6D/zi49CCjP9MyDtOGDhYwJnbA2tStJD2uxqBXuTE8
 whbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=vnVB62n/dyMgxZTjPt1hdsQcInddDhGUU9UAun7w52M=;
 b=px0ydeXjLJFFoEr8A9M1pT91EgVkfH+RiuVpGV8vfrCJRBa3Sit2RySwTlzK1oHbus
 NOcRcPRcYkt35PsmHeaJHkFOzZLnhNc/DBwEpMNs6NLU7M3ALEhCGmEz1lptPeIWobIv
 GmBUyNMJ2PNPhaGxKeV8p5ZU1VaqA02bFiTK/c5KzWpjdjYj7U1wNfvr6wyzMKb19IPI
 qdXx174G18lGDW6U/UPtpf9v7KGTvb3ZwrWzp4XeWuSyrhiqiToqd3ch3EeRtYeztICR
 05GMIMdw6gSS1MlZXa4hu6pZoBsfPvdZfAIb1tVQvc7jlSmC4npX0yT01COLeC2f1Tix
 HwTg==
X-Gm-Message-State: AMke39kg7iDIpesFtBa7oyCaORjofpCZNREhu5mMwojwiyHPU6I9DOU6aDCZY4w7k4RuQw==
X-Received: by 10.99.223.5 with SMTP id u5mr1212555pgg.58.1487913366599;
 Thu, 23 Feb 2017 21:16:06 -0800 (PST)
Received: from aurora.jms.id.au (103-232-208-193.nat.sa.cust.uniti.network.
 [103.232.208.193])
 by smtp.gmail.com with ESMTPSA id h3sm12540589pfc.82.2017.02.23.21.16.03
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 23 Feb 2017 21:16:05 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Fri, 24 Feb 2017 15:45:58 +1030
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: andrew@aj.id.au
Subject: [PATCH linux dev-4.7] i2c: aspeed: drop the locks
Date: Fri, 24 Feb 2017 15:45:56 +1030
Message-Id: <20170224051556.16432-1-joel@jms.id.au>
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
X-List-Received-Date: Fri, 24 Feb 2017 05:16:09 -0000

The i2c core code provides i2c_lock_bus. This gives all i2c buses a
per-adapter lock, so the locking we perform in the driver is redundant.

Tested on Zaius by using the UDC and EEPROM which are on the same i2c bus.

Suggested-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/i2c/busses/i2c-aspeed.c | 27 ++-------------------------
 1 file changed, 2 insertions(+), 25 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index ece5aa3ecfd1..61da89407895 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -252,9 +252,6 @@ struct ast_i2c_bus {
 	struct clk	*pclk;
 	int		irq;
 
-	/* i2c transfer state. this is accessed from both process and IRQ
-	 * context, so is protected by cmd_lock */
-	spinlock_t	cmd_lock;
 	bool		send_start;
 	bool		send_stop;	/* last message of an xfer? */
 	bool		query_len;
@@ -358,10 +355,8 @@ static void ast_i2c_issue_cmd(struct ast_i2c_bus *bus, u32 cmd)
 
 static int ast_i2c_issue_oob_command(struct ast_i2c_bus *bus, u32 cmd)
 {
-	spin_lock_irq(&bus->cmd_lock);
 	init_completion(&bus->cmd_complete);
 	ast_i2c_issue_cmd(bus, cmd);
-	spin_unlock_irq(&bus->cmd_lock);
 	return wait_for_completion_interruptible_timeout(&bus->cmd_complete,
 					      bus->adap.timeout*HZ);
 }
@@ -539,8 +534,9 @@ static void ast_i2c_master_xfer_done(struct ast_i2c_bus *bus)
 	/* queue the next message. If there's none left, we notify the
 	 * waiter */
 	next_msg_queued = ast_i2c_do_byte_xfer(bus);
-	if (!next_msg_queued)
+	if (!next_msg_queued) {
 		complete(&bus->cmd_complete);
+	}
 }
 
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
@@ -554,7 +550,6 @@ static bool ast_i2c_slave_irq(struct ast_i2c_bus *bus)
 	enum i2c_slave_event event;
 	struct i2c_client *slave = bus->slave;
 
-	spin_lock(&bus->cmd_lock);
 	if (!slave) {
 		irq_handled = false;
 		goto out;
@@ -635,7 +630,6 @@ static bool ast_i2c_slave_irq(struct ast_i2c_bus *bus)
 	ast_i2c_write(bus, status_ack, I2C_INTR_STS_REG);
 
 out:
-	spin_unlock(&bus->cmd_lock);
 	return irq_handled;
 }
 #endif
@@ -649,7 +643,6 @@ static bool ast_i2c_master_irq(struct ast_i2c_bus *bus)
 		AST_I2CD_INTR_TX_NAK;
 	u32 sts, cmd;
 
-	spin_lock(&bus->cmd_lock);
 
 	cmd = ast_i2c_read(bus, I2C_CMD_REG);
 	sts = ast_i2c_read(bus, I2C_INTR_STS_REG);
@@ -708,8 +701,6 @@ static bool ast_i2c_master_irq(struct ast_i2c_bus *bus)
 				bus->msg, bus->cmd_pending);
 	}
 
-	spin_unlock(&bus->cmd_lock);
-
 	return true;
 }
 
@@ -734,13 +725,11 @@ static irqreturn_t ast_i2c_bus_irq(int irq, void *dev_id)
 static int ast_i2c_do_msgs_xfer(struct ast_i2c_bus *bus,
 				struct i2c_msg *msgs, int num)
 {
-	unsigned long flags;
 	int i, ret = 0;
 	u32 err, cmd;
 
 	for (i = 0; i < num; i++) {
 
-		spin_lock_irqsave(&bus->cmd_lock, flags);
 		bus->msg = &msgs[i];
 		bus->msg_pos = 0;
 		bus->query_len = bus->msg->flags & I2C_M_RECV_LEN;
@@ -749,18 +738,15 @@ static int ast_i2c_do_msgs_xfer(struct ast_i2c_bus *bus,
 		init_completion(&bus->cmd_complete);
 
 		ast_i2c_do_byte_xfer(bus);
-		spin_unlock_irqrestore(&bus->cmd_lock, flags);
 
 		ret = wait_for_completion_interruptible_timeout(
 					&bus->cmd_complete,
 					bus->adap.timeout * HZ);
 
-		spin_lock_irqsave(&bus->cmd_lock, flags);
 		err = bus->cmd_err;
 		cmd = bus->cmd_sent;
 		bus->cmd_sent = 0;
 		bus->msg = NULL;
-		spin_unlock_irqrestore(&bus->cmd_lock, flags);
 
 		if (!ret) {
 			dev_dbg(bus->dev, "controller timed out\n");
@@ -831,14 +817,11 @@ static u32 ast_i2c_functionality(struct i2c_adapter *adap)
 static int ast_i2c_reg_slave(struct i2c_client *client)
 {
 	struct ast_i2c_bus *bus;
-	unsigned long flags;
 	u32 addr_reg_val;
 	u32 func_ctrl_reg_val;
 
 	bus = client->adapter->algo_data;
-	spin_lock_irqsave(&bus->cmd_lock, flags);
 	if (bus->slave) {
-		spin_unlock_irqrestore(&bus->cmd_lock, flags);
 		return -EINVAL;
 	}
 
@@ -856,20 +839,16 @@ static int ast_i2c_reg_slave(struct i2c_client *client)
 
 	bus->slave = client;
 	bus->slave_state = AST_I2C_SLAVE_STOP;
-	spin_unlock_irqrestore(&bus->cmd_lock, flags);
 	return 0;
 }
 
 static int ast_i2c_unreg_slave(struct i2c_client *client)
 {
 	struct ast_i2c_bus *bus = client->adapter->algo_data;
-	unsigned long flags;
 	u32 addr_reg_val;
 	u32 func_ctrl_reg_val;
 
-	spin_lock_irqsave(&bus->cmd_lock, flags);
 	if (!bus->slave) {
-		spin_unlock_irqrestore(&bus->cmd_lock, flags);
 		return -EINVAL;
 	}
 
@@ -880,7 +859,6 @@ static int ast_i2c_unreg_slave(struct i2c_client *client)
 	ast_i2c_write(bus, func_ctrl_reg_val, I2C_FUN_CTRL_REG);
 
 	bus->slave = NULL;
-	spin_unlock_irqrestore(&bus->cmd_lock, flags);
 	return 0;
 }
 #endif
@@ -933,7 +911,6 @@ static int ast_i2c_probe_bus(struct platform_device *pdev)
 	}
 
 	/* Initialize the I2C adapter */
-	spin_lock_init(&bus->cmd_lock);
 	bus->adap.nr = bus_num;
 	bus->adap.owner = THIS_MODULE;
 	bus->adap.retries = 0;
-- 
2.11.0
