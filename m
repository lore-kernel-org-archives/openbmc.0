Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tRqhN4J3bzDvjt
 for <openbmc@lists.ozlabs.org>; Mon, 28 Nov 2016 13:03:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="KfRA/D2I"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="eMLh+yk/"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 84E1020DB4;
 Sun, 27 Nov 2016 21:02:58 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Sun, 27 Nov 2016 21:02:58 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=sEnBL7FHBeHY8XOR5GY9rHsPkcI=; b=KfRA/D
 2I+X8N2v/M6k6sIaQ/kBu5X4AHo2gZxmVfXMqDbJM2wCAHTs3aJmLnnAr4suyFBw
 95YEt2n7eeVXjTHNY+iXpJ8z39WfZBbd6Ynl00bMXoL0tprxk7e9Zych+yg2sRH3
 HuCF1sDpB6czyNaCr0Qrpb4ax3Y6KPqmbkMzc=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=sEnBL7FHBeHY8X
 OR5GY9rHsPkcI=; b=eMLh+yk/tIpxuNEDlSzCCzf8rwB0Ks1MEvXyD3fWKOuLUW
 pRjtHVhfDRUU+4RNay2oA6WeIm0VJUeg+xABNG2eG9tiUU+3fzlNMMvFiG3vVFqN
 seFsSDEvXlg5UdOEpP4MWweglDOyntr20e2qZb3Cyeivs2Fyl9nyOtdqusyhg=
X-ME-Sender: <xms:UpA7WMt_JPGNKM5BGK5rsRPLOWV_DOi8BL60wd_b8wfCnL3XbD1iWw>
X-Sasl-enc: Mm/4ohtdsqYXjz3SNIgVCiY3eKhwVwTp4mzeXaJ5ehm2 1480298577
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id BCBDD7E3FA;
 Sun, 27 Nov 2016 21:02:56 -0500 (EST)
Message-ID: <1480298571.2503.70.camel@aj.id.au>
Subject: Re: [PATCH qemu 26/38] aspeed/sdmc: fake a few more registers to
 let DRAM calibration run
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Mon, 28 Nov 2016 12:32:51 +1030
In-Reply-To: <1479478938-13267-27-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-27-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-yRWQDmdcp5kKXTkY4soc"
X-Mailer: Evolution 3.22.1-0ubuntu2 
Mime-Version: 1.0
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
X-List-Received-Date: Mon, 28 Nov 2016 02:03:01 -0000


--=-yRWQDmdcp5kKXTkY4soc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-11-18 at 15:22 +0100, C=C3=A9dric Le Goater wrote:
> It helps in understanding the DRAM calibration sequence which is all
written in assembly, and may be rewritten in C one day.

This provides support only for the AST2400 SoC (DDR3). AST2500 still
uses the SOC_SCRATCH1 to pretend DRAM was already initialized.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/misc/aspeed_scu.c          |   2 +-
 hw/misc/aspeed_sdmc.c         | 188 ++++++++++++++++++++++++++++++++++++++=
++++
 include/hw/misc/aspeed_sdmc.h |   2 +-
 3 files changed, 190 insertions(+), 2 deletions(-)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 95022d3607ad..b5efba9121b2 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -100,7 +100,7 @@ static const uint32_t ast2400_a0_resets[ASPEED_SCU_NR_R=
EGS] =3D {
      [PCI_CTRL2]       =3D 0x20001A03U,
      [PCI_CTRL3]       =3D 0x04000030U,
      [SYS_RST_STATUS]  =3D 0x00000001U,
-     [SOC_SCRATCH1]    =3D 0x000000C0U, /* SoC completed DRAM init */
+     [SOC_SCRATCH1]    =3D 0x00000000U,
      [MISC_CTRL2]      =3D 0x00000023U,
      [RNG_CTRL]        =3D 0x0000000EU,
      [PINMUX_CTRL2]    =3D 0x0000F000U,
diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index 867caa2d64dc..c71d18953c1c 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -80,6 +80,114 @@
      ASPEED_SDMC_AST2500_RESERVED | ASPEED_SDMC_VGA_COMPAT |            \
      ASPEED_SDMC_VGA_APERTURE(ASPEED_SDMC_VGA_64MB))
=20
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
     AspeedSDMCState *s =3D ASPEED_SDMC(opaque);
