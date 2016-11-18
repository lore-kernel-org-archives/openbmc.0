Return-Path: <clg@kaod.org>
Received: from 4.mo7.mail-out.ovh.net (4.mo7.mail-out.ovh.net [178.32.122.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tL0f303FzzDvnt
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 01:25:46 +1100 (AEDT)
Received: from player697.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 361E7207A9
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 15:25:43 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id F3FAE480080;
 Fri, 18 Nov 2016 15:25:39 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 16/38] aspeed/smc: add tests for Command mode
Date: Fri, 18 Nov 2016 15:21:56 +0100
Message-Id: <1479478938-13267-17-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479478938-13267-1-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1109855836070382338
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrudekgdeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 18 Nov 2016 14:25:47 -0000

0005 tests add a read_page_mem test

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/m25p80-test.c | 86 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/tests/m25p80-test.c b/tests/m25p80-test.c
index cb7ec81f1a6d..3d449bd194a9 100644
--- a/tests/m25p80-test.c
+++ b/tests/m25p80-test.c
@@ -36,6 +36,9 @@
 #define   CRTL_EXTENDED0       0  /* 32 bit addressing for SPI */
 #define R_CTRL0             0x10
 #define   CTRL_CE_STOP_ACTIVE  (1 << 2)
+#define   CTRL_READMODE        0x0
+#define   CTRL_FREADMODE       0x1
+#define   CTRL_WRITEMODE       0x2
 #define   CTRL_USERMODE        0x3
 
 #define ASPEED_FMC_BASE    0x1E620000
@@ -76,6 +79,22 @@ static void spi_conf(uint32_t value)
     writel(ASPEED_FMC_BASE + R_CONF, conf);
 }
 
+static void spi_ce_ctrl(uint32_t value)
+{
+    uint32_t conf = readl(ASPEED_FMC_BASE + R_CE_CTRL);
+
+    conf |= value;
+    writel(ASPEED_FMC_BASE + R_CE_CTRL, conf);
+}
+
+static void spi_ctrl_setmode(uint8_t mode, uint8_t cmd)
+{
+    uint32_t ctrl = readl(ASPEED_FMC_BASE + R_CTRL0);
+    ctrl &= ~(CTRL_USERMODE | 0xff << 16);
+    ctrl |= mode | (cmd << 16);
+    writel(ASPEED_FMC_BASE + R_CTRL0, ctrl);
+}
+
 static void spi_ctrl_start_user(void)
 {
     uint32_t ctrl = readl(ASPEED_FMC_BASE + R_CTRL0);
@@ -128,6 +147,18 @@ static void read_page(uint32_t addr, uint32_t *page)
     spi_ctrl_stop_user();
 }
 
+static void read_page_mem(uint32_t addr, uint32_t *page)
+{
+    int i;
+
+    /* move out USER mode to use direct reads from the AHB bus */
+    spi_ctrl_setmode(CTRL_READMODE, READ);
+
+    for (i = 0; i < PAGE_SIZE / 4; i++) {
+        page[i] = make_be32(readl(ASPEED_FLASH_BASE + addr + i * 4));
+    }
+}
+
 static void test_erase_sector(void)
 {
     uint32_t some_page_addr = 0x600 * PAGE_SIZE;
@@ -195,6 +226,7 @@ static void test_write_page(void)
 
     spi_ctrl_start_user();
     writeb(ASPEED_FLASH_BASE, EN_4BYTE_ADDR);
+    writeb(ASPEED_FLASH_BASE, WREN);
     writeb(ASPEED_FLASH_BASE, PP);
     writel(ASPEED_FLASH_BASE, make_be32(my_page_addr));
 
@@ -217,6 +249,58 @@ static void test_write_page(void)
     }
 }
 
+static void test_read_page_mem(void)
+{
+    uint32_t my_page_addr = 0x14000 * PAGE_SIZE; /* beyond 16MB */
+    uint32_t some_page_addr = 0x15000 * PAGE_SIZE;
+    uint32_t page[PAGE_SIZE / 4];
+    int i;
+
+    /* Enable 4BYTE mode for flash. This is should be strapped by HW
+     * for CE0 anyhow.
+     */
+    spi_ce_ctrl(1 << CRTL_EXTENDED0);
+
+    /* Check what was written */
+    read_page_mem(my_page_addr, page);
+    for (i = 0; i < PAGE_SIZE / 4; i++) {
+        g_assert_cmphex(page[i], ==, my_page_addr + i * 4);
+    }
+
+    /* Check some other page. It should be full of 0xff */
+    read_page_mem(some_page_addr, page);
+    for (i = 0; i < PAGE_SIZE / 4; i++) {
+        g_assert_cmphex(page[i], ==, 0xffffffff);
+    }
+}
+
+static void test_write_page_mem(void)
+{
+    uint32_t my_page_addr = 0x15000 * PAGE_SIZE;
+    uint32_t page[PAGE_SIZE / 4];
+    int i;
+
+    /* Enable 4BYTE mode for flash. This is should be strapped by HW
+     * for CE0 anyhow.
+     */
+    spi_ce_ctrl(1 << CRTL_EXTENDED0);
+
+    /* move out USER mode to use direct writes to the AHB bus */
+    spi_ctrl_setmode(CTRL_WRITEMODE, PP);
+
+    for (i = 0; i < PAGE_SIZE / 4; i++) {
+        writel(ASPEED_FLASH_BASE + my_page_addr + i * 4,
+               make_be32(my_page_addr + i * 4));
+    }
+
+    /* Check what was written */
+    read_page_mem(my_page_addr, page);
+    for (i = 0; i < PAGE_SIZE / 4; i++) {
+        g_assert_cmphex(page[i], ==, my_page_addr + i * 4);
+    }
+}
+
+
 static char tmp_path[] = "/tmp/qtest.m25p80.XXXXXX";
 
 int main(int argc, char **argv)
@@ -242,6 +326,8 @@ int main(int argc, char **argv)
     qtest_add_func("/m25p80/erase_sector", test_erase_sector);
     qtest_add_func("/m25p80/erase_all",  test_erase_all);
     qtest_add_func("/m25p80/write_page", test_write_page);
+    qtest_add_func("/m25p80/read_page_mem", test_read_page_mem);
+    qtest_add_func("/m25p80/write_page_mem", test_write_page_mem);
 
     ret = g_test_run();
 
-- 
2.7.4
