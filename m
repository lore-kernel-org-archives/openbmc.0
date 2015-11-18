Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 815981A04C1
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2015 15:10:27 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447819820912856.2997977278851;
 Tue, 17 Nov 2015 20:10:20 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux v2 1/2] misc/bt-host: Add facility for interrupt-driven
 BT messages
Date: Tue, 17 Nov 2015 23:10:18 -0500
Message-Id: <1447819819-21180-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447819819-21180-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447819819-21180-1-git-send-email-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Nov 2015 04:10:29 -0000

From: Jeremy Kerr <jk@ozlabs.org>

This change adds a facility for the bt-host driver to use interrupts
rather than polling via a timer.

If we find an interrupts property in the device tree, we'll enable
interrupts on the bt device.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 arch/arm/boot/dts/ast2400.dtsi |  1 +
 drivers/misc/bt-host.c         | 74 ++++++++++++++++++++++++++++++++++++++----
 2 files changed, 69 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/ast2400.dtsi b/arch/arm/boot/dts/ast2400.dtsi
index d924ac1..6a09125 100644
--- a/arch/arm/boot/dts/ast2400.dtsi
+++ b/arch/arm/boot/dts/ast2400.dtsi
@@ -87,6 +87,7 @@
 			ibt@1e789140 {
 				compatible = "aspeed,bt-host";
 				reg = <0x1e789140 0x18>;
+				interrupts = <8>;
 			};
 
 			i2c: i2c@1e78a040 {
diff --git a/drivers/misc/bt-host.c b/drivers/misc/bt-host.c
index bf1e4ac..7b5206e 100644
--- a/drivers/misc/bt-host.c
+++ b/drivers/misc/bt-host.c
@@ -8,8 +8,10 @@
 #include <linux/init.h>
 #include <linux/device.h>
 #include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
+#include <linux/interrupt.h>
 #include <linux/delay.h>
 #include <linux/miscdevice.h>
 #include <linux/timer.h>
@@ -28,7 +30,11 @@
 #define   BT_CR0_EN_CLR_SLV_WRP		0x4
 #define   BT_CR0_ENABLE_IBT		0x1
 #define BT_CR1		0x4
+#define   BT_CR1_IRQ_H2B	0x01
+#define   BT_CR1_IRQ_HBUSY	0x40
 #define BT_CR2		0x8
+#define   BT_CR2_IRQ_H2B	0x01
+#define   BT_CR2_IRQ_HBUSY	0x40
 #define BT_CR3		0xc
 #define BT_CTRL		0x10
 #define   BT_CTRL_B_BUSY		0x80
@@ -50,6 +56,7 @@ struct bt_host {
 	struct miscdevice	miscdev;
 	void			*base;
 	int			open_count;
+	int			irq;
 	wait_queue_head_t	queue;
 	struct timer_list	poll_timer;
 };
@@ -253,6 +260,53 @@ static void poll_timer(unsigned long data)
 	add_timer(&bt_host->poll_timer);
 }
 
+irqreturn_t bt_host_irq(int irq, void *arg)
+{
+	struct bt_host *bt_host = arg;
+	uint32_t reg;
+
+	reg = ioread32(bt_host->base + BT_CR2);
+	reg &= BT_CR2_IRQ_H2B | BT_CR2_IRQ_HBUSY;
+	if (!reg)
+		return IRQ_NONE;
+
+	/* ack pending IRQs */
+	iowrite32(reg, bt_host->base + BT_CR2);
+
+	wake_up(&bt_host->queue);
+	return IRQ_HANDLED;
+}
+
+static int bt_host_config_irq(struct bt_host *bt_host,
+		struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	uint32_t reg;
+	int rc;
+
+	bt_host->irq = irq_of_parse_and_map(dev->of_node, 0);
+	if (!bt_host->irq)
+		return -ENODEV;
+
+	rc = devm_request_irq(dev, bt_host->irq, bt_host_irq, IRQF_SHARED,
+			DEVICE_NAME, bt_host);
+	if (rc < 0) {
+		dev_warn(dev, "Unable to request IRQ %d\n", bt_host->irq);
+		bt_host->irq = 0;
+		return rc;
+	}
+
+	/* Configure IRQs on the host clearing the H2B and HBUSY bits;
+	 * H2B will be asserted when the host has data for us; HBUSY
+	 * will be cleared (along with B2H) when we can write the next
+	 * message to the BT buffer */
+	reg = ioread32(bt_host->base + BT_CR1);
+	reg |= BT_CR1_IRQ_H2B | BT_CR1_IRQ_HBUSY;
+	iowrite32(reg, bt_host->base + BT_CR1);
+
+	return 0;
+}
+
 static int bt_host_probe(struct platform_device *pdev)
 {
 	struct bt_host *bt_host;
@@ -298,11 +352,18 @@ static int bt_host_probe(struct platform_device *pdev)
 		goto out_unmap;
 	}
 
-	init_timer(&bt_host->poll_timer);
-	bt_host->poll_timer.function = poll_timer;
-	bt_host->poll_timer.data = (unsigned long)bt_host;
-	bt_host->poll_timer.expires = jiffies + msecs_to_jiffies(10);
-	add_timer(&bt_host->poll_timer);
+	bt_host_config_irq(bt_host, pdev);
+
+	if (bt_host->irq) {
+		dev_info(dev, "Using IRQ %d\n", bt_host->irq);
+	} else {
+		dev_info(dev, "No IRQ; using timer\n");
+		init_timer(&bt_host->poll_timer);
+		bt_host->poll_timer.function = poll_timer;
+		bt_host->poll_timer.data = (unsigned long)bt_host;
+		bt_host->poll_timer.expires = jiffies + msecs_to_jiffies(10);
+		add_timer(&bt_host->poll_timer);
+	}
 
 	iowrite32((BT_IO_BASE << BT_CR0_IO_BASE) |
 		  (BT_IRQ << BT_CR0_IRQ) |
@@ -327,8 +388,9 @@ out_free:
 static int bt_host_remove(struct platform_device *pdev)
 {
 	struct bt_host *bt_host = dev_get_drvdata(&pdev->dev);
-	del_timer_sync(&bt_host->poll_timer);
 	misc_deregister(&bt_host->miscdev);
+	if (!bt_host->irq)
+		del_timer_sync(&bt_host->poll_timer);
 	devm_iounmap(&pdev->dev, bt_host->base);
 	devm_kfree(&pdev->dev, bt_host);
 	bt_host = NULL;
-- 
2.6.3
