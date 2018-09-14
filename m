Return-Path: <groeck7@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KwNzTMSR"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42BLcn1hvKzF3TN;
 Fri, 14 Sep 2018 13:30:16 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id g23-v6so3514255plq.9;
 Thu, 13 Sep 2018 20:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=CE7CisDtOe1qc1Y/eLDbkwNL86Hd/5IDA1nzcGb+Rck=;
 b=KwNzTMSRXNLaW9ANNkIs6Yq+m7zeuGN4/ewCCT5Nj6iFCmSg2fh+MkGIApx/xYhgjX
 nwyV1SjVNBeZ2POvDawi1PNqwU6hHJBiC8sLmhrcg75Z/XjhjV/1iaPgMRHcUe6Y22b/
 JMZvrHmkTiyeQ8ObVMNjW5vZALiYAFIySNHPwmF+LXIarcIVZ2+o0qnnoalsbjQxyaro
 IlzNEUsk5DpmYpCl0/TjXABm3yLdBlFPRP6+nXDlUdcIPq1XATCsCp3kSKFVp0N7bBkl
 JqSE1Q1fzvYRLz6a56fzDO6tKFK1ddzYXwOUDRaxjAkIVewKpGb8yl5VEklI8JV1YCdI
 Vaeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=CE7CisDtOe1qc1Y/eLDbkwNL86Hd/5IDA1nzcGb+Rck=;
 b=qAdeHxzsk2d15F1NSS6r6sroDmudTs3geHJgrvP3CG962FbKdXhPm30NdPNi6IA3zA
 FXacFLaSU1+bXEDAJJZ7goPqp49TLTWGEKxcPZYqAELmn92YinKdSnwfqpwOHwu2owLj
 egpGHDB4dIiUdPuHEk+5GvYYPd1goGwp/QUwoKVcENvLM0NL9KLPYKUftgyHqyOgFwJM
 12niTN3JwcBWiNPYSN7yIIb48fhdMzuw/PZ8v0KIiogTv/F/ggZ6UZDr9Rh2n0k41nH/
 i/djQxiJtG98KP5p5A8Xd9qSFIZZD7mSpIFA/wAowW1h2RnOoPOTtz4SqxS7gvf8wT8B
 tilg==
X-Gm-Message-State: APzg51BDLb37ve6s3MqdItWbwWrSDl8iFGuztshHBgT984oGCy+hCn6T
 tS/SFkuv6Gv7FxtSSSpX5k4=
X-Google-Smtp-Source: ANB0VdY0P35yn4UBN0WXK1MqxgjjrwVhBKujPYiXYzCz900G4grpBDQ2TSO01QC/r4U8tXmAjH1VBA==
X-Received: by 2002:a17:902:714f:: with SMTP id
 u15-v6mr10168834plm.154.1536895813994; 
 Thu, 13 Sep 2018 20:30:13 -0700 (PDT)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net.
 [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id h4-v6sm7881511pfe.49.2018.09.13.20.30.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Sep 2018 20:30:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH] i2c: aspeed: Acknowledge most interrupts early in interrupt
 handler
Date: Thu, 13 Sep 2018 20:30:10 -0700
Message-Id: <1536895810-28903-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Sep 2018 03:30:18 -0000

Commit 3e9efc3299dd ("i2c: aspeed: Handle master/slave combined irq events
properly") moved interrupt acknowledgment to the end of the interrupt
handler. In part this was done because the AST2500 datasheet says:

 I2CD10 Interrupt Status Register
   bit 2 Receive Done Interrupt status
         S/W needs to clear this status bit to allow next data receiving.

Acknowledging Receive Done before receive data was handled resulted in
receive errors on high speed I2C busses.

However, interrupt acknowledgment was not only moved to the end of the
interrupt handler for Receive Done Interrupt status, but for all interrupt
status bits. This could result in race conditions if a second interrupt was
received during interrupt handling and not handled but still acknowledged
at the end of the interrupt handler.

Acknowledge only "Receive Done Interrupt status" late in the interrupt
handler to solve the problem.

Fixes: 3e9efc3299dd ("i2c: aspeed: Handle master/slave combined irq events properly")
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Joel Stanley <joel@jms.id.au>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/i2c/busses/i2c-aspeed.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index c258c4d9a4c0..3d518e09369f 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -552,6 +552,9 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
 
 	spin_lock(&bus->lock);
 	irq_received = readl(bus->base + ASPEED_I2C_INTR_STS_REG);
+	/* Ack all interrupts except for Rx done */
+	writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
+	       bus->base + ASPEED_I2C_INTR_STS_REG);
 	irq_remaining = irq_received;
 
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
@@ -584,8 +587,10 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
 			"irq handled != irq. expected 0x%08x, but was 0x%08x\n",
 			irq_received, irq_handled);
 
-	/* Ack all interrupt bits. */
-	writel(irq_received, bus->base + ASPEED_I2C_INTR_STS_REG);
+	/* Ack Rx done */
+	if (irq_received & ASPEED_I2CD_INTR_RX_DONE)
+		writel(ASPEED_I2CD_INTR_RX_DONE,
+		       bus->base + ASPEED_I2C_INTR_STS_REG);
 	spin_unlock(&bus->lock);
 	return irq_remaining ? IRQ_NONE : IRQ_HANDLED;
 }
-- 
2.7.4
