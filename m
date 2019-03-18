Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44NNKM3s0BzDqGb
 for <openbmc@lists.ozlabs.org>; Tue, 19 Mar 2019 04:22:14 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Mar 2019 10:21:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,494,1544515200"; d="scan'208";a="135074965"
Received: from unknown (HELO [10.7.153.147]) ([10.7.153.147])
 by orsmga003.jf.intel.com with ESMTP; 18 Mar 2019 10:21:59 -0700
Subject: Re: Does obmc-ikvm work with bmcweb?
To: Lei YU <mine260309@gmail.com>
Cc: xiuzhi <1450335857@qq.com>, openbmc <openbmc@lists.ozlabs.org>,
 ed <ed@tanous.net>, Eddie James <eajames@linux.vnet.ibm.com>
References: <tencent_2EF1C4452C43ADF74A37DF04@qq.com>
 <fa618273-b2e8-3d53-9c28-91f01fd83c05@linux.intel.com>
 <tencent_77BC148C0E378EFD5F488CE6@qq.com>
 <fa79e3d3-cc85-ba90-42b7-2e6ef69f6653@linux.intel.com>
 <CAARXrtn+ghtcdPLBDVMrMtX31==ZufsuPDCKm11dd92zQwm22A@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <fb4ea162-ae50-5c02-eea6-3adb200e6ed8@linux.intel.com>
Date: Mon, 18 Mar 2019 10:21:59 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <CAARXrtn+ghtcdPLBDVMrMtX31==ZufsuPDCKm11dd92zQwm22A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Mon, 18 Mar 2019 17:22:16 -0000

On 3/17/2019 7:25 PM, Lei YU wrote:
>> openbmc: ae29d00f227e55192a69f66c87633e1b53fc6e68
>>
>> I'm using a custom build config for my machine. As you already know, for
>> enabling the KVM feature, customization on kernel configs, adding a
>> 'start-ipkvm' service, adding of libvncserver package and back-porting
>> of aspeed video driver are also needed so there is no one-shot buildable
>> TEMPLATECONF for KVM test.
> 
> Could you kindly put everything together on a branch so others could refer the
> branch to know what the changes are for KVM to work?
> Thanks a lot!
> 

Well, I've already shared SHAs that are relating to KVM in this email
thread, I'm sharing it again with some more details.

openbmc: ae29d00f227e55192a69f66c87633e1b53fc6e68

bmcweb: 9474b3788017bddd70e493e2b9b7674be30abc87

phosphor-webui: 511a2bbc5540fccb883b8d0005c2b387a23c9d05
                 Cherry picked 
https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-webui/+/10268/

libvncserver: 3348a7e42e86dfb98dd7458ad29def476cf6096f
Need to remove 'x11' and 'gtk+' to reduce package size so I made:
libvncserver_%.bbappend
----------------------------------------------------------------
PACKAGECONFIG_remove = "gcrypt gnutls png sdl zlib"

TARGET_CXXFLAGS += " -Dflto"

do_install_append() {
     rm -rf ${D}${libdir}/libvncclient*
}

inherit cmake

# Use the latest to support obmc-ikvm
DEPENDS += "openssl"
SRC_URI = "git://github.com/LibVNC/libvncserver"
SRCREV = "3348a7e42e86dfb98dd7458ad29def476cf6096f"
S = "${WORKDIR}/git"

# Remove x11 and gtk+ that cause big image size
# Actually, these aren't needed to support obmc-ikvm
REQUIRED_DISTRO_FEATURES_remove = "x11"
DEPENDS_remove = "gtk+"
RDEPENDS_${PN}_remove = "gtk+"
----------------------------------------------------------------

start-ipkvm: Cherry pick 
https://gerrit.openbmc-project.xyz/#/c/openbmc/meta-phosphor/+/13536/
After cherry picking it, I changed start-ipkvm.service file like below:
start-ipkvm.service
----------------------------------------------------------------
[Unit]
Description=OpenBMC ipKVM daemon
StopWhenUnneeded=false

[Service]
Restart=always
ExecStartPre=/usr/bin/create_usbhid.sh
ExecStart=/usr/bin/env obmc-ikvm -v /dev/video0 -f 10 -k /dev/hidg0 -p 
/dev/hidg1

[Install]
WantedBy=multi-user.target
-----------------------------------------------------------------

obmc-ikvm: 2bc661d34abd1fda92a9d2b256ed88ca0e90d09a

