Return-Path: <yong.b.li@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=yong.b.li@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zG2TZ3cHdzF0Rb
 for <openbmc@lists.ozlabs.org>; Tue,  9 Jan 2018 17:36:00 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jan 2018 22:35:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,334,1511856000"; d="scan'208";a="17761063"
Received: from yongli3-mobl.ccr.corp.intel.com (HELO yongli3MOBL)
 ([10.239.196.113])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Jan 2018 22:35:56 -0800
From: "Yong Li" <yong.b.li@linux.intel.com>
To: <gmills@linux.vnet.ibm.com>,
	<Balaji.B.Rao@dell.com>
Cc: <openbmc@lists.ozlabs.org>
References: <mailman.36.1515462295.24997.openbmc@lists.ozlabs.org>
In-Reply-To: <mailman.36.1515462295.24997.openbmc@lists.ozlabs.org>
Subject: RE: openbmc Digest, Vol 29, Issue 17
Date: Tue, 9 Jan 2018 14:35:55 +0800
Message-ID: <000001d38914$1ae91330$50bb3990$@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQHk2jGJ408qAPIJqPFWRIwAKtEMWKNIcksw
Content-Language: en-us
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNjY0ZTYzM2ItNTM2OS00YjhkLWEwYzAtNTY3OTU1ZmJhOTY2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE2LjUuOS4zIiwiVHJ1c3RlZExhYmVsSGFzaCI6Ikh0RlN0KzYyOWpQMkNKYndcL21ndVwvSDB2Q2habFJUY0dCd3ErMzM0ellpTT0ifQ==
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Jan 2018 06:36:03 -0000

For systemd update, I want to upgrade it too:
https://lists.ozlabs.org/pipermail/openbmc/2017-December/010124.html

For a new machine-id related API.

FYI, I uploaded a code review for this API: =
https://gerrit.openbmc-project.xyz/#/c/8323/

Thanks,
Yong

-----Original Message-----
From: openbmc =
[mailto:openbmc-bounces+yong.b.li=3Dlinux.intel.com@lists.ozlabs.org] On =
Behalf Of openbmc-request@lists.ozlabs.org
Sent: Tuesday, January 9, 2018 9:45 AM
To: openbmc@lists.ozlabs.org
Subject: openbmc Digest, Vol 29, Issue 17

Send openbmc mailing list submissions to
	openbmc@lists.ozlabs.org

To subscribe or unsubscribe via the World Wide Web, visit
	https://lists.ozlabs.org/listinfo/openbmc
or, via email, send a message with subject or body 'help' to
	openbmc-request@lists.ozlabs.org

You can reach the person managing the list at
	openbmc-owner@lists.ozlabs.org

When replying, please edit your Subject line so it is more specific than =
"Re: Contents of openbmc digest..."


Today's Topics:

   1. Re: systemd update for openbmc (Gunnar Mills)
   2. [PATCH linux dev-4.10 v3] ipmi: add an Aspeed KCS IPMI BMC
      driver (Haiyue Wang)


----------------------------------------------------------------------

Message: 1
Date: Mon, 8 Jan 2018 19:20:55 -0600
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: Re: systemd update for openbmc
Message-ID: <529f4ce1-35d3-5cb4-4e29-0e6e12864569@linux.vnet.ibm.com>
Content-Type: text/plain; charset=3D"utf-8"; Format=3D"flowed"

We currently use systemd v232.
https://github.com/openbmc/openbmc/blob/master/import-layers/yocto-poky/m=
eta/recipes-core/systemd/systemd_232.bb

Looks like that commit is included starting in systemd v233.

$git config --get remote.origin.url
git@github.com:systemd/systemd.gi

$git tag --contains aa3288505569433200bfa311ff12d29684a14374
v233
v234
v235
v236

Yocto Project 2.4 does update systemd to v234.

https://lists.yoctoproject.org/pipermail/yocto-announce/2017-October/0001=
25.html

https://github.com/openbmc/openbmc/issues/2461 is the OpenBMC issue for =
updating to Yocto 2.4.

You could also look at including that patch in a systemd_%.bbappend.

Gunnar


On 1/8/2018 6:20 PM, Nancy Yuen wrote:
> I think systemd is a component that OpenBMC picks up when it updates=20
> Yocto.  I think there was some rumblings about updating to Yocto 2.4.
> I don't know what version of systemd is in it though.
>
> ----------
> Nancy
>
> On Fri, Jan 5, 2018 at 9:53 AM, <Balaji.B.Rao@dell.com=20
> <mailto:Balaji.B.Rao@dell.com>> wrote:
>
>     systemd in openbmc repo seems a little outdated making it unable
>     to build with GNU c++ compilers. Is there a plan to update it?
>     Particularly interesting is the following fix,
>
>     =
https://github.com/systemd/systemd/commit/aa3288505569433200bfa311ff12d29=
684a14374
>    =20
> <https://github.com/systemd/systemd/commit/aa3288505569433200bfa311ff1
> 2d29684a14374>
>
>     Will systemd be updated anytime soon?
>
>     Thanks
>
>     Balaji
>
>

