Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2942D1A0038
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 19:26:24 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1023)
 id 0C8F6140B93; Thu, 11 Feb 2016 19:26:23 +1100 (AEDT)
From: Jeremy Kerr <jk@ozlabs.org>
To: openbmc@lists.ozlabs.org
Subject: [RFC PATCH 2/2] serial/aspeed-vuart: Perform enable/disable on driver
 bind/unbind
Date: Thu, 11 Feb 2016 16:26:05 +0800
Message-Id: <1455179165-13252-2-git-send-email-jk@ozlabs.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1455179165-13252-1-git-send-email-jk@ozlabs.org>
References: <1455179165-13252-1-git-send-email-jk@ozlabs.org>
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
X-List-Received-Date: Thu, 11 Feb 2016 08:26:24 -0000

Rather than exposing an enable sysfs attribute, we can just set the
VUART enabled bit when we bind to the device, and clear it on unbind.

We don't want to do this on open/release, as the host may be using this
bit to configure serial output modes, which is independent of whether
the devices has been opened by BMC userspace.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/tty/serial/aspeed-vuart.c | 53 +++++++++++----------------------------
 1 file changed, 14 insertions(+), 39 deletions(-)

diff --git a/drivers/tty/serial/aspeed-vuart.c b/drivers/tty/serial/aspeed-vuart.c
index 73bb0e7..020c815 100644
--- a/drivers/tty/serial/aspeed-vuart.c
+++ b/drivers/tty/serial/aspeed-vuart.c
@@ -35,42 +35,6 @@ struct ast_vuart {
 	int			line;
 };
 
-static ssize_t ast_vuart_show_enabled(struct device *dev,
-		struct device_attribute *attr, char *buf)
-{
-	struct ast_vuart *vuart = dev_get_drvdata(dev);
-	u8 reg;
-
-	reg = readb(vuart->regs + AST_VUART_GCRA) & AST_VUART_GCRA_VUART_EN;
-
-	return snprintf(buf, PAGE_SIZE - 1, "%u\n", reg ? 1 : 0);
-}
-
-static ssize_t ast_vuart_set_enabled(struct device *dev,
-		struct device_attribute *attr,
-		const char *buf, size_t count)
-{
-	struct ast_vuart *vuart = dev_get_drvdata(dev);
-	unsigned long val;
-	int err;
-	u8 reg;
-
-	err = kstrtoul(buf, 0, &val);
-	if (err)
-		return err;
-
-	reg = readb(vuart->regs + AST_VUART_GCRA);
-	reg &= ~AST_VUART_GCRA_VUART_EN;
-	if (val)
-		reg |= AST_VUART_GCRA_VUART_EN;
-	writeb(reg, vuart->regs + AST_VUART_GCRA);
-
-	return count;
-}
-
-static DEVICE_ATTR(enabled, S_IWUSR | S_IRUGO,
-		ast_vuart_show_enabled, ast_vuart_set_enabled);
-
 static ssize_t ast_vuart_show_addr(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
@@ -144,6 +108,17 @@ static ssize_t ast_vuart_set_sirq(struct device *dev,
 static DEVICE_ATTR(sirq, S_IWUSR | S_IRUGO,
 		ast_vuart_show_sirq, ast_vuart_set_sirq);
 
+static void ast_vuart_set_enabled(struct ast_vuart *vuart, bool enabled)
+{
+	u8 reg;
+
+	reg = readb(vuart->regs + AST_VUART_GCRA);
+	reg &= ~AST_VUART_GCRA_VUART_EN;
+	if (enabled)
+		reg |= AST_VUART_GCRA_VUART_EN;
+	writeb(reg, vuart->regs + AST_VUART_GCRA);
+}
+
 static void ast_vuart_set_host_tx_discard(struct ast_vuart *vuart, bool discard)
 {
 	u8 reg;
@@ -304,6 +279,7 @@ static int ast_vuart_probe(struct platform_device *pdev)
 
 
 	vuart->line = rc;
+	ast_vuart_set_enabled(vuart, true);
 	ast_vuart_set_host_tx_discard(vuart, true);
 	platform_set_drvdata(pdev, vuart);
 
@@ -314,9 +290,6 @@ static int ast_vuart_probe(struct platform_device *pdev)
 	rc = device_create_file(&pdev->dev, &dev_attr_sirq);
 	if (rc)
 		dev_warn(&pdev->dev, "can't create sirq file\n");
-	rc = device_create_file(&pdev->dev, &dev_attr_enabled);
-	if (rc)
-		dev_warn(&pdev->dev, "can't create enabled file\n");
 
 	return 0;
 
@@ -332,6 +305,8 @@ static int ast_vuart_remove(struct platform_device *pdev)
 {
 	struct ast_vuart *vuart = platform_get_drvdata(pdev);
 
+	ast_vuart_set_enabled(vuart, false);
+
 	if (vuart->clk)
 		clk_disable_unprepare(vuart->clk);
 	return 0;
-- 
2.5.0