linux-aspeed: 7859d04be772a1d185de335a8e9d38ac03a89f3f
Added these kernel configs:
-----------------------------------------------------------------
CONFIG_FRAME_VECTOR=y
CONFIG_MEDIA_SUPPORT=y
CONFIG_MEDIA_CAMERA_SUPPORT=y
CONFIG_VIDEO_DEV=y
CONFIG_VIDEO_V4L2=y
CONFIG_V4L_PLATFORM_DRIVERS=y
CONFIG_VIDEO_ASPEED=y
CONFIG_VIDEOBUF2_CORE=y
CONFIG_VIDEOBUF2_V4L2=y
CONFIG_VIDEOBUF2_MEMOPS=y
CONFIG_VIDEOBUF2_DMA_CONTIG=y
CONFIG_MEDIA_SUBDRV_AUTOSELECT=y
CONFIG_USB_GADGET_VBUS_DRAW=2
CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=2
CONFIG_USB_LIBCOMPOSITE=y
CONFIG_USB_F_HID=y
CONFIG_USB_GADGET=y
CONFIG_U_SERIAL_CONSOLE=y
CONFIG_USB_ASPEED_VHUB=y
CONFIG_USB_CONFIGFS=y
CONFIG_USB_CONFIGFS_MASS_STORAGE=y
CONFIG_USB_CONFIGFS_F_FS=y
CONFIG_USB_CONFIGFS_F_HID=y
-------------------------------------------------------------------
Back ported Eddie's aspeed-video driver

diff --git a/MAINTAINERS b/MAINTAINERS
index b98a5763f6c1..cdd8f824b6da 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2358,6 +2358,14 @@ S:	Maintained
  F:	Documentation/hwmon/asc7621
  F:	drivers/hwmon/asc7621.c

+ASPEED VIDEO ENGINE DRIVER
+M:	Eddie James <eajames@linux.ibm.com>
+L:	linux-media@vger.kernel.org
+L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
+S:	Maintained
+F:	drivers/media/platform/aspeed-video.c
+F:	Documentation/devicetree/bindings/media/aspeed-video.txt
+
  ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS
  M:	Corentin Chary <corentin.chary@gmail.com>
  L:	acpi4asus-user@lists.sourceforge.net
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi 
b/arch/arm/boot/dts/aspeed-g5.dtsi
index d8a9d20cc4e0..d6da0a29ced3 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -243,6 +243,17 @@
  				interrupts = <0x19>;
  			};