-------------- next part --------------
An HTML attachment was scrubbed...
URL: =
<http://lists.ozlabs.org/pipermail/openbmc/attachments/20180108/856bfca3/=
attachment-0001.html>

------------------------------

Message: 2
Date: Tue,  9 Jan 2018 09:45:19 +0800
From: Haiyue Wang <haiyue.wang@linux.intel.com>
To: minyard@acm.org,	joel@jms.id.au,	openbmc@lists.ozlabs.org
Cc: Haiyue Wang <haiyue.wang@linux.intel.com>
Subject: [PATCH linux dev-4.10 v3] ipmi: add an Aspeed KCS IPMI BMC
	driver
Message-ID:
	<1515462319-5549-1-git-send-email-haiyue.wang@linux.intel.com>

The KCS (Keyboard Controller Style) interface is used to perform in-band =
IPMI communication between a server host and its BMC (BaseBoard =
Management Controllers).

This driver exposes the KCS interface on ASpeed SOCs (AST2400 and =
AST2500) as a character device. Such SOCs are commonly used as BMCs and =
this driver implements the BMC side of the KCS interface.

Signed-off-by: Haiyue Wang <haiyue.wang@linux.intel.com>
---
 .../devicetree/bindings/ipmi/aspeed-kcs-bmc.txt    |  25 +
 drivers/char/ipmi/Kconfig                          |   9 +
 drivers/char/ipmi/Makefile                         |   1 +
 drivers/char/ipmi/kcs-bmc.c                        | 744 =
+++++++++++++++++++++
 include/uapi/linux/kcs-bmc.h                       |  14 +
 5 files changed, 793 insertions(+)
 create mode 100644 =
Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt
 create mode 100644 drivers/char/ipmi/kcs-bmc.c  create mode 100644 =
include/uapi/linux/kcs-bmc.h

diff --git a/Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt =
b/Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt
new file mode 100644
index 0000000..809307b
--- /dev/null
+++ b/Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt
@@ -0,0 +1,25 @@
+* Aspeed KCS (Keyboard Controller Style) IPMI interface
+
+The Aspeed SOCs (AST2400 and AST2500) are commonly used as BMCs=20
+(BaseBoard Management Controllers) and the KCS interface can be used to =

+perform in-band IPMI communication with their host.
+
+Required properties:
+- compatible : should be one of
+    "aspeed,ast2400-kcs-bmc"
+    "aspeed,ast2500-kcs-bmc"
+- interrupts : interrupt generated by the controller
+- kcs_chan : The LPC channel number in the controller
+- kcs_addr : The host CPU IO map address
+
+
+Example:
+
+    kcs: kcs@0 {
+        compatible =3D "aspeed,ast2500-kcs-bmc";
+        interrupts =3D <8>;
+        kcs_chan =3D <3>;
+        kcs_addr =3D <0xCA2>;
+        status =3D "okay";
+    };
+
diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig index =
90f3edf..2e6007e 100644
--- a/drivers/char/ipmi/Kconfig
+++ b/drivers/char/ipmi/Kconfig
@@ -85,3 +85,12 @@ config ASPEED_BT_IPMI_BMC
 	  Provides a driver for the BT (Block Transfer) IPMI interface
 	  found on Aspeed SOCs (AST2400 and AST2500). The driver
 	  implements the BMC side of the BT interface.
+
+config ASPEED_KCS_IPMI_BMC
+	depends on ARCH_ASPEED || COMPILE_TEST
+	select REGMAP_MMIO
+	tristate "KCS IPMI bmc driver"
+	help
+	  Provides a driver for the KCS (Keyboard Controller Style) IPMI
+	  interface found on Aspeed SOCs (AST2400 and AST2500). The driver
+	  implements the BMC side of the KCS interface.
\ No newline at end of file
diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile =
index 0d98cd9..35272a7 100644
--- a/drivers/char/ipmi/Makefile
+++ b/drivers/char/ipmi/Makefile
@@ -12,3 +12,4 @@ obj-$(CONFIG_IPMI_POWERNV) +=3D ipmi_powernv.o
 obj-$(CONFIG_IPMI_WATCHDOG) +=3D ipmi_watchdog.o
 obj-$(CONFIG_IPMI_POWEROFF) +=3D ipmi_poweroff.o
 obj-$(CONFIG_ASPEED_BT_IPMI_BMC) +=3D bt-bmc.o
