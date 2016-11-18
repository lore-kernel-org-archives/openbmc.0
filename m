Return-Path: <clg@kaod.org>
Received: from 4.mo7.mail-out.ovh.net (4.mo7.mail-out.ovh.net [178.32.122.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tL0fg05v5zDvb1
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 01:26:18 +1100 (AEDT)
Received: from player697.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id C06401A37C
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 15:26:15 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id 71F08480075;
 Fri, 18 Nov 2016 15:26:12 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 26/38] aspeed/sdmc: fake a few more registers to let DRAM
 calibration run
Date: Fri, 18 Nov 2016 15:22:06 +0100
Message-Id: <1479478938-13267-27-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479478938-13267-1-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1118863035735247618
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
X-List-Received-Date: Fri, 18 Nov 2016 14:26:19 -0000

It helps in understanding the DRAM calibration sequence which is all
written in assembly, and may be rewritten in C one day.

This provides support only for the AST2400 SoC (DDR3). AST2500 still
uses the SOC_SCRATCH1 to pretend DRAM was already initialized.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/misc/aspeed_scu.c          |   2 +-
 hw/misc/aspeed_sdmc.c         | 188 ++++++++++++++++++++++++++++++++++++++++++
 include/hw/misc/aspeed_sdmc.h |   2 +-
 3 files changed, 190 insertions(+), 2 deletions(-)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 95022d3607ad..b5efba9121b2 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -100,7 +100,7 @@ static const uint32_t ast2400_a0_resets[ASPEED_SCU_NR_REGS] = {
      [PCI_CTRL2]       = 0x20001A03U,
      [PCI_CTRL3]       = 0x04000030U,
      [SYS_RST_STATUS]  = 0x00000001U,
-     [SOC_SCRATCH1]    = 0x000000C0U, /* SoC completed DRAM init */
+     [SOC_SCRATCH1]    = 0x00000000U,
      [MISC_CTRL2]      = 0x00000023U,
      [RNG_CTRL]        = 0x0000000EU,
      [PINMUX_CTRL2]    = 0x0000F000U,
diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index 867caa2d64dc..c71d18953c1c 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -80,6 +80,114 @@
      ASPEED_SDMC_AST2500_RESERVED | ASPEED_SDMC_VGA_COMPAT |            \
      ASPEED_SDMC_VGA_APERTURE(ASPEED_SDMC_VGA_64MB))
 
+/* MCR08: Graphics Memory Protection Register */
+#define R_GRAPHIC_MEM_PROT              (0x8 / 4)
+
+/* MCR0C: Refresh Timing Register */
+#define R_REFRESH_TIMING                (0x0C / 4)
+
+/* MCR10: AC Timing Register #1 */
+#define R_AC_TIMING1                    (0x10 / 4)
+
+/* MCR14: AC Timing Register #2 */
+#define R_AC_TIMING2                    (0x14 / 4)
+
+/* MCR18: CK/DQS Delay Control Register */
+#define R_CQDQS_DELAY_CTRL              (0x18 / 4)
+
+/* MCR1C: MCLK to MCLK2X Calibration(CBR) Status Register */
+#define R_MCLK_CALIB_STATUS             (0x1C / 4)
+#define   MCLK2X_PHASE                      (0x96 << 16)
+
+/* MCR20: DQS Input Phase Calibration Control and Status */
+#define R_DQS_INPUT_CALIB_STATUS        (0x20 / 4)
+
+/* MCR24: ????  */
+#define R_MCR24                         (0x24 / 4)
+
+/* MCR28: Mode Setting Control Register */
+#define R_MODE_SETTING_CTRL             (0x28 / 4)
+
+/* MCR2C: MRS/EMRS2 Mode Setting Register */
+#define R_MRS_MODE_SETTING_CTRL         (0x2C / 4)
+
+/* MCR30: EMRS/EMRS3 Mode Setting Register */
+#define R_EMRS_MODE_SETTING_CTRL        (0x30 / 4)
+
+/* MCR34: Power Control Register */
+#define R_POWER_CTRL                    (0x34 / 4)
+
+/* MCR38: Page Miss Latency Mask Register */
+#define R_PAGE_MISS_MASK                (0x38 / 4)
+
+/* MCR40: Maximum Grant Length Register #1 */
+#define R_MAX_GRANT_LEN1                (0x40 / 4)
+
+/* MCR44: Maximum Grant Length Register #2 */
+#define R_MAX_GRANT_LEN2                (0x44 / 4)
+
+/* MCR48: Maximum Grant Length Register #3 */
+#define R_MAX_GRANT_LEN3                (0x48 / 4)
+
+/* MCR4C: Maximum Grant Length Register #4 */
+#define R_MAX_GRANT_LEN4                (0x4C / 4)
+
+/* MCR50: Interrupt Control/Status Register */
+#define R_IRQ_STATUS_CTRL               (0x50 / 4)
+
+/* MCR54: ECC Protection Address Range Register */
+#define R_ECC_PROTECT                   (0x54 / 4)
+
+/* MCR58: ????  */
+#define R_MCR58                         (0x58 / 4)
+
+/* MCR60: IO Buffer Mode Register */
+#define R_IO_BUFFER_MODE                (0x60 / 4)
+
+/* MCR64: DLL Control Register #1 */
+#define R_DLL_CTRL                      (0x64 / 4)
+
+/* MCR68: DLL Control Register #2 */
+#define R_DLL_CTRL2                     (0x68 / 4)
+
+/* MCR6C: DDR IO Impedance Calibration Control */
+#define R_DDR_IO_IMPEDANCE_CTRL         (0x6C / 4)
+
+/* MCR70: ECC Testing Control/Status Register */
+#define R_ECC_STATUS_CTRL               (0x70 / 4)
+#define   ECC_TEST_FINISH                  (1 << 12)
+
+/* MCR74: Testing Start Address and Length Register */
+#define R_START_ADDR_LEN                (0x74 / 4)
+
+/* MCR78: Testing Fail DQ Bit Register */
+#define R_FAIL_DQ                       (0x78 / 4)
+
+/* MCR7C: Test Initial Value Register */
+#define R_TEST_INIT_VALUE               (0x7C / 4)
+
+/* MCR80: DQ Input Delay Calibration Control #1 */
+#define R_DQ_DELAY_CALIB_CTRL1          (0x80 / 4)
+#define   DQ_DELAY_CALIB_COUNT_DONE        (1 << 31)
+
+/* MCR84: DQ Input Delay Calibration Control #2 */
+#define R_DQ_DELAY_CALIB_CTRL2          (0x84 / 4)
+
+/* MCR88: DQ Input Delay Calibration Control #3 */
+#define R_DQ_DELAY_CALIB_CTRL3          (0x88 / 4)
+
+/* MCR8C: CK Duty Counter Value */
+#define R_CK_DUTY_VALUE                 (0x8C / 4)
+
+/* MCR100: AST2000 Backward Compatible SCU Password */
+#define R_COMPAT_SCU_PASSWORD           (0x100 / 4)
+
+/* MCR120: AST2000 Backward Compatible SCU MPLL Parameter */
+#define R_COMPAT_SCU_MPLL               (0x120 / 4)
+
+/* MCR170: AST2000 Backward Compatible SCU Hardware Strapping Value */
+#define R_COMPAT_SCU_HW_STRAPPING       (0x170 / 4)
+
 static uint64_t aspeed_sdmc_read(void *opaque, hwaddr addr, unsigned size)
 {
     AspeedSDMCState *s = ASPEED_SDMC(opaque);
@@ -91,6 +199,48 @@ static uint64_t aspeed_sdmc_read(void *opaque, hwaddr addr, unsigned size)
     case R_PROT:
         val = s->unlocked;
         break;
+    case R_CONF:
+    case R_GRAPHIC_MEM_PROT:
+    case R_REFRESH_TIMING:
+    case R_AC_TIMING1:
+    case R_AC_TIMING2:
+    case R_CQDQS_DELAY_CTRL:
+    case R_MCLK_CALIB_STATUS:
+    case R_DQS_INPUT_CALIB_STATUS:
+    case R_MCR24:
+    case R_MODE_SETTING_CTRL:
+    case R_MRS_MODE_SETTING_CTRL:
+    case R_EMRS_MODE_SETTING_CTRL:
+    case R_POWER_CTRL:
+    case R_PAGE_MISS_MASK:
+    case R_MAX_GRANT_LEN1:
+    case R_MAX_GRANT_LEN2:
+    case R_MAX_GRANT_LEN3:
+    case R_MAX_GRANT_LEN4:
+    case R_IRQ_STATUS_CTRL:
+    case R_ECC_PROTECT:
+    case R_MCR58:
+    case R_IO_BUFFER_MODE:
+    case R_DLL_CTRL:
+    case R_DLL_CTRL2:
+    case R_DDR_IO_IMPEDANCE_CTRL:
+    case R_START_ADDR_LEN:
+    case R_FAIL_DQ:
+    case R_TEST_INIT_VALUE:
+    case R_DQ_DELAY_CALIB_CTRL2:
+    case R_DQ_DELAY_CALIB_CTRL3:
+    case R_CK_DUTY_VALUE:
+    case R_COMPAT_SCU_PASSWORD:
+    case R_COMPAT_SCU_MPLL:
+    case R_COMPAT_SCU_HW_STRAPPING:
+        val = s->regs[addr];
+        break;
+    case R_DQ_DELAY_CALIB_CTRL1:
+        val = s->regs[addr] | DQ_DELAY_CALIB_COUNT_DONE;
+        break;
+    case R_ECC_STATUS_CTRL:
+        val = s->regs[addr] | ECC_TEST_FINISH;
+        break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: Out-of-bounds read at offset 0x%" HWADDR_PRIx "\n",
@@ -133,6 +283,42 @@ static void aspeed_sdmc_write(void *opaque, hwaddr addr, uint64_t data,
             g_assert_not_reached();
         }
         break;
+    case R_GRAPHIC_MEM_PROT:
+    case R_REFRESH_TIMING:
+    case R_AC_TIMING1:
+    case R_AC_TIMING2:
+    case R_CQDQS_DELAY_CTRL:
+    case R_MCLK_CALIB_STATUS:
+    case R_DQS_INPUT_CALIB_STATUS:
+    case R_MCR24:
+    case R_MODE_SETTING_CTRL:
+    case R_MRS_MODE_SETTING_CTRL:
+    case R_EMRS_MODE_SETTING_CTRL:
+    case R_POWER_CTRL:
+    case R_PAGE_MISS_MASK:
+    case R_MAX_GRANT_LEN1:
+    case R_MAX_GRANT_LEN2:
+    case R_MAX_GRANT_LEN3:
+    case R_MAX_GRANT_LEN4:
+    case R_IRQ_STATUS_CTRL:
+    case R_ECC_PROTECT:
+    case R_MCR58:
+    case R_IO_BUFFER_MODE:
+    case R_DLL_CTRL:
+    case R_DLL_CTRL2:
+    case R_DDR_IO_IMPEDANCE_CTRL:
+    case R_ECC_STATUS_CTRL:
+    case R_START_ADDR_LEN:
+    case R_FAIL_DQ:
+    case R_TEST_INIT_VALUE:
+    case R_DQ_DELAY_CALIB_CTRL1:
+    case R_DQ_DELAY_CALIB_CTRL2:
+    case R_DQ_DELAY_CALIB_CTRL3:
+    case R_CK_DUTY_VALUE:
+    case R_COMPAT_SCU_PASSWORD:
+    case R_COMPAT_SCU_MPLL:
+    case R_COMPAT_SCU_HW_STRAPPING:
+        break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx "\n",
@@ -221,6 +407,8 @@ static void aspeed_sdmc_reset(DeviceState *dev)
     default:
         g_assert_not_reached();
     }
+
+    s->regs[R_MCLK_CALIB_STATUS] = MCLK2X_PHASE;
 }
 
 static void aspeed_sdmc_realize(DeviceState *dev, Error **errp)
diff --git a/include/hw/misc/aspeed_sdmc.h b/include/hw/misc/aspeed_sdmc.h
index a4415d9efc2f..e073a6c9419a 100644
--- a/include/hw/misc/aspeed_sdmc.h
+++ b/include/hw/misc/aspeed_sdmc.h
@@ -14,7 +14,7 @@
 #define TYPE_ASPEED_SDMC "aspeed.sdmc"
 #define ASPEED_SDMC(obj) OBJECT_CHECK(AspeedSDMCState, (obj), TYPE_ASPEED_SDMC)
 
-#define ASPEED_SDMC_NR_REGS (0x8 >> 2)
+#define ASPEED_SDMC_NR_REGS (0x174 >> 2)
 
 typedef struct AspeedSDMCState {
     /*< private >*/
-- 
2.7.4