@@ -91,6 +199,48 @@ static uint64_t aspeed_sdmc_read(void *opaque, hwaddr a=
ddr, unsigned size)
     case R_PROT:
         val =3D s->unlocked;
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

This is a lengthy list of registers. What are your thoughts about using
numeric range values with comments?

 case 0x08 ... 0x38: /* GFX memprotect, refresh timings ... */
 case 0x40 ... 0x58: /* grant length registers, ... */
 ...
  val =3D s->regs[addr];
  break;

Either way I'm probably not fussed, but I'm interested in your
thoughts.

This addresses my comment on the previous patch, but it would be good
not to break the SDMC commit-to-commit.

Andrew

> +        val =3D s->regs[addr];
+        break;
+    case R_DQ_DELAY_CALIB_CTRL1:
+        val =3D s->regs[addr] | DQ_DELAY_CALIB_COUNT_DONE;
+        break;
+    case R_ECC_STATUS_CTRL:
+        val =3D s->regs[addr] | ECC_TEST_FINISH;
+        break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: Out-of-bounds read at offset 0x%" HWADDR_PRIx "=
\n",
@@ -133,6 +283,42 @@ static void aspeed_sdmc_write(void *opaque, hwaddr add=
r, uint64_t data,
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
                       "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx =
"\n",
@@ -221,6 +407,8 @@ static void aspeed_sdmc_reset(DeviceState *dev)
     default:
         g_assert_not_reached();
     }
+
+    s->regs[R_MCLK_CALIB_STATUS] =3D MCLK2X_PHASE;
 }
=20
 static void aspeed_sdmc_realize(DeviceState *dev, Error **errp)
diff --git a/include/hw/misc/aspeed_sdmc.h b/include/hw/misc/aspeed_sdmc.h
index a4415d9efc2f..e073a6c9419a 100644
--- a/include/hw/misc/aspeed_sdmc.h
+++ b/include/hw/misc/aspeed_sdmc.h
@@ -14,7 +14,7 @@
 #define TYPE_ASPEED_SDMC "aspeed.sdmc"
 #define ASPEED_SDMC(obj) OBJECT_CHECK(AspeedSDMCState, (obj), TYPE_ASPEED_=
SDMC)
=20
-#define ASPEED_SDMC_NR_REGS (0x8 >> 2)
+#define ASPEED_SDMC_NR_REGS (0x174 >> 2)
=20
 typedef struct AspeedSDMCState {
     /*< private >*/
--=-yRWQDmdcp5kKXTkY4soc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYO5BLAAoJEJ0dnzgO5LT5FYcP/1lnMWlupqx2LiNS86VyTMUZ
gN2e17zgQ9ZkgExYmfS3TirUksNffvRprvjlLnL13sg6wMUZd5irwuF95BxfIGEk
feEA9gHjNIbJHqb77vp+AYE8zL+0JYy591jMWqS2Sfokx4b/jvZLcpFacPWmBLMf
f0/t382OAD2XxT4R1HJkwAqR+0UvhcYuf3V6KEy6YXjvNjRY2bTRSDtmRA8hW4+b
++OSS/bN3fovBUJRMojN7HLsNjgD/lnplaH+hrzlgauL4Dq7pQnQz80lpy2lvcdU
wQSi+O48G5RmUYoeXIOEahA7kGKqTWauN15N8LDapV425fxQQ5vFafJLAX7K647N
f1XWrHKB7U+wYPeFIiSQQYloCWot91GlN7JdfpASBZrhnaeX6YO34VuNHIVp7SiY
FQqcfjJ/yqD6vS+Lzsp8qjCDul6sfb0cfdllILpqOlbpuar89s1JE4fWrNxX0Tyr
qRjRYgxS/q1oAOmvFTDl1wfPDNYcGo4hybt4YmDiisrnobCjGmo2VtO9IaDJalww
pHQYbaYWL10MGC4NdGdO5Zy7+GZK+Cy1fKFR64eulF2xlTpytPM50idLlZG52gvx
JSBh9k205SSVgkjFovJUicTGrwcYgtBscBwM+oGyoCiR5e7d+3HOX+C68ppGJ6Uu
DOc7oPD56xyoY+DQBA6s
=arHI
-----END PGP SIGNATURE-----

--=-yRWQDmdcp5kKXTkY4soc--