+obj-$(CONFIG_ASPEED_KCS_IPMI_BMC) +=3D kcs-bmc.o
\ No newline at end of file
diff --git a/drivers/char/ipmi/kcs-bmc.c b/drivers/char/ipmi/kcs-bmc.c =
new file mode 100644 index 0000000..86dcde7
--- /dev/null
+++ b/drivers/char/ipmi/kcs-bmc.c
@@ -0,0 +1,744 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2015-2017, Intel Corporation.
+
+#include <linux/atomic.h>
+#include <linux/errno.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kcs-bmc.h>
+#include <linux/mfd/syscon.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/poll.h>
+#include <linux/regmap.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+#include <linux/timer.h>
+
+#define KCS_MSG_BUFSIZ      1024
+#define KCS_CHANNEL_MAX     4
+
+/*
+ * This is a BMC device used to communicate to the host  */
+#define DEVICE_NAME     "ipmi-kcs-host"
+
+
+/* Different Phases of the KCS Module */
+#define KCS_PHASE_IDLE          0x00
+#define KCS_PHASE_WRITE         0x01
+#define KCS_PHASE_WRITE_END     0x02
+#define KCS_PHASE_READ          0x03
+#define KCS_PHASE_ABORT         0x04
+#define KCS_PHASE_ERROR         0x05
+
+/* Abort Phase */
+#define ABORT_PHASE_ERROR1      0x01
+#define ABORT_PHASE_ERROR2      0x02
+
+/* KCS Command Control codes. */
+#define KCS_GET_STATUS          0x60
+#define KCS_ABORT               0x60
+#define KCS_WRITE_START         0x61
+#define KCS_WRITE_END           0x62
+#define KCS_READ_BYTE           0x68
+
+/* Status bits.:
+ * - IDLE_STATE.  Interface is idle. System software should not be =
expecting
+ *                nor sending any data.
+ * - READ_STATE.  BMC is transferring a packet to system software. =
System
+ *                software should be in the "Read Message" state.
+ * - WRITE_STATE. BMC is receiving a packet from system software. =
System
+ *                software should be writing a command to the BMC.
+ * - ERROR_STATE. BMC has detected a protocol violation at the =
interface level,
+ *                or the transfer has been aborted. System software can =
either
+ *                use the "Get_Status" control code to request the =
nature of
+ *                the error, or it can just retry the command.
+ */
+#define KCS_IDLE_STATE           0
+#define KCS_READ_STATE           1
+#define KCS_WRITE_STATE          2
+#define KCS_ERROR_STATE          3
+
+/* KCS Error Codes */
+#define KCS_NO_ERROR                0x00
+#define KCS_ABORTED_BY_COMMAND      0x01
+#define KCS_ILLEGAL_CONTROL_CODE    0x02
+#define KCS_LENGTH_ERROR            0x06
+#define KCS_UNSPECIFIED_ERROR       0xFF
+
+
+#define KCS_ZERO_DATA           0
+
+/* IPMI 2.0 - Table 9-1, KCS Interface Status Register Bits */
+#define KCS_STR_STATE(state)        (state << 6)
+#define KCS_STR_STATE_MASK          KCS_STR_STATE(0x3)
+#define KCS_STR_CMD_DAT             BIT(3)
+#define KCS_STR_SMS_ATN             BIT(2)
+#define KCS_STR_IBF                 BIT(1)
+#define KCS_STR_OBF                 BIT(0)
+
+
+/* mapped to lpc-bmc@0 IO space */
+#define LPC_HICR0            0x000
+#define     LPC_HICR0_LPC3E          BIT(7)
+#define     LPC_HICR0_LPC2E          BIT(6)
+#define     LPC_HICR0_LPC1E          BIT(5)
+#define LPC_HICR2            0x008
+#define     LPC_HICR2_IBFIF3         BIT(3)
+#define     LPC_HICR2_IBFIF2         BIT(2)
+#define     LPC_HICR2_IBFIF1         BIT(1)
+#define LPC_HICR4            0x010
+#define     LPC_HICR4_LADR12AS       BIT(7)
+#define     LPC_HICR4_KCSENBL        BIT(2)
+#define LPC_LADR3H           0x014
+#define LPC_LADR3L           0x018
+#define LPC_LADR12H          0x01C
+#define LPC_LADR12L          0x020
+#define LPC_IDR1             0x024
+#define LPC_IDR2             0x028
+#define LPC_IDR3             0x02C
+#define LPC_ODR1             0x030
+#define LPC_ODR2             0x034
+#define LPC_ODR3             0x038
+#define LPC_STR1             0x03C
+#define LPC_STR2             0x040
+#define LPC_STR3             0x044
+
+/* mapped to lpc-host@80 IO space */
+#define LPC_HICRB            0x080
+#define     LPC_HICRB_IBFIF4         BIT(1)
+#define     LPC_HICRB_LPC4E          BIT(0)
+#define LPC_LADR4            0x090
+#define LPC_IDR4             0x094
+#define LPC_ODR4             0x098
+#define LPC_STR4             0x09C
+
+
+/* IPMI 2.0 - 9.5, KCS Interface Registers */ struct kcs_ioreg {
+	u32 idr; /* Input Data Register */
+	u32 odr; /* Output Data Register */
+	u32 str; /* Status Register */
+};
+
+static const struct kcs_ioreg kcs_ioreg_map[KCS_CHANNEL_MAX] =3D {
+	{ .idr =3D LPC_IDR1, .odr =3D LPC_ODR1, .str =3D LPC_STR1 },
+	{ .idr =3D LPC_IDR2, .odr =3D LPC_ODR2, .str =3D LPC_STR2 },
+	{ .idr =3D LPC_IDR3, .odr =3D LPC_ODR3, .str =3D LPC_STR3 },
+	{ .idr =3D LPC_IDR4, .odr =3D LPC_ODR4, .str =3D LPC_STR4 }, };
+
+struct kcs_bmc {
+	struct regmap *map;
+	spinlock_t     lock;
+
+	u32 chan;
+	int running;
+
+	u32 idr;
+	u32 odr;
+	u32 str;
+
+	int kcs_phase;
+	u8  abort_phase;
+	u8  kcs_error;
+
+	wait_queue_head_t queue;
+	int  data_in_avail;
+	int  data_in_idx;
+	u8  *data_in;
+
+	int  data_out_idx;
+	int  data_out_len;
+	u8  *data_out;
+
+	struct miscdevice miscdev;
+};
+
+static u8 kcs_inb(struct kcs_bmc *kcs_bmc, u32 reg) {
+	u32 val =3D 0;
+	int rc;
+
+	rc =3D regmap_read(kcs_bmc->map, reg, &val);
+	WARN(rc !=3D 0, "regmap_read() failed: %d\n", rc);
+
+	return rc =3D=3D 0 ? (u8) val : 0;
+}
+
+static void kcs_outb(struct kcs_bmc *kcs_bmc, u8 data, u32 reg) {
+	int rc;
+
+	rc =3D regmap_write(kcs_bmc->map, reg, data);
+	WARN(rc !=3D 0, "regmap_write() failed: %d\n", rc); }
+
+static inline void kcs_set_state(struct kcs_bmc *kcs_bmc, u8 state) {
+	regmap_update_bits(kcs_bmc->map, kcs_bmc->str, KCS_STR_STATE_MASK,
+			KCS_STR_STATE(state));
+}
+
+static inline void kcs_set_atn(struct kcs_bmc *kcs_bmc) {
+	regmap_update_bits(kcs_bmc->map, kcs_bmc->str, KCS_STR_SMS_ATN,
+			KCS_STR_SMS_ATN);
+}
+
+static inline void kcs_clear_atn(struct kcs_bmc *kcs_bmc) {
+	regmap_update_bits(kcs_bmc->map, kcs_bmc->str, KCS_STR_SMS_ATN,
+			0);
+}
+
+/*
+ * AST_usrGuide_KCS.pdf
+ * 2. Background:
+ *   we note D for Data, and C for Cmd/Status, default rules are
+ *     A. KCS1 / KCS2 ( D / C:X / X+4 )
+ *        D / C : CA0h / CA4h
+ *        D / C : CA8h / CACh
+ *     B. KCS3 ( D / C:XX2h / XX3h )
+ *        D / C : CA2h / CA3h
+ *        D / C : CB2h / CB3h
+ *     C. KCS4
+ *        D / C : CA4h / CA5h
+ */
+static void kcs_set_addr(struct kcs_bmc *kcs_bmc, u16 addr) {
+	switch (kcs_bmc->chan) {
+	case 1:
+		regmap_update_bits(kcs_bmc->map, LPC_HICR4,
+				LPC_HICR4_LADR12AS, 0);
+		regmap_write(kcs_bmc->map, LPC_LADR12H, addr >> 8);
+		regmap_write(kcs_bmc->map, LPC_LADR12L, addr & 0xFF);
+		break;
+
+	case 2:
+		regmap_update_bits(kcs_bmc->map, LPC_HICR4,
+				LPC_HICR4_LADR12AS, LPC_HICR4_LADR12AS);
+		regmap_write(kcs_bmc->map, LPC_LADR12H, addr >> 8);
+		regmap_write(kcs_bmc->map, LPC_LADR12L, addr & 0xFF);
+		break;
+
+	case 3:
+		regmap_write(kcs_bmc->map, LPC_LADR3H, addr >> 8);
+		regmap_write(kcs_bmc->map, LPC_LADR3L, addr & 0xFF);
+		break;
+
+	case 4:
+		regmap_write(kcs_bmc->map, LPC_LADR4, ((addr + 1) << 16) |
+			addr);
+		break;
+
+	default:
+		break;
+	}
+}
+
+static void kcs_enable_channel(struct kcs_bmc *kcs_bmc, int enable) {
+	switch (kcs_bmc->chan) {
+	case 1:
+		if (enable) {
+			regmap_update_bits(kcs_bmc->map, LPC_HICR2,
+					LPC_HICR2_IBFIF1, LPC_HICR2_IBFIF1);
+			regmap_update_bits(kcs_bmc->map, LPC_HICR0,
+					LPC_HICR0_LPC1E, LPC_HICR0_LPC1E);
+		} else {
+			regmap_update_bits(kcs_bmc->map, LPC_HICR0,
+					LPC_HICR0_LPC1E, 0);
+			regmap_update_bits(kcs_bmc->map, LPC_HICR2,
+					LPC_HICR2_IBFIF1, 0);
+		}
+		break;
+
+	case 2:
+		if (enable) {
+			regmap_update_bits(kcs_bmc->map, LPC_HICR2,
+					LPC_HICR2_IBFIF2, LPC_HICR2_IBFIF2);
+			regmap_update_bits(kcs_bmc->map, LPC_HICR0,
+					LPC_HICR0_LPC2E, LPC_HICR0_LPC2E);
+		} else {
+			regmap_update_bits(kcs_bmc->map, LPC_HICR0,
+					LPC_HICR0_LPC2E, 0);
+			regmap_update_bits(kcs_bmc->map, LPC_HICR2,
+					LPC_HICR2_IBFIF2, 0);
+		}
+		break;
+
+	case 3:
+		if (enable) {
+			regmap_update_bits(kcs_bmc->map, LPC_HICR2,
+					LPC_HICR2_IBFIF3, LPC_HICR2_IBFIF3);
+			regmap_update_bits(kcs_bmc->map, LPC_HICR0,
+					LPC_HICR0_LPC3E, LPC_HICR0_LPC3E);
+			regmap_update_bits(kcs_bmc->map, LPC_HICR4,
+					LPC_HICR4_KCSENBL, LPC_HICR4_KCSENBL);
+		} else {
+			regmap_update_bits(kcs_bmc->map, LPC_HICR0,
+					LPC_HICR0_LPC3E, 0);
+			regmap_update_bits(kcs_bmc->map, LPC_HICR4,
+					LPC_HICR4_KCSENBL, 0);
+			regmap_update_bits(kcs_bmc->map, LPC_HICR2,
+					LPC_HICR2_IBFIF3, 0);
+		}
+		break;
+
+	case 4:
+		if (enable) {
+			regmap_update_bits(kcs_bmc->map, LPC_HICRB,
+					LPC_HICRB_IBFIF4 | LPC_HICRB_LPC4E,
+					LPC_HICRB_IBFIF4 | LPC_HICRB_LPC4E);
+		} else {
+			regmap_update_bits(kcs_bmc->map, LPC_HICRB,
+					LPC_HICRB_IBFIF4 | LPC_HICRB_LPC4E,
+					0);
+		}
+		break;
+
+	default:
+		break;
+	}
+}
+
+static void kcs_rx_data(struct kcs_bmc *kcs_bmc) {
+	u8 data;
+
+	switch (kcs_bmc->kcs_phase) {
+	case KCS_PHASE_WRITE:
+		kcs_set_state(kcs_bmc, KCS_WRITE_STATE);
+
+		/* set OBF before reading data */
+		kcs_outb(kcs_bmc, KCS_ZERO_DATA, kcs_bmc->odr);
+
+		if (kcs_bmc->data_in_idx < KCS_MSG_BUFSIZ)
+			kcs_bmc->data_in[kcs_bmc->data_in_idx++] =3D
+					kcs_inb(kcs_bmc, kcs_bmc->idr);
+		break;
+
+	case KCS_PHASE_WRITE_END:
+		kcs_set_state(kcs_bmc, KCS_READ_STATE);
+
+		if (kcs_bmc->data_in_idx < KCS_MSG_BUFSIZ)
+			kcs_bmc->data_in[kcs_bmc->data_in_idx++] =3D
+					kcs_inb(kcs_bmc, kcs_bmc->idr);
+
+		kcs_bmc->kcs_phase =3D KCS_PHASE_READ;
+		if (kcs_bmc->running) {
+			kcs_bmc->data_in_avail =3D 1;
+			wake_up_interruptible(&kcs_bmc->queue);
+		}
+		break;
+
+	case KCS_PHASE_READ:
+		if (kcs_bmc->data_out_idx =3D=3D kcs_bmc->data_out_len)
+			kcs_set_state(kcs_bmc, KCS_IDLE_STATE);
+
+		data =3D kcs_inb(kcs_bmc, kcs_bmc->idr);
+		if (data !=3D KCS_READ_BYTE) {
+			kcs_set_state(kcs_bmc, KCS_ERROR_STATE);
+			kcs_outb(kcs_bmc, KCS_ZERO_DATA, kcs_bmc->odr);
+			break;
+		}
+
+		if (kcs_bmc->data_out_idx =3D=3D kcs_bmc->data_out_len) {
+			kcs_outb(kcs_bmc, KCS_ZERO_DATA, kcs_bmc->odr);
+			kcs_bmc->kcs_phase =3D KCS_PHASE_IDLE;
+			break;
+		}
+
+		kcs_outb(kcs_bmc, kcs_bmc->data_out[kcs_bmc->data_out_idx++],
+				 kcs_bmc->odr);
+		break;
+
+	case KCS_PHASE_ABORT:
+		switch (kcs_bmc->abort_phase) {
+		case ABORT_PHASE_ERROR1:
+			kcs_set_state(kcs_bmc, KCS_READ_STATE);
+
+			/* Read the Dummy byte */
+			kcs_inb(kcs_bmc, kcs_bmc->idr);
+
+			kcs_outb(kcs_bmc, kcs_bmc->kcs_error, kcs_bmc->odr);
+			kcs_bmc->abort_phase =3D ABORT_PHASE_ERROR2;
+			break;
+
+		case ABORT_PHASE_ERROR2:
+			kcs_set_state(kcs_bmc, KCS_IDLE_STATE);
+
+			/* Read the Dummy byte */
+			kcs_inb(kcs_bmc, kcs_bmc->idr);
+
+			kcs_outb(kcs_bmc, KCS_ZERO_DATA, kcs_bmc->odr);
+			kcs_bmc->kcs_phase =3D KCS_PHASE_IDLE;
+			kcs_bmc->abort_phase =3D 0;
+			break;
+
+		default:
+			break;
+		}
+
+		break;
+
+	case KCS_PHASE_ERROR:
+		kcs_set_state(kcs_bmc, KCS_ERROR_STATE);
+
+		/* Read the Dummy byte */
+		kcs_inb(kcs_bmc, kcs_bmc->idr);
+
+		kcs_outb(kcs_bmc, KCS_ZERO_DATA, kcs_bmc->odr);
+		break;
+
+	default:
+		kcs_set_state(kcs_bmc, KCS_ERROR_STATE);
+
+		/* Read the Dummy byte */
+		kcs_inb(kcs_bmc, kcs_bmc->idr);
+
+		kcs_outb(kcs_bmc, KCS_ZERO_DATA, kcs_bmc->odr);
+		break;
+	}
+}
+
+static void kcs_rx_cmd(struct kcs_bmc *kcs_bmc) {
+	u8 cmd;
+
+	kcs_set_state(kcs_bmc, KCS_WRITE_STATE);
+
+	/* Dummy data to generate OBF */
+	kcs_outb(kcs_bmc, KCS_ZERO_DATA, kcs_bmc->odr);
+
+	cmd =3D kcs_inb(kcs_bmc, kcs_bmc->idr);
+	switch (cmd) {
+	case KCS_WRITE_START:
+		kcs_bmc->data_in_avail =3D 0;
+		kcs_bmc->data_in_idx   =3D 0;
+		kcs_bmc->kcs_phase     =3D KCS_PHASE_WRITE;
+		kcs_bmc->kcs_error     =3D KCS_NO_ERROR;
+		break;
+
+	case KCS_WRITE_END:
+		kcs_bmc->kcs_phase =3D KCS_PHASE_WRITE_END;
+		break;
+
+	case KCS_ABORT:
+		if (kcs_bmc->kcs_error =3D=3D KCS_NO_ERROR)
+			kcs_bmc->kcs_error =3D KCS_ABORTED_BY_COMMAND;
+
+		kcs_bmc->kcs_phase   =3D KCS_PHASE_ABORT;
+		kcs_bmc->abort_phase =3D ABORT_PHASE_ERROR1;
+		break;
+
+	default:
+		kcs_bmc->kcs_error =3D KCS_ILLEGAL_CONTROL_CODE;
+		kcs_set_state(kcs_bmc, KCS_ERROR_STATE);
+		kcs_outb(kcs_bmc, kcs_bmc->kcs_error, kcs_bmc->odr);
+		kcs_bmc->kcs_phase =3D KCS_PHASE_ERROR;
+		break;
+	}
+}
+
+/*
+ * Whenever the BMC is reset (from power-on or a hard reset), the State =

+Bits
+ * are initialized to "11 - Error State". Doing so allows SMS to detect =

+that
+ * the BMC has been reset and that any message in process has been=20
+terminated
+ * by the BMC.
+ */
+static void kcs_force_abort(struct kcs_bmc *kcs_bmc) {
+	unsigned long flags;
+
+	spin_lock_irqsave(&kcs_bmc->lock, flags);
+	kcs_set_state(kcs_bmc, KCS_ERROR_STATE);
+
+	/* Read the Dummy byte */
+	kcs_inb(kcs_bmc, kcs_bmc->idr);
+
+	kcs_outb(kcs_bmc, KCS_ZERO_DATA, kcs_bmc->odr);
+	kcs_bmc->kcs_phase =3D KCS_PHASE_ERROR;
+	spin_unlock_irqrestore(&kcs_bmc->lock, flags); }
+
+static irqreturn_t kcs_bmc_irq(int irq, void *arg) {
+	struct kcs_bmc *kcs_bmc =3D arg;
+	u32 sts;
+
+	if (regmap_read(kcs_bmc->map, kcs_bmc->str, &sts) !=3D 0)
+		return IRQ_NONE;
+
+	sts &=3D (KCS_STR_IBF | KCS_STR_CMD_DAT);
+
+	switch (sts) {
+	case KCS_STR_IBF | KCS_STR_CMD_DAT:
+		kcs_rx_cmd(kcs_bmc);
+		break;
+
+	case KCS_STR_IBF:
+		kcs_rx_data(kcs_bmc);
+
+	default:
+		return IRQ_NONE;
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int kcs_bmc_config_irq(struct kcs_bmc *kcs_bmc,
+			struct platform_device *pdev)
+{
+	struct device *dev =3D &pdev->dev;
+	int irq;
+
+	irq =3D platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	return devm_request_irq(dev, irq, kcs_bmc_irq, IRQF_SHARED,
+			dev_name(dev), kcs_bmc);
+}
+
+
+static inline struct kcs_bmc *file_kcs_bmc(struct file *filp) {
+	return container_of(filp->private_data, struct kcs_bmc, miscdev); }
+
+static int kcs_bmc_open(struct inode *inode, struct file *filp) {
+	struct kcs_bmc *kcs_bmc =3D file_kcs_bmc(filp);
+	unsigned long flags;
+
+	if (kcs_bmc->running)
+		return -EBUSY;
+
+	spin_lock_irqsave(&kcs_bmc->lock, flags);
+	kcs_bmc->kcs_phase     =3D KCS_PHASE_IDLE;
+	kcs_bmc->running       =3D 1;
+	kcs_bmc->data_in_avail =3D 0;
+	spin_unlock_irqrestore(&kcs_bmc->lock, flags);
+
+	return 0;
+}
+
+static unsigned int kcs_bmc_poll(struct file *filp, poll_table *wait) {
+	struct kcs_bmc *kcs_bmc =3D file_kcs_bmc(filp);
+	unsigned int mask =3D 0;
+
+	poll_wait(filp, &kcs_bmc->queue, wait);
+
+	if (kcs_bmc->data_in_avail)
+		mask |=3D POLLIN;
+
+	if (kcs_bmc->kcs_phase =3D=3D KCS_PHASE_READ)
+		mask |=3D POLLOUT;
+
+	return mask;
+}
+
+static ssize_t kcs_bmc_read(struct file *filp, char *buf,
+			    size_t count, loff_t *offset)
+{
+	struct kcs_bmc *kcs_bmc =3D file_kcs_bmc(filp);
+	int rv;
+
+	rv =3D wait_event_interruptible(kcs_bmc->queue,
+				kcs_bmc->data_in_avail !=3D 0);
+	if (rv < 0)
+		return -ERESTARTSYS;
+
+	kcs_bmc->data_in_avail =3D 0;
+
+	if (count > kcs_bmc->data_in_idx)
+		count =3D kcs_bmc->data_in_idx;
+
+	if (copy_to_user(buf, kcs_bmc->data_in, count))
+		return -EFAULT;
+
+	return count;
+}
+
+static ssize_t kcs_bmc_write(struct file *filp, const char *buf,
+			     size_t count, loff_t *offset)
+{
+	struct kcs_bmc *kcs_bmc =3D file_kcs_bmc(filp);
+	unsigned long flags;
+
+	if (count < 1 || count > KCS_MSG_BUFSIZ)
+		return -EINVAL;
+
+	if (copy_from_user(kcs_bmc->data_out, buf, count))
+		return -EFAULT;
+
+	spin_lock_irqsave(&kcs_bmc->lock, flags);
+	if (kcs_bmc->kcs_phase =3D=3D KCS_PHASE_READ) {
+		kcs_bmc->data_out_idx =3D 1;
+		kcs_bmc->data_out_len =3D count;
+		kcs_outb(kcs_bmc, kcs_bmc->data_out[0], kcs_bmc->odr);
+	}
+	spin_unlock_irqrestore(&kcs_bmc->lock, flags);
+
+	return count;
+}
+
+static long kcs_bmc_ioctl(struct file *filp, unsigned int cmd,
+			  unsigned long arg)
+{
+	struct kcs_bmc *kcs_bmc =3D file_kcs_bmc(filp);
+	long ret =3D 0;
+
+	switch (cmd) {
+	case KCS_BMC_IOCTL_SET_ATN:
+		kcs_set_atn(kcs_bmc);
+		break;
+
+	case KCS_BMC_IOCTL_CLR_ATN:
+		kcs_clear_atn(kcs_bmc);
+		break;
+
+	case KCS_BMC_IOCTL_FORCE_ABORT:
+		kcs_force_abort(kcs_bmc);
+		break;
+
+	default:
+		ret =3D -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static int kcs_bmc_release(struct inode *inode, struct file *filp) {
+	struct kcs_bmc *kcs_bmc =3D file_kcs_bmc(filp);
+	unsigned long flags;
+
+	spin_lock_irqsave(&kcs_bmc->lock, flags);
+	kcs_bmc->running =3D 0;
+	spin_unlock_irqrestore(&kcs_bmc->lock, flags);
+
+	return 0;
+}
+
+static const struct file_operations kcs_bmc_fops =3D {
+	.owner          =3D THIS_MODULE,
+	.open           =3D kcs_bmc_open,
+	.read           =3D kcs_bmc_read,
+	.write          =3D kcs_bmc_write,
+	.release        =3D kcs_bmc_release,
+	.poll           =3D kcs_bmc_poll,
+	.unlocked_ioctl =3D kcs_bmc_ioctl,
+};
+
+static int kcs_bmc_probe(struct platform_device *pdev) {
+	struct device *dev =3D &pdev->dev;
+	const struct kcs_ioreg *ioreg;
+	struct kcs_bmc *kcs_bmc;
+	u32 chan, addr;
+	int rc;
+
+	kcs_bmc =3D devm_kzalloc(dev, sizeof(*kcs_bmc), GFP_KERNEL);
+	if (!kcs_bmc)
+		return -ENOMEM;
+
+	rc =3D of_property_read_u32(dev->of_node, "kcs_chan", &chan);
+	if ((rc !=3D 0) || (chan =3D=3D 0 || chan > KCS_CHANNEL_MAX)) {
+		dev_err(dev, "no valid 'kcs_chan' configured\n");
+		return -ENODEV;
+	}
+
+	rc =3D of_property_read_u32(dev->of_node, "kcs_addr", &addr);
+	if (rc) {
+		dev_err(dev, "no valid 'kcs_addr' configured\n");
+		return -ENODEV;
+	}
+
+	kcs_bmc->map =3D syscon_node_to_regmap(dev->parent->of_node);
+	if (IS_ERR(kcs_bmc->map)) {
+		dev_err(dev, "Couldn't get regmap\n");
+		return -ENODEV;
+	}
+
+	dev_set_name(dev, "ipmi-kcs%u", chan);
+
+	spin_lock_init(&kcs_bmc->lock);
+	kcs_bmc->chan =3D chan;
+
+	ioreg =3D &kcs_ioreg_map[chan - 1];
+	kcs_bmc->idr  =3D ioreg->idr;
+	kcs_bmc->odr  =3D ioreg->odr;
+	kcs_bmc->str  =3D ioreg->str;
+
+	init_waitqueue_head(&kcs_bmc->queue);
+	kcs_bmc->data_in  =3D devm_kmalloc(dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
+	kcs_bmc->data_out =3D devm_kmalloc(dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
+	if (kcs_bmc->data_in =3D=3D NULL || kcs_bmc->data_out =3D=3D NULL) {
+		dev_err(dev, "Failed to allocate data buffers\n");
+		return -ENOMEM;
+	}
+
+	kcs_bmc->miscdev.minor =3D MISC_DYNAMIC_MINOR;
+	kcs_bmc->miscdev.name =3D dev_name(dev);
+	kcs_bmc->miscdev.fops =3D &kcs_bmc_fops;
+	rc =3D misc_register(&kcs_bmc->miscdev);
+	if (rc) {
+		dev_err(dev, "Unable to register device\n");
+		return rc;
+	}
+
+	kcs_set_addr(kcs_bmc, addr);
+	kcs_enable_channel(kcs_bmc, 1);
+
+	rc =3D kcs_bmc_config_irq(kcs_bmc, pdev);
+	if (rc) {
+		misc_deregister(&kcs_bmc->miscdev);
+		return rc;
+	}
+
+	dev_set_drvdata(&pdev->dev, kcs_bmc);
+
+	dev_info(dev, "addr=3D0x%x, idr=3D0x%x, odr=3D0x%x, str=3D0x%x\n",
+		addr, kcs_bmc->idr, kcs_bmc->odr, kcs_bmc->str);
+
+	return 0;
+}
+
+static int kcs_bmc_remove(struct platform_device *pdev) {
+	struct kcs_bmc *kcs_bmc =3D dev_get_drvdata(&pdev->dev);
+
+	misc_deregister(&kcs_bmc->miscdev);
+
+	return 0;
+}
+
+static const struct of_device_id kcs_bmc_match[] =3D {
+	{ .compatible =3D "aspeed,ast2400-kcs-bmc" },
+	{ .compatible =3D "aspeed,ast2500-kcs-bmc" },
+	{ }
+};
+
+static struct platform_driver kcs_bmc_driver =3D {
+	.driver =3D {
+		.name           =3D DEVICE_NAME,
+		.of_match_table =3D kcs_bmc_match,
+	},
+	.probe =3D kcs_bmc_probe,
+	.remove =3D kcs_bmc_remove,
+};
+
+module_platform_driver(kcs_bmc_driver);
+
+MODULE_DEVICE_TABLE(of, kcs_bmc_match); MODULE_LICENSE("GPL v2");=20
+MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");=20
+MODULE_DESCRIPTION("Linux device interface to the IPMI KCS interface");
diff --git a/include/uapi/linux/kcs-bmc.h b/include/uapi/linux/kcs-bmc.h =
new file mode 100644 index 0000000..c0ccc5e
--- /dev/null
+++ b/include/uapi/linux/kcs-bmc.h
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2015-2017, Intel Corporation.
+
+#ifndef _UAPI_LINUX_KCS_BMC_H
+#define _UAPI_LINUX_KCS_BMC_H
+
+#include <linux/ioctl.h>
+
+#define __KCS_BMC_IOCTL_MAGIC        'K'
+#define KCS_BMC_IOCTL_SET_ATN        _IO(__KCS_BMC_IOCTL_MAGIC, 1)
+#define KCS_BMC_IOCTL_CLR_ATN        _IO(__KCS_BMC_IOCTL_MAGIC, 2)
+#define KCS_BMC_IOCTL_FORCE_ABORT    _IO(__KCS_BMC_IOCTL_MAGIC, 3)
+
+#endif /* _UAPI_LINUX_KCS_BMC_H */
--
2.7.4



End of openbmc Digest, Vol 29, Issue 17
***************************************
