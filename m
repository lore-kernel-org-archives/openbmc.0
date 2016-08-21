Return-Path: <brendanhiggins@google.com>
Received: from mail-pf0-x235.google.com (mail-pf0-x235.google.com
 [IPv6:2607:f8b0:400e:c00::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sGzlG4pPqzDr3N
 for <openbmc@lists.ozlabs.org>; Sun, 21 Aug 2016 11:34:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=AnYdy/mt; 
 dkim-atps=neutral
Received: by mail-pf0-x235.google.com with SMTP id h186so20719987pfg.3
 for <openbmc@lists.ozlabs.org>; Sat, 20 Aug 2016 18:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gtHImNG5lEDTjNsbmKzoFwaYyT2QW+bRc9Q9saRYTi4=;
 b=AnYdy/mtTdo178MmA1xHy5uB6nMzOY9RVa5GdqDroCT5Wc5Sqf5teecf9qzjj/ojAZ
 744OfBXQRIH4ZlPzPEAM1RgWMT5AOg4cP3PEtVFlzOzJM4wMNrlvZwRvQ/6q/ha6W4Rj
 Sb5YAogc+bZIbykfeUbFnq57GFSdQtGjyWjXiPRCPYTnyDXR2jFXhQbW7OuSTfVGleh1
 N49bjt7ryU1et8nHU1abZpfnXVjri62Xms3NYeKT4cB4vWgifQUEJ6/BuDtLNX/cgw7d
 7WmzqxkTnf0hMJYtPp/lgERXMNph3eIZIPY1KBJfG7b5uK9FxVDf2DKHsInEKsJrqP2u
 dYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=gtHImNG5lEDTjNsbmKzoFwaYyT2QW+bRc9Q9saRYTi4=;
 b=ExGg0xMSd0t+5MUECu1UPHfVVge/zy9+R9FEc/SwDEJktZigeWbgWqsMgqhI9UbuNx
 XfvGXIkX8mCigDZ6LOckpNtK7LiJjYvvB6ClPEHvKY7gfshYKkAu4lVjitcHGWJryeC3
 w8FxdKdzdQNi8S16Ixc9vDbJ/aj85nflV90GPbwGKQe2ToaHg9DbBdsOpLB4fP9DfhZ/
 Kve/FB4+PTitdy9XkUDZ8s19EgAiVlj1KTpeuw93c3Tk7/mIpww9pSbvSb6EGQXym132
 OCuD8VjfmSg1kBwhkLNZtCg+oxGYhhiEyNWvwVMF4BQmoQsbp1BFr7KG72Lrf7ApOUR9
 wTeg==
X-Gm-Message-State: AEkoout00P+aFnU2iQicPwtJcxz5C7jbdxTgPH7waFnjbpu2UaQ1SrF2/ixA4BRttbdlF36S
X-Received: by 10.98.84.65 with SMTP id i62mr28572112pfb.72.1471743271362;
 Sat, 20 Aug 2016 18:34:31 -0700 (PDT)
Received: from mactruck.mtv.corp.google.com ([172.18.64.18])
 by smtp.gmail.com with ESMTPSA id bw10sm21772578pac.27.2016.08.20.18.34.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 20 Aug 2016 18:34:30 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: openbmc@lists.ozlabs.org
Cc: Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH 2/2] i2c: aspeed: cleanup driver
Date: Sat, 20 Aug 2016 18:34:18 -0700
Message-Id: <1471743258-7179-3-git-send-email-brendanhiggins@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1471743258-7179-1-git-send-email-brendanhiggins@google.com>
References: <1471743258-7179-1-git-send-email-brendanhiggins@google.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 21 Aug 2016 01:34:35 -0000

Rewrote most of master IRQ handler, xfer functions, and error recovery.
Minor refactor of probing functions. Added remove functions.
---
 drivers/i2c/busses/i2c-aspeed.c | 932 ++++++++++++++--------------------------
 1 file changed, 318 insertions(+), 614 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index ece5aa3..542ddef 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -1,5 +1,5 @@
 /*
- *  I2C adapter for the ASPEED I2C bus access.
+ *  I2C adapter for the ASPEED I2C bus.
  *
  *  Copyright (C) 2012-2020  ASPEED Technology Inc.
  *  Copyright 2015 IBM Corporation
@@ -7,9 +7,6 @@
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License version 2 as
  *  published by the Free Software Foundation.
- *
- *  History:
- *    2012.07.26: Initial version [Ryan Chen]
  */
 
 #include <linux/kernel.h>
@@ -18,76 +15,29 @@
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
 #include <linux/init.h>
-#include <linux/time.h>
-#include <linux/delay.h>
 #include <linux/errno.h>
 #include <linux/interrupt.h>
 #include <linux/completion.h>
 #include <linux/slab.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
-
 #include <linux/platform_device.h>
 #include <linux/err.h>
 #include <linux/clk.h>
 
-#include <linux/dma-mapping.h>
-
-#include <asm/irq.h>
 #include <asm/io.h>
 
-#if defined(CONFIG_COLDFIRE)
-#include <asm/arch/regs-iic.h>
-#include <asm/arch/ast_i2c.h>
-#else
-//#include <plat/regs-iic.h>
-//#include <plat/ast_i2c.h>
-#endif
-
-#define BYTE_MODE	0
-#define BUFF_MODE	1
-#define DEC_DMA_MODE	2
-#define INC_DMA_MODE	3
-
 /* I2C Register */
 #define  I2C_FUN_CTRL_REG    				0x00
-#define  I2C_AC_TIMING_REG1         		0x04
-#define  I2C_AC_TIMING_REG2         		0x08
-#define  I2C_INTR_CTRL_REG					0x0c
-#define  I2C_INTR_STS_REG					0x10
-#define  I2C_CMD_REG						0x14
-#define  I2C_DEV_ADDR_REG					0x18
-#define  I2C_BUF_CTRL_REG					0x1c
-#define  I2C_BYTE_BUF_REG					0x20
-#define  I2C_DMA_BASE_REG					0x24
-#define  I2C_DMA_LEN_REG					0x28
-
-#define AST_I2C_DMA_SIZE				0
-#define AST_I2C_PAGE_SIZE 				256
-#define MASTER_XFER_MODE				BUFF_MODE
-#define SLAVE_XFER_MODE				BYTE_MODE
-#define NUM_BUS 14
-
-/*AST I2C Register Definition */
-// if defined(AST_SOC_G4)
-#define AST_I2C_POOL_BUFF_2048	
-#define AST_I2C_GLOBAL_REG		0x00
-#define AST_I2C_DEVICE1			0x40
-#define AST_I2C_DEVICE2			0x80
-#define AST_I2C_DEVICE3			0xc0
-#define AST_I2C_DEVICE4			0x100
-#define AST_I2C_DEVICE5			0x140
-#define AST_I2C_DEVICE6			0x180
-#define AST_I2C_DEVICE7			0x1c0
-#define AST_I2C_BUFFER_POOL2	0x200
-#define AST_I2C_DEVICE8			0x300
-#define AST_I2C_DEVICE9			0x340
-#define AST_I2C_DEVICE10		0x380
-#define AST_I2C_DEVICE11		0x3c0
-#define AST_I2C_DEVICE12		0x400
-#define AST_I2C_DEVICE13		0x440
-#define AST_I2C_DEVICE14		0x480
-#define AST_I2C_BUFFER_POOL1	0x800
+#define  I2C_AC_TIMING_REG1         			0x04
+#define  I2C_AC_TIMING_REG2         			0x08
+#define  I2C_INTR_CTRL_REG				0x0c
+#define  I2C_INTR_STS_REG				0x10
+#define  I2C_CMD_REG					0x14
+#define  I2C_DEV_ADDR_REG				0x18
+#define  I2C_BYTE_BUF_REG				0x20
+
+#define AST_I2C_NUM_BUS 14
 
 /* Gloable Register Definition */
 /* 0x00 : I2C Interrupt Status Register  */
@@ -95,35 +45,15 @@
 
 /* Device Register Definition */
 /* 0x00 : I2CD Function Control Register  */
-#define AST_I2CD_BUFF_SEL_MASK				(0x7 << 20)
-#define AST_I2CD_BUFF_SEL(x) 				(x << 20)		// page 0 ~ 7
-#define AST_I2CD_M_SDA_LOCK_EN			(0x1 << 16)
 #define AST_I2CD_MULTI_MASTER_DIS			(0x1 << 15)
-#define AST_I2CD_M_SCL_DRIVE_EN		(0x1 << 14)
-#define AST_I2CD_MSB_STS					(0x1 << 9)
 #define AST_I2CD_SDA_DRIVE_1T_EN			(0x1 << 8)
-#define AST_I2CD_M_SDA_DRIVE_1T_EN		(0x1 << 7)
-#define AST_I2CD_M_HIGH_SPEED_EN		(0x1 << 6)
-#define AST_I2CD_DEF_ADDR_EN				(0x1 << 5)
-#define AST_I2CD_DEF_ALERT_EN				(0x1 << 4)
-#define AST_I2CD_DEF_ARP_EN					(0x1 << 3)
-#define AST_I2CD_DEF_GCALL_EN				(0x1 << 2)
-#define AST_I2CD_SLAVE_EN					(0x1 << 1)
-#define AST_I2CD_MASTER_EN					(0x1 )
-
-/* 0x04 : I2CD Clock and AC Timing Control Register #1 */
-#define AST_I2CD_tBUF						(0x1 << 28) 	// 0~7 
-#define AST_I2CD_tHDSTA						(0x1 << 24)		// 0~7 
-#define AST_I2CD_tACST						(0x1 << 20)		// 0~7 
-#define AST_I2CD_tCKHIGH					(0x1 << 16)		// 0~7 
-#define AST_I2CD_tCKLOW						(0x1 << 12)		// 0~7 
-#define AST_I2CD_tHDDAT						(0x1 << 10)		// 0~7 
-#define AST_I2CD_CLK_TO_BASE_DIV			(0x1 << 8)		// 0~3
-#define AST_I2CD_CLK_BASE_DIV				(0x1 )			// 0~0xf
+#define AST_I2CD_M_SDA_DRIVE_1T_EN			(0x1 << 7)
+#define AST_I2CD_M_HIGH_SPEED_EN			(0x1 << 6)
+#define AST_I2CD_SLAVE_EN				(0x1 << 1)
+#define AST_I2CD_MASTER_EN				(0x1)
 
 /* 0x08 : I2CD Clock and AC Timing Control Register #2 */
-#define AST_I2CD_tTIMEOUT					(0x1 )			// 0~7
-#define AST_NO_TIMEOUT_CTRL					0x0
+#define AST_NO_TIMEOUT_CTRL				0x0
 
 
 /* 0x0c : I2CD Interrupt Control Register &
@@ -134,11 +64,6 @@
  */
 #define AST_I2CD_INTR_SDA_DL_TIMEOUT			(0x1 << 14)
 #define AST_I2CD_INTR_BUS_RECOVER_DONE			(0x1 << 13)
-#define AST_I2CD_INTR_SMBUS_ALERT			(0x1 << 12)
-#define AST_I2CD_INTR_SMBUS_ARP_ADDR			(0x1 << 11)
-#define AST_I2CD_INTR_SMBUS_DEV_ALERT_ADDR		(0x1 << 10)
-#define AST_I2CD_INTR_SMBUS_DEF_ADDR			(0x1 << 9)
-#define AST_I2CD_INTR_GCALL_ADDR			(0x1 << 8)
 #define AST_I2CD_INTR_SLAVE_MATCH			(0x1 << 7)
 #define AST_I2CD_INTR_SCL_TIMEOUT			(0x1 << 6)
 #define AST_I2CD_INTR_ABNORMAL				(0x1 << 5)
@@ -149,82 +74,22 @@
 #define AST_I2CD_INTR_TX_ACK				(0x1 << 0)
 
 /* 0x14 : I2CD Command/Status Register   */
-#define AST_I2CD_SDA_OE					(0x1 << 28)
-#define AST_I2CD_SDA_O					(0x1 << 27)		
-#define AST_I2CD_SCL_OE					(0x1 << 26)		
-#define AST_I2CD_SCL_O					(0x1 << 25)		
-#define AST_I2CD_TX_TIMING				(0x1 << 24)		// 0 ~3
-#define AST_I2CD_TX_STATUS				(0x1 << 23)		
-// Tx State Machine 
-#define AST_I2CD_IDLE	 				0x0
-#define AST_I2CD_MACTIVE				0x8
-#define AST_I2CD_MSTART					0x9
-#define AST_I2CD_MSTARTR				0xa
-#define AST_I2CD_MSTOP					0xb
-#define AST_I2CD_MTXD					0xc
-#define AST_I2CD_MRXACK					0xd
-#define AST_I2CD_MRXD 					0xe
-#define AST_I2CD_MTXACK 				0xf
-#define AST_I2CD_SWAIT					0x1
-#define AST_I2CD_SRXD 					0x4
-#define AST_I2CD_STXACK 				0x5
-#define AST_I2CD_STXD					0x6
-#define AST_I2CD_SRXACK 				0x7
-#define AST_I2CD_RECOVER 				0x3
-
-#define AST_I2CD_SCL_LINE_STS				(0x1 << 18)		
-#define AST_I2CD_SDA_LINE_STS				(0x1 << 17)		
-#define AST_I2CD_BUS_BUSY_STS				(0x1 << 16)		
-#define AST_I2CD_SDA_OE_OUT_DIR				(0x1 << 15)		
-#define AST_I2CD_SDA_O_OUT_DIR				(0x1 << 14)		
-#define AST_I2CD_SCL_OE_OUT_DIR				(0x1 << 13)		
-#define AST_I2CD_SCL_O_OUT_DIR				(0x1 << 12)		
-#define AST_I2CD_BUS_RECOVER_CMD_EN			(0x1 << 11)		
-#define AST_I2CD_S_ALT_EN				(0x1 << 10)		
-// 0 : DMA Buffer, 1: Pool Buffer
-//AST1070 DMA register 
-#define AST_I2CD_RX_DMA_ENABLE				(0x1 << 9)		
-#define AST_I2CD_TX_DMA_ENABLE				(0x1 << 8)		
+#define AST_I2CD_SCL_LINE_STS				(0x1 << 18)
+#define AST_I2CD_SDA_LINE_STS				(0x1 << 17)
+#define AST_I2CD_BUS_BUSY_STS				(0x1 << 16)
+#define AST_I2CD_BUS_RECOVER_CMD			(0x1 << 11)
 
 /* Command Bit */
-#define AST_I2CD_RX_BUFF_ENABLE				(0x1 << 7)		
-#define AST_I2CD_TX_BUFF_ENABLE				(0x1 << 6)		
-#define AST_I2CD_M_STOP_CMD					(0x1 << 5)		
-#define AST_I2CD_M_S_RX_CMD_LAST			(0x1 << 4)		
-#define AST_I2CD_M_RX_CMD					(0x1 << 3)		
-#define AST_I2CD_S_TX_CMD					(0x1 << 2)		
-#define AST_I2CD_M_TX_CMD					(0x1 << 1)		
-#define AST_I2CD_M_START_CMD				(0x1 )		
+#define AST_I2CD_M_STOP_CMD				(0x1 << 5)
+#define AST_I2CD_M_S_RX_CMD_LAST			(0x1 << 4)
+#define AST_I2CD_M_RX_CMD				(0x1 << 3)
+#define AST_I2CD_S_TX_CMD				(0x1 << 2)
+#define AST_I2CD_M_TX_CMD				(0x1 << 1)
+#define AST_I2CD_M_START_CMD				(0x1)
 
 /* 0x18 : I2CD Slave Device Address Register   */
 #define AST_I2CD_DEV_ADDR_MASK                          ((0x1 << 7) - 1)
 
-/* 0x1C : I2CD Pool Buffer Control Register   */
-#define AST_I2CD_RX_BUF_ADDR_GET(x)				((x>> 24)& 0xff)
-#define AST_I2CD_RX_BUF_END_ADDR_SET(x)			(x << 16)		
-#define AST_I2CD_TX_DATA_BUF_END_SET(x)			((x&0xff) << 8)		
-#define AST_I2CD_TX_DATA_BUF_GET(x)			((x >>8) & 0xff)		
-#define AST_I2CD_BUF_BASE_ADDR_SET(x)			(x & 0x3f)		
-
-/* 0x20 : I2CD Transmit/Receive Byte Buffer Register   */
-#define AST_I2CD_GET_MODE(x)					((x >> 8) & 0x1)		
-
-#define AST_I2CD_RX_BYTE_BUFFER					(0xff << 8)		
-#define AST_I2CD_TX_BYTE_BUFFER					(0xff )		
-
-//1. usage flag , 2 size,	3. request address
-/* Use platform_data instead of module parameters */
-/* Fast Mode = 400 kHz, Standard = 100 kHz */
-//static int clock = 100; /* Default: 100 kHz */
-
-/* bitmask of commands that we wait for, in the cmd_pending mask */
-#define AST_I2CD_CMDS	(AST_I2CD_BUS_RECOVER_CMD_EN | \
-			 AST_I2CD_M_STOP_CMD | \
-			 AST_I2CD_M_RX_CMD | \
-			 AST_I2CD_M_TX_CMD)
-
-static const int ast_i2c_n_busses = 14;
-
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 enum ast_i2c_slave_state {
 	AST_I2C_SLAVE_START,
@@ -238,33 +103,20 @@ enum ast_i2c_slave_state {
 
 struct ast_i2c_bus {
 	/* TODO: find a better way to do this */
-	struct ast_i2c_dev *i2c_dev;
-	struct device	*dev;
-
-	void __iomem	*base;			/* virtual */	
-	u32 state;				//I2C xfer mode state matchine 
-	struct i2c_adapter adap;
+	struct i2c_adapter 		adap;
+	struct device			*dev;
+	void __iomem			*base;
+	spinlock_t			lock;
+	struct completion		cmd_complete;
+	int				irq;
+	/* Transaction state. */
+	struct i2c_msg			*msg;
+	int				msg_pos;
+	u32				cmd_err;
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
-	struct i2c_client *slave;
-	enum ast_i2c_slave_state slave_state;
+	struct i2c_client		*slave;
+	enum ast_i2c_slave_state	slave_state;
 #endif
-	u32		bus_clk;
-	struct clk	*pclk;
-	int		irq;
-
-	/* i2c transfer state. this is accessed from both process and IRQ
-	 * context, so is protected by cmd_lock */
-	spinlock_t	cmd_lock;
-	bool		send_start;
-	bool		send_stop;	/* last message of an xfer? */
-	bool		query_len;
-	struct i2c_msg	*msg;		/* current tx/rx message */
-	int		msg_pos;	/* current byte position in message */
-
-	struct completion cmd_complete;
-	u32		cmd_sent;
-	u32		cmd_pending;
-	u32		cmd_err;
 };
 
 struct ast_i2c_controller {
@@ -284,263 +136,57 @@ static inline u32 ast_i2c_read(struct ast_i2c_bus *bus, u32 reg)
 	return readl(bus->base + reg);
 }
 
-static u32 select_i2c_clock(struct ast_i2c_bus *bus)
-{
-	unsigned int inc = 0, div, divider_ratio;
-	u32 SCL_Low, SCL_High, data;
-
-	divider_ratio = clk_get_rate(bus->pclk) / bus->bus_clk;
-	for (div = 0; divider_ratio >= 16; div++) {
-		inc |= (divider_ratio & 1);
-		divider_ratio >>= 1;
-	}
-	divider_ratio += inc;
-	SCL_Low = (divider_ratio >> 1) - 1;
-	SCL_High = divider_ratio - SCL_Low - 2;
-	data = 0x77700300 | (SCL_High << 16) | (SCL_Low << 12) | div;
-	return data;
-}
-
-static void ast_i2c_dev_init(struct ast_i2c_bus *bus)
-{
-	/* reset device: disable master & slave functions */
-	ast_i2c_write(bus, 0, I2C_FUN_CTRL_REG);
-
-	dev_dbg(bus->dev, "bus_clk %u, pclk %lu\n",
-			bus->bus_clk, clk_get_rate(bus->pclk));
-
-	/* Set AC Timing */
-	if(bus->bus_clk / 1000 > 400) {
-		ast_i2c_write(bus, ast_i2c_read(bus, I2C_FUN_CTRL_REG) |
-				AST_I2CD_M_HIGH_SPEED_EN |
-				AST_I2CD_M_SDA_DRIVE_1T_EN |
-				AST_I2CD_SDA_DRIVE_1T_EN,
-				I2C_FUN_CTRL_REG);
-
-		ast_i2c_write(bus, 0x3, I2C_AC_TIMING_REG2);
-		ast_i2c_write(bus, select_i2c_clock(bus), I2C_AC_TIMING_REG1);
-	} else {
-		ast_i2c_write(bus, select_i2c_clock(bus), I2C_AC_TIMING_REG1);
-		ast_i2c_write(bus, AST_NO_TIMEOUT_CTRL, I2C_AC_TIMING_REG2);
-	}
-
-	dev_dbg(bus->dev, "reg1: %x, reg2: %x, fun_ctrl: %x\n",
-			ast_i2c_read(bus, I2C_AC_TIMING_REG1),
-			ast_i2c_read(bus, I2C_AC_TIMING_REG2),
-			ast_i2c_read(bus, I2C_FUN_CTRL_REG));
-
-	/* Enable Master Mode */
-	ast_i2c_write(bus, ast_i2c_read(bus, I2C_FUN_CTRL_REG)
-			| AST_I2CD_MASTER_EN, I2C_FUN_CTRL_REG);
-
-	/* Set interrupt generation of I2C controller */
-	ast_i2c_write(bus, AST_I2CD_INTR_SDA_DL_TIMEOUT |
-			AST_I2CD_INTR_BUS_RECOVER_DONE |
-			AST_I2CD_INTR_SCL_TIMEOUT |
-			AST_I2CD_INTR_ABNORMAL |
-			AST_I2CD_INTR_NORMAL_STOP |
-			AST_I2CD_INTR_ARBIT_LOSS |
-			AST_I2CD_INTR_RX_DONE |
-			AST_I2CD_INTR_TX_NAK |
-			AST_I2CD_INTR_TX_ACK,
-			I2C_INTR_CTRL_REG);
-
-}
-
-static void ast_i2c_issue_cmd(struct ast_i2c_bus *bus, u32 cmd)
-{
-	dev_dbg(bus->dev, "issuing cmd: %x\n", cmd);
-	bus->cmd_err = 0;
-	bus->cmd_sent = cmd;
-	bus->cmd_pending = cmd & AST_I2CD_CMDS;
-	ast_i2c_write(bus, cmd, I2C_CMD_REG);
-}
-
-static int ast_i2c_issue_oob_command(struct ast_i2c_bus *bus, u32 cmd)
-{
-	spin_lock_irq(&bus->cmd_lock);
-	init_completion(&bus->cmd_complete);
-	ast_i2c_issue_cmd(bus, cmd);
-	spin_unlock_irq(&bus->cmd_lock);
-	return wait_for_completion_interruptible_timeout(&bus->cmd_complete,
-					      bus->adap.timeout*HZ);
-}
-
-static u8 ast_i2c_bus_error_recover(struct ast_i2c_bus *bus)
+static u8 ast_i2c_recover_bus(struct ast_i2c_bus *bus)
 {
-	u32 sts, i;
-	int r;
+	u32 sts;
+	unsigned long time_left;
+	unsigned long flags;
+	int ret = 0;
 
-	//Check 0x14's SDA and SCL status
+	spin_lock_irqsave(&bus->lock, flags);
 	sts = ast_i2c_read(bus,I2C_CMD_REG);
-
+	/* Bus is idle: no recovery needed. */
 	if ((sts & AST_I2CD_SDA_LINE_STS) && (sts & AST_I2CD_SCL_LINE_STS)) {
-		//Means bus is idle.
-		dev_dbg(bus->dev,
-				"I2C bus is idle. I2C slave doesn't exist?!\n");
-		return -1;
+		spin_unlock_irqrestore(&bus->lock, flags);
+		return 0;
 	}
+	dev_dbg(bus->dev, "bus hung (status %x), attempting recovery\n", sts);
 
-	dev_dbg(bus->dev, "I2C bus hung (status %x), attempting recovery\n",
-			sts);
-
+	/* Bus held: put bus in stop state. */
 	if ((sts & AST_I2CD_SDA_LINE_STS) && !(sts & AST_I2CD_SCL_LINE_STS)) {
-		//if SDA == 1 and SCL == 0, it means the master is locking the bus.
-		//Send a stop command to unlock the bus.
-		dev_dbg(bus->dev, "I2C's master is locking the bus, try to stop it.\n");
-
-		init_completion(&bus->cmd_complete);
-
 		ast_i2c_write(bus, AST_I2CD_M_STOP_CMD, I2C_CMD_REG);
-
-		r = wait_for_completion_interruptible_timeout(&bus->cmd_complete,
-							      bus->adap.timeout*HZ);
-
-		if (bus->cmd_err) {
-			dev_dbg(bus->dev, "recovery error \n");
-			return -1;
-		}
-
-		if (r == 0) {
-			 dev_dbg(bus->dev, "recovery timed out\n");
-			 return -1;
-		} else {
-			dev_dbg(bus->dev, "Recovery successfully\n");
-			return 0;
-		}
-
+		reinit_completion(&bus->cmd_complete);
+		spin_unlock_irqrestore(&bus->lock, flags);
+
+		time_left = wait_for_completion_interruptible_timeout(
+				&bus->cmd_complete, bus->adap.timeout * HZ);
+
+		spin_lock_irqsave(&bus->lock, flags);
+		if (time_left == 0)
+			ret = -ETIMEDOUT;
+		else if (bus->cmd_err)
+			ret = -EIO;
+	/* Bus error. */
 	} else if (!(sts & AST_I2CD_SDA_LINE_STS)) {
-		//else if SDA == 0, the device is dead. We need to reset the bus
-		//And do the recovery command.
-		dev_dbg(bus->dev, "I2C's slave is dead, try to recover it\n");
-		for (i = 0; i < 2; i++) {
-			ast_i2c_dev_init(bus);
-			ast_i2c_issue_oob_command(bus,
-					AST_I2CD_BUS_RECOVER_CMD_EN);
-			if (bus->cmd_err != 0) {
-				dev_dbg(bus->dev, "ERROR!! Failed to do recovery command(0x%08x)\n", bus->cmd_err);
-				return -1;
-			}
-			//Check 0x14's SDA and SCL status
-			sts = ast_i2c_read(bus,I2C_CMD_REG);
-			if (sts & AST_I2CD_SDA_LINE_STS) //Recover OK
-				break;
-		}
-		if (i == 2) {
-			dev_dbg(bus->dev, "ERROR!! recover failed\n");
-			return -1;
-		}
-	} else {
-		dev_dbg(bus->dev, "Don't know how to handle this case?!\n");
-		return -1;
+		ast_i2c_write(bus, AST_I2CD_BUS_RECOVER_CMD, I2C_CMD_REG);
+		reinit_completion(&bus->cmd_complete);
+		spin_unlock_irqrestore(&bus->lock, flags);
+
+		time_left = wait_for_completion_interruptible_timeout(
+				&bus->cmd_complete, bus->adap.timeout * HZ);
+
+		spin_lock_irqsave(&bus->lock, flags);
+		if (time_left == 0)
+			ret = -ETIMEDOUT;
+		else if (bus->cmd_err)
+			ret = -EIO;
+		/* Recovery failed. */
+		else if (!(ast_i2c_read(bus,I2C_CMD_REG) &
+			   AST_I2CD_SDA_LINE_STS))
+			ret = -EIO;
 	}
-	dev_dbg(bus->dev, "Recovery successfully\n");
-	return 0;
-}
-
-static int ast_i2c_wait_bus_not_busy(struct ast_i2c_bus *bus)
-{
-	int timeout = 2; //TODO number
-
-	while (ast_i2c_read(bus, I2C_CMD_REG) & AST_I2CD_BUS_BUSY_STS) {
-		ast_i2c_bus_error_recover(bus);
-		if(timeout <= 0)
-			break;
-		timeout--;
-		msleep(2);
-	}
-
-	return timeout <= 0 ? EAGAIN : 0;
-}
-
-static bool ast_i2c_do_byte_xfer(struct ast_i2c_bus *bus)
-{
-	u32 cmd, data;
-
-	if (bus->send_start) {
-		dev_dbg(bus->dev, "%s %c: addr %x start, len %d\n", __func__,
-			bus->msg->flags & I2C_M_RD ? 'R' : 'W',
-			bus->msg->addr,	bus->msg->len);
-
-		data = bus->msg->addr << 1;
-		if (bus->msg->flags & I2C_M_RD)
-			data |= 0x1;
-
-		cmd = AST_I2CD_M_TX_CMD | AST_I2CD_M_START_CMD;
-		if (bus->send_stop && bus->msg->len == 0)
-			cmd |= AST_I2CD_M_STOP_CMD;
-
-		ast_i2c_write(bus, data, I2C_BYTE_BUF_REG);
-		ast_i2c_issue_cmd(bus, cmd);
-
-	} else if (bus->msg_pos < bus->msg->len){
-		bool is_last = bus->msg_pos + 1 == bus->msg->len;
-
-		dev_dbg(bus->dev, "%s %c%c: addr %x xfer %d, len %d\n",
-			__func__,
-			bus->msg->flags & I2C_M_RD ? 'R' : 'W',
-			bus->send_stop && is_last ? 'T' : '-',
-			bus->msg->addr,
-			bus->msg_pos, bus->msg->len);
-
-		if (bus->msg->flags & I2C_M_RD) {
-			cmd = AST_I2CD_M_RX_CMD;
-			if (bus->send_stop && is_last && !bus->query_len)
-				cmd |= AST_I2CD_M_S_RX_CMD_LAST |
-					AST_I2CD_M_STOP_CMD;
-
-		} else {
-			cmd = AST_I2CD_M_TX_CMD;
-			ast_i2c_write(bus, bus->msg->buf[bus->msg_pos],
-					I2C_BYTE_BUF_REG);
-
-			if (bus->send_stop && is_last)
-				cmd |= AST_I2CD_M_STOP_CMD;
-		}
-		ast_i2c_issue_cmd(bus, cmd);
-
-	} else {
-		return false;
-	}
-
-	return true;
-}
-
-//TX/Rx Done
-static void ast_i2c_master_xfer_done(struct ast_i2c_bus *bus)
-{
-	bool next_msg_queued;
-
-	dev_dbg(bus->dev, "%s xfer %d%c\n", __func__,
-			bus->msg_pos,
-			bus->send_start ? 'S' : ' ');
-
-	if (bus->send_start) {
-		bus->send_start = false;
-	} else {
-
-		if (bus->msg->flags & I2C_M_RD) {
-			uint8_t data;
-
-			data = (ast_i2c_read(bus, I2C_BYTE_BUF_REG) &
-					AST_I2CD_RX_BYTE_BUFFER) >> 8;
-
-			if (bus->query_len) {
-				bus->msg->len += data;
-				bus->query_len = false;
-				dev_dbg(bus->dev, "got rx len: %d\n",
-						bus->msg->len -1);
-			}
-			bus->msg->buf[bus->msg_pos] = data;
-		}
-		bus->msg_pos++;
-	}
-
-	/* queue the next message. If there's none left, we notify the
-	 * waiter */
-	next_msg_queued = ast_i2c_do_byte_xfer(bus);
-	if (!next_msg_queued)
-		complete(&bus->cmd_complete);
+	spin_unlock_irqrestore(&bus->lock, flags);
+	return ret;
 }
 
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
@@ -554,7 +200,7 @@ static bool ast_i2c_slave_irq(struct ast_i2c_bus *bus)
 	enum i2c_slave_event event;
 	struct i2c_client *slave = bus->slave;
 
-	spin_lock(&bus->cmd_lock);
+	spin_lock(&bus->lock);
 	if (!slave) {
 		irq_handled = false;
 		goto out;
@@ -635,7 +281,7 @@ static bool ast_i2c_slave_irq(struct ast_i2c_bus *bus)
 	ast_i2c_write(bus, status_ack, I2C_INTR_STS_REG);
 
 out:
-	spin_unlock(&bus->cmd_lock);
+	spin_unlock(&bus->lock);
 	return irq_handled;
 }
 #endif
@@ -647,69 +293,43 @@ static bool ast_i2c_master_irq(struct ast_i2c_bus *bus)
 		AST_I2CD_INTR_SCL_TIMEOUT |
 		AST_I2CD_INTR_SDA_DL_TIMEOUT |
 		AST_I2CD_INTR_TX_NAK;
-	u32 sts, cmd;
-
-	spin_lock(&bus->cmd_lock);
-
-	cmd = ast_i2c_read(bus, I2C_CMD_REG);
-	sts = ast_i2c_read(bus, I2C_INTR_STS_REG);
-
-	dev_dbg(bus->dev, "irq! status 0x%08x, cmd 0x%08x\n", sts, cmd);
-
-	sts &= 0xffff;
-	bus->state = cmd >> 19 & 0xf;
-
-	/*
-	 * ack everything - this is safe because this driver makes master mode
-	 * and slave mode mutually exclusive on a single bus; thus, it is not
-	 * possible for a master to steal a slave IRQ in this way.
-	 */
-	ast_i2c_write(bus, sts, I2C_INTR_STS_REG);
-
-	bus->cmd_err |= sts & errs;
-
-	/**
-	 * Mask-out pending commands that this interrupt has indicated are
-	 * complete. These checks need to cover all of the possible bits set
-	 * in the AST_I2CD_CMDS bitmask.
-	 */
-	if (sts & AST_I2CD_INTR_TX_ACK)
-		bus->cmd_pending &= ~AST_I2CD_M_TX_CMD;
-
-	if (sts & AST_I2CD_INTR_RX_DONE)
-		bus->cmd_pending &= ~AST_I2CD_M_RX_CMD;
-
-	if (sts & AST_I2CD_INTR_NORMAL_STOP)
-		bus->cmd_pending &= ~AST_I2CD_M_STOP_CMD;
-
-	if (sts & AST_I2CD_INTR_BUS_RECOVER_DONE)
-		bus->cmd_pending &= ~AST_I2CD_BUS_RECOVER_CMD_EN;
-
-	/* if we've seen an error, notify our waiter */
-	if (bus->cmd_err) {
-		complete(&bus->cmd_complete);
+	u32 irq_status;
 
-	/* still have work to do? We'll wait for the corresponding IRQ(s) for
-	 * that to complete. */
-	} else if (bus->cmd_pending) {
-		dev_dbg(bus->dev, "cmds pending: 0x%x\n", bus->cmd_pending);
+	spin_lock(&bus->lock);
+	irq_status = ast_i2c_read(bus, I2C_INTR_STS_REG);
+	bus->cmd_err |= irq_status & errs;
 
-	/* message transfer complete */
-	} else if (bus->msg) {
-		ast_i2c_master_xfer_done(bus);
+	dev_dbg(bus->dev, "master irq status 0x%08x\n", irq_status);
 
-	/* other (non-message) command complete: recovery, error stop. Notify
-	 * waiters. */
-	} else if (bus->cmd_sent) {
+	/* No message to transfer. */
+	if (bus->cmd_err ||
+	    (irq_status & AST_I2CD_INTR_NORMAL_STOP) ||
+	    (irq_status & AST_I2CD_INTR_BUS_RECOVER_DONE)) {
 		complete(&bus->cmd_complete);
+		goto out;
+	} else if (!bus->msg || bus->msg_pos >= bus->msg->len)
+		goto out;
 
-	} else {
-		dev_err(bus->dev, "Invalid state (msg %p, pending %x)?",
-				bus->msg, bus->cmd_pending);
+	if ((bus->msg->flags & I2C_M_RD) && (irq_status & AST_I2CD_INTR_RX_DONE)) {
+		bus->msg->buf[bus->msg_pos++] =
+				ast_i2c_read(bus, I2C_BYTE_BUF_REG) >> 8;
+		if (bus->msg_pos + 1 < bus->msg->len)
+			ast_i2c_write(bus, AST_I2CD_M_RX_CMD, I2C_CMD_REG);
+		else if (bus->msg_pos < bus->msg->len)
+			ast_i2c_write(bus, AST_I2CD_M_RX_CMD |
+				      AST_I2CD_M_S_RX_CMD_LAST, I2C_CMD_REG);
+	} else if (!(bus->msg->flags & I2C_M_RD) && (irq_status & AST_I2CD_INTR_TX_ACK)) {
+		ast_i2c_write(bus, bus->msg->buf[bus->msg_pos++],
+			      I2C_BYTE_BUF_REG);
+		ast_i2c_write(bus, AST_I2CD_M_TX_CMD, I2C_CMD_REG);
 	}
 
-	spin_unlock(&bus->cmd_lock);
-
+	/* Transmission complete: notify caller. */
+	if (bus->msg_pos >= bus->msg->len)
+		complete(&bus->cmd_complete);
+out:
+	ast_i2c_write(bus, irq_status, I2C_INTR_STS_REG);
+	spin_unlock(&bus->lock);
 	return true;
 }
 
@@ -731,95 +351,94 @@ static irqreturn_t ast_i2c_bus_irq(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static int ast_i2c_do_msgs_xfer(struct ast_i2c_bus *bus,
-				struct i2c_msg *msgs, int num)
+static int ast_i2c_master_single_xfer(struct i2c_adapter *adap, struct i2c_msg *msg)
 {
+	struct ast_i2c_bus *bus = adap->algo_data;
 	unsigned long flags;
-	int i, ret = 0;
-	u32 err, cmd;
-
-	for (i = 0; i < num; i++) {
-
-		spin_lock_irqsave(&bus->cmd_lock, flags);
-		bus->msg = &msgs[i];
-		bus->msg_pos = 0;
-		bus->query_len = bus->msg->flags & I2C_M_RECV_LEN;
-		bus->send_start = !(bus->msg->flags & I2C_M_NOSTART);
-		bus->send_stop = !!(num == i+1);
-		init_completion(&bus->cmd_complete);
-
-		ast_i2c_do_byte_xfer(bus);
-		spin_unlock_irqrestore(&bus->cmd_lock, flags);
-
-		ret = wait_for_completion_interruptible_timeout(
-					&bus->cmd_complete,
-					bus->adap.timeout * HZ);
-
-		spin_lock_irqsave(&bus->cmd_lock, flags);
-		err = bus->cmd_err;
-		cmd = bus->cmd_sent;
-		bus->cmd_sent = 0;
-		bus->msg = NULL;
-		spin_unlock_irqrestore(&bus->cmd_lock, flags);
-
-		if (!ret) {
-			dev_dbg(bus->dev, "controller timed out\n");
-			return -EIO;
-		}
-
-		if (err != 0) {
-			if (cmd & AST_I2CD_M_STOP_CMD) {
-				return -ETIMEDOUT;
-			} else {
-				dev_dbg(bus->dev, "send stop\n");
-				ast_i2c_issue_oob_command(bus,
-						AST_I2CD_M_STOP_CMD);
-				return -EAGAIN;
-			}
-		}
+	u8 slave_addr;
+	u32 command = AST_I2CD_M_START_CMD | AST_I2CD_M_TX_CMD;
+	int ret = msg->len;
+	unsigned long time_left;
+
+	spin_lock_irqsave(&bus->lock, flags);
+	bus->msg = msg;
+	bus->msg_pos = 0;
+	slave_addr = msg->addr << 1;
+	if (msg->flags & I2C_M_RD) {
+		slave_addr |= 1;
+		command |= AST_I2CD_M_RX_CMD;
 	}
+	ast_i2c_write(bus, slave_addr, I2C_BYTE_BUF_REG);
+	ast_i2c_write(bus, command, I2C_CMD_REG);
+	reinit_completion(&bus->cmd_complete);
+	spin_unlock_irqrestore(&bus->lock, flags);
+
+	time_left = wait_for_completion_interruptible_timeout(
+			&bus->cmd_complete, bus->adap.timeout * HZ * msg->len);
+	if (time_left == 0)
+		return -ETIMEDOUT;
+
+	spin_lock_irqsave(&bus->lock, flags);
+	if (bus->cmd_err)
+		ret = -EIO;
+	bus->msg = NULL;
+	spin_unlock_irqrestore(&bus->lock, flags);
 
-	return num;
+	return ret;
 }
 
-static int ast_i2c_xfer(struct i2c_adapter *adap,
-			struct i2c_msg *msgs, int num)
+static int ast_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
+			       int num)
 {
 	struct ast_i2c_bus *bus = adap->algo_data;
-	int ret, i;
-	int sts;
-
-	sts = ast_i2c_read(bus, I2C_CMD_REG);
-	dev_dbg(bus->dev, "state[%x], SCL[%d], SDA[%d], BUS[%d]\n",
-		(sts >> 19) & 0xf,
-		(sts >> 18) & 0x1,
-		(sts >> 17) & 0x1,
-		(sts >> 16) & 1);
-	/*
-	 * Wait for the bus to become free.
-	 */
+	int ret;
+	int i;
+	unsigned long flags;
+	unsigned long time_left;
 
-	ret = ast_i2c_wait_bus_not_busy(bus);
-	if (ret) {
-		dev_err(&adap->dev, "i2c_ast: timeout waiting for bus free\n");
-		goto out;
+	/* If bus is busy, attempt recovery. We assume a single master
+	 * environment.
+	 */
+	if (ast_i2c_read(bus, I2C_CMD_REG) & AST_I2CD_BUS_BUSY_STS) {
+		ret = ast_i2c_recover_bus(bus);
+		if (ret)
+			return ret;
 	}
 
-	for (i = adap->retries; i >= 0; i--) {
-		if (i != 0)
-			dev_dbg(&adap->dev, "Do retrying transmission [%d]\n",i);
-
-		ret = ast_i2c_do_msgs_xfer(bus, msgs, num);
-		if (ret != -EAGAIN)
-			goto out;
-
-		udelay(100);
+	for (i = 0; i < num; i++) {
+		ret = ast_i2c_master_single_xfer(adap, &msgs[i]);
+		if (ret < 0)
+			break;
+		/* TODO: Support other forms of I2C protocol mangling. */
+		if (msgs[i].flags & I2C_M_STOP) {
+			spin_lock_irqsave(&bus->lock, flags);
+			ast_i2c_write(bus, AST_I2CD_M_STOP_CMD, I2C_CMD_REG);
+			reinit_completion(&bus->cmd_complete);
+			spin_unlock_irqrestore(&bus->lock, flags);
+
+			time_left = wait_for_completion_interruptible_timeout(
+					&bus->cmd_complete,
+					bus->adap.timeout * HZ);
+			if (time_left == 0)
+				return -ETIMEDOUT;
+		}
 	}
 
-	ret = -EREMOTEIO;
-out:
+	spin_lock_irqsave(&bus->lock, flags);
+	ast_i2c_write(bus, AST_I2CD_M_STOP_CMD, I2C_CMD_REG);
+	reinit_completion(&bus->cmd_complete);
+	spin_unlock_irqrestore(&bus->lock, flags);
 
-	return ret;
+	time_left = wait_for_completion_interruptible_timeout(
+			&bus->cmd_complete, bus->adap.timeout * HZ);
+	if (time_left == 0)
+		return -ETIMEDOUT;
+
+	/* If nothing went wrong, return number of messages transferred. */
+	if (ret < 0)
+		return ret;
+	else
+		return i;
 }
 
 static u32 ast_i2c_functionality(struct i2c_adapter *adap)
@@ -836,9 +455,9 @@ static int ast_i2c_reg_slave(struct i2c_client *client)
 	u32 func_ctrl_reg_val;
 
 	bus = client->adapter->algo_data;
-	spin_lock_irqsave(&bus->cmd_lock, flags);
+	spin_lock_irqsave(&bus->lock, flags);
 	if (bus->slave) {
-		spin_unlock_irqrestore(&bus->cmd_lock, flags);
+		spin_unlock_irqrestore(&bus->lock, flags);
 		return -EINVAL;
 	}
 
@@ -856,7 +475,7 @@ static int ast_i2c_reg_slave(struct i2c_client *client)
 
 	bus->slave = client;
 	bus->slave_state = AST_I2C_SLAVE_STOP;
-	spin_unlock_irqrestore(&bus->cmd_lock, flags);
+	spin_unlock_irqrestore(&bus->lock, flags);
 	return 0;
 }
 
@@ -864,12 +483,11 @@ static int ast_i2c_unreg_slave(struct i2c_client *client)
 {
 	struct ast_i2c_bus *bus = client->adapter->algo_data;
 	unsigned long flags;
-	u32 addr_reg_val;
 	u32 func_ctrl_reg_val;
 
-	spin_lock_irqsave(&bus->cmd_lock, flags);
+	spin_lock_irqsave(&bus->lock, flags);
 	if (!bus->slave) {
-		spin_unlock_irqrestore(&bus->cmd_lock, flags);
+		spin_unlock_irqrestore(&bus->lock, flags);
 		return -EINVAL;
 	}
 
@@ -880,13 +498,13 @@ static int ast_i2c_unreg_slave(struct i2c_client *client)
 	ast_i2c_write(bus, func_ctrl_reg_val, I2C_FUN_CTRL_REG);
 
 	bus->slave = NULL;
-	spin_unlock_irqrestore(&bus->cmd_lock, flags);
+	spin_unlock_irqrestore(&bus->lock, flags);
 	return 0;
 }
 #endif
 
 static const struct i2c_algorithm i2c_ast_algorithm = {
-	.master_xfer	= ast_i2c_xfer,
+	.master_xfer	= ast_i2c_master_xfer,
 	.functionality	= ast_i2c_functionality,
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	.reg_slave	= ast_i2c_reg_slave,
@@ -894,6 +512,65 @@ static const struct i2c_algorithm i2c_ast_algorithm = {
 #endif
 };
 
+static u32 get_clk_reg_val(u32 divider_ratio)
+{
+	unsigned int inc = 0, div;
+	u32 scl_low, scl_high, data;
+
+	for (div = 0; divider_ratio >= 16; div++) {
+		inc |= (divider_ratio & 1);
+		divider_ratio >>= 1;
+	}
+	divider_ratio += inc;
+	scl_low = (divider_ratio >> 1) - 1;
+	scl_high = divider_ratio - scl_low - 2;
+	data = 0x77700300 | (scl_high << 16) | (scl_low << 12) | div;
+	return data;
+}
+
+static int init_clk(struct ast_i2c_bus *bus, struct platform_device *pdev)
+{
+	struct clk *pclk;
+	u32 clk_freq;
+	u32 divider_ratio;
+	int ret;
+
+	pclk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(pclk)) {
+		dev_err(&pdev->dev, "clk_get failed\n");
+		return PTR_ERR(pclk);
+	}
+	ret = of_property_read_u32(pdev->dev.of_node,
+			"clock-frequency", &clk_freq);
+	if (ret < 0) {
+		dev_err(&pdev->dev,
+				"Could not read clock-frequency property\n");
+		clk_freq = 100000;
+	}
+	divider_ratio = clk_get_rate(pclk) / clk_freq;
+	/* We just need the clock rate, we don't actually use the clk object. */
+	devm_clk_put(&pdev->dev, pclk);
+
+	/* Set AC Timing */
+	if(clk_freq / 1000 > 400) {
+		ast_i2c_write(bus, ast_i2c_read(bus, I2C_FUN_CTRL_REG) |
+				AST_I2CD_M_HIGH_SPEED_EN |
+				AST_I2CD_M_SDA_DRIVE_1T_EN |
+				AST_I2CD_SDA_DRIVE_1T_EN,
+				I2C_FUN_CTRL_REG);
+
+		ast_i2c_write(bus, 0x3, I2C_AC_TIMING_REG2);
+		ast_i2c_write(bus, get_clk_reg_val(divider_ratio),
+			      I2C_AC_TIMING_REG1);
+	} else {
+		ast_i2c_write(bus, get_clk_reg_val(divider_ratio),
+			      I2C_AC_TIMING_REG1);
+		ast_i2c_write(bus, AST_NO_TIMEOUT_CTRL, I2C_AC_TIMING_REG2);
+	}
+
+	return 0;
+}
+
 static int ast_i2c_probe_bus(struct platform_device *pdev)
 {
 	struct ast_i2c_bus *bus;
@@ -908,12 +585,6 @@ static int ast_i2c_probe_bus(struct platform_device *pdev)
 	if (ret)
 		return -ENXIO;
 
-	bus->pclk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(bus->pclk)) {
-		dev_err(&pdev->dev, "clk_get failed\n");
-		return PTR_ERR(bus->pclk);
-	}
-
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	bus->base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(bus->base))
@@ -933,7 +604,8 @@ static int ast_i2c_probe_bus(struct platform_device *pdev)
 	}
 
 	/* Initialize the I2C adapter */
-	spin_lock_init(&bus->cmd_lock);
+	spin_lock_init(&bus->lock);
+	init_completion(&bus->cmd_complete);
 	bus->adap.nr = bus_num;
 	bus->adap.owner = THIS_MODULE;
 	bus->adap.retries = 0;
@@ -947,26 +619,67 @@ static int ast_i2c_probe_bus(struct platform_device *pdev)
 
 	bus->dev = &pdev->dev;
 
-	ret = of_property_read_u32(pdev->dev.of_node,
-			"clock-frequency", &bus->bus_clk);
-	if (ret < 0) {
-		dev_err(&pdev->dev,
-				"Could not read clock-frequency property\n");
-		bus->bus_clk = 100000;
-	}
+	/* reset device: disable master & slave functions */
+	ast_i2c_write(bus, 0, I2C_FUN_CTRL_REG);
+
+	ret = init_clk(bus, pdev);
+	if (ret < 0)
+		return ret;
 
-	ast_i2c_dev_init(bus);
+	/* Enable Master Mode */
+	ast_i2c_write(bus, ast_i2c_read(bus, I2C_FUN_CTRL_REG) |
+		      AST_I2CD_MASTER_EN |
+		      AST_I2CD_MULTI_MASTER_DIS, I2C_FUN_CTRL_REG);
+
+	/* Set interrupt generation of I2C controller */
+	ast_i2c_write(bus, AST_I2CD_INTR_SDA_DL_TIMEOUT |
+			AST_I2CD_INTR_BUS_RECOVER_DONE |
+			AST_I2CD_INTR_SCL_TIMEOUT |
+			AST_I2CD_INTR_ABNORMAL |
+			AST_I2CD_INTR_NORMAL_STOP |
+			AST_I2CD_INTR_ARBIT_LOSS |
+			AST_I2CD_INTR_RX_DONE |
+			AST_I2CD_INTR_TX_NAK |
+			AST_I2CD_INTR_TX_ACK,
+			I2C_INTR_CTRL_REG);
 
 	ret = i2c_add_numbered_adapter(&bus->adap);
 	if (ret < 0)
 		return -ENXIO;
 
+	platform_set_drvdata(pdev, bus);
+
 	dev_info(bus->dev, "i2c bus %d registered, irq %d\n",
 			bus->adap.nr, bus->irq);
 
 	return 0;
 }
 
+static int ast_i2c_remove_bus(struct platform_device *pdev)
+{
+	struct ast_i2c_bus *bus = platform_get_drvdata(pdev);
+
+	i2c_del_adapter(&bus->adap);
+	return 0;
+}
+
+static const struct of_device_id ast_i2c_bus_of_table[] = {
+	{ .compatible = "aspeed,ast2400-i2c-bus", },
+	{ .compatible = "aspeed,ast2500-i2c-bus", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, ast_i2c_of_table);
+
+static struct platform_driver ast_i2c_bus_driver = {
+	.probe		= ast_i2c_probe_bus,
+	.remove		= ast_i2c_remove_bus,
+	.driver         = {
+		.name   = "ast-i2c-bus",
+		.of_match_table = ast_i2c_bus_of_table,
+	},
+};
+module_platform_driver(ast_i2c_bus_driver);
+
 static void noop(struct irq_data *data) { }
 
 static struct irq_chip ast_i2c_irqchip = {
@@ -982,7 +695,7 @@ static void ast_i2c_controller_irq(struct irq_desc *desc)
 	unsigned int bus_irq;
 
 	status = readl(c->base);
-	for_each_set_bit(p, &status, ast_i2c_n_busses) {
+	for_each_set_bit(p, &status, AST_I2C_NUM_BUS) {
 		bus_irq = irq_find_mapping(c->irq_domain, p);
 		generic_handle_irq(bus_irq);
 	}
@@ -1011,14 +724,14 @@ static int ast_i2c_probe_controller(struct platform_device *pdev)
 	}
 
 	controller->irq_domain = irq_domain_add_linear(pdev->dev.of_node,
-			ast_i2c_n_busses, &irq_domain_simple_ops, NULL);
+			AST_I2C_NUM_BUS, &irq_domain_simple_ops, NULL);
 	if (!controller->irq_domain) {
 		dev_err(&pdev->dev, "no IRQ domain\n");
 		return -ENXIO;
 	}
 	controller->irq_domain->name = "ast-i2c-domain";
 
-	for (i = 0; i < ast_i2c_n_busses; i++) {
+	for (i = 0; i < AST_I2C_NUM_BUS; i++) {
 		irq = irq_create_mapping(controller->irq_domain, i);
 		irq_set_chip_data(irq, controller);
 		irq_set_chip_and_handler(irq, &ast_i2c_irqchip,
@@ -1062,43 +775,34 @@ static int ast_i2c_probe_controller(struct platform_device *pdev)
 	return 0;
 }
 
-static int ast_i2c_probe(struct platform_device *pdev)
+static int ast_i2c_remove_controller(struct platform_device *pdev)
 {
-	if (of_device_is_compatible(pdev->dev.of_node,
-				"aspeed,ast2400-i2c-controller") ||
-	    of_device_is_compatible(pdev->dev.of_node,
-		    		"aspeed,ast2500-i2c-controller"))
-		return ast_i2c_probe_controller(pdev);
-
-	if (of_device_is_compatible(pdev->dev.of_node,
-				"aspeed,ast2400-i2c-bus") ||
-	    of_device_is_compatible(pdev->dev.of_node,
-				"aspeed,ast2500-i2c-bus"))
-		return ast_i2c_probe_bus(pdev);
-
-	return -ENODEV;
+	struct ast_i2c_controller *controller = platform_get_drvdata(pdev);
+
+	irq_domain_remove(controller->irq_domain);
+	return 0;
 }
 
-static const struct of_device_id ast_i2c_of_table[] = {
-	{ .compatible = "aspeed,ast2500-i2c-controller", },
-	{ .compatible = "aspeed,ast2500-i2c-bus", },
+static const struct of_device_id ast_i2c_controller_of_table[] = {
 	{ .compatible = "aspeed,ast2400-i2c-controller", },
-	{ .compatible = "aspeed,ast2400-i2c-bus", },
+	{ .compatible = "aspeed,ast2500-i2c-controller", },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, ast_i2c_of_table);
 
-static struct platform_driver i2c_ast_driver = {
-	.probe		= ast_i2c_probe,
+static struct platform_driver ast_i2c_controller_driver = {
+	.probe		= ast_i2c_probe_controller,
+	.remove		= ast_i2c_remove_controller,
 	.driver         = {
-		.name   = KBUILD_MODNAME,
-		.of_match_table = ast_i2c_of_table,
+		.name   = "ast-i2c-controller",
+		.of_match_table = ast_i2c_controller_of_table,
 	},
 };
 
-module_platform_driver(i2c_ast_driver);
+module_platform_driver(ast_i2c_controller_driver);
 
 MODULE_AUTHOR("Ryan Chen <ryan_chen@aspeedtech.com>");
+MODULE_AUTHOR("Brendan Higgins <brendanhiggins@google.com>");
 MODULE_DESCRIPTION("ASPEED AST I2C Bus Driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:ast_i2c");
-- 
2.8.0.rc3.226.g39d4020