+			video: video@1e700000 {
+				compatible = "aspeed,ast2500-video-engine";
+				reg = <0x1e700000 0x20000>;
+				clocks = <&syscon ASPEED_CLK_GATE_VCLK>,
+					 <&syscon ASPEED_CLK_GATE_ECLK>;
+				clock-names = "vclk", "eclk";
+				resets = <&syscon ASPEED_RESET_VIDEO>;
+				interrupts = <7>;
+				status = "disabled";
+			};
+
  			adc: adc@1e6e9000 {
  				compatible = "aspeed,ast2500-adc";
  				reg = <0x1e6e9000 0xb0>;
diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
index 596136793fc4..f16ce7dbd6ab 100644
--- a/drivers/clk/clk-aspeed.c
+++ b/drivers/clk/clk-aspeed.c
@@ -87,7 +87,7 @@ struct aspeed_clk_gate {
  /* TODO: ask Aspeed about the actual parent data */
  static const struct aspeed_gate_data aspeed_gates[] = {
  	/*				 clk rst   name			parent	flags */
-	[ASPEED_CLK_GATE_ECLK] =	{  0, -1, "eclk-gate",		"eclk",	0 }, /* Video 
Engine */
+	[ASPEED_CLK_GATE_ECLK] =	{  0,  6, "eclk-gate",		"eclk",	0 }, /* Video 
Engine */
  	[ASPEED_CLK_GATE_GCLK] =	{  1,  7, "gclk-gate",		NULL,	0 }, /* 2D 
engine */
  	[ASPEED_CLK_GATE_MCLK] =	{  2, -1, "mclk-gate",		"mpll", 
CLK_IS_CRITICAL }, /* SDRAM */
  	[ASPEED_CLK_GATE_VCLK] =	{  3,  6, "vclk-gate",		NULL,	0 }, /* Video 
Capture */
@@ -113,6 +113,24 @@ static const struct aspeed_gate_data aspeed_gates[] = {
  	[ASPEED_CLK_GATE_LHCCLK] =	{ 28, -1, "lhclk-gate",		"lhclk", 0 }, /* 
LPC master/LPC+ */
  };

+static const char * const eclk_parent_names[] = {
+	"mpll",
+	"hpll",
+	"dpll",
+};
+
+static const struct clk_div_table ast2500_eclk_div_table[] = {
+	{ 0x0, 2 },
+	{ 0x1, 2 },
+	{ 0x2, 3 },
+	{ 0x3, 4 },
+	{ 0x4, 5 },
+	{ 0x5, 6 },
+	{ 0x6, 7 },
+	{ 0x7, 8 },
+	{ 0 }
+};
+
  static const struct clk_div_table ast2500_mac_div_table[] = {
  	{ 0x0, 4 }, /* Yep, really. Aspeed confirmed this is correct */
  	{ 0x1, 4 },
@@ -192,18 +210,21 @@ static struct clk_hw 
*aspeed_ast2500_calc_pll(const char *name, u32 val)

  struct aspeed_clk_soc_data {
  	const struct clk_div_table *div_table;
+	const struct clk_div_table *eclk_div_table;
  	const struct clk_div_table *mac_div_table;
  	struct clk_hw *(*calc_pll)(const char *name, u32 val);
  };

  static const struct aspeed_clk_soc_data ast2500_data = {
  	.div_table = ast2500_div_table,
+	.eclk_div_table = ast2500_eclk_div_table,
  	.mac_div_table = ast2500_mac_div_table,
  	.calc_pll = aspeed_ast2500_calc_pll,
  };

  static const struct aspeed_clk_soc_data ast2400_data = {
  	.div_table = ast2400_div_table,
+	.eclk_div_table = ast2400_div_table,
  	.mac_div_table = ast2400_div_table,
  	.calc_pll = aspeed_ast2400_calc_pll,
  };
@@ -317,6 +338,7 @@ static const u8 aspeed_resets[] = {
  	[ASPEED_RESET_PECI]	= 10,
  	[ASPEED_RESET_I2C]	=  2,
  	[ASPEED_RESET_AHB]	=  1,
+	[ASPEED_RESET_VIDEO]	=  6,

  	/*
  	 * SCUD4 resets start at an offset to separate them from
@@ -522,6 +544,22 @@ static int aspeed_clk_probe(struct platform_device 
*pdev)
  		return PTR_ERR(hw);
  	aspeed_clk_data->hws[ASPEED_CLK_24M] = hw;

+	hw = clk_hw_register_mux(dev, "eclk-mux", eclk_parent_names,
+				 ARRAY_SIZE(eclk_parent_names), 0,
+				 scu_base + ASPEED_CLK_SELECTION, 2, 0x3, 0,
+				 &aspeed_clk_lock);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+	aspeed_clk_data->hws[ASPEED_CLK_ECLK_MUX] = hw;
+
+	hw = clk_hw_register_divider_table(dev, "eclk", "eclk-mux", 0,
+					   scu_base + ASPEED_CLK_SELECTION, 28,
+					   3, 0, soc_data->eclk_div_table,
+					   &aspeed_clk_lock);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+	aspeed_clk_data->hws[ASPEED_CLK_ECLK] = hw;
+
  	/*
  	 * TODO: There are a number of clocks that not included in this driver
  	 * as more information is required:
@@ -531,7 +569,6 @@ static int aspeed_clk_probe(struct platform_device 
*pdev)
  	 *   RGMII
  	 *   RMII
  	 *   UART[1..5] clock source mux
-	 *   Video Engine (ECLK) mux and clock divider
  	 */

  	for (i = 0; i < ARRAY_SIZE(aspeed_gates); i++) {
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 54fe90acb5b2..d6edf2d28f9b 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -32,6 +32,15 @@ source "drivers/media/platform/davinci/Kconfig"

  source "drivers/media/platform/omap/Kconfig"

+config VIDEO_ASPEED
+	tristate "Aspeed AST2400 and AST2500 Video Engine driver"
+	depends on VIDEO_V4L2
+	select VIDEOBUF2_DMA_CONTIG
+	help
+	  Support for the Aspeed Video Engine (VE) embedded in the Aspeed
+	  AST2400 and AST2500 SOCs. The VE can capture and compress video data
+	  from digital or analog sources.
+
  config VIDEO_SH_VOU
  	tristate "SuperH VOU video output driver"
  	depends on MEDIA_CAMERA_SUPPORT
diff --git a/drivers/media/platform/Makefile 
b/drivers/media/platform/Makefile
index 41322ab65802..205c33a004fc 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -3,6 +3,7 @@
  # Makefile for the video capture/playback device drivers.
  #

+obj-$(CONFIG_VIDEO_ASPEED)		+= aspeed-video.o
  obj-$(CONFIG_VIDEO_CADENCE)		+= cadence/
  obj-$(CONFIG_VIDEO_VIA_CAMERA) += via-camera.o
  obj-$(CONFIG_VIDEO_CAFE_CCIC) += marvell-ccic/
diff --git a/include/dt-bindings/clock/aspeed-clock.h 
b/include/dt-bindings/clock/aspeed-clock.h
index f43738607d77..15a9059d0303 100644
--- a/include/dt-bindings/clock/aspeed-clock.h
+++ b/include/dt-bindings/clock/aspeed-clock.h
@@ -50,5 +50,6 @@
  #define ASPEED_RESET_I2C		7
  #define ASPEED_RESET_AHB		8
  #define ASPEED_RESET_CRT1		9
+#define ASPEED_RESET_VIDEO		10

  #endif
------------------------------------------------------------------

These are all I did for testing KVM.

Cheers,
Jae
