Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44NNZd1XhfzDqJX
 for <openbmc@lists.ozlabs.org>; Tue, 19 Mar 2019 04:33:44 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Mar 2019 10:33:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,494,1544515200"; 
 d="scan'208,223";a="135078536"
Received: from unknown (HELO [10.7.153.147]) ([10.7.153.147])
 by orsmga003.jf.intel.com with ESMTP; 18 Mar 2019 10:33:35 -0700
Subject: Re: Does obmc-ikvm work with bmcweb?
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Lei YU <mine260309@gmail.com>
Cc: xiuzhi <1450335857@qq.com>, openbmc <openbmc@lists.ozlabs.org>,
 ed <ed@tanous.net>, Eddie James <eajames@linux.vnet.ibm.com>
References: <tencent_2EF1C4452C43ADF74A37DF04@qq.com>
 <fa618273-b2e8-3d53-9c28-91f01fd83c05@linux.intel.com>
 <tencent_77BC148C0E378EFD5F488CE6@qq.com>
 <fa79e3d3-cc85-ba90-42b7-2e6ef69f6653@linux.intel.com>
 <CAARXrtn+ghtcdPLBDVMrMtX31==ZufsuPDCKm11dd92zQwm22A@mail.gmail.com>
 <fb4ea162-ae50-5c02-eea6-3adb200e6ed8@linux.intel.com>
Message-ID: <e592f504-b7b4-ff40-543c-84e99502e1d1@linux.intel.com>
Date: Mon, 18 Mar 2019 10:33:34 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <fb4ea162-ae50-5c02-eea6-3adb200e6ed8@linux.intel.com>
Content-Type: multipart/mixed; boundary="------------4F3533E2E7D29D0387E49B67"
Content-Language: en-US
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
X-List-Received-Date: Mon, 18 Mar 2019 17:33:46 -0000

This is a multi-part message in MIME format.
--------------4F3533E2E7D29D0387E49B67
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Attaching a patch file for back porting of Eddie's aspeed-video driver.
Diff in below doesn't include the newly created file so I'm attaching it
as a patch.

-Jae

On 3/18/2019 10:21 AM, Jae Hyun Yoo wrote:
> On 3/17/2019 7:25 PM, Lei YU wrote:
>>> openbmc: ae29d00f227e55192a69f66c87633e1b53fc6e68
>>>
>>> I'm using a custom build config for my machine. As you already know, for
>>> enabling the KVM feature, customization on kernel configs, adding a
>>> 'start-ipkvm' service, adding of libvncserver package and back-porting
>>> of aspeed video driver are also needed so there is no one-shot buildable
>>> TEMPLATECONF for KVM test.
>>
>> Could you kindly put everything together on a branch so others could 
>> refer the
>> branch to know what the changes are for KVM to work?
>> Thanks a lot!
>>
> 
> Well, I've already shared SHAs that are relating to KVM in this email
> thread, I'm sharing it again with some more details.
> 
> openbmc: ae29d00f227e55192a69f66c87633e1b53fc6e68
> 
> bmcweb: 9474b3788017bddd70e493e2b9b7674be30abc87
> 
> phosphor-webui: 511a2bbc5540fccb883b8d0005c2b387a23c9d05
>                  Cherry picked 
> https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-webui/+/10268/
> 
> libvncserver: 3348a7e42e86dfb98dd7458ad29def476cf6096f
> Need to remove 'x11' and 'gtk+' to reduce package size so I made:
> libvncserver_%.bbappend
> ----------------------------------------------------------------
> PACKAGECONFIG_remove = "gcrypt gnutls png sdl zlib"
> 
> TARGET_CXXFLAGS += " -Dflto"
> 
> do_install_append() {
>      rm -rf ${D}${libdir}/libvncclient*
> }
> 
> inherit cmake
> 
> # Use the latest to support obmc-ikvm
> DEPENDS += "openssl"
> SRC_URI = "git://github.com/LibVNC/libvncserver"
> SRCREV = "3348a7e42e86dfb98dd7458ad29def476cf6096f"
> S = "${WORKDIR}/git"
> 
> # Remove x11 and gtk+ that cause big image size
> # Actually, these aren't needed to support obmc-ikvm
> REQUIRED_DISTRO_FEATURES_remove = "x11"
> DEPENDS_remove = "gtk+"
> RDEPENDS_${PN}_remove = "gtk+"
> ----------------------------------------------------------------
> 
> start-ipkvm: Cherry pick 
> https://gerrit.openbmc-project.xyz/#/c/openbmc/meta-phosphor/+/13536/
> After cherry picking it, I changed start-ipkvm.service file like below:
> start-ipkvm.service
> ----------------------------------------------------------------
> [Unit]
> Description=OpenBMC ipKVM daemon
> StopWhenUnneeded=false
> 
> [Service]
> Restart=always
> ExecStartPre=/usr/bin/create_usbhid.sh
> ExecStart=/usr/bin/env obmc-ikvm -v /dev/video0 -f 10 -k /dev/hidg0 -p 
> /dev/hidg1
> 
> [Install]
> WantedBy=multi-user.target
> -----------------------------------------------------------------
> 
> obmc-ikvm: 2bc661d34abd1fda92a9d2b256ed88ca0e90d09a
> 
> linux-aspeed: 7859d04be772a1d185de335a8e9d38ac03a89f3f
> Added these kernel configs:
> -----------------------------------------------------------------
> CONFIG_FRAME_VECTOR=y
> CONFIG_MEDIA_SUPPORT=y
> CONFIG_MEDIA_CAMERA_SUPPORT=y
> CONFIG_VIDEO_DEV=y
> CONFIG_VIDEO_V4L2=y
> CONFIG_V4L_PLATFORM_DRIVERS=y
> CONFIG_VIDEO_ASPEED=y
> CONFIG_VIDEOBUF2_CORE=y
> CONFIG_VIDEOBUF2_V4L2=y
> CONFIG_VIDEOBUF2_MEMOPS=y
> CONFIG_VIDEOBUF2_DMA_CONTIG=y
> CONFIG_MEDIA_SUBDRV_AUTOSELECT=y
> CONFIG_USB_GADGET_VBUS_DRAW=2
> CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=2
> CONFIG_USB_LIBCOMPOSITE=y
> CONFIG_USB_F_HID=y
> CONFIG_USB_GADGET=y
> CONFIG_U_SERIAL_CONSOLE=y
> CONFIG_USB_ASPEED_VHUB=y
> CONFIG_USB_CONFIGFS=y
> CONFIG_USB_CONFIGFS_MASS_STORAGE=y
> CONFIG_USB_CONFIGFS_F_FS=y
> CONFIG_USB_CONFIGFS_F_HID=y
> -------------------------------------------------------------------
> Back ported Eddie's aspeed-video driver
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b98a5763f6c1..cdd8f824b6da 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2358,6 +2358,14 @@ S:    Maintained
>   F:    Documentation/hwmon/asc7621
>   F:    drivers/hwmon/asc7621.c
> 
> +ASPEED VIDEO ENGINE DRIVER
> +M:    Eddie James <eajames@linux.ibm.com>
> +L:    linux-media@vger.kernel.org
> +L:    openbmc@lists.ozlabs.org (moderated for non-subscribers)
> +S:    Maintained
> +F:    drivers/media/platform/aspeed-video.c
> +F:    Documentation/devicetree/bindings/media/aspeed-video.txt
> +
>   ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS
>   M:    Corentin Chary <corentin.chary@gmail.com>
>   L:    acpi4asus-user@lists.sourceforge.net
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi 
> b/arch/arm/boot/dts/aspeed-g5.dtsi
> index d8a9d20cc4e0..d6da0a29ced3 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -243,6 +243,17 @@
>                   interrupts = <0x19>;
>               };
> 
> +            video: video@1e700000 {
> +                compatible = "aspeed,ast2500-video-engine";
> +                reg = <0x1e700000 0x20000>;
> +                clocks = <&syscon ASPEED_CLK_GATE_VCLK>,
> +                     <&syscon ASPEED_CLK_GATE_ECLK>;
> +                clock-names = "vclk", "eclk";
> +                resets = <&syscon ASPEED_RESET_VIDEO>;
> +                interrupts = <7>;
> +                status = "disabled";
> +            };
> +
>               adc: adc@1e6e9000 {
>                   compatible = "aspeed,ast2500-adc";
>                   reg = <0x1e6e9000 0xb0>;
> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> index 596136793fc4..f16ce7dbd6ab 100644
> --- a/drivers/clk/clk-aspeed.c
> +++ b/drivers/clk/clk-aspeed.c
> @@ -87,7 +87,7 @@ struct aspeed_clk_gate {
>   /* TODO: ask Aspeed about the actual parent data */
>   static const struct aspeed_gate_data aspeed_gates[] = {
>       /*                 clk rst   name            parent    flags */
> -    [ASPEED_CLK_GATE_ECLK] =    {  0, -1, "eclk-gate",        
> "eclk",    0 }, /* Video Engine */
> +    [ASPEED_CLK_GATE_ECLK] =    {  0,  6, "eclk-gate",        
> "eclk",    0 }, /* Video Engine */
>       [ASPEED_CLK_GATE_GCLK] =    {  1,  7, "gclk-gate",        NULL,    
> 0 }, /* 2D engine */
>       [ASPEED_CLK_GATE_MCLK] =    {  2, -1, "mclk-gate",        "mpll", 
> CLK_IS_CRITICAL }, /* SDRAM */
>       [ASPEED_CLK_GATE_VCLK] =    {  3,  6, "vclk-gate",        NULL,    
> 0 }, /* Video Capture */
> @@ -113,6 +113,24 @@ static const struct aspeed_gate_data aspeed_gates[] 
> = {
>       [ASPEED_CLK_GATE_LHCCLK] =    { 28, -1, "lhclk-gate",        
> "lhclk", 0 }, /* LPC master/LPC+ */
>   };
> 
> +static const char * const eclk_parent_names[] = {
> +    "mpll",
> +    "hpll",
> +    "dpll",
> +};
> +
> +static const struct clk_div_table ast2500_eclk_div_table[] = {
> +    { 0x0, 2 },
> +    { 0x1, 2 },
> +    { 0x2, 3 },
> +    { 0x3, 4 },
> +    { 0x4, 5 },
> +    { 0x5, 6 },
> +    { 0x6, 7 },
> +    { 0x7, 8 },
> +    { 0 }
> +};
> +
>   static const struct clk_div_table ast2500_mac_div_table[] = {
>       { 0x0, 4 }, /* Yep, really. Aspeed confirmed this is correct */
>       { 0x1, 4 },
> @@ -192,18 +210,21 @@ static struct clk_hw 
> *aspeed_ast2500_calc_pll(const char *name, u32 val)
> 
>   struct aspeed_clk_soc_data {
>       const struct clk_div_table *div_table;
> +    const struct clk_div_table *eclk_div_table;
>       const struct clk_div_table *mac_div_table;
>       struct clk_hw *(*calc_pll)(const char *name, u32 val);
>   };
> 
>   static const struct aspeed_clk_soc_data ast2500_data = {
>       .div_table = ast2500_div_table,
> +    .eclk_div_table = ast2500_eclk_div_table,
>       .mac_div_table = ast2500_mac_div_table,
>       .calc_pll = aspeed_ast2500_calc_pll,
>   };
> 
>   static const struct aspeed_clk_soc_data ast2400_data = {
>       .div_table = ast2400_div_table,
> +    .eclk_div_table = ast2400_div_table,
>       .mac_div_table = ast2400_div_table,
>       .calc_pll = aspeed_ast2400_calc_pll,
>   };
> @@ -317,6 +338,7 @@ static const u8 aspeed_resets[] = {
>       [ASPEED_RESET_PECI]    = 10,
>       [ASPEED_RESET_I2C]    =  2,
>       [ASPEED_RESET_AHB]    =  1,
> +    [ASPEED_RESET_VIDEO]    =  6,
> 
>       /*
>        * SCUD4 resets start at an offset to separate them from
> @@ -522,6 +544,22 @@ static int aspeed_clk_probe(struct platform_device 
> *pdev)
>           return PTR_ERR(hw);
>       aspeed_clk_data->hws[ASPEED_CLK_24M] = hw;
> 
> +    hw = clk_hw_register_mux(dev, "eclk-mux", eclk_parent_names,
> +                 ARRAY_SIZE(eclk_parent_names), 0,
> +                 scu_base + ASPEED_CLK_SELECTION, 2, 0x3, 0,
> +                 &aspeed_clk_lock);
> +    if (IS_ERR(hw))
> +        return PTR_ERR(hw);
> +    aspeed_clk_data->hws[ASPEED_CLK_ECLK_MUX] = hw;
> +
> +    hw = clk_hw_register_divider_table(dev, "eclk", "eclk-mux", 0,
> +                       scu_base + ASPEED_CLK_SELECTION, 28,
> +                       3, 0, soc_data->eclk_div_table,
> +                       &aspeed_clk_lock);
> +    if (IS_ERR(hw))
> +        return PTR_ERR(hw);
> +    aspeed_clk_data->hws[ASPEED_CLK_ECLK] = hw;
> +
>       /*
>        * TODO: There are a number of clocks that not included in this 
> driver
>        * as more information is required:
> @@ -531,7 +569,6 @@ static int aspeed_clk_probe(struct platform_device 
> *pdev)
>        *   RGMII
>        *   RMII
>        *   UART[1..5] clock source mux
> -     *   Video Engine (ECLK) mux and clock divider
>        */
> 
>       for (i = 0; i < ARRAY_SIZE(aspeed_gates); i++) {
> diff --git a/drivers/media/platform/Kconfig 
> b/drivers/media/platform/Kconfig
> index 54fe90acb5b2..d6edf2d28f9b 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -32,6 +32,15 @@ source "drivers/media/platform/davinci/Kconfig"
> 
>   source "drivers/media/platform/omap/Kconfig"
> 
> +config VIDEO_ASPEED
> +    tristate "Aspeed AST2400 and AST2500 Video Engine driver"
> +    depends on VIDEO_V4L2
> +    select VIDEOBUF2_DMA_CONTIG
> +    help
> +      Support for the Aspeed Video Engine (VE) embedded in the Aspeed
> +      AST2400 and AST2500 SOCs. The VE can capture and compress video data
> +      from digital or analog sources.
> +
>   config VIDEO_SH_VOU
>       tristate "SuperH VOU video output driver"
>       depends on MEDIA_CAMERA_SUPPORT
> diff --git a/drivers/media/platform/Makefile 
> b/drivers/media/platform/Makefile
> index 41322ab65802..205c33a004fc 100644
> --- a/drivers/media/platform/Makefile
> +++ b/drivers/media/platform/Makefile
> @@ -3,6 +3,7 @@
>   # Makefile for the video capture/playback device drivers.
>   #
> 
> +obj-$(CONFIG_VIDEO_ASPEED)        += aspeed-video.o
>   obj-$(CONFIG_VIDEO_CADENCE)        += cadence/
>   obj-$(CONFIG_VIDEO_VIA_CAMERA) += via-camera.o
>   obj-$(CONFIG_VIDEO_CAFE_CCIC) += marvell-ccic/
> diff --git a/include/dt-bindings/clock/aspeed-clock.h 
> b/include/dt-bindings/clock/aspeed-clock.h
> index f43738607d77..15a9059d0303 100644
> --- a/include/dt-bindings/clock/aspeed-clock.h
> +++ b/include/dt-bindings/clock/aspeed-clock.h
> @@ -50,5 +50,6 @@
>   #define ASPEED_RESET_I2C        7
>   #define ASPEED_RESET_AHB        8
>   #define ASPEED_RESET_CRT1        9
> +#define ASPEED_RESET_VIDEO        10
> 
>   #endif
> ------------------------------------------------------------------
> 
> These are all I did for testing KVM.
> 
> Cheers,
> Jae

--------------4F3533E2E7D29D0387E49B67
Content-Type: text/plain; charset=UTF-8;
 name="0001-Add-Aspeed-Video-Engine-Driver.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-Add-Aspeed-Video-Engine-Driver.patch"

RnJvbSA1OGQ5NDgxNzdiZTg4OTc2MmVjMjI3N2I3YmZiOGE2MGQwMmY0NDVkIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKYWUgSHl1biBZb28gPGphZS5oeXVuLnlvb0BpbnRl
bC5jb20+CkRhdGU6IEZyaSwgOSBOb3YgMjAxOCAxMTozMjoyNyAtMDgwMApTdWJqZWN0OiBb
UEFUQ0hdIEFkZCBBc3BlZWQgVmlkZW8gRW5naW5lIERyaXZlcgoKVGhlIFZpZGVvIEVuZ2lu
ZSAoVkUpIGVtYmVkZGVkIGluIHRoZSBBc3BlZWQgQVNUMjQwMCBhbmQgQVNUMjUwMCBTT0Nz
CmNhbiBjYXB0dXJlIGFuZCBjb21wcmVzcyB2aWRlbyBkYXRhIGZyb20gZGlnaXRhbCBvciBh
bmFsb2cgc291cmNlcy4gV2l0aAp0aGUgQXNwZWVkIGNoaXAgYWN0aW5nIGEgc2VydmljZSBw
cm9jZXNzb3IsIHRoZSBWaWRlbyBFbmdpbmUgY2FuIGNhcHR1cmUKdGhlIGhvc3QgcHJvY2Vz
c29yIGdyYXBoaWNzIG91dHB1dC4KCkFkZCBhIFY0TDIgZHJpdmVyIHRvIGNhcHR1cmUgdmlk
ZW8gZGF0YSBhbmQgY29tcHJlc3MgaXQgdG8gSlBFRyBpbWFnZXMuCk1ha2UgdGhlIHZpZGVv
IGZyYW1lcyBhdmFpbGFibGUgdGhyb3VnaCB0aGUgVjRMMiBzdHJlYW1pbmcgaW50ZXJmYWNl
LgoKU2lnbmVkLW9mZi1ieTogRWRkaWUgSmFtZXMgPGVhamFtZXNAbGludXguaWJtLmNvbT4K
U2lnbmVkLW9mZi1ieTogSGFucyBWZXJrdWlsIDxodmVya3VpbC1jaXNjb0B4czRhbGwubmw+
ClNpZ25lZC1vZmYtYnk6IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYitzYW1zdW5n
QGtlcm5lbC5vcmc+Ci0tLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvYXNwZWVk
LXZpZGVvLnR4dCAgICAgfCAgIDI2ICsKIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgICAgOCArCiBhcmNoL2FybS9ib290L2R0cy9hc3Bl
ZWQtZzUuZHRzaSAgICAgICAgICAgICAgICAgICB8ICAgMTEgKwogZHJpdmVycy9jbGsvY2xr
LWFzcGVlZC5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDQxICstCiBkcml2ZXJz
L21lZGlhL3BsYXRmb3JtL0tjb25maWcgICAgICAgICAgICAgICAgICAgICB8ICAgIDkgKwog
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgfCAg
ICAxICsKIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYXNwZWVkLXZpZGVvLmMgICAgICAgICAg
ICAgIHwgMTcyOSArKysrKysrKysrKysrKysrKysrKwogaW5jbHVkZS9kdC1iaW5kaW5ncy9j
bG9jay9hc3BlZWQtY2xvY2suaCAgICAgICAgICAgfCAgICAxICsKIDggZmlsZXMgY2hhbmdl
ZCwgMTgyNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9hc3BlZWQtdmlk
ZW8udHh0CiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hc3Bl
ZWQtdmlkZW8uYwoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZWRpYS9hc3BlZWQtdmlkZW8udHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21lZGlhL2FzcGVlZC12aWRlby50eHQKbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMDAwMDAwLi43OGI0NjRhZTI2NzIKLS0tIC9kZXYvbnVsbAorKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvYXNwZWVkLXZpZGVvLnR4
dApAQCAtMCwwICsxLDI2IEBACisqIERldmljZSB0cmVlIGJpbmRpbmdzIGZvciBBc3BlZWQg
VmlkZW8gRW5naW5lCisKK1RoZSBWaWRlbyBFbmdpbmUgKFZFKSBlbWJlZGRlZCBpbiB0aGUg
QXNwZWVkIEFTVDI0MDAgYW5kIEFTVDI1MDAgU09DcyBjYW4KK2NhcHR1cmUgYW5kIGNvbXBy
ZXNzIHZpZGVvIGRhdGEgZnJvbSBkaWdpdGFsIG9yIGFuYWxvZyBzb3VyY2VzLgorCitSZXF1
aXJlZCBwcm9wZXJ0aWVzOgorIC0gY29tcGF0aWJsZToJCSJhc3BlZWQsYXN0MjQwMC12aWRl
by1lbmdpbmUiIG9yCisJCQkiYXNwZWVkLGFzdDI1MDAtdmlkZW8tZW5naW5lIgorIC0gcmVn
OgkJCWNvbnRhaW5zIHRoZSBvZmZzZXQgYW5kIGxlbmd0aCBvZiB0aGUgVkUgbWVtb3J5IHJl
Z2lvbgorIC0gY2xvY2tzOgkJY2xvY2sgc3BlY2lmaWVycyBmb3IgdGhlIHN5c2NvbiBjbG9j
a3MgYXNzb2NpYXRlZCB3aXRoCisJCQl0aGUgVkUgKG9yZGVyaW5nIG11c3QgbWF0Y2ggdGhl
IGNsb2NrLW5hbWVzIHByb3BlcnR5KQorIC0gY2xvY2stbmFtZXM6CQkidmNsayIgYW5kICJl
Y2xrIgorIC0gcmVzZXRzOgkJcmVzZXQgc3BlY2lmaWVyIGZvciB0aGUgc3lzY29uIHJlc2V0
IGFzc29jaWF0ZWQgd2l0aAorCQkJdGhlIFZFCisgLSBpbnRlcnJ1cHRzOgkJdGhlIGludGVy
cnVwdCBhc3NvY2lhdGVkIHdpdGggdGhlIFZFIG9uIHRoaXMgcGxhdGZvcm0KKworRXhhbXBs
ZToKKwordmlkZW8tZW5naW5lQDFlNzAwMDAwIHsKKyAgICBjb21wYXRpYmxlID0gImFzcGVl
ZCxhc3QyNTAwLXZpZGVvLWVuZ2luZSI7CisgICAgcmVnID0gPDB4MWU3MDAwMDAgMHgyMDAw
MD47CisgICAgY2xvY2tzID0gPCZzeXNjb24gQVNQRUVEX0NMS19HQVRFX1ZDTEs+LCA8JnN5
c2NvbiBBU1BFRURfQ0xLX0dBVEVfRUNMSz47CisgICAgY2xvY2stbmFtZXMgPSAidmNsayIs
ICJlY2xrIjsKKyAgICByZXNldHMgPSA8JnN5c2NvbiBBU1BFRURfUkVTRVRfVklERU8+Owor
ICAgIGludGVycnVwdHMgPSA8Nz47Cit9OwpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9N
QUlOVEFJTkVSUwppbmRleCBiOThhNTc2M2Y2YzEuLmNkZDhmODI0YjZkYSAxMDA2NDQKLS0t
IGEvTUFJTlRBSU5FUlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTIzNTgsNiArMjM1OCwxNCBA
QCBTOglNYWludGFpbmVkCiBGOglEb2N1bWVudGF0aW9uL2h3bW9uL2FzYzc2MjEKIEY6CWRy
aXZlcnMvaHdtb24vYXNjNzYyMS5jCiAKK0FTUEVFRCBWSURFTyBFTkdJTkUgRFJJVkVSCitN
OglFZGRpZSBKYW1lcyA8ZWFqYW1lc0BsaW51eC5pYm0uY29tPgorTDoJbGludXgtbWVkaWFA
dmdlci5rZXJuZWwub3JnCitMOglvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcgKG1vZGVyYXRl
ZCBmb3Igbm9uLXN1YnNjcmliZXJzKQorUzoJTWFpbnRhaW5lZAorRjoJZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS9hc3BlZWQtdmlkZW8uYworRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21lZGlhL2FzcGVlZC12aWRlby50eHQKKwogQVNVUyBOT1RFQk9PS1MgQU5E
IEVFRVBDIEFDUEkvV01JIEVYVFJBUyBEUklWRVJTCiBNOglDb3JlbnRpbiBDaGFyeSA8Y29y
ZW50aW4uY2hhcnlAZ21haWwuY29tPgogTDoJYWNwaTRhc3VzLXVzZXJAbGlzdHMuc291cmNl
Zm9yZ2UubmV0CmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzUuZHRz
aSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1nNS5kdHNpCmluZGV4IGQ4YTlkMjBjYzRl
MC4uZDZkYTBhMjljZWQzIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQt
ZzUuZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzUuZHRzaQpAQCAtMjQz
LDYgKzI0MywxNyBAQAogCQkJCWludGVycnVwdHMgPSA8MHgxOT47CiAJCQl9OwogCisJCQl2
aWRlbzogdmlkZW9AMWU3MDAwMDAgeworCQkJCWNvbXBhdGlibGUgPSAiYXNwZWVkLGFzdDI1
MDAtdmlkZW8tZW5naW5lIjsKKwkJCQlyZWcgPSA8MHgxZTcwMDAwMCAweDIwMDAwPjsKKwkJ
CQljbG9ja3MgPSA8JnN5c2NvbiBBU1BFRURfQ0xLX0dBVEVfVkNMSz4sCisJCQkJCSA8JnN5
c2NvbiBBU1BFRURfQ0xLX0dBVEVfRUNMSz47CisJCQkJY2xvY2stbmFtZXMgPSAidmNsayIs
ICJlY2xrIjsKKwkJCQlyZXNldHMgPSA8JnN5c2NvbiBBU1BFRURfUkVTRVRfVklERU8+Owor
CQkJCWludGVycnVwdHMgPSA8Nz47CisJCQkJc3RhdHVzID0gImRpc2FibGVkIjsKKwkJCX07
CisKIAkJCWFkYzogYWRjQDFlNmU5MDAwIHsKIAkJCQljb21wYXRpYmxlID0gImFzcGVlZCxh
c3QyNTAwLWFkYyI7CiAJCQkJcmVnID0gPDB4MWU2ZTkwMDAgMHhiMD47CmRpZmYgLS1naXQg
YS9kcml2ZXJzL2Nsay9jbGstYXNwZWVkLmMgYi9kcml2ZXJzL2Nsay9jbGstYXNwZWVkLmMK
aW5kZXggNTk2MTM2NzkzZmM0Li5mMTZjZTdkYmQ2YWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Y2xrL2Nsay1hc3BlZWQuYworKysgYi9kcml2ZXJzL2Nsay9jbGstYXNwZWVkLmMKQEAgLTg3
LDcgKzg3LDcgQEAgc3RydWN0IGFzcGVlZF9jbGtfZ2F0ZSB7CiAvKiBUT0RPOiBhc2sgQXNw
ZWVkIGFib3V0IHRoZSBhY3R1YWwgcGFyZW50IGRhdGEgKi8KIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgYXNwZWVkX2dhdGVfZGF0YSBhc3BlZWRfZ2F0ZXNbXSA9IHsKIAkvKgkJCQkgY2xrIHJz
dCAgIG5hbWUJCQlwYXJlbnQJZmxhZ3MgKi8KLQlbQVNQRUVEX0NMS19HQVRFX0VDTEtdID0J
eyAgMCwgLTEsICJlY2xrLWdhdGUiLAkJImVjbGsiLAkwIH0sIC8qIFZpZGVvIEVuZ2luZSAq
LworCVtBU1BFRURfQ0xLX0dBVEVfRUNMS10gPQl7ICAwLCAgNiwgImVjbGstZ2F0ZSIsCQki
ZWNsayIsCTAgfSwgLyogVmlkZW8gRW5naW5lICovCiAJW0FTUEVFRF9DTEtfR0FURV9HQ0xL
XSA9CXsgIDEsICA3LCAiZ2Nsay1nYXRlIiwJCU5VTEwsCTAgfSwgLyogMkQgZW5naW5lICov
CiAJW0FTUEVFRF9DTEtfR0FURV9NQ0xLXSA9CXsgIDIsIC0xLCAibWNsay1nYXRlIiwJCSJt
cGxsIiwJQ0xLX0lTX0NSSVRJQ0FMIH0sIC8qIFNEUkFNICovCiAJW0FTUEVFRF9DTEtfR0FU
RV9WQ0xLXSA9CXsgIDMsICA2LCAidmNsay1nYXRlIiwJCU5VTEwsCTAgfSwgLyogVmlkZW8g
Q2FwdHVyZSAqLwpAQCAtMTEzLDYgKzExMywyNCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFz
cGVlZF9nYXRlX2RhdGEgYXNwZWVkX2dhdGVzW10gPSB7CiAJW0FTUEVFRF9DTEtfR0FURV9M
SENDTEtdID0JeyAyOCwgLTEsICJsaGNsay1nYXRlIiwJCSJsaGNsayIsIDAgfSwgLyogTFBD
IG1hc3Rlci9MUEMrICovCiB9OwogCitzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IGVjbGtf
cGFyZW50X25hbWVzW10gPSB7CisJIm1wbGwiLAorCSJocGxsIiwKKwkiZHBsbCIsCit9Owor
CitzdGF0aWMgY29uc3Qgc3RydWN0IGNsa19kaXZfdGFibGUgYXN0MjUwMF9lY2xrX2Rpdl90
YWJsZVtdID0geworCXsgMHgwLCAyIH0sCisJeyAweDEsIDIgfSwKKwl7IDB4MiwgMyB9LAor
CXsgMHgzLCA0IH0sCisJeyAweDQsIDUgfSwKKwl7IDB4NSwgNiB9LAorCXsgMHg2LCA3IH0s
CisJeyAweDcsIDggfSwKKwl7IDAgfQorfTsKKwogc3RhdGljIGNvbnN0IHN0cnVjdCBjbGtf
ZGl2X3RhYmxlIGFzdDI1MDBfbWFjX2Rpdl90YWJsZVtdID0gewogCXsgMHgwLCA0IH0sIC8q
IFllcCwgcmVhbGx5LiBBc3BlZWQgY29uZmlybWVkIHRoaXMgaXMgY29ycmVjdCAqLwogCXsg
MHgxLCA0IH0sCkBAIC0xOTIsMTggKzIxMCwyMSBAQCBzdGF0aWMgc3RydWN0IGNsa19odyAq
YXNwZWVkX2FzdDI1MDBfY2FsY19wbGwoY29uc3QgY2hhciAqbmFtZSwgdTMyIHZhbCkKIAog
c3RydWN0IGFzcGVlZF9jbGtfc29jX2RhdGEgewogCWNvbnN0IHN0cnVjdCBjbGtfZGl2X3Rh
YmxlICpkaXZfdGFibGU7CisJY29uc3Qgc3RydWN0IGNsa19kaXZfdGFibGUgKmVjbGtfZGl2
X3RhYmxlOwogCWNvbnN0IHN0cnVjdCBjbGtfZGl2X3RhYmxlICptYWNfZGl2X3RhYmxlOwog
CXN0cnVjdCBjbGtfaHcgKigqY2FsY19wbGwpKGNvbnN0IGNoYXIgKm5hbWUsIHUzMiB2YWwp
OwogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBhc3BlZWRfY2xrX3NvY19kYXRhIGFzdDI1
MDBfZGF0YSA9IHsKIAkuZGl2X3RhYmxlID0gYXN0MjUwMF9kaXZfdGFibGUsCisJLmVjbGtf
ZGl2X3RhYmxlID0gYXN0MjUwMF9lY2xrX2Rpdl90YWJsZSwKIAkubWFjX2Rpdl90YWJsZSA9
IGFzdDI1MDBfbWFjX2Rpdl90YWJsZSwKIAkuY2FsY19wbGwgPSBhc3BlZWRfYXN0MjUwMF9j
YWxjX3BsbCwKIH07CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXNwZWVkX2Nsa19zb2NfZGF0
YSBhc3QyNDAwX2RhdGEgPSB7CiAJLmRpdl90YWJsZSA9IGFzdDI0MDBfZGl2X3RhYmxlLAor
CS5lY2xrX2Rpdl90YWJsZSA9IGFzdDI0MDBfZGl2X3RhYmxlLAogCS5tYWNfZGl2X3RhYmxl
ID0gYXN0MjQwMF9kaXZfdGFibGUsCiAJLmNhbGNfcGxsID0gYXNwZWVkX2FzdDI0MDBfY2Fs
Y19wbGwsCiB9OwpAQCAtMzE3LDYgKzMzOCw3IEBAIHN0YXRpYyBjb25zdCB1OCBhc3BlZWRf
cmVzZXRzW10gPSB7CiAJW0FTUEVFRF9SRVNFVF9QRUNJXQk9IDEwLAogCVtBU1BFRURfUkVT
RVRfSTJDXQk9ICAyLAogCVtBU1BFRURfUkVTRVRfQUhCXQk9ICAxLAorCVtBU1BFRURfUkVT
RVRfVklERU9dCT0gIDYsCiAKIAkvKgogCSAqIFNDVUQ0IHJlc2V0cyBzdGFydCBhdCBhbiBv
ZmZzZXQgdG8gc2VwYXJhdGUgdGhlbSBmcm9tCkBAIC01MjIsNiArNTQ0LDIyIEBAIHN0YXRp
YyBpbnQgYXNwZWVkX2Nsa19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQog
CQlyZXR1cm4gUFRSX0VSUihodyk7CiAJYXNwZWVkX2Nsa19kYXRhLT5od3NbQVNQRUVEX0NM
S18yNE1dID0gaHc7CiAKKwlodyA9IGNsa19od19yZWdpc3Rlcl9tdXgoZGV2LCAiZWNsay1t
dXgiLCBlY2xrX3BhcmVudF9uYW1lcywKKwkJCQkgQVJSQVlfU0laRShlY2xrX3BhcmVudF9u
YW1lcyksIDAsCisJCQkJIHNjdV9iYXNlICsgQVNQRUVEX0NMS19TRUxFQ1RJT04sIDIsIDB4
MywgMCwKKwkJCQkgJmFzcGVlZF9jbGtfbG9jayk7CisJaWYgKElTX0VSUihodykpCisJCXJl
dHVybiBQVFJfRVJSKGh3KTsKKwlhc3BlZWRfY2xrX2RhdGEtPmh3c1tBU1BFRURfQ0xLX0VD
TEtfTVVYXSA9IGh3OworCisJaHcgPSBjbGtfaHdfcmVnaXN0ZXJfZGl2aWRlcl90YWJsZShk
ZXYsICJlY2xrIiwgImVjbGstbXV4IiwgMCwKKwkJCQkJICAgc2N1X2Jhc2UgKyBBU1BFRURf
Q0xLX1NFTEVDVElPTiwgMjgsCisJCQkJCSAgIDMsIDAsIHNvY19kYXRhLT5lY2xrX2Rpdl90
YWJsZSwKKwkJCQkJICAgJmFzcGVlZF9jbGtfbG9jayk7CisJaWYgKElTX0VSUihodykpCisJ
CXJldHVybiBQVFJfRVJSKGh3KTsKKwlhc3BlZWRfY2xrX2RhdGEtPmh3c1tBU1BFRURfQ0xL
X0VDTEtdID0gaHc7CisKIAkvKgogCSAqIFRPRE86IFRoZXJlIGFyZSBhIG51bWJlciBvZiBj
bG9ja3MgdGhhdCBub3QgaW5jbHVkZWQgaW4gdGhpcyBkcml2ZXIKIAkgKiBhcyBtb3JlIGlu
Zm9ybWF0aW9uIGlzIHJlcXVpcmVkOgpAQCAtNTMxLDcgKzU2OSw2IEBAIHN0YXRpYyBpbnQg
YXNwZWVkX2Nsa19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCSAqICAg
UkdNSUkKIAkgKiAgIFJNSUkKIAkgKiAgIFVBUlRbMS4uNV0gY2xvY2sgc291cmNlIG11eAot
CSAqICAgVmlkZW8gRW5naW5lIChFQ0xLKSBtdXggYW5kIGNsb2NrIGRpdmlkZXIKIAkgKi8K
IAogCWZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGFzcGVlZF9nYXRlcyk7IGkrKykgewpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9LY29uZmlnIGIvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9LY29uZmlnCmluZGV4IDU0ZmU5MGFjYjViMi4uZDZlZGYyZDI4Zjli
IDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL0tjb25maWcKKysrIGIvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9LY29uZmlnCkBAIC0zMiw2ICszMiwxNSBAQCBzb3VyY2Ug
ImRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vZGF2aW5jaS9LY29uZmlnIgogCiBzb3VyY2UgImRy
aXZlcnMvbWVkaWEvcGxhdGZvcm0vb21hcC9LY29uZmlnIgogCitjb25maWcgVklERU9fQVNQ
RUVECisJdHJpc3RhdGUgIkFzcGVlZCBBU1QyNDAwIGFuZCBBU1QyNTAwIFZpZGVvIEVuZ2lu
ZSBkcml2ZXIiCisJZGVwZW5kcyBvbiBWSURFT19WNEwyCisJc2VsZWN0IFZJREVPQlVGMl9E
TUFfQ09OVElHCisJaGVscAorCSAgU3VwcG9ydCBmb3IgdGhlIEFzcGVlZCBWaWRlbyBFbmdp
bmUgKFZFKSBlbWJlZGRlZCBpbiB0aGUgQXNwZWVkCisJICBBU1QyNDAwIGFuZCBBU1QyNTAw
IFNPQ3MuIFRoZSBWRSBjYW4gY2FwdHVyZSBhbmQgY29tcHJlc3MgdmlkZW8gZGF0YQorCSAg
ZnJvbSBkaWdpdGFsIG9yIGFuYWxvZyBzb3VyY2VzLgorCiBjb25maWcgVklERU9fU0hfVk9V
CiAJdHJpc3RhdGUgIlN1cGVySCBWT1UgdmlkZW8gb3V0cHV0IGRyaXZlciIKIAlkZXBlbmRz
IG9uIE1FRElBX0NBTUVSQV9TVVBQT1JUCmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL01ha2VmaWxlIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9NYWtlZmlsZQppbmRl
eCA0MTMyMmFiNjU4MDIuLjIwNWMzM2EwMDRmYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS9NYWtlZmlsZQorKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL01ha2Vm
aWxlCkBAIC0zLDYgKzMsNyBAQAogIyBNYWtlZmlsZSBmb3IgdGhlIHZpZGVvIGNhcHR1cmUv
cGxheWJhY2sgZGV2aWNlIGRyaXZlcnMuCiAjCiAKK29iai0kKENPTkZJR19WSURFT19BU1BF
RUQpCQkrPSBhc3BlZWQtdmlkZW8ubwogb2JqLSQoQ09ORklHX1ZJREVPX0NBREVOQ0UpCQkr
PSBjYWRlbmNlLwogb2JqLSQoQ09ORklHX1ZJREVPX1ZJQV9DQU1FUkEpICs9IHZpYS1jYW1l
cmEubwogb2JqLSQoQ09ORklHX1ZJREVPX0NBRkVfQ0NJQykgKz0gbWFydmVsbC1jY2ljLwpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hc3BlZWQtdmlkZW8uYyBiL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vYXNwZWVkLXZpZGVvLmMKbmV3IGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5kZmVjODEzZjUwYTkKLS0tIC9kZXYvbnVsbAorKysg
Yi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2FzcGVlZC12aWRlby5jCkBAIC0wLDAgKzEsMTcy
OSBAQAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjArCisKKyNpbmNsdWRl
IDxsaW51eC9hdG9taWMuaD4KKyNpbmNsdWRlIDxsaW51eC9iaXRmaWVsZC5oPgorI2luY2x1
ZGUgPGxpbnV4L2Nsay5oPgorI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+CisjaW5jbHVkZSA8
bGludXgvZGV2aWNlLmg+CisjaW5jbHVkZSA8bGludXgvZG1hLW1hcHBpbmcuaD4KKyNpbmNs
dWRlIDxsaW51eC9pbnRlcnJ1cHQuaD4KKyNpbmNsdWRlIDxsaW51eC9qaWZmaWVzLmg+Cisj
aW5jbHVkZSA8bGludXgvbW9kdWxlLmg+CisjaW5jbHVkZSA8bGludXgvbXV0ZXguaD4KKyNp
bmNsdWRlIDxsaW51eC9vZi5oPgorI2luY2x1ZGUgPGxpbnV4L29mX2lycS5oPgorI2luY2x1
ZGUgPGxpbnV4L29mX3Jlc2VydmVkX21lbS5oPgorI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3Jt
X2RldmljZS5oPgorI2luY2x1ZGUgPGxpbnV4L3Jlc2V0Lmg+CisjaW5jbHVkZSA8bGludXgv
c2NoZWQuaD4KKyNpbmNsdWRlIDxsaW51eC9zcGlubG9jay5oPgorI2luY2x1ZGUgPGxpbnV4
L3N0cmluZy5oPgorI2luY2x1ZGUgPGxpbnV4L3Y0bDItY29udHJvbHMuaD4KKyNpbmNsdWRl
IDxsaW51eC92aWRlb2RldjIuaD4KKyNpbmNsdWRlIDxsaW51eC93YWl0Lmg+CisjaW5jbHVk
ZSA8bGludXgvd29ya3F1ZXVlLmg+CisjaW5jbHVkZSA8bWVkaWEvdjRsMi1jdHJscy5oPgor
I2luY2x1ZGUgPG1lZGlhL3Y0bDItZGV2Lmg+CisjaW5jbHVkZSA8bWVkaWEvdjRsMi1kZXZp
Y2UuaD4KKyNpbmNsdWRlIDxtZWRpYS92NGwyLWR2LXRpbWluZ3MuaD4KKyNpbmNsdWRlIDxt
ZWRpYS92NGwyLWV2ZW50Lmg+CisjaW5jbHVkZSA8bWVkaWEvdjRsMi1pb2N0bC5oPgorI2lu
Y2x1ZGUgPG1lZGlhL3ZpZGVvYnVmMi1kbWEtY29udGlnLmg+CisKKyNkZWZpbmUgREVWSUNF
X05BTUUJCQkiYXNwZWVkLXZpZGVvIgorCisjZGVmaW5lIEFTUEVFRF9WSURFT19KUEVHX05V
TV9RVUFMSVRJRVMJMTIKKyNkZWZpbmUgQVNQRUVEX1ZJREVPX0pQRUdfSEVBREVSX1NJWkUJ
MTAKKyNkZWZpbmUgQVNQRUVEX1ZJREVPX0pQRUdfUVVBTlRfU0laRQkxMTYKKyNkZWZpbmUg
QVNQRUVEX1ZJREVPX0pQRUdfRENUX1NJWkUJMzQKKworI2RlZmluZSBNQVhfRlJBTUVfUkFU
RQkJCTYwCisjZGVmaW5lIE1BWF9IRUlHSFQJCQkxMjAwCisjZGVmaW5lIE1BWF9XSURUSAkJ
CTE5MjAKKyNkZWZpbmUgTUlOX0hFSUdIVAkJCTQ4MAorI2RlZmluZSBNSU5fV0lEVEgJCQk2
NDAKKworI2RlZmluZSBOVU1fUE9MQVJJVFlfQ0hFQ0tTCQkxMAorI2RlZmluZSBJTlZBTElE
X1JFU09MVVRJT05fUkVUUklFUwkyCisjZGVmaW5lIElOVkFMSURfUkVTT0xVVElPTl9ERUxB
WQltc2Vjc190b19qaWZmaWVzKDI1MCkKKyNkZWZpbmUgUkVTT0xVVElPTl9DSEFOR0VfREVM
QVkJCW1zZWNzX3RvX2ppZmZpZXMoNTAwKQorI2RlZmluZSBNT0RFX0RFVEVDVF9USU1FT1VU
CQltc2Vjc190b19qaWZmaWVzKDUwMCkKKyNkZWZpbmUgU1RPUF9USU1FT1VUCQkJbXNlY3Nf
dG9famlmZmllcygxMDAwKQorI2RlZmluZSBESVJFQ1RfRkVUQ0hfVEhSRVNIT0xECQkweDBj
MDAwMCAvKiAxMDI0ICogNzY4ICovCisKKyNkZWZpbmUgVkVfTUFYX1NSQ19CVUZGRVJfU0la
RQkJMHg4Y2EwMDAgLyogMTkyMCAqIDEyMDAsIDMyYnBwICovCisjZGVmaW5lIFZFX0pQRUdf
SEVBREVSX1NJWkUJCTB4MDA2MDAwIC8qIDUxMiAqIDEyICogNCAqLworCisjZGVmaW5lIFZF
X1BST1RFQ1RJT05fS0VZCQkweDAwMAorI2RlZmluZSAgVkVfUFJPVEVDVElPTl9LRVlfVU5M
T0NLCTB4MWEwMzhhYTgKKworI2RlZmluZSBWRV9TRVFfQ1RSTAkJCTB4MDA0CisjZGVmaW5l
ICBWRV9TRVFfQ1RSTF9UUklHX01PREVfREVUCUJJVCgwKQorI2RlZmluZSAgVkVfU0VRX0NU
UkxfVFJJR19DQVBUVVJFCUJJVCgxKQorI2RlZmluZSAgVkVfU0VRX0NUUkxfRk9SQ0VfSURM
RQkJQklUKDIpCisjZGVmaW5lICBWRV9TRVFfQ1RSTF9NVUxUX0ZSQU1FCQlCSVQoMykKKyNk
ZWZpbmUgIFZFX1NFUV9DVFJMX1RSSUdfQ09NUAkJQklUKDQpCisjZGVmaW5lICBWRV9TRVFf
Q1RSTF9BVVRPX0NPTVAJCUJJVCg1KQorI2RlZmluZSAgVkVfU0VRX0NUUkxfRU5fV0FUQ0hE
T0cJQklUKDcpCisjZGVmaW5lICBWRV9TRVFfQ1RSTF9ZVVY0MjAJCUJJVCgxMCkKKyNkZWZp
bmUgIFZFX1NFUV9DVFJMX0NPTVBfRk1UCQlHRU5NQVNLKDExLCAxMCkKKyNkZWZpbmUgIFZF
X1NFUV9DVFJMX0hBTFQJCUJJVCgxMikKKyNkZWZpbmUgIFZFX1NFUV9DVFJMX0VOX1dBVENI
RE9HX0NPTVAJQklUKDE0KQorI2RlZmluZSAgVkVfU0VRX0NUUkxfVFJJR19KUEcJCUJJVCgx
NSkKKyNkZWZpbmUgIFZFX1NFUV9DVFJMX0NBUF9CVVNZCQlCSVQoMTYpCisjZGVmaW5lICBW
RV9TRVFfQ1RSTF9DT01QX0JVU1kJCUJJVCgxOCkKKworI2lmZGVmIENPTkZJR19NQUNIX0FT
UEVFRF9HNQorI2RlZmluZSAgVkVfU0VRX0NUUkxfSlBFR19NT0RFCQlCSVQoMTMpCS8qIEFT
VDI1MDAgKi8KKyNlbHNlCisjZGVmaW5lICBWRV9TRVFfQ1RSTF9KUEVHX01PREUJCUJJVCg4
KQkvKiBBU1QyNDAwICovCisjZW5kaWYgLyogQ09ORklHX01BQ0hfQVNQRUVEX0c1ICovCisK
KyNkZWZpbmUgVkVfQ1RSTAkJCQkweDAwOAorI2RlZmluZSAgVkVfQ1RSTF9IU1lOQ19QT0wJ
CUJJVCgwKQorI2RlZmluZSAgVkVfQ1RSTF9WU1lOQ19QT0wJCUJJVCgxKQorI2RlZmluZSAg
VkVfQ1RSTF9TT1VSQ0UJCQlCSVQoMikKKyNkZWZpbmUgIFZFX0NUUkxfSU5UX0RFCQkJQklU
KDQpCisjZGVmaW5lICBWRV9DVFJMX0RJUkVDVF9GRVRDSAkJQklUKDUpCisjZGVmaW5lICBW
RV9DVFJMX1lVVgkJCUJJVCg2KQorI2RlZmluZSAgVkVfQ1RSTF9SR0IJCQlCSVQoNykKKyNk
ZWZpbmUgIFZFX0NUUkxfQ0FQVFVSRV9GTVQJCUdFTk1BU0soNywgNikKKyNkZWZpbmUgIFZF
X0NUUkxfQVVUT19PUl9DVVJTT1IJCUJJVCg4KQorI2RlZmluZSAgVkVfQ1RSTF9DTEtfSU5W
RVJTRQkJQklUKDExKQorI2RlZmluZSAgVkVfQ1RSTF9DTEtfREVMQVkJCUdFTk1BU0soMTEs
IDkpCisjZGVmaW5lICBWRV9DVFJMX0lOVEVSTEFDRQkJQklUKDE0KQorI2RlZmluZSAgVkVf
Q1RSTF9IU1lOQ19QT0xfQ1RSTAkJQklUKDE1KQorI2RlZmluZSAgVkVfQ1RSTF9GUkMJCQlH
RU5NQVNLKDIzLCAxNikKKworI2RlZmluZSBWRV9UR1NfMAkJCTB4MDBjCisjZGVmaW5lIFZF
X1RHU18xCQkJMHgwMTAKKyNkZWZpbmUgIFZFX1RHU19GSVJTVAkJCUdFTk1BU0soMjgsIDE2
KQorI2RlZmluZSAgVkVfVEdTX0xBU1QJCQlHRU5NQVNLKDEyLCAwKQorCisjZGVmaW5lIFZF
X1NDQUxJTkdfRkFDVE9SCQkweDAxNAorI2RlZmluZSBWRV9TQ0FMSU5HX0ZJTFRFUjAJCTB4
MDE4CisjZGVmaW5lIFZFX1NDQUxJTkdfRklMVEVSMQkJMHgwMWMKKyNkZWZpbmUgVkVfU0NB
TElOR19GSUxURVIyCQkweDAyMAorI2RlZmluZSBWRV9TQ0FMSU5HX0ZJTFRFUjMJCTB4MDI0
CisKKyNkZWZpbmUgVkVfQ0FQX1dJTkRPVwkJCTB4MDMwCisjZGVmaW5lIFZFX0NPTVBfV0lO
RE9XCQkJMHgwMzQKKyNkZWZpbmUgVkVfQ09NUF9QUk9DX09GRlNFVAkJMHgwMzgKKyNkZWZp
bmUgVkVfQ09NUF9PRkZTRVQJCQkweDAzYworI2RlZmluZSBWRV9KUEVHX0FERFIJCQkweDA0
MAorI2RlZmluZSBWRV9TUkMwX0FERFIJCQkweDA0NAorI2RlZmluZSBWRV9TUkNfU0NBTkxJ
TkVfT0ZGU0VUCQkweDA0OAorI2RlZmluZSBWRV9TUkMxX0FERFIJCQkweDA0YworI2RlZmlu
ZSBWRV9DT01QX0FERFIJCQkweDA1NAorCisjZGVmaW5lIFZFX1NUUkVBTV9CVUZfU0laRQkJ
MHgwNTgKKyNkZWZpbmUgIFZFX1NUUkVBTV9CVUZfU0laRV9OX1BBQ0tFVFMJR0VOTUFTSyg1
LCAzKQorI2RlZmluZSAgVkVfU1RSRUFNX0JVRl9TSVpFX1BfU0laRQlHRU5NQVNLKDIsIDAp
CisKKyNkZWZpbmUgVkVfQ09NUF9DVFJMCQkJMHgwNjAKKyNkZWZpbmUgIFZFX0NPTVBfQ1RS
TF9WUV9EQ1RfT05MWQlCSVQoMCkKKyNkZWZpbmUgIFZFX0NPTVBfQ1RSTF9WUV80Q09MT1IJ
CUJJVCgxKQorI2RlZmluZSAgVkVfQ09NUF9DVFJMX1FVQU5USVpFCQlCSVQoMikKKyNkZWZp
bmUgIFZFX0NPTVBfQ1RSTF9FTl9CUQkJQklUKDQpCisjZGVmaW5lICBWRV9DT01QX0NUUkxf
RU5fQ1JZUFRPCQlCSVQoNSkKKyNkZWZpbmUgIFZFX0NPTVBfQ1RSTF9EQ1RfQ0hSCQlHRU5N
QVNLKDEwLCA2KQorI2RlZmluZSAgVkVfQ09NUF9DVFJMX0RDVF9MVU0JCUdFTk1BU0soMTUs
IDExKQorI2RlZmluZSAgVkVfQ09NUF9DVFJMX0VOX0hRCQlCSVQoMTYpCisjZGVmaW5lICBW
RV9DT01QX0NUUkxfUlNWRAkJQklUKDE5KQorI2RlZmluZSAgVkVfQ09NUF9DVFJMX0VOQ09E
RQkJR0VOTUFTSygyMSwgMjApCisjZGVmaW5lICBWRV9DT01QX0NUUkxfSFFfRENUX0NIUglH
RU5NQVNLKDI2LCAyMikKKyNkZWZpbmUgIFZFX0NPTVBfQ1RSTF9IUV9EQ1RfTFVNCUdFTk1B
U0soMzEsIDI3KQorCisjZGVmaW5lIFZFX09GRlNFVF9DT01QX1NUUkVBTQkJMHgwNzgKKwor
I2RlZmluZSBWRV9TUkNfTFJfRURHRV9ERVQJCTB4MDkwCisjZGVmaW5lICBWRV9TUkNfTFJf
RURHRV9ERVRfTEVGVAlHRU5NQVNLKDExLCAwKQorI2RlZmluZSAgVkVfU1JDX0xSX0VER0Vf
REVUX05PX1YJQklUKDEyKQorI2RlZmluZSAgVkVfU1JDX0xSX0VER0VfREVUX05PX0gJQklU
KDEzKQorI2RlZmluZSAgVkVfU1JDX0xSX0VER0VfREVUX05PX0RJU1AJQklUKDE0KQorI2Rl
ZmluZSAgVkVfU1JDX0xSX0VER0VfREVUX05PX0NMSwlCSVQoMTUpCisjZGVmaW5lICBWRV9T
UkNfTFJfRURHRV9ERVRfUlRfU0hGCTE2CisjZGVmaW5lICBWRV9TUkNfTFJfRURHRV9ERVRf
UlQJCUdFTk1BU0soMjcsIFZFX1NSQ19MUl9FREdFX0RFVF9SVF9TSEYpCisjZGVmaW5lICBW
RV9TUkNfTFJfRURHRV9ERVRfSU5URVJMQUNFCUJJVCgzMSkKKworI2RlZmluZSBWRV9TUkNf
VEJfRURHRV9ERVQJCTB4MDk0CisjZGVmaW5lICBWRV9TUkNfVEJfRURHRV9ERVRfVE9QCQlH
RU5NQVNLKDEyLCAwKQorI2RlZmluZSAgVkVfU1JDX1RCX0VER0VfREVUX0JPVF9TSEYJMTYK
KyNkZWZpbmUgIFZFX1NSQ19UQl9FREdFX0RFVF9CT1QJCUdFTk1BU0soMjgsIFZFX1NSQ19U
Ql9FREdFX0RFVF9CT1RfU0hGKQorCisjZGVmaW5lIFZFX01PREVfREVURUNUX1NUQVRVUwkJ
MHgwOTgKKyNkZWZpbmUgIFZFX01PREVfREVURUNUX0hfUElYRUxTCUdFTk1BU0soMTEsIDAp
CisjZGVmaW5lICBWRV9NT0RFX0RFVEVDVF9WX0xJTkVTX1NIRgkxNgorI2RlZmluZSAgVkVf
TU9ERV9ERVRFQ1RfVl9MSU5FUwkJR0VOTUFTSygyNywgVkVfTU9ERV9ERVRFQ1RfVl9MSU5F
U19TSEYpCisjZGVmaW5lICBWRV9NT0RFX0RFVEVDVF9TVEFUVVNfVlNZTkMJQklUKDI4KQor
I2RlZmluZSAgVkVfTU9ERV9ERVRFQ1RfU1RBVFVTX0hTWU5DCUJJVCgyOSkKKworI2RlZmlu
ZSBWRV9TWU5DX1NUQVRVUwkJCTB4MDljCisjZGVmaW5lICBWRV9TWU5DX1NUQVRVU19IU1lO
QwkJR0VOTUFTSygxMSwgMCkKKyNkZWZpbmUgIFZFX1NZTkNfU1RBVFVTX1ZTWU5DX1NIRgkx
NgorI2RlZmluZSAgVkVfU1lOQ19TVEFUVVNfVlNZTkMJCUdFTk1BU0soMjcsIFZFX1NZTkNf
U1RBVFVTX1ZTWU5DX1NIRikKKworI2RlZmluZSBWRV9JTlRFUlJVUFRfQ1RSTAkJMHgzMDQK
KyNkZWZpbmUgVkVfSU5URVJSVVBUX1NUQVRVUwkJMHgzMDgKKyNkZWZpbmUgIFZFX0lOVEVS
UlVQVF9NT0RFX0RFVEVDVF9XRAlCSVQoMCkKKyNkZWZpbmUgIFZFX0lOVEVSUlVQVF9DQVBU
VVJFX0NPTVBMRVRFCUJJVCgxKQorI2RlZmluZSAgVkVfSU5URVJSVVBUX0NPTVBfUkVBRFkJ
QklUKDIpCisjZGVmaW5lICBWRV9JTlRFUlJVUFRfQ09NUF9DT01QTEVURQlCSVQoMykKKyNk
ZWZpbmUgIFZFX0lOVEVSUlVQVF9NT0RFX0RFVEVDVAlCSVQoNCkKKyNkZWZpbmUgIFZFX0lO
VEVSUlVQVF9GUkFNRV9DT01QTEVURQlCSVQoNSkKKyNkZWZpbmUgIFZFX0lOVEVSUlVQVF9E
RUNPREVfRVJSCUJJVCg2KQorI2RlZmluZSAgVkVfSU5URVJSVVBUX0hBTFRfUkVBRFkJQklU
KDgpCisjZGVmaW5lICBWRV9JTlRFUlJVUFRfSEFOR19XRAkJQklUKDkpCisjZGVmaW5lICBW
RV9JTlRFUlJVUFRfU1RSRUFNX0RFU0MJQklUKDEwKQorI2RlZmluZSAgVkVfSU5URVJSVVBU
X1ZTWU5DX0RFU0MJQklUKDExKQorCisjZGVmaW5lIFZFX01PREVfREVURUNUCQkJMHgzMGMK
KyNkZWZpbmUgVkVfTUVNX1JFU1RSSUNUX1NUQVJUCQkweDMxMAorI2RlZmluZSBWRV9NRU1f
UkVTVFJJQ1RfRU5ECQkweDMxNAorCitlbnVtIHsKKwlWSURFT19NT0RFX0RFVEVDVF9ET05F
LAorCVZJREVPX1JFU19DSEFOR0UsCisJVklERU9fUkVTX0RFVEVDVCwKKwlWSURFT19TVFJF
QU1JTkcsCisJVklERU9fRlJBTUVfSU5QUkcsCisJVklERU9fU1RPUFBFRCwKK307CisKK3N0
cnVjdCBhc3BlZWRfdmlkZW9fYWRkciB7CisJdW5zaWduZWQgaW50IHNpemU7CisJZG1hX2Fk
ZHJfdCBkbWE7CisJdm9pZCAqdmlydDsKK307CisKK3N0cnVjdCBhc3BlZWRfdmlkZW9fYnVm
ZmVyIHsKKwlzdHJ1Y3QgdmIyX3Y0bDJfYnVmZmVyIHZiOworCXN0cnVjdCBsaXN0X2hlYWQg
bGluazsKK307CisKKyNkZWZpbmUgdG9fYXNwZWVkX3ZpZGVvX2J1ZmZlcih4KSBcCisJY29u
dGFpbmVyX29mKCh4KSwgc3RydWN0IGFzcGVlZF92aWRlb19idWZmZXIsIHZiKQorCitzdHJ1
Y3QgYXNwZWVkX3ZpZGVvIHsKKwl2b2lkIF9faW9tZW0gKmJhc2U7CisJc3RydWN0IGNsayAq
ZWNsazsKKwlzdHJ1Y3QgY2xrICp2Y2xrOworCXN0cnVjdCByZXNldF9jb250cm9sICpyc3Q7
CisKKwlzdHJ1Y3QgZGV2aWNlICpkZXY7CisJc3RydWN0IHY0bDJfY3RybF9oYW5kbGVyIGN0
cmxfaGFuZGxlcjsKKwlzdHJ1Y3QgdjRsMl9kZXZpY2UgdjRsMl9kZXY7CisJc3RydWN0IHY0
bDJfcGl4X2Zvcm1hdCBwaXhfZm10OworCXN0cnVjdCB2NGwyX2J0X3RpbWluZ3MgYWN0aXZl
X3RpbWluZ3M7CisJc3RydWN0IHY0bDJfYnRfdGltaW5ncyBkZXRlY3RlZF90aW1pbmdzOwor
CXUzMiB2NGwyX2lucHV0X3N0YXR1czsKKwlzdHJ1Y3QgdmIyX3F1ZXVlIHF1ZXVlOworCXN0
cnVjdCB2aWRlb19kZXZpY2UgdmRldjsKKwlzdHJ1Y3QgbXV0ZXggdmlkZW9fbG9jazsJLyog
djRsMiBhbmQgdmlkZW9idWYyIGxvY2sgKi8KKworCXdhaXRfcXVldWVfaGVhZF90IHdhaXQ7
CisJc3BpbmxvY2tfdCBsb2NrOwkJLyogYnVmZmVyIGxpc3QgbG9jayAqLworCXN0cnVjdCBk
ZWxheWVkX3dvcmsgcmVzX3dvcms7CisJc3RydWN0IGxpc3RfaGVhZCBidWZmZXJzOworCXVu
c2lnbmVkIGxvbmcgZmxhZ3M7CisJdW5zaWduZWQgaW50IHNlcXVlbmNlOworCisJdW5zaWdu
ZWQgaW50IG1heF9jb21wcmVzc2VkX3NpemU7CisJc3RydWN0IGFzcGVlZF92aWRlb19hZGRy
IHNyY3NbMl07CisJc3RydWN0IGFzcGVlZF92aWRlb19hZGRyIGpwZWc7CisKKwlib29sIHl1
djQyMDsKKwl1bnNpZ25lZCBpbnQgZnJhbWVfcmF0ZTsKKwl1bnNpZ25lZCBpbnQganBlZ19x
dWFsaXR5OworCisJdW5zaWduZWQgaW50IGZyYW1lX2JvdHRvbTsKKwl1bnNpZ25lZCBpbnQg
ZnJhbWVfbGVmdDsKKwl1bnNpZ25lZCBpbnQgZnJhbWVfcmlnaHQ7CisJdW5zaWduZWQgaW50
IGZyYW1lX3RvcDsKK307CisKKyNkZWZpbmUgdG9fYXNwZWVkX3ZpZGVvKHgpIGNvbnRhaW5l
cl9vZigoeCksIHN0cnVjdCBhc3BlZWRfdmlkZW8sIHY0bDJfZGV2KQorCitzdGF0aWMgY29u
c3QgdTMyIGFzcGVlZF92aWRlb19qcGVnX2hlYWRlcltBU1BFRURfVklERU9fSlBFR19IRUFE
RVJfU0laRV0gPSB7CisJMHhlMGZmZDhmZiwgMHg0NjRhMTAwMCwgMHgwMTAwNDY0OSwgMHg2
MDAwMDEwMSwgMHgwMDAwNjAwMCwgMHgwZjAwZmVmZiwKKwkweDAwMDAyZDA1LCAweDAwMDAw
MDAwLCAweDAwMDAwMDAwLCAweDAwZGJmZjAwCit9OworCitzdGF0aWMgY29uc3QgdTMyIGFz
cGVlZF92aWRlb19qcGVnX3F1YW50W0FTUEVFRF9WSURFT19KUEVHX1FVQU5UX1NJWkVdID0g
eworCTB4MDgxMTAwYzAsIDB4MDAwMDAwMDAsIDB4MDAxMTAxMDMsIDB4MDMwMTExMDIsIDB4
YzRmZjAxMTEsIDB4MDAwMDFmMDAsCisJMHgwMTAxMDUwMSwgMHgwMTAxMDEwMSwgMHgwMDAw
MDAwMCwgMHgwMDAwMDAwMCwgMHgwNDAzMDIwMSwgMHgwODA3MDYwNSwKKwkweGZmMGIwYTA5
LCAweDEwYjUwMGM0LCAweDAzMDEwMjAwLCAweDAzMDQwMjAzLCAweDA0MDQwNTA1LCAweDdk
MDEwMDAwLAorCTB4MDAwMzAyMDEsIDB4MTIwNTExMDQsIDB4MDY0MTMxMjEsIDB4MDc2MTUx
MTMsIDB4MzIxNDcxMjIsIDB4MDhhMTkxODEsCisJMHhjMWIxNDIyMywgMHhmMGQxNTIxNSwg
MHg3MjYyMzMyNCwgMHgxNjBhMDk4MiwgMHgxYTE5MTgxNywgMHgyODI3MjYyNSwKKwkweDM1
MzQyYTI5LCAweDM5MzgzNzM2LCAweDQ1NDQ0MzNhLCAweDQ5NDg0NzQ2LCAweDU1NTQ1MzRh
LCAweDU5NTg1NzU2LAorCTB4NjU2NDYzNWEsIDB4Njk2ODY3NjYsIDB4NzU3NDczNmEsIDB4
Nzk3ODc3NzYsIDB4ODU4NDgzN2EsIDB4ODk4ODg3ODYsCisJMHg5NDkzOTI4YSwgMHg5ODk3
OTY5NSwgMHhhM2EyOWE5OSwgMHhhN2E2YTVhNCwgMHhiMmFhYTlhOCwgMHhiNmI1YjRiMywK
KwkweGJhYjliOGI3LCAweGM1YzRjM2MyLCAweGM5YzhjN2M2LCAweGQ0ZDNkMmNhLCAweGQ4
ZDdkNmQ1LCAweGUyZTFkYWQ5LAorCTB4ZTZlNWU0ZTMsIDB4ZWFlOWU4ZTcsIDB4ZjRmM2Yy
ZjEsIDB4ZjhmN2Y2ZjUsIDB4YzRmZmZhZjksIDB4MDAwMTFmMDAsCisJMHgwMTAxMDEwMywg
MHgwMTAxMDEwMSwgMHgwMDAwMDEwMSwgMHgwMDAwMDAwMCwgMHgwNDAzMDIwMSwgMHgwODA3
MDYwNSwKKwkweGZmMGIwYTA5LCAweDExYjUwMGM0LCAweDAyMDEwMjAwLCAweDA0MDMwNDA0
LCAweDA0MDQwNTA3LCAweDc3MDIwMTAwLAorCTB4MDMwMjAxMDAsIDB4MjEwNTA0MTEsIDB4
NDExMjA2MzEsIDB4NzE2MTA3NTEsIDB4ODEzMjIyMTMsIDB4OTE0MjE0MDgsCisJMHgwOWMx
YjFhMSwgMHhmMDUyMzMyMywgMHhkMTcyNjIxNSwgMHgzNDI0MTYwYSwgMHgxN2YxMjVlMSwg
MHgyNjFhMTkxOCwKKwkweDJhMjkyODI3LCAweDM4MzczNjM1LCAweDQ0NDMzYTM5LCAweDQ4
NDc0NjQ1LCAweDU0NTM0YTQ5LCAweDU4NTc1NjU1LAorCTB4NjQ2MzVhNTksIDB4Njg2NzY2
NjUsIDB4NzQ3MzZhNjksIDB4Nzg3Nzc2NzUsIDB4ODM4MjdhNzksIDB4ODc4Njg1ODQsCisJ
MHg5MjhhODk4OCwgMHg5Njk1OTQ5MywgMHg5YTk5OTg5NywgMHhhNWE0YTNhMiwgMHhhOWE4
YTdhNiwgMHhiNGIzYjJhYSwKKwkweGI4YjdiNmI1LCAweGMzYzJiYWI5LCAweGM3YzZjNWM0
LCAweGQyY2FjOWM4LCAweGQ2ZDVkNGQzLCAweGRhZDlkOGQ3LAorCTB4ZTVlNGUzZTIsIDB4
ZTllOGU3ZTYsIDB4ZjRmM2YyZWEsIDB4ZjhmN2Y2ZjUsIDB4ZGFmZmZhZjksIDB4MDEwMzBj
MDAsCisJMHgwMzExMDIwMCwgMHgwMDNmMDAxMQorfTsKKworc3RhdGljIGNvbnN0IHUzMiBh
c3BlZWRfdmlkZW9fanBlZ19kY3RbQVNQRUVEX1ZJREVPX0pQRUdfTlVNX1FVQUxJVElFU10K
KwkJCQkgICAgICBbQVNQRUVEX1ZJREVPX0pQRUdfRENUX1NJWkVdID0geworCXsgMHgwZDE0
MDA0MywgMHgwYzBmMTEwZiwgMHgxMTEwMTExNCwgMHgxNzE0MTUxNiwgMHgxZTIwMzIxZSwK
KwkgIDB4M2QxZTFiMWIsIDB4MzIyNDJlMmIsIDB4NGI0YzNmNDgsIDB4NDQ0NjNmNDcsIDB4
NjE3MzVhNTAsCisJICAweDU2NmM1NTUwLCAweDg4NjQ0NjQ0LCAweDdhNzY2YzY1LCAweDRk
ODA4MjgwLCAweDhjOTc4ZDYwLAorCSAgMHg3ZTczOTY3ZCwgMHhkYmZmN2I4MCwgMHgxZjAx
NDMwMCwgMHgyNzJkMjEyMSwgMHgzMDMwNTgyZCwKKwkgIDB4Njk3YmI5NTgsIDB4YjhiOWI5
N2IsIDB4YjliOGE2YTYsIDB4YjliOWI5YjksIDB4YjliOWI5YjksCisJICAweGI5YjliOWI5
LCAweGI5YjliOWI5LCAweGI5YjliOWI5LCAweGI5YjliOWI5LCAweGI5YjliOWI5LAorCSAg
MHhiOWI5YjliOSwgMHhiOWI5YjliOSwgMHhiOWI5YjliOSwgMHhmZmI5YjliOSB9LAorCXsg
MHgwYzExMDA0MywgMHgwYTBkMGYwZCwgMHgwZjBlMGYxMSwgMHgxNDExMTIxMywgMHgxYTFj
MmIxYSwKKwkgIDB4MzUxYTE4MTgsIDB4MmIxZjI4MjYsIDB4NDE0MjM3M2YsIDB4M2MzZDM3
M2UsIDB4NTU2NDRlNDYsCisJICAweDRiNWY0YTQ2LCAweDc3NTczZDNjLCAweDZiNjc1ZjU4
LCAweDQzNzA3MTcwLCAweDdhODQ3YjU0LAorCSAgMHg2ZTY0ODM2ZCwgMHhkYmZmNmM3MCwg
MHgxYjAxNDMwMCwgMHgyMjI3MWQxZCwgMHgyYTJhNGMyNywKKwkgIDB4NWI2YmEwNGMsIDB4
YTBhMGEwNmIsIDB4YTBhMGEwYTAsIDB4YTBhMGEwYTAsIDB4YTBhMGEwYTAsCisJICAweGEw
YTBhMGEwLCAweGEwYTBhMGEwLCAweGEwYTBhMGEwLCAweGEwYTBhMGEwLCAweGEwYTBhMGEw
LAorCSAgMHhhMGEwYTBhMCwgMHhhMGEwYTBhMCwgMHhhMGEwYTBhMCwgMHhmZmEwYTBhMCB9
LAorCXsgMHgwOTBlMDA0MywgMHgwOTBhMGMwYSwgMHgwYzBiMGMwZSwgMHgxMTBlMGYxMCwg
MHgxNTE3MjQxNSwKKwkgIDB4MmMxNTEzMTMsIDB4MjQxYTIxMWYsIDB4MzYzNzJlMzQsIDB4
MzEzMjJlMzMsIDB4NDY1MzQxM2EsCisJICAweDNlNGUzZDNhLCAweDYyNDgzMjMxLCAweDU4
NTY0ZTQ5LCAweDM4NWQ1ZTVkLCAweDY1NmQ2NjQ1LAorCSAgMHg1YjUzNmM1YSwgMHhkYmZm
NTk1ZCwgMHgxNjAxNDMwMCwgMHgxYzIwMTgxOCwgMHgyMjIyM2YyMCwKKwkgIDB4NGI1ODg1
M2YsIDB4ODU4NTg1NTgsIDB4ODU4NTg1ODUsIDB4ODU4NTg1ODUsIDB4ODU4NTg1ODUsCisJ
ICAweDg1ODU4NTg1LCAweDg1ODU4NTg1LCAweDg1ODU4NTg1LCAweDg1ODU4NTg1LCAweDg1
ODU4NTg1LAorCSAgMHg4NTg1ODU4NSwgMHg4NTg1ODU4NSwgMHg4NTg1ODU4NSwgMHhmZjg1
ODU4NSB9LAorCXsgMHgwNzBiMDA0MywgMHgwNzA4MGEwOCwgMHgwYTA5MGEwYiwgMHgwZDBi
MGMwYywgMHgxMTEyMWMxMSwKKwkgIDB4MjMxMTBmMGYsIDB4MWMxNDFhMTksIDB4MmIyYjI0
MjksIDB4MjcyODI0MjgsIDB4Mzg0MjMzMmUsCisJICAweDMxM2UzMDJlLCAweDRlMzkyODI3
LCAweDQ2NDQzZTNhLCAweDJjNGE0YTRhLCAweDUwNTY1MTM3LAorCSAgMHg0ODQyNTY0Nywg
MHhkYmZmNDc0YSwgMHgxMjAxNDMwMCwgMHgxNjFhMTMxMywgMHgxYzFjMzMxYSwKKwkgIDB4
M2Q0ODZjMzMsIDB4NmM2YzZjNDgsIDB4NmM2YzZjNmMsIDB4NmM2YzZjNmMsIDB4NmM2YzZj
NmMsCisJICAweDZjNmM2YzZjLCAweDZjNmM2YzZjLCAweDZjNmM2YzZjLCAweDZjNmM2YzZj
LCAweDZjNmM2YzZjLAorCSAgMHg2YzZjNmM2YywgMHg2YzZjNmM2YywgMHg2YzZjNmM2Yywg
MHhmZjZjNmM2YyB9LAorCXsgMHgwNjA5MDA0MywgMHgwNTA2MDcwNiwgMHgwNzA3MDcwOSwg
MHgwYTA5MDkwYSwgMHgwZDBlMTYwZCwKKwkgIDB4MWIwZDBjMGMsIDB4MTYxMDE0MTMsIDB4
MjEyMjFjMjAsIDB4MWUxZjFjMjAsIDB4MmIzMzI4MjQsCisJICAweDI2MzAyNjI0LCAweDNk
MmQxZjFlLCAweDM3MzUzMDJkLCAweDIyMzkzYTM5LCAweDNmNDQzZjJiLAorCSAgMHgzODMz
NDMzOCwgMHhkYmZmMzczOSwgMHgwZDAxNDMwMCwgMHgxMTEzMGUwZSwgMHgxNTE1MjYxMywK
KwkgIDB4MmQzNTUwMjYsIDB4NTA1MDUwMzUsIDB4NTA1MDUwNTAsIDB4NTA1MDUwNTAsIDB4
NTA1MDUwNTAsCisJICAweDUwNTA1MDUwLCAweDUwNTA1MDUwLCAweDUwNTA1MDUwLCAweDUw
NTA1MDUwLCAweDUwNTA1MDUwLAorCSAgMHg1MDUwNTA1MCwgMHg1MDUwNTA1MCwgMHg1MDUw
NTA1MCwgMHhmZjUwNTA1MCB9LAorCXsgMHgwNDA2MDA0MywgMHgwMzA0MDUwNCwgMHgwNTA0
MDUwNiwgMHgwNzA2MDYwNiwgMHgwOTA5MGYwOSwKKwkgIDB4MTIwOTA4MDgsIDB4MGYwYTBk
MGQsIDB4MTYxNjEzMTUsIDB4MTQxNTEzMTUsIDB4MWQyMjFiMTgsCisJICAweDE5MjAxOTE4
LCAweDI4MWUxNTE0LCAweDI0MjMyMDFlLCAweDE3MjYyNzI2LCAweDJhMmQyYTFjLAorCSAg
MHgyNTIyMmQyNSwgMHhkYmZmMjUyNiwgMHgwOTAxNDMwMCwgMHgwYjBkMGEwYSwgMHgwZTBl
MWEwZCwKKwkgIDB4MWYyNTM3MWEsIDB4MzczNzM3MjUsIDB4MzczNzM3MzcsIDB4MzczNzM3
MzcsIDB4MzczNzM3MzcsCisJICAweDM3MzczNzM3LCAweDM3MzczNzM3LCAweDM3MzczNzM3
LCAweDM3MzczNzM3LCAweDM3MzczNzM3LAorCSAgMHgzNzM3MzczNywgMHgzNzM3MzczNywg
MHgzNzM3MzczNywgMHhmZjM3MzczNyB9LAorCXsgMHgwMjAzMDA0MywgMHgwMTAyMDIwMiwg
MHgwMjAyMDIwMywgMHgwMzAzMDMwMywgMHgwNDA0MDcwNCwKKwkgIDB4MDkwNDA0MDQsIDB4
MDcwNTA2MDYsIDB4MGIwYjA5MGEsIDB4MGEwYTA5MGEsIDB4MGUxMTBkMGMsCisJICAweDBj
MTAwYzBjLCAweDE0MGYwYTBhLCAweDEyMTExMDBmLCAweDBiMTMxMzEzLCAweDE1MTYxNTBl
LAorCSAgMHgxMjExMTYxMiwgMHhkYmZmMTIxMywgMHgwNDAxNDMwMCwgMHgwNTA2MDUwNSwg
MHgwNzA3MGQwNiwKKwkgIDB4MGYxMjFiMGQsIDB4MWIxYjFiMTIsIDB4MWIxYjFiMWIsIDB4
MWIxYjFiMWIsIDB4MWIxYjFiMWIsCisJICAweDFiMWIxYjFiLCAweDFiMWIxYjFiLCAweDFi
MWIxYjFiLCAweDFiMWIxYjFiLCAweDFiMWIxYjFiLAorCSAgMHgxYjFiMWIxYiwgMHgxYjFi
MWIxYiwgMHgxYjFiMWIxYiwgMHhmZjFiMWIxYiB9LAorCXsgMHgwMTAyMDA0MywgMHgwMTAx
MDEwMSwgMHgwMTAxMDEwMiwgMHgwMjAyMDIwMiwgMHgwMzAzMDUwMywKKwkgIDB4MDYwMzAy
MDIsIDB4MDUwMzA0MDQsIDB4MDcwNzA2MDcsIDB4MDYwNzA2MDcsIDB4MDkwYjA5MDgsCisJ
ICAweDA4MGEwODA4LCAweDBkMGEwNzA2LCAweDBjMGIwYTBhLCAweDA3MGMwZDBjLCAweDBl
MGYwZTA5LAorCSAgMHgwYzBiMGYwYywgMHhkYmZmMGMwYywgMHgwMzAxNDMwMCwgMHgwMzA0
MDMwMywgMHgwNDA0MDgwNCwKKwkgIDB4MGEwYzEyMDgsIDB4MTIxMjEyMGMsIDB4MTIxMjEy
MTIsIDB4MTIxMjEyMTIsIDB4MTIxMjEyMTIsCisJICAweDEyMTIxMjEyLCAweDEyMTIxMjEy
LCAweDEyMTIxMjEyLCAweDEyMTIxMjEyLCAweDEyMTIxMjEyLAorCSAgMHgxMjEyMTIxMiwg
MHgxMjEyMTIxMiwgMHgxMjEyMTIxMiwgMHhmZjEyMTIxMiB9LAorCXsgMHgwMTAyMDA0Mywg
MHgwMTAxMDEwMSwgMHgwMTAxMDEwMiwgMHgwMjAyMDIwMiwgMHgwMzAzMDUwMywKKwkgIDB4
MDYwMzAyMDIsIDB4MDUwMzA0MDQsIDB4MDcwNzA2MDcsIDB4MDYwNzA2MDcsIDB4MDkwYjA5
MDgsCisJICAweDA4MGEwODA4LCAweDBkMGEwNzA2LCAweDBjMGIwYTBhLCAweDA3MGMwZDBj
LCAweDBlMGYwZTA5LAorCSAgMHgwYzBiMGYwYywgMHhkYmZmMGMwYywgMHgwMjAxNDMwMCwg
MHgwMzAzMDIwMiwgMHgwNDA0MDcwMywKKwkgIDB4MDgwYTBmMDcsIDB4MGYwZjBmMGEsIDB4
MGYwZjBmMGYsIDB4MGYwZjBmMGYsIDB4MGYwZjBmMGYsCisJICAweDBmMGYwZjBmLCAweDBm
MGYwZjBmLCAweDBmMGYwZjBmLCAweDBmMGYwZjBmLCAweDBmMGYwZjBmLAorCSAgMHgwZjBm
MGYwZiwgMHgwZjBmMGYwZiwgMHgwZjBmMGYwZiwgMHhmZjBmMGYwZiB9LAorCXsgMHgwMTAx
MDA0MywgMHgwMTAxMDEwMSwgMHgwMTAxMDEwMSwgMHgwMTAxMDEwMSwgMHgwMjAyMDMwMiwK
KwkgIDB4MDQwMjAyMDIsIDB4MDMwMjAzMDMsIDB4MDUwNTA0MDUsIDB4MDUwNTA0MDUsIDB4
MDcwODA2MDYsCisJICAweDA2MDgwNjA2LCAweDBhMDcwNTA1LCAweDA5MDgwODA3LCAweDA1
MDkwOTA5LCAweDBhMGIwYTA3LAorCSAgMHgwOTA4MGIwOSwgMHhkYmZmMDkwOSwgMHgwMjAx
NDMwMCwgMHgwMjAzMDIwMiwgMHgwMzAzMDUwMywKKwkgIDB4MDcwODBjMDUsIDB4MGMwYzBj
MDgsIDB4MGMwYzBjMGMsIDB4MGMwYzBjMGMsIDB4MGMwYzBjMGMsCisJICAweDBjMGMwYzBj
LCAweDBjMGMwYzBjLCAweDBjMGMwYzBjLCAweDBjMGMwYzBjLCAweDBjMGMwYzBjLAorCSAg
MHgwYzBjMGMwYywgMHgwYzBjMGMwYywgMHgwYzBjMGMwYywgMHhmZjBjMGMwYyB9LAorCXsg
MHgwMTAxMDA0MywgMHgwMTAxMDEwMSwgMHgwMTAxMDEwMSwgMHgwMTAxMDEwMSwgMHgwMTAx
MDIwMSwKKwkgIDB4MDMwMTAxMDEsIDB4MDIwMTAyMDIsIDB4MDMwMzAzMDMsIDB4MDMwMzAz
MDMsIDB4MDQwNTA0MDQsCisJICAweDA0MDUwNDA0LCAweDA2MDUwMzAzLCAweDA2MDUwNTA1
LCAweDAzMDYwNjA2LCAweDA3MDcwNzA0LAorCSAgMHgwNjA1MDcwNiwgMHhkYmZmMDYwNiwg
MHgwMTAxNDMwMCwgMHgwMTAyMDEwMSwgMHgwMjAyMDQwMiwKKwkgIDB4MDUwNjA5MDQsIDB4
MDkwOTA5MDYsIDB4MDkwOTA5MDksIDB4MDkwOTA5MDksIDB4MDkwOTA5MDksCisJICAweDA5
MDkwOTA5LCAweDA5MDkwOTA5LCAweDA5MDkwOTA5LCAweDA5MDkwOTA5LCAweDA5MDkwOTA5
LAorCSAgMHgwOTA5MDkwOSwgMHgwOTA5MDkwOSwgMHgwOTA5MDkwOSwgMHhmZjA5MDkwOSB9
LAorCXsgMHgwMTAxMDA0MywgMHgwMTAxMDEwMSwgMHgwMTAxMDEwMSwgMHgwMTAxMDEwMSwg
MHgwMTAxMDEwMSwKKwkgIDB4MDEwMTAxMDEsIDB4MDEwMTAxMDEsIDB4MDEwMTAxMDEsIDB4
MDEwMTAxMDEsIDB4MDIwMjAyMDIsCisJICAweDAyMDIwMjAyLCAweDAzMDIwMTAxLCAweDAz
MDIwMjAyLCAweDAxMDMwMzAzLCAweDAzMDMwMzAyLAorCSAgMHgwMzAyMDMwMywgMHhkYmZm
MDQwMywgMHgwMTAxNDMwMCwgMHgwMTAxMDEwMSwgMHgwMTAxMDIwMSwKKwkgIDB4MDMwNDA2
MDIsIDB4MDYwNjA2MDQsIDB4MDYwNjA2MDYsIDB4MDYwNjA2MDYsIDB4MDYwNjA2MDYsCisJ
ICAweDA2MDYwNjA2LCAweDA2MDYwNjA2LCAweDA2MDYwNjA2LCAweDA2MDYwNjA2LCAweDA2
MDYwNjA2LAorCSAgMHgwNjA2MDYwNiwgMHgwNjA2MDYwNiwgMHgwNjA2MDYwNiwgMHhmZjA2
MDYwNiB9Cit9OworCitzdGF0aWMgY29uc3Qgc3RydWN0IHY0bDJfZHZfdGltaW5nc19jYXAg
YXNwZWVkX3ZpZGVvX3RpbWluZ3NfY2FwID0geworCS50eXBlID0gVjRMMl9EVl9CVF82NTZf
MTEyMCwKKwkuYnQgPSB7CisJCS5taW5fd2lkdGggPSBNSU5fV0lEVEgsCisJCS5tYXhfd2lk
dGggPSBNQVhfV0lEVEgsCisJCS5taW5faGVpZ2h0ID0gTUlOX0hFSUdIVCwKKwkJLm1heF9o
ZWlnaHQgPSBNQVhfSEVJR0hULAorCQkubWluX3BpeGVsY2xvY2sgPSA2NTc0MDgwLCAvKiA2
NDAgeCA0ODAgeCAyNEh6ICovCisJCS5tYXhfcGl4ZWxjbG9jayA9IDEzODI0MDAwMCwgLyog
MTkyMCB4IDEyMDAgeCA2MEh6ICovCisJCS5zdGFuZGFyZHMgPSBWNEwyX0RWX0JUX1NURF9D
RUE4NjEgfCBWNEwyX0RWX0JUX1NURF9ETVQgfAorCQkJVjRMMl9EVl9CVF9TVERfQ1ZUIHwg
VjRMMl9EVl9CVF9TVERfR1RGLAorCQkuY2FwYWJpbGl0aWVzID0gVjRMMl9EVl9CVF9DQVBf
UFJPR1JFU1NJVkUgfAorCQkJVjRMMl9EVl9CVF9DQVBfUkVEVUNFRF9CTEFOS0lORyB8CisJ
CQlWNEwyX0RWX0JUX0NBUF9DVVNUT00sCisJfSwKK307CisKK3N0YXRpYyB2b2lkIGFzcGVl
ZF92aWRlb19pbml0X2pwZWdfdGFibGUodTMyICp0YWJsZSwgYm9vbCB5dXY0MjApCit7CisJ
aW50IGk7CisJdW5zaWduZWQgaW50IGJhc2U7CisKKwlmb3IgKGkgPSAwOyBpIDwgQVNQRUVE
X1ZJREVPX0pQRUdfTlVNX1FVQUxJVElFUzsgaSsrKSB7CisJCWJhc2UgPSAyNTYgKiBpOwkv
KiBBU1QgSFcgcmVxdWlyZXMgdGhpcyBoZWFkZXIgc3BhY2luZyAqLworCQltZW1jcHkoJnRh
YmxlW2Jhc2VdLCBhc3BlZWRfdmlkZW9fanBlZ19oZWFkZXIsCisJCSAgICAgICBzaXplb2Yo
YXNwZWVkX3ZpZGVvX2pwZWdfaGVhZGVyKSk7CisKKwkJYmFzZSArPSBBU1BFRURfVklERU9f
SlBFR19IRUFERVJfU0laRTsKKwkJbWVtY3B5KCZ0YWJsZVtiYXNlXSwgYXNwZWVkX3ZpZGVv
X2pwZWdfZGN0W2ldLAorCQkgICAgICAgc2l6ZW9mKGFzcGVlZF92aWRlb19qcGVnX2RjdFtp
XSkpOworCisJCWJhc2UgKz0gQVNQRUVEX1ZJREVPX0pQRUdfRENUX1NJWkU7CisJCW1lbWNw
eSgmdGFibGVbYmFzZV0sIGFzcGVlZF92aWRlb19qcGVnX3F1YW50LAorCQkgICAgICAgc2l6
ZW9mKGFzcGVlZF92aWRlb19qcGVnX3F1YW50KSk7CisKKwkJaWYgKHl1djQyMCkKKwkJCXRh
YmxlW2Jhc2UgKyAyXSA9IDB4MDAyMjAxMDM7CisJfQorfQorCitzdGF0aWMgdm9pZCBhc3Bl
ZWRfdmlkZW9fdXBkYXRlKHN0cnVjdCBhc3BlZWRfdmlkZW8gKnZpZGVvLCB1MzIgcmVnLCB1
MzIgY2xlYXIsCisJCQkJdTMyIGJpdHMpCit7CisJdTMyIHQgPSByZWFkbCh2aWRlby0+YmFz
ZSArIHJlZyk7CisJdTMyIGJlZm9yZSA9IHQ7CisKKwl0ICY9IH5jbGVhcjsKKwl0IHw9IGJp
dHM7CisJd3JpdGVsKHQsIHZpZGVvLT5iYXNlICsgcmVnKTsKKwlkZXZfZGJnKHZpZGVvLT5k
ZXYsICJ1cGRhdGUgJTAzeFslMDh4IC0+ICUwOHhdXG4iLCByZWcsIGJlZm9yZSwKKwkJcmVh
ZGwodmlkZW8tPmJhc2UgKyByZWcpKTsKK30KKworc3RhdGljIHUzMiBhc3BlZWRfdmlkZW9f
cmVhZChzdHJ1Y3QgYXNwZWVkX3ZpZGVvICp2aWRlbywgdTMyIHJlZykKK3sKKwl1MzIgdCA9
IHJlYWRsKHZpZGVvLT5iYXNlICsgcmVnKTsKKworCWRldl9kYmcodmlkZW8tPmRldiwgInJl
YWQgJTAzeFslMDh4XVxuIiwgcmVnLCB0KTsKKwlyZXR1cm4gdDsKK30KKworc3RhdGljIHZv
aWQgYXNwZWVkX3ZpZGVvX3dyaXRlKHN0cnVjdCBhc3BlZWRfdmlkZW8gKnZpZGVvLCB1MzIg
cmVnLCB1MzIgdmFsKQoreworCXdyaXRlbCh2YWwsIHZpZGVvLT5iYXNlICsgcmVnKTsKKwlk
ZXZfZGJnKHZpZGVvLT5kZXYsICJ3cml0ZSAlMDN4WyUwOHhdXG4iLCByZWcsCisJCXJlYWRs
KHZpZGVvLT5iYXNlICsgcmVnKSk7Cit9CisKK3N0YXRpYyBpbnQgYXNwZWVkX3ZpZGVvX3N0
YXJ0X2ZyYW1lKHN0cnVjdCBhc3BlZWRfdmlkZW8gKnZpZGVvKQoreworCWRtYV9hZGRyX3Qg
YWRkcjsKKwl1bnNpZ25lZCBsb25nIGZsYWdzOworCXN0cnVjdCBhc3BlZWRfdmlkZW9fYnVm
ZmVyICpidWY7CisJdTMyIHNlcV9jdHJsID0gYXNwZWVkX3ZpZGVvX3JlYWQodmlkZW8sIFZF
X1NFUV9DVFJMKTsKKworCWlmICh2aWRlby0+djRsMl9pbnB1dF9zdGF0dXMpIHsKKwkJZGV2
X2RiZyh2aWRlby0+ZGV2LCAiTm8gc2lnbmFsOyBkb24ndCBzdGFydCBmcmFtZVxuIik7CisJ
CXJldHVybiAwOworCX0KKworCWlmICghKHNlcV9jdHJsICYgVkVfU0VRX0NUUkxfQ09NUF9C
VVNZKSB8fAorCSAgICAhKHNlcV9jdHJsICYgVkVfU0VRX0NUUkxfQ0FQX0JVU1kpKSB7CisJ
CWRldl9lcnIodmlkZW8tPmRldiwgIkVuZ2luZSBidXN5OyBkb24ndCBzdGFydCBmcmFtZVxu
Iik7CisJCXJldHVybiAtRUJVU1k7CisJfQorCisJc3Bpbl9sb2NrX2lycXNhdmUoJnZpZGVv
LT5sb2NrLCBmbGFncyk7CisJYnVmID0gbGlzdF9maXJzdF9lbnRyeV9vcl9udWxsKCZ2aWRl
by0+YnVmZmVycywKKwkJCQkgICAgICAgc3RydWN0IGFzcGVlZF92aWRlb19idWZmZXIsIGxp
bmspOworCWlmICghYnVmKSB7CisJCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnZpZGVvLT5s
b2NrLCBmbGFncyk7CisJCWRldl9kYmcodmlkZW8tPmRldiwgIk5vIGJ1ZmZlcnM7IGRvbid0
IHN0YXJ0IGZyYW1lXG4iKTsKKwkJcmV0dXJuIC1FUFJPVE87CisJfQorCisJc2V0X2JpdChW
SURFT19GUkFNRV9JTlBSRywgJnZpZGVvLT5mbGFncyk7CisJYWRkciA9IHZiMl9kbWFfY29u
dGlnX3BsYW5lX2RtYV9hZGRyKCZidWYtPnZiLnZiMl9idWYsIDApOworCXNwaW5fdW5sb2Nr
X2lycXJlc3RvcmUoJnZpZGVvLT5sb2NrLCBmbGFncyk7CisKKwlhc3BlZWRfdmlkZW9fd3Jp
dGUodmlkZW8sIFZFX0NPTVBfUFJPQ19PRkZTRVQsIDApOworCWFzcGVlZF92aWRlb193cml0
ZSh2aWRlbywgVkVfQ09NUF9PRkZTRVQsIDApOworCWFzcGVlZF92aWRlb193cml0ZSh2aWRl
bywgVkVfQ09NUF9BRERSLCBhZGRyKTsKKworCWFzcGVlZF92aWRlb191cGRhdGUodmlkZW8s
IFZFX0lOVEVSUlVQVF9DVFJMLCAwLAorCQkJICAgIFZFX0lOVEVSUlVQVF9DT01QX0NPTVBM
RVRFIHwKKwkJCSAgICBWRV9JTlRFUlJVUFRfQ0FQVFVSRV9DT01QTEVURSk7CisKKwlhc3Bl
ZWRfdmlkZW9fdXBkYXRlKHZpZGVvLCBWRV9TRVFfQ1RSTCwgMCwKKwkJCSAgICBWRV9TRVFf
Q1RSTF9UUklHX0NBUFRVUkUgfCBWRV9TRVFfQ1RSTF9UUklHX0NPTVApOworCisJcmV0dXJu
IDA7Cit9CisKK3N0YXRpYyB2b2lkIGFzcGVlZF92aWRlb19lbmFibGVfbW9kZV9kZXRlY3Qo
c3RydWN0IGFzcGVlZF92aWRlbyAqdmlkZW8pCit7CisJLyogRW5hYmxlIG1vZGUgZGV0ZWN0
IGludGVycnVwdHMgKi8KKwlhc3BlZWRfdmlkZW9fdXBkYXRlKHZpZGVvLCBWRV9JTlRFUlJV
UFRfQ1RSTCwgMCwKKwkJCSAgICBWRV9JTlRFUlJVUFRfTU9ERV9ERVRFQ1QpOworCisJLyog
VHJpZ2dlciBtb2RlIGRldGVjdCAqLworCWFzcGVlZF92aWRlb191cGRhdGUodmlkZW8sIFZF
X1NFUV9DVFJMLCAwLCBWRV9TRVFfQ1RSTF9UUklHX01PREVfREVUKTsKK30KKworc3RhdGlj
IHZvaWQgYXNwZWVkX3ZpZGVvX3Jlc2V0KHN0cnVjdCBhc3BlZWRfdmlkZW8gKnZpZGVvKQor
eworCS8qIFJlc2V0IHRoZSBlbmdpbmUgKi8KKwlyZXNldF9jb250cm9sX2Fzc2VydCh2aWRl
by0+cnN0KTsKKworCS8qIERvbid0IHVzbGVlcCBoZXJlOyBmdW5jdGlvbiBtYXkgYmUgY2Fs
bGVkIGluIGludGVycnVwdCBjb250ZXh0ICovCisJdWRlbGF5KDEwMCk7CisJcmVzZXRfY29u
dHJvbF9kZWFzc2VydCh2aWRlby0+cnN0KTsKK30KKworc3RhdGljIHZvaWQgYXNwZWVkX3Zp
ZGVvX29mZihzdHJ1Y3QgYXNwZWVkX3ZpZGVvICp2aWRlbykKK3sKKwlhc3BlZWRfdmlkZW9f
cmVzZXQodmlkZW8pOworCisJLyogVHVybiBvZmYgdGhlIHJlbGV2YW50IGNsb2NrcyAqLwor
CWNsa19kaXNhYmxlX3VucHJlcGFyZSh2aWRlby0+dmNsayk7CisJY2xrX2Rpc2FibGVfdW5w
cmVwYXJlKHZpZGVvLT5lY2xrKTsKK30KKworc3RhdGljIHZvaWQgYXNwZWVkX3ZpZGVvX29u
KHN0cnVjdCBhc3BlZWRfdmlkZW8gKnZpZGVvKQoreworCS8qIFR1cm4gb24gdGhlIHJlbGV2
YW50IGNsb2NrcyAqLworCWNsa19wcmVwYXJlX2VuYWJsZSh2aWRlby0+ZWNsayk7CisJY2xr
X3ByZXBhcmVfZW5hYmxlKHZpZGVvLT52Y2xrKTsKKworCWFzcGVlZF92aWRlb19yZXNldCh2
aWRlbyk7Cit9CisKK3N0YXRpYyB2b2lkIGFzcGVlZF92aWRlb19idWZzX2RvbmUoc3RydWN0
IGFzcGVlZF92aWRlbyAqdmlkZW8sCisJCQkJICAgZW51bSB2YjJfYnVmZmVyX3N0YXRlIHN0
YXRlKQoreworCXVuc2lnbmVkIGxvbmcgZmxhZ3M7CisJc3RydWN0IGFzcGVlZF92aWRlb19i
dWZmZXIgKmJ1ZjsKKworCXNwaW5fbG9ja19pcnFzYXZlKCZ2aWRlby0+bG9jaywgZmxhZ3Mp
OworCWxpc3RfZm9yX2VhY2hfZW50cnkoYnVmLCAmdmlkZW8tPmJ1ZmZlcnMsIGxpbmspCisJ
CXZiMl9idWZmZXJfZG9uZSgmYnVmLT52Yi52YjJfYnVmLCBzdGF0ZSk7CisJSU5JVF9MSVNU
X0hFQUQoJnZpZGVvLT5idWZmZXJzKTsKKwlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZ2aWRl
by0+bG9jaywgZmxhZ3MpOworfQorCitzdGF0aWMgdm9pZCBhc3BlZWRfdmlkZW9faXJxX3Jl
c19jaGFuZ2Uoc3RydWN0IGFzcGVlZF92aWRlbyAqdmlkZW8pCit7CisJZGV2X2RiZyh2aWRl
by0+ZGV2LCAiUmVzb2x1dGlvbiBjaGFuZ2VkOyByZXNldHRpbmdcbiIpOworCisJc2V0X2Jp
dChWSURFT19SRVNfQ0hBTkdFLCAmdmlkZW8tPmZsYWdzKTsKKwljbGVhcl9iaXQoVklERU9f
RlJBTUVfSU5QUkcsICZ2aWRlby0+ZmxhZ3MpOworCisJYXNwZWVkX3ZpZGVvX29mZih2aWRl
byk7CisJYXNwZWVkX3ZpZGVvX2J1ZnNfZG9uZSh2aWRlbywgVkIyX0JVRl9TVEFURV9FUlJP
Uik7CisKKwlzY2hlZHVsZV9kZWxheWVkX3dvcmsoJnZpZGVvLT5yZXNfd29yaywgUkVTT0xV
VElPTl9DSEFOR0VfREVMQVkpOworfQorCitzdGF0aWMgaXJxcmV0dXJuX3QgYXNwZWVkX3Zp
ZGVvX2lycShpbnQgaXJxLCB2b2lkICphcmcpCit7CisJc3RydWN0IGFzcGVlZF92aWRlbyAq
dmlkZW8gPSBhcmc7CisJdTMyIHN0cyA9IGFzcGVlZF92aWRlb19yZWFkKHZpZGVvLCBWRV9J
TlRFUlJVUFRfU1RBVFVTKTsKKworCS8qCisJICogUmVzb2x1dGlvbiBjaGFuZ2VkIG9yIHNp
Z25hbCB3YXMgbG9zdDsgcmVzZXQgdGhlIGVuZ2luZSBhbmQKKwkgKiByZS1pbml0aWFsaXpl
CisJICovCisJaWYgKHN0cyAmIFZFX0lOVEVSUlVQVF9NT0RFX0RFVEVDVF9XRCkgeworCQlh
c3BlZWRfdmlkZW9faXJxX3Jlc19jaGFuZ2UodmlkZW8pOworCQlyZXR1cm4gSVJRX0hBTkRM
RUQ7CisJfQorCisJaWYgKHN0cyAmIFZFX0lOVEVSUlVQVF9NT0RFX0RFVEVDVCkgeworCQlp
ZiAodGVzdF9iaXQoVklERU9fUkVTX0RFVEVDVCwgJnZpZGVvLT5mbGFncykpIHsKKwkJCWFz
cGVlZF92aWRlb191cGRhdGUodmlkZW8sIFZFX0lOVEVSUlVQVF9DVFJMLAorCQkJCQkgICAg
VkVfSU5URVJSVVBUX01PREVfREVURUNULCAwKTsKKwkJCWFzcGVlZF92aWRlb193cml0ZSh2
aWRlbywgVkVfSU5URVJSVVBUX1NUQVRVUywKKwkJCQkJICAgVkVfSU5URVJSVVBUX01PREVf
REVURUNUKTsKKworCQkJc2V0X2JpdChWSURFT19NT0RFX0RFVEVDVF9ET05FLCAmdmlkZW8t
PmZsYWdzKTsKKwkJCXdha2VfdXBfaW50ZXJydXB0aWJsZV9hbGwoJnZpZGVvLT53YWl0KTsK
KwkJfSBlbHNlIHsKKwkJCS8qCisJCQkgKiBTaWduYWwgYWNxdWlyZWQgd2hpbGUgTk9UIGRv
aW5nIHJlc29sdXRpb24KKwkJCSAqIGRldGVjdGlvbjsgcmVzZXQgdGhlIGVuZ2luZSBhbmQg
cmUtaW5pdGlhbGl6ZQorCQkJICovCisJCQlhc3BlZWRfdmlkZW9faXJxX3Jlc19jaGFuZ2Uo
dmlkZW8pOworCQkJcmV0dXJuIElSUV9IQU5ETEVEOworCQl9CisJfQorCisJaWYgKChzdHMg
JiBWRV9JTlRFUlJVUFRfQ09NUF9DT01QTEVURSkgJiYKKwkgICAgKHN0cyAmIFZFX0lOVEVS
UlVQVF9DQVBUVVJFX0NPTVBMRVRFKSkgeworCQlzdHJ1Y3QgYXNwZWVkX3ZpZGVvX2J1ZmZl
ciAqYnVmOworCQl1MzIgZnJhbWVfc2l6ZSA9IGFzcGVlZF92aWRlb19yZWFkKHZpZGVvLAor
CQkJCQkJICAgVkVfT0ZGU0VUX0NPTVBfU1RSRUFNKTsKKworCQlzcGluX2xvY2soJnZpZGVv
LT5sb2NrKTsKKwkJY2xlYXJfYml0KFZJREVPX0ZSQU1FX0lOUFJHLCAmdmlkZW8tPmZsYWdz
KTsKKwkJYnVmID0gbGlzdF9maXJzdF9lbnRyeV9vcl9udWxsKCZ2aWRlby0+YnVmZmVycywK
KwkJCQkJICAgICAgIHN0cnVjdCBhc3BlZWRfdmlkZW9fYnVmZmVyLAorCQkJCQkgICAgICAg
bGluayk7CisJCWlmIChidWYpIHsKKwkJCXZiMl9zZXRfcGxhbmVfcGF5bG9hZCgmYnVmLT52
Yi52YjJfYnVmLCAwLCBmcmFtZV9zaXplKTsKKworCQkJaWYgKCFsaXN0X2lzX2xhc3QoJmJ1
Zi0+bGluaywgJnZpZGVvLT5idWZmZXJzKSkgeworCQkJCWJ1Zi0+dmIudmIyX2J1Zi50aW1l
c3RhbXAgPSBrdGltZV9nZXRfbnMoKTsKKwkJCQlidWYtPnZiLnNlcXVlbmNlID0gdmlkZW8t
PnNlcXVlbmNlKys7CisJCQkJYnVmLT52Yi5maWVsZCA9IFY0TDJfRklFTERfTk9ORTsKKwkJ
CQl2YjJfYnVmZmVyX2RvbmUoJmJ1Zi0+dmIudmIyX2J1ZiwKKwkJCQkJCVZCMl9CVUZfU1RB
VEVfRE9ORSk7CisJCQkJbGlzdF9kZWwoJmJ1Zi0+bGluayk7CisJCQl9CisJCX0KKwkJc3Bp
bl91bmxvY2soJnZpZGVvLT5sb2NrKTsKKworCQlhc3BlZWRfdmlkZW9fdXBkYXRlKHZpZGVv
LCBWRV9TRVFfQ1RSTCwKKwkJCQkgICAgVkVfU0VRX0NUUkxfVFJJR19DQVBUVVJFIHwKKwkJ
CQkgICAgVkVfU0VRX0NUUkxfRk9SQ0VfSURMRSB8CisJCQkJICAgIFZFX1NFUV9DVFJMX1RS
SUdfQ09NUCwgMCk7CisJCWFzcGVlZF92aWRlb191cGRhdGUodmlkZW8sIFZFX0lOVEVSUlVQ
VF9DVFJMLAorCQkJCSAgICBWRV9JTlRFUlJVUFRfQ09NUF9DT01QTEVURSB8CisJCQkJICAg
IFZFX0lOVEVSUlVQVF9DQVBUVVJFX0NPTVBMRVRFLCAwKTsKKwkJYXNwZWVkX3ZpZGVvX3dy
aXRlKHZpZGVvLCBWRV9JTlRFUlJVUFRfU1RBVFVTLAorCQkJCSAgIFZFX0lOVEVSUlVQVF9D
T01QX0NPTVBMRVRFIHwKKwkJCQkgICBWRV9JTlRFUlJVUFRfQ0FQVFVSRV9DT01QTEVURSk7
CisKKwkJaWYgKHRlc3RfYml0KFZJREVPX1NUUkVBTUlORywgJnZpZGVvLT5mbGFncykgJiYg
YnVmKQorCQkJYXNwZWVkX3ZpZGVvX3N0YXJ0X2ZyYW1lKHZpZGVvKTsKKwl9CisKKwlyZXR1
cm4gSVJRX0hBTkRMRUQ7Cit9CisKK3N0YXRpYyB2b2lkIGFzcGVlZF92aWRlb19jaGVja19h
bmRfc2V0X3BvbGFyaXR5KHN0cnVjdCBhc3BlZWRfdmlkZW8gKnZpZGVvKQoreworCWludCBp
OworCWludCBoc3luY19jb3VudGVyID0gMDsKKwlpbnQgdnN5bmNfY291bnRlciA9IDA7CisJ
dTMyIHN0czsKKworCWZvciAoaSA9IDA7IGkgPCBOVU1fUE9MQVJJVFlfQ0hFQ0tTOyArK2kp
IHsKKwkJc3RzID0gYXNwZWVkX3ZpZGVvX3JlYWQodmlkZW8sIFZFX01PREVfREVURUNUX1NU
QVRVUyk7CisJCWlmIChzdHMgJiBWRV9NT0RFX0RFVEVDVF9TVEFUVVNfVlNZTkMpCisJCQl2
c3luY19jb3VudGVyLS07CisJCWVsc2UKKwkJCXZzeW5jX2NvdW50ZXIrKzsKKworCQlpZiAo
c3RzICYgVkVfTU9ERV9ERVRFQ1RfU1RBVFVTX0hTWU5DKQorCQkJaHN5bmNfY291bnRlci0t
OworCQllbHNlCisJCQloc3luY19jb3VudGVyKys7CisJfQorCisJaWYgKGhzeW5jX2NvdW50
ZXIgPCAwIHx8IHZzeW5jX2NvdW50ZXIgPCAwKSB7CisJCXUzMiBjdHJsOworCisJCWlmICho
c3luY19jb3VudGVyIDwgMCkgeworCQkJY3RybCA9IFZFX0NUUkxfSFNZTkNfUE9MOworCQkJ
dmlkZW8tPmRldGVjdGVkX3RpbWluZ3MucG9sYXJpdGllcyAmPQorCQkJCX5WNEwyX0RWX0hT
WU5DX1BPU19QT0w7CisJCX0gZWxzZSB7CisJCQl2aWRlby0+ZGV0ZWN0ZWRfdGltaW5ncy5w
b2xhcml0aWVzIHw9CisJCQkJVjRMMl9EVl9IU1lOQ19QT1NfUE9MOworCQl9CisKKwkJaWYg
KHZzeW5jX2NvdW50ZXIgPCAwKSB7CisJCQljdHJsID0gVkVfQ1RSTF9WU1lOQ19QT0w7CisJ
CQl2aWRlby0+ZGV0ZWN0ZWRfdGltaW5ncy5wb2xhcml0aWVzICY9CisJCQkJflY0TDJfRFZf
VlNZTkNfUE9TX1BPTDsKKwkJfSBlbHNlIHsKKwkJCXZpZGVvLT5kZXRlY3RlZF90aW1pbmdz
LnBvbGFyaXRpZXMgfD0KKwkJCQlWNEwyX0RWX1ZTWU5DX1BPU19QT0w7CisJCX0KKworCQlh
c3BlZWRfdmlkZW9fdXBkYXRlKHZpZGVvLCBWRV9DVFJMLCAwLCBjdHJsKTsKKwl9Cit9CisK
K3N0YXRpYyBib29sIGFzcGVlZF92aWRlb19hbGxvY19idWYoc3RydWN0IGFzcGVlZF92aWRl
byAqdmlkZW8sCisJCQkJICAgc3RydWN0IGFzcGVlZF92aWRlb19hZGRyICphZGRyLAorCQkJ
CSAgIHVuc2lnbmVkIGludCBzaXplKQoreworCWFkZHItPnZpcnQgPSBkbWFfYWxsb2NfY29o
ZXJlbnQodmlkZW8tPmRldiwgc2l6ZSwgJmFkZHItPmRtYSwKKwkJCQkJR0ZQX0tFUk5FTCk7
CisJaWYgKCFhZGRyLT52aXJ0KQorCQlyZXR1cm4gZmFsc2U7CisKKwlhZGRyLT5zaXplID0g
c2l6ZTsKKwlyZXR1cm4gdHJ1ZTsKK30KKworc3RhdGljIHZvaWQgYXNwZWVkX3ZpZGVvX2Zy
ZWVfYnVmKHN0cnVjdCBhc3BlZWRfdmlkZW8gKnZpZGVvLAorCQkJCSAgc3RydWN0IGFzcGVl
ZF92aWRlb19hZGRyICphZGRyKQoreworCWRtYV9mcmVlX2NvaGVyZW50KHZpZGVvLT5kZXYs
IGFkZHItPnNpemUsIGFkZHItPnZpcnQsIGFkZHItPmRtYSk7CisJYWRkci0+c2l6ZSA9IDA7
CisJYWRkci0+ZG1hID0gMFVMTDsKKwlhZGRyLT52aXJ0ID0gTlVMTDsKK30KKworLyoKKyAq
IEdldCB0aGUgbWluaW11bSBIVy1zdXBwb3J0ZWQgY29tcHJlc3Npb24gYnVmZmVyIHNpemUg
Zm9yIHRoZSBmcmFtZSBzaXplLgorICogQXNzdW1lIHdvcnN0LWNhc2UgSlBFRyBjb21wcmVz
c2lvbiBzaXplIGlzIDEvOCByYXcgc2l6ZS4gVGhpcyBzaG91bGQgYmUKKyAqIHBsZW50eSBl
dmVuIGZvciBtYXhpbXVtIHF1YWxpdHk7IGFueSB3b3JzZSBhbmQgdGhlIGVuZ2luZSB3aWxs
IHNpbXBseSByZXR1cm4KKyAqIGluY29tcGxldGUgSlBFR3MuCisgKi8KK3N0YXRpYyB2b2lk
IGFzcGVlZF92aWRlb19jYWxjX2NvbXByZXNzZWRfc2l6ZShzdHJ1Y3QgYXNwZWVkX3ZpZGVv
ICp2aWRlbywKKwkJCQkJICAgICAgdW5zaWduZWQgaW50IGZyYW1lX3NpemUpCit7CisJaW50
IGksIGo7CisJdTMyIGNvbXByZXNzaW9uX2J1ZmZlcl9zaXplX3JlZyA9IDA7CisJdW5zaWdu
ZWQgaW50IHNpemU7CisJY29uc3QgdW5zaWduZWQgaW50IG51bV9jb21wcmVzc2lvbl9wYWNr
ZXRzID0gNDsKKwljb25zdCB1bnNpZ25lZCBpbnQgY29tcHJlc3Npb25fcGFja2V0X3NpemUg
PSAxMDI0OworCWNvbnN0IHVuc2lnbmVkIGludCBtYXhfY29tcHJlc3NlZF9zaXplID0gZnJh
bWVfc2l6ZSAvIDI7IC8qIDRicHAgLyA4ICovCisKKwl2aWRlby0+bWF4X2NvbXByZXNzZWRf
c2l6ZSA9IFVJTlRfTUFYOworCisJZm9yIChpID0gMDsgaSA8IDY7ICsraSkgeworCQlmb3Ig
KGogPSAwOyBqIDwgODsgKytqKSB7CisJCQlzaXplID0gKG51bV9jb21wcmVzc2lvbl9wYWNr
ZXRzIDw8IGkpICoKKwkJCQkoY29tcHJlc3Npb25fcGFja2V0X3NpemUgPDwgaik7CisJCQlp
ZiAoc2l6ZSA8IG1heF9jb21wcmVzc2VkX3NpemUpCisJCQkJY29udGludWU7CisKKwkJCWlm
IChzaXplIDwgdmlkZW8tPm1heF9jb21wcmVzc2VkX3NpemUpIHsKKwkJCQljb21wcmVzc2lv
bl9idWZmZXJfc2l6ZV9yZWcgPSAoaSA8PCAzKSB8IGo7CisJCQkJdmlkZW8tPm1heF9jb21w
cmVzc2VkX3NpemUgPSBzaXplOworCQkJfQorCQl9CisJfQorCisJYXNwZWVkX3ZpZGVvX3dy
aXRlKHZpZGVvLCBWRV9TVFJFQU1fQlVGX1NJWkUsCisJCQkgICBjb21wcmVzc2lvbl9idWZm
ZXJfc2l6ZV9yZWcpOworCisJZGV2X2RiZyh2aWRlby0+ZGV2LCAiTWF4IGNvbXByZXNzZWQg
c2l6ZTogJXhcbiIsCisJCXZpZGVvLT5tYXhfY29tcHJlc3NlZF9zaXplKTsKK30KKworI2Rl
ZmluZSByZXNfY2hlY2sodikgdGVzdF9hbmRfY2xlYXJfYml0KFZJREVPX01PREVfREVURUNU
X0RPTkUsICYodiktPmZsYWdzKQorCitzdGF0aWMgdm9pZCBhc3BlZWRfdmlkZW9fZ2V0X3Jl
c29sdXRpb24oc3RydWN0IGFzcGVlZF92aWRlbyAqdmlkZW8pCit7CisJYm9vbCBpbnZhbGlk
X3Jlc29sdXRpb24gPSB0cnVlOworCWludCByYzsKKwlpbnQgdHJpZXMgPSAwOworCXUzMiBt
ZHM7CisJdTMyIHNyY19scl9lZGdlOworCXUzMiBzcmNfdGJfZWRnZTsKKwl1MzIgc3luYzsK
KwlzdHJ1Y3QgdjRsMl9idF90aW1pbmdzICpkZXQgPSAmdmlkZW8tPmRldGVjdGVkX3RpbWlu
Z3M7CisKKwlkZXQtPndpZHRoID0gTUlOX1dJRFRIOworCWRldC0+aGVpZ2h0ID0gTUlOX0hF
SUdIVDsKKwl2aWRlby0+djRsMl9pbnB1dF9zdGF0dXMgPSBWNEwyX0lOX1NUX05PX1NJR05B
TDsKKworCS8qCisJICogU2luY2Ugd2UgbmVlZCBtYXggYnVmZmVyIHNpemUgZm9yIGRldGVj
dGlvbiwgZnJlZSB0aGUgc2Vjb25kIHNvdXJjZQorCSAqIGJ1ZmZlciBmaXJzdC4KKwkgKi8K
KwlpZiAodmlkZW8tPnNyY3NbMV0uc2l6ZSkKKwkJYXNwZWVkX3ZpZGVvX2ZyZWVfYnVmKHZp
ZGVvLCAmdmlkZW8tPnNyY3NbMV0pOworCisJaWYgKHZpZGVvLT5zcmNzWzBdLnNpemUgPCBW
RV9NQVhfU1JDX0JVRkZFUl9TSVpFKSB7CisJCWlmICh2aWRlby0+c3Jjc1swXS5zaXplKQor
CQkJYXNwZWVkX3ZpZGVvX2ZyZWVfYnVmKHZpZGVvLCAmdmlkZW8tPnNyY3NbMF0pOworCisJ
CWlmICghYXNwZWVkX3ZpZGVvX2FsbG9jX2J1Zih2aWRlbywgJnZpZGVvLT5zcmNzWzBdLAor
CQkJCQkgICAgVkVfTUFYX1NSQ19CVUZGRVJfU0laRSkpIHsKKwkJCWRldl9lcnIodmlkZW8t
PmRldiwKKwkJCQkiRmFpbGVkIHRvIGFsbG9jYXRlIHNvdXJjZSBidWZmZXJzXG4iKTsKKwkJ
CXJldHVybjsKKwkJfQorCX0KKworCWFzcGVlZF92aWRlb193cml0ZSh2aWRlbywgVkVfU1JD
MF9BRERSLCB2aWRlby0+c3Jjc1swXS5kbWEpOworCisJZG8geworCQlpZiAodHJpZXMpIHsK
KwkJCXNldF9jdXJyZW50X3N0YXRlKFRBU0tfSU5URVJSVVBUSUJMRSk7CisJCQlpZiAoc2No
ZWR1bGVfdGltZW91dChJTlZBTElEX1JFU09MVVRJT05fREVMQVkpKQorCQkJCXJldHVybjsK
KwkJfQorCisJCXNldF9iaXQoVklERU9fUkVTX0RFVEVDVCwgJnZpZGVvLT5mbGFncyk7CisJ
CWFzcGVlZF92aWRlb19lbmFibGVfbW9kZV9kZXRlY3QodmlkZW8pOworCisJCXJjID0gd2Fp
dF9ldmVudF9pbnRlcnJ1cHRpYmxlX3RpbWVvdXQodmlkZW8tPndhaXQsCisJCQkJCQkgICAg
ICByZXNfY2hlY2sodmlkZW8pLAorCQkJCQkJICAgICAgTU9ERV9ERVRFQ1RfVElNRU9VVCk7
CisJCWlmICghcmMpIHsKKwkJCWRldl9lcnIodmlkZW8tPmRldiwgIlRpbWVkIG91dDsgZmly
c3QgbW9kZSBkZXRlY3RcbiIpOworCQkJY2xlYXJfYml0KFZJREVPX1JFU19ERVRFQ1QsICZ2
aWRlby0+ZmxhZ3MpOworCQkJcmV0dXJuOworCQl9CisKKwkJLyogRGlzYWJsZSBtb2RlIGRl
dGVjdCBpbiBvcmRlciB0byByZS10cmlnZ2VyICovCisJCWFzcGVlZF92aWRlb191cGRhdGUo
dmlkZW8sIFZFX1NFUV9DVFJMLAorCQkJCSAgICBWRV9TRVFfQ1RSTF9UUklHX01PREVfREVU
LCAwKTsKKworCQlhc3BlZWRfdmlkZW9fY2hlY2tfYW5kX3NldF9wb2xhcml0eSh2aWRlbyk7
CisKKwkJYXNwZWVkX3ZpZGVvX2VuYWJsZV9tb2RlX2RldGVjdCh2aWRlbyk7CisKKwkJcmMg
PSB3YWl0X2V2ZW50X2ludGVycnVwdGlibGVfdGltZW91dCh2aWRlby0+d2FpdCwKKwkJCQkJ
CSAgICAgIHJlc19jaGVjayh2aWRlbyksCisJCQkJCQkgICAgICBNT0RFX0RFVEVDVF9USU1F
T1VUKTsKKwkJY2xlYXJfYml0KFZJREVPX1JFU19ERVRFQ1QsICZ2aWRlby0+ZmxhZ3MpOwor
CQlpZiAoIXJjKSB7CisJCQlkZXZfZXJyKHZpZGVvLT5kZXYsICJUaW1lZCBvdXQ7IHNlY29u
ZCBtb2RlIGRldGVjdFxuIik7CisJCQlyZXR1cm47CisJCX0KKworCQlzcmNfbHJfZWRnZSA9
IGFzcGVlZF92aWRlb19yZWFkKHZpZGVvLCBWRV9TUkNfTFJfRURHRV9ERVQpOworCQlzcmNf
dGJfZWRnZSA9IGFzcGVlZF92aWRlb19yZWFkKHZpZGVvLCBWRV9TUkNfVEJfRURHRV9ERVQp
OworCQltZHMgPSBhc3BlZWRfdmlkZW9fcmVhZCh2aWRlbywgVkVfTU9ERV9ERVRFQ1RfU1RB
VFVTKTsKKwkJc3luYyA9IGFzcGVlZF92aWRlb19yZWFkKHZpZGVvLCBWRV9TWU5DX1NUQVRV
Uyk7CisKKwkJdmlkZW8tPmZyYW1lX2JvdHRvbSA9IChzcmNfdGJfZWRnZSAmIFZFX1NSQ19U
Ql9FREdFX0RFVF9CT1QpID4+CisJCQlWRV9TUkNfVEJfRURHRV9ERVRfQk9UX1NIRjsKKwkJ
dmlkZW8tPmZyYW1lX3RvcCA9IHNyY190Yl9lZGdlICYgVkVfU1JDX1RCX0VER0VfREVUX1RP
UDsKKwkJZGV0LT52ZnJvbnRwb3JjaCA9IHZpZGVvLT5mcmFtZV90b3A7CisJCWRldC0+dmJh
Y2twb3JjaCA9ICgobWRzICYgVkVfTU9ERV9ERVRFQ1RfVl9MSU5FUykgPj4KKwkJCVZFX01P
REVfREVURUNUX1ZfTElORVNfU0hGKSAtIHZpZGVvLT5mcmFtZV9ib3R0b207CisJCWRldC0+
dnN5bmMgPSAoc3luYyAmIFZFX1NZTkNfU1RBVFVTX1ZTWU5DKSA+PgorCQkJVkVfU1lOQ19T
VEFUVVNfVlNZTkNfU0hGOworCQlpZiAodmlkZW8tPmZyYW1lX3RvcCA+IHZpZGVvLT5mcmFt
ZV9ib3R0b20pCisJCQljb250aW51ZTsKKworCQl2aWRlby0+ZnJhbWVfcmlnaHQgPSAoc3Jj
X2xyX2VkZ2UgJiBWRV9TUkNfTFJfRURHRV9ERVRfUlQpID4+CisJCQlWRV9TUkNfTFJfRURH
RV9ERVRfUlRfU0hGOworCQl2aWRlby0+ZnJhbWVfbGVmdCA9IHNyY19scl9lZGdlICYgVkVf
U1JDX0xSX0VER0VfREVUX0xFRlQ7CisJCWRldC0+aGZyb250cG9yY2ggPSB2aWRlby0+ZnJh
bWVfbGVmdDsKKwkJZGV0LT5oYmFja3BvcmNoID0gKG1kcyAmIFZFX01PREVfREVURUNUX0hf
UElYRUxTKSAtCisJCQl2aWRlby0+ZnJhbWVfcmlnaHQ7CisJCWRldC0+aHN5bmMgPSBzeW5j
ICYgVkVfU1lOQ19TVEFUVVNfSFNZTkM7CisJCWlmICh2aWRlby0+ZnJhbWVfbGVmdCA+IHZp
ZGVvLT5mcmFtZV9yaWdodCkKKwkJCWNvbnRpbnVlOworCisJCWludmFsaWRfcmVzb2x1dGlv
biA9IGZhbHNlOworCX0gd2hpbGUgKGludmFsaWRfcmVzb2x1dGlvbiAmJiAodHJpZXMrKyA8
IElOVkFMSURfUkVTT0xVVElPTl9SRVRSSUVTKSk7CisKKwlpZiAoaW52YWxpZF9yZXNvbHV0
aW9uKSB7CisJCWRldl9lcnIodmlkZW8tPmRldiwgIkludmFsaWQgcmVzb2x1dGlvbiBkZXRl
Y3RlZFxuIik7CisJCXJldHVybjsKKwl9CisKKwlkZXQtPmhlaWdodCA9ICh2aWRlby0+ZnJh
bWVfYm90dG9tIC0gdmlkZW8tPmZyYW1lX3RvcCkgKyAxOworCWRldC0+d2lkdGggPSAodmlk
ZW8tPmZyYW1lX3JpZ2h0IC0gdmlkZW8tPmZyYW1lX2xlZnQpICsgMTsKKwl2aWRlby0+djRs
Ml9pbnB1dF9zdGF0dXMgPSAwOworCisJLyoKKwkgKiBFbmFibGUgbW9kZS1kZXRlY3Qgd2F0
Y2hkb2csIHJlc29sdXRpb24tY2hhbmdlIHdhdGNoZG9nIGFuZAorCSAqIGF1dG9tYXRpYyBj
b21wcmVzc2lvbiBhZnRlciBmcmFtZSBjYXB0dXJlLgorCSAqLworCWFzcGVlZF92aWRlb191
cGRhdGUodmlkZW8sIFZFX0lOVEVSUlVQVF9DVFJMLCAwLAorCQkJICAgIFZFX0lOVEVSUlVQ
VF9NT0RFX0RFVEVDVF9XRCk7CisJYXNwZWVkX3ZpZGVvX3VwZGF0ZSh2aWRlbywgVkVfU0VR
X0NUUkwsIDAsCisJCQkgICAgVkVfU0VRX0NUUkxfQVVUT19DT01QIHwgVkVfU0VRX0NUUkxf
RU5fV0FUQ0hET0cpOworCisJZGV2X2RiZyh2aWRlby0+ZGV2LCAiR290IHJlc29sdXRpb246
ICVkeCVkXG4iLCBkZXQtPndpZHRoLAorCQlkZXQtPmhlaWdodCk7Cit9CisKK3N0YXRpYyB2
b2lkIGFzcGVlZF92aWRlb19zZXRfcmVzb2x1dGlvbihzdHJ1Y3QgYXNwZWVkX3ZpZGVvICp2
aWRlbykKK3sKKwlzdHJ1Y3QgdjRsMl9idF90aW1pbmdzICphY3QgPSAmdmlkZW8tPmFjdGl2
ZV90aW1pbmdzOworCXVuc2lnbmVkIGludCBzaXplID0gYWN0LT53aWR0aCAqIGFjdC0+aGVp
Z2h0OworCisJYXNwZWVkX3ZpZGVvX2NhbGNfY29tcHJlc3NlZF9zaXplKHZpZGVvLCBzaXpl
KTsKKworCS8qIERvbid0IHVzZSBkaXJlY3QgbW9kZSBiZWxvdyAxMDI0IHggNzY4IChpcnFz
IGRvbid0IGZpcmUpICovCisJaWYgKHNpemUgPCBESVJFQ1RfRkVUQ0hfVEhSRVNIT0xEKSB7
CisJCWFzcGVlZF92aWRlb193cml0ZSh2aWRlbywgVkVfVEdTXzAsCisJCQkJICAgRklFTERf
UFJFUChWRV9UR1NfRklSU1QsCisJCQkJCSAgICAgIHZpZGVvLT5mcmFtZV9sZWZ0IC0gMSkg
fAorCQkJCSAgIEZJRUxEX1BSRVAoVkVfVEdTX0xBU1QsCisJCQkJCSAgICAgIHZpZGVvLT5m
cmFtZV9yaWdodCkpOworCQlhc3BlZWRfdmlkZW9fd3JpdGUodmlkZW8sIFZFX1RHU18xLAor
CQkJCSAgIEZJRUxEX1BSRVAoVkVfVEdTX0ZJUlNULCB2aWRlby0+ZnJhbWVfdG9wKSB8CisJ
CQkJICAgRklFTERfUFJFUChWRV9UR1NfTEFTVCwKKwkJCQkJICAgICAgdmlkZW8tPmZyYW1l
X2JvdHRvbSArIDEpKTsKKwkJYXNwZWVkX3ZpZGVvX3VwZGF0ZSh2aWRlbywgVkVfQ1RSTCwg
MCwgVkVfQ1RSTF9JTlRfREUpOworCX0gZWxzZSB7CisJCWFzcGVlZF92aWRlb191cGRhdGUo
dmlkZW8sIFZFX0NUUkwsIDAsIFZFX0NUUkxfRElSRUNUX0ZFVENIKTsKKwl9CisKKwkvKiBT
ZXQgY2FwdHVyZS9jb21wcmVzc2lvbiBmcmFtZSBzaXplcyAqLworCWFzcGVlZF92aWRlb193
cml0ZSh2aWRlbywgVkVfQ0FQX1dJTkRPVywKKwkJCSAgIGFjdC0+d2lkdGggPDwgMTYgfCBh
Y3QtPmhlaWdodCk7CisJYXNwZWVkX3ZpZGVvX3dyaXRlKHZpZGVvLCBWRV9DT01QX1dJTkRP
VywKKwkJCSAgIGFjdC0+d2lkdGggPDwgMTYgfCBhY3QtPmhlaWdodCk7CisJYXNwZWVkX3Zp
ZGVvX3dyaXRlKHZpZGVvLCBWRV9TUkNfU0NBTkxJTkVfT0ZGU0VULCBhY3QtPndpZHRoICog
NCk7CisKKwlzaXplICo9IDQ7CisKKwlpZiAoc2l6ZSA9PSB2aWRlby0+c3Jjc1swXS5zaXpl
IC8gMikgeworCQlhc3BlZWRfdmlkZW9fd3JpdGUodmlkZW8sIFZFX1NSQzFfQUREUiwKKwkJ
CQkgICB2aWRlby0+c3Jjc1swXS5kbWEgKyBzaXplKTsKKwl9IGVsc2UgaWYgKHNpemUgPT0g
dmlkZW8tPnNyY3NbMF0uc2l6ZSkgeworCQlpZiAoIWFzcGVlZF92aWRlb19hbGxvY19idWYo
dmlkZW8sICZ2aWRlby0+c3Jjc1sxXSwgc2l6ZSkpCisJCQlnb3RvIGVycl9tZW07CisKKwkJ
YXNwZWVkX3ZpZGVvX3dyaXRlKHZpZGVvLCBWRV9TUkMxX0FERFIsIHZpZGVvLT5zcmNzWzFd
LmRtYSk7CisJfSBlbHNlIHsKKwkJYXNwZWVkX3ZpZGVvX2ZyZWVfYnVmKHZpZGVvLCAmdmlk
ZW8tPnNyY3NbMF0pOworCisJCWlmICghYXNwZWVkX3ZpZGVvX2FsbG9jX2J1Zih2aWRlbywg
JnZpZGVvLT5zcmNzWzBdLCBzaXplKSkKKwkJCWdvdG8gZXJyX21lbTsKKworCQlpZiAoIWFz
cGVlZF92aWRlb19hbGxvY19idWYodmlkZW8sICZ2aWRlby0+c3Jjc1sxXSwgc2l6ZSkpCisJ
CQlnb3RvIGVycl9tZW07CisKKwkJYXNwZWVkX3ZpZGVvX3dyaXRlKHZpZGVvLCBWRV9TUkMw
X0FERFIsIHZpZGVvLT5zcmNzWzBdLmRtYSk7CisJCWFzcGVlZF92aWRlb193cml0ZSh2aWRl
bywgVkVfU1JDMV9BRERSLCB2aWRlby0+c3Jjc1sxXS5kbWEpOworCX0KKworCXJldHVybjsK
KworZXJyX21lbToKKwlkZXZfZXJyKHZpZGVvLT5kZXYsICJGYWlsZWQgdG8gYWxsb2NhdGUg
c291cmNlIGJ1ZmZlcnNcbiIpOworCisJaWYgKHZpZGVvLT5zcmNzWzBdLnNpemUpCisJCWFz
cGVlZF92aWRlb19mcmVlX2J1Zih2aWRlbywgJnZpZGVvLT5zcmNzWzBdKTsKK30KKworc3Rh
dGljIHZvaWQgYXNwZWVkX3ZpZGVvX2luaXRfcmVncyhzdHJ1Y3QgYXNwZWVkX3ZpZGVvICp2
aWRlbykKK3sKKwl1MzIgY29tcF9jdHJsID0gVkVfQ09NUF9DVFJMX1JTVkQgfAorCQlGSUVM
RF9QUkVQKFZFX0NPTVBfQ1RSTF9EQ1RfTFVNLCB2aWRlby0+anBlZ19xdWFsaXR5KSB8CisJ
CUZJRUxEX1BSRVAoVkVfQ09NUF9DVFJMX0RDVF9DSFIsIHZpZGVvLT5qcGVnX3F1YWxpdHkg
fCAweDEwKTsKKwl1MzIgY3RybCA9IFZFX0NUUkxfQVVUT19PUl9DVVJTT1I7CisJdTMyIHNl
cV9jdHJsID0gVkVfU0VRX0NUUkxfSlBFR19NT0RFOworCisJaWYgKHZpZGVvLT5mcmFtZV9y
YXRlKQorCQljdHJsIHw9IEZJRUxEX1BSRVAoVkVfQ1RSTF9GUkMsIHZpZGVvLT5mcmFtZV9y
YXRlKTsKKworCWlmICh2aWRlby0+eXV2NDIwKQorCQlzZXFfY3RybCB8PSBWRV9TRVFfQ1RS
TF9ZVVY0MjA7CisKKwkvKiBVbmxvY2sgVkUgcmVnaXN0ZXJzICovCisJYXNwZWVkX3ZpZGVv
X3dyaXRlKHZpZGVvLCBWRV9QUk9URUNUSU9OX0tFWSwgVkVfUFJPVEVDVElPTl9LRVlfVU5M
T0NLKTsKKworCS8qIERpc2FibGUgaW50ZXJydXB0cyAqLworCWFzcGVlZF92aWRlb193cml0
ZSh2aWRlbywgVkVfSU5URVJSVVBUX0NUUkwsIDApOworCWFzcGVlZF92aWRlb193cml0ZSh2
aWRlbywgVkVfSU5URVJSVVBUX1NUQVRVUywgMHhmZmZmZmZmZik7CisKKwkvKiBDbGVhciB0
aGUgb2Zmc2V0ICovCisJYXNwZWVkX3ZpZGVvX3dyaXRlKHZpZGVvLCBWRV9DT01QX1BST0Nf
T0ZGU0VULCAwKTsKKwlhc3BlZWRfdmlkZW9fd3JpdGUodmlkZW8sIFZFX0NPTVBfT0ZGU0VU
LCAwKTsKKworCWFzcGVlZF92aWRlb193cml0ZSh2aWRlbywgVkVfSlBFR19BRERSLCB2aWRl
by0+anBlZy5kbWEpOworCisJLyogU2V0IGNvbnRyb2wgcmVnaXN0ZXJzICovCisJYXNwZWVk
X3ZpZGVvX3dyaXRlKHZpZGVvLCBWRV9TRVFfQ1RSTCwgc2VxX2N0cmwpOworCWFzcGVlZF92
aWRlb193cml0ZSh2aWRlbywgVkVfQ1RSTCwgY3RybCk7CisJYXNwZWVkX3ZpZGVvX3dyaXRl
KHZpZGVvLCBWRV9DT01QX0NUUkwsIGNvbXBfY3RybCk7CisKKwkvKiBEb24ndCBkb3duc2Nh
bGUgKi8KKwlhc3BlZWRfdmlkZW9fd3JpdGUodmlkZW8sIFZFX1NDQUxJTkdfRkFDVE9SLCAw
eDEwMDAxMDAwKTsKKwlhc3BlZWRfdmlkZW9fd3JpdGUodmlkZW8sIFZFX1NDQUxJTkdfRklM
VEVSMCwgMHgwMDIwMDAwMCk7CisJYXNwZWVkX3ZpZGVvX3dyaXRlKHZpZGVvLCBWRV9TQ0FM
SU5HX0ZJTFRFUjEsIDB4MDAyMDAwMDApOworCWFzcGVlZF92aWRlb193cml0ZSh2aWRlbywg
VkVfU0NBTElOR19GSUxURVIyLCAweDAwMjAwMDAwKTsKKwlhc3BlZWRfdmlkZW9fd3JpdGUo
dmlkZW8sIFZFX1NDQUxJTkdfRklMVEVSMywgMHgwMDIwMDAwMCk7CisKKwkvKiBTZXQgbW9k
ZSBkZXRlY3Rpb24gZGVmYXVsdHMgKi8KKwlhc3BlZWRfdmlkZW9fd3JpdGUodmlkZW8sIFZF
X01PREVfREVURUNULCAweDIyNjY2NTAwKTsKK30KKworc3RhdGljIHZvaWQgYXNwZWVkX3Zp
ZGVvX3N0YXJ0KHN0cnVjdCBhc3BlZWRfdmlkZW8gKnZpZGVvKQoreworCWFzcGVlZF92aWRl
b19vbih2aWRlbyk7CisKKwlhc3BlZWRfdmlkZW9faW5pdF9yZWdzKHZpZGVvKTsKKworCS8q
IFJlc29sdXRpb24gc2V0IHRvIDY0MHg0ODAgaWYgbm8gc2lnbmFsIGZvdW5kICovCisJYXNw
ZWVkX3ZpZGVvX2dldF9yZXNvbHV0aW9uKHZpZGVvKTsKKworCS8qIFNldCB0aW1pbmdzIHNp
bmNlIHRoZSBkZXZpY2UgaXMgYmVpbmcgb3BlbmVkIGZvciB0aGUgZmlyc3QgdGltZSAqLwor
CXZpZGVvLT5hY3RpdmVfdGltaW5ncyA9IHZpZGVvLT5kZXRlY3RlZF90aW1pbmdzOworCWFz
cGVlZF92aWRlb19zZXRfcmVzb2x1dGlvbih2aWRlbyk7CisKKwl2aWRlby0+cGl4X2ZtdC53
aWR0aCA9IHZpZGVvLT5hY3RpdmVfdGltaW5ncy53aWR0aDsKKwl2aWRlby0+cGl4X2ZtdC5o
ZWlnaHQgPSB2aWRlby0+YWN0aXZlX3RpbWluZ3MuaGVpZ2h0OworCXZpZGVvLT5waXhfZm10
LnNpemVpbWFnZSA9IHZpZGVvLT5tYXhfY29tcHJlc3NlZF9zaXplOworfQorCitzdGF0aWMg
dm9pZCBhc3BlZWRfdmlkZW9fc3RvcChzdHJ1Y3QgYXNwZWVkX3ZpZGVvICp2aWRlbykKK3sK
KwlzZXRfYml0KFZJREVPX1NUT1BQRUQsICZ2aWRlby0+ZmxhZ3MpOworCWNhbmNlbF9kZWxh
eWVkX3dvcmtfc3luYygmdmlkZW8tPnJlc193b3JrKTsKKworCWFzcGVlZF92aWRlb19vZmYo
dmlkZW8pOworCisJaWYgKHZpZGVvLT5zcmNzWzBdLnNpemUpCisJCWFzcGVlZF92aWRlb19m
cmVlX2J1Zih2aWRlbywgJnZpZGVvLT5zcmNzWzBdKTsKKworCWlmICh2aWRlby0+c3Jjc1sx
XS5zaXplKQorCQlhc3BlZWRfdmlkZW9fZnJlZV9idWYodmlkZW8sICZ2aWRlby0+c3Jjc1sx
XSk7CisKKwl2aWRlby0+djRsMl9pbnB1dF9zdGF0dXMgPSBWNEwyX0lOX1NUX05PX1NJR05B
TDsKKwl2aWRlby0+ZmxhZ3MgPSAwOworfQorCitzdGF0aWMgaW50IGFzcGVlZF92aWRlb19x
dWVyeWNhcChzdHJ1Y3QgZmlsZSAqZmlsZSwgdm9pZCAqZmgsCisJCQkJIHN0cnVjdCB2NGwy
X2NhcGFiaWxpdHkgKmNhcCkKK3sKKwlzdHJzY3B5KGNhcC0+ZHJpdmVyLCBERVZJQ0VfTkFN
RSwgc2l6ZW9mKGNhcC0+ZHJpdmVyKSk7CisJc3Ryc2NweShjYXAtPmNhcmQsICJBc3BlZWQg
VmlkZW8gRW5naW5lIiwgc2l6ZW9mKGNhcC0+Y2FyZCkpOworCXNucHJpbnRmKGNhcC0+YnVz
X2luZm8sIHNpemVvZihjYXAtPmJ1c19pbmZvKSwgInBsYXRmb3JtOiVzIiwKKwkJIERFVklD
RV9OQU1FKTsKKworCXJldHVybiAwOworfQorCitzdGF0aWMgaW50IGFzcGVlZF92aWRlb19l
bnVtX2Zvcm1hdChzdHJ1Y3QgZmlsZSAqZmlsZSwgdm9pZCAqZmgsCisJCQkJICAgIHN0cnVj
dCB2NGwyX2ZtdGRlc2MgKmYpCit7CisJaWYgKGYtPmluZGV4KQorCQlyZXR1cm4gLUVJTlZB
TDsKKworCWYtPnBpeGVsZm9ybWF0ID0gVjRMMl9QSVhfRk1UX0pQRUc7CisKKwlyZXR1cm4g
MDsKK30KKworc3RhdGljIGludCBhc3BlZWRfdmlkZW9fZ2V0X2Zvcm1hdChzdHJ1Y3QgZmls
ZSAqZmlsZSwgdm9pZCAqZmgsCisJCQkJICAgc3RydWN0IHY0bDJfZm9ybWF0ICpmKQorewor
CXN0cnVjdCBhc3BlZWRfdmlkZW8gKnZpZGVvID0gdmlkZW9fZHJ2ZGF0YShmaWxlKTsKKwor
CWYtPmZtdC5waXggPSB2aWRlby0+cGl4X2ZtdDsKKworCXJldHVybiAwOworfQorCitzdGF0
aWMgaW50IGFzcGVlZF92aWRlb19lbnVtX2lucHV0KHN0cnVjdCBmaWxlICpmaWxlLCB2b2lk
ICpmaCwKKwkJCQkgICBzdHJ1Y3QgdjRsMl9pbnB1dCAqaW5wKQoreworCXN0cnVjdCBhc3Bl
ZWRfdmlkZW8gKnZpZGVvID0gdmlkZW9fZHJ2ZGF0YShmaWxlKTsKKworCWlmIChpbnAtPmlu
ZGV4KQorCQlyZXR1cm4gLUVJTlZBTDsKKworCXN0cnNjcHkoaW5wLT5uYW1lLCAiSG9zdCBW
R0EgY2FwdHVyZSIsIHNpemVvZihpbnAtPm5hbWUpKTsKKwlpbnAtPnR5cGUgPSBWNEwyX0lO
UFVUX1RZUEVfQ0FNRVJBOworCWlucC0+Y2FwYWJpbGl0aWVzID0gVjRMMl9JTl9DQVBfRFZf
VElNSU5HUzsKKwlpbnAtPnN0YXR1cyA9IHZpZGVvLT52NGwyX2lucHV0X3N0YXR1czsKKwor
CXJldHVybiAwOworfQorCitzdGF0aWMgaW50IGFzcGVlZF92aWRlb19nZXRfaW5wdXQoc3Ry
dWN0IGZpbGUgKmZpbGUsIHZvaWQgKmZoLCB1bnNpZ25lZCBpbnQgKmkpCit7CisJKmkgPSAw
OworCisJcmV0dXJuIDA7Cit9CisKK3N0YXRpYyBpbnQgYXNwZWVkX3ZpZGVvX3NldF9pbnB1
dChzdHJ1Y3QgZmlsZSAqZmlsZSwgdm9pZCAqZmgsIHVuc2lnbmVkIGludCBpKQoreworCWlm
IChpKQorCQlyZXR1cm4gLUVJTlZBTDsKKworCXJldHVybiAwOworfQorCitzdGF0aWMgaW50
IGFzcGVlZF92aWRlb19nZXRfcGFybShzdHJ1Y3QgZmlsZSAqZmlsZSwgdm9pZCAqZmgsCisJ
CQkJIHN0cnVjdCB2NGwyX3N0cmVhbXBhcm0gKmEpCit7CisJc3RydWN0IGFzcGVlZF92aWRl
byAqdmlkZW8gPSB2aWRlb19kcnZkYXRhKGZpbGUpOworCisJYS0+cGFybS5jYXB0dXJlLmNh
cGFiaWxpdHkgPSBWNEwyX0NBUF9USU1FUEVSRlJBTUU7CisJYS0+cGFybS5jYXB0dXJlLnJl
YWRidWZmZXJzID0gMzsKKwlhLT5wYXJtLmNhcHR1cmUudGltZXBlcmZyYW1lLm51bWVyYXRv
ciA9IDE7CisJaWYgKCF2aWRlby0+ZnJhbWVfcmF0ZSkKKwkJYS0+cGFybS5jYXB0dXJlLnRp
bWVwZXJmcmFtZS5kZW5vbWluYXRvciA9IE1BWF9GUkFNRV9SQVRFOworCWVsc2UKKwkJYS0+
cGFybS5jYXB0dXJlLnRpbWVwZXJmcmFtZS5kZW5vbWluYXRvciA9IHZpZGVvLT5mcmFtZV9y
YXRlOworCisJcmV0dXJuIDA7Cit9CisKK3N0YXRpYyBpbnQgYXNwZWVkX3ZpZGVvX3NldF9w
YXJtKHN0cnVjdCBmaWxlICpmaWxlLCB2b2lkICpmaCwKKwkJCQkgc3RydWN0IHY0bDJfc3Ry
ZWFtcGFybSAqYSkKK3sKKwl1bnNpZ25lZCBpbnQgZnJhbWVfcmF0ZSA9IDA7CisJc3RydWN0
IGFzcGVlZF92aWRlbyAqdmlkZW8gPSB2aWRlb19kcnZkYXRhKGZpbGUpOworCisJYS0+cGFy
bS5jYXB0dXJlLmNhcGFiaWxpdHkgPSBWNEwyX0NBUF9USU1FUEVSRlJBTUU7CisJYS0+cGFy
bS5jYXB0dXJlLnJlYWRidWZmZXJzID0gMzsKKworCWlmIChhLT5wYXJtLmNhcHR1cmUudGlt
ZXBlcmZyYW1lLm51bWVyYXRvcikKKwkJZnJhbWVfcmF0ZSA9IGEtPnBhcm0uY2FwdHVyZS50
aW1lcGVyZnJhbWUuZGVub21pbmF0b3IgLworCQkJYS0+cGFybS5jYXB0dXJlLnRpbWVwZXJm
cmFtZS5udW1lcmF0b3I7CisKKwlpZiAoIWZyYW1lX3JhdGUgfHwgZnJhbWVfcmF0ZSA+IE1B
WF9GUkFNRV9SQVRFKSB7CisJCWZyYW1lX3JhdGUgPSAwOworCQlhLT5wYXJtLmNhcHR1cmUu
dGltZXBlcmZyYW1lLmRlbm9taW5hdG9yID0gTUFYX0ZSQU1FX1JBVEU7CisJCWEtPnBhcm0u
Y2FwdHVyZS50aW1lcGVyZnJhbWUubnVtZXJhdG9yID0gMTsKKwl9CisKKwlpZiAodmlkZW8t
PmZyYW1lX3JhdGUgIT0gZnJhbWVfcmF0ZSkgeworCQl2aWRlby0+ZnJhbWVfcmF0ZSA9IGZy
YW1lX3JhdGU7CisJCWFzcGVlZF92aWRlb191cGRhdGUodmlkZW8sIFZFX0NUUkwsIFZFX0NU
UkxfRlJDLAorCQkJCSAgICBGSUVMRF9QUkVQKFZFX0NUUkxfRlJDLCBmcmFtZV9yYXRlKSk7
CisJfQorCisJcmV0dXJuIDA7Cit9CisKK3N0YXRpYyBpbnQgYXNwZWVkX3ZpZGVvX2VudW1f
ZnJhbWVzaXplcyhzdHJ1Y3QgZmlsZSAqZmlsZSwgdm9pZCAqZmgsCisJCQkJCXN0cnVjdCB2
NGwyX2ZybXNpemVlbnVtICpmc2l6ZSkKK3sKKwlzdHJ1Y3QgYXNwZWVkX3ZpZGVvICp2aWRl
byA9IHZpZGVvX2RydmRhdGEoZmlsZSk7CisKKwlpZiAoZnNpemUtPmluZGV4KQorCQlyZXR1
cm4gLUVJTlZBTDsKKworCWlmIChmc2l6ZS0+cGl4ZWxfZm9ybWF0ICE9IFY0TDJfUElYX0ZN
VF9KUEVHKQorCQlyZXR1cm4gLUVJTlZBTDsKKworCWZzaXplLT5kaXNjcmV0ZS53aWR0aCA9
IHZpZGVvLT5waXhfZm10LndpZHRoOworCWZzaXplLT5kaXNjcmV0ZS5oZWlnaHQgPSB2aWRl
by0+cGl4X2ZtdC5oZWlnaHQ7CisJZnNpemUtPnR5cGUgPSBWNEwyX0ZSTVNJWkVfVFlQRV9E
SVNDUkVURTsKKworCXJldHVybiAwOworfQorCitzdGF0aWMgaW50IGFzcGVlZF92aWRlb19l
bnVtX2ZyYW1laW50ZXJ2YWxzKHN0cnVjdCBmaWxlICpmaWxlLCB2b2lkICpmaCwKKwkJCQkJ
ICAgIHN0cnVjdCB2NGwyX2ZybWl2YWxlbnVtICpmaXZhbCkKK3sKKwlzdHJ1Y3QgYXNwZWVk
X3ZpZGVvICp2aWRlbyA9IHZpZGVvX2RydmRhdGEoZmlsZSk7CisKKwlpZiAoZml2YWwtPmlu
ZGV4KQorCQlyZXR1cm4gLUVJTlZBTDsKKworCWlmIChmaXZhbC0+d2lkdGggIT0gdmlkZW8t
PmRldGVjdGVkX3RpbWluZ3Mud2lkdGggfHwKKwkgICAgZml2YWwtPmhlaWdodCAhPSB2aWRl
by0+ZGV0ZWN0ZWRfdGltaW5ncy5oZWlnaHQpCisJCXJldHVybiAtRUlOVkFMOworCisJaWYg
KGZpdmFsLT5waXhlbF9mb3JtYXQgIT0gVjRMMl9QSVhfRk1UX0pQRUcpCisJCXJldHVybiAt
RUlOVkFMOworCisJZml2YWwtPnR5cGUgPSBWNEwyX0ZSTUlWQUxfVFlQRV9DT05USU5VT1VT
OworCisJZml2YWwtPnN0ZXB3aXNlLm1pbi5kZW5vbWluYXRvciA9IE1BWF9GUkFNRV9SQVRF
OworCWZpdmFsLT5zdGVwd2lzZS5taW4ubnVtZXJhdG9yID0gMTsKKwlmaXZhbC0+c3RlcHdp
c2UubWF4LmRlbm9taW5hdG9yID0gMTsKKwlmaXZhbC0+c3RlcHdpc2UubWF4Lm51bWVyYXRv
ciA9IDE7CisJZml2YWwtPnN0ZXB3aXNlLnN0ZXAgPSBmaXZhbC0+c3RlcHdpc2UubWF4Owor
CisJcmV0dXJuIDA7Cit9CisKK3N0YXRpYyBpbnQgYXNwZWVkX3ZpZGVvX3NldF9kdl90aW1p
bmdzKHN0cnVjdCBmaWxlICpmaWxlLCB2b2lkICpmaCwKKwkJCQkgICAgICAgc3RydWN0IHY0
bDJfZHZfdGltaW5ncyAqdGltaW5ncykKK3sKKwlzdHJ1Y3QgYXNwZWVkX3ZpZGVvICp2aWRl
byA9IHZpZGVvX2RydmRhdGEoZmlsZSk7CisKKwlpZiAodGltaW5ncy0+YnQud2lkdGggPT0g
dmlkZW8tPmFjdGl2ZV90aW1pbmdzLndpZHRoICYmCisJICAgIHRpbWluZ3MtPmJ0LmhlaWdo
dCA9PSB2aWRlby0+YWN0aXZlX3RpbWluZ3MuaGVpZ2h0KQorCQlyZXR1cm4gMDsKKworCWlm
ICh2YjJfaXNfYnVzeSgmdmlkZW8tPnF1ZXVlKSkKKwkJcmV0dXJuIC1FQlVTWTsKKworCXZp
ZGVvLT5hY3RpdmVfdGltaW5ncyA9IHRpbWluZ3MtPmJ0OworCisJYXNwZWVkX3ZpZGVvX3Nl
dF9yZXNvbHV0aW9uKHZpZGVvKTsKKworCXZpZGVvLT5waXhfZm10LndpZHRoID0gdGltaW5n
cy0+YnQud2lkdGg7CisJdmlkZW8tPnBpeF9mbXQuaGVpZ2h0ID0gdGltaW5ncy0+YnQuaGVp
Z2h0OworCXZpZGVvLT5waXhfZm10LnNpemVpbWFnZSA9IHZpZGVvLT5tYXhfY29tcHJlc3Nl
ZF9zaXplOworCisJdGltaW5ncy0+dHlwZSA9IFY0TDJfRFZfQlRfNjU2XzExMjA7CisKKwly
ZXR1cm4gMDsKK30KKworc3RhdGljIGludCBhc3BlZWRfdmlkZW9fZ2V0X2R2X3RpbWluZ3Mo
c3RydWN0IGZpbGUgKmZpbGUsIHZvaWQgKmZoLAorCQkJCSAgICAgICBzdHJ1Y3QgdjRsMl9k
dl90aW1pbmdzICp0aW1pbmdzKQoreworCXN0cnVjdCBhc3BlZWRfdmlkZW8gKnZpZGVvID0g
dmlkZW9fZHJ2ZGF0YShmaWxlKTsKKworCXRpbWluZ3MtPnR5cGUgPSBWNEwyX0RWX0JUXzY1
Nl8xMTIwOworCXRpbWluZ3MtPmJ0ID0gdmlkZW8tPmFjdGl2ZV90aW1pbmdzOworCisJcmV0
dXJuIDA7Cit9CisKK3N0YXRpYyBpbnQgYXNwZWVkX3ZpZGVvX3F1ZXJ5X2R2X3RpbWluZ3Mo
c3RydWN0IGZpbGUgKmZpbGUsIHZvaWQgKmZoLAorCQkJCQkgc3RydWN0IHY0bDJfZHZfdGlt
aW5ncyAqdGltaW5ncykKK3sKKwlpbnQgcmM7CisJc3RydWN0IGFzcGVlZF92aWRlbyAqdmlk
ZW8gPSB2aWRlb19kcnZkYXRhKGZpbGUpOworCisJLyoKKwkgKiBUaGlzIGJsb2NrcyBvbmx5
IGlmIHRoZSBkcml2ZXIgaXMgY3VycmVudGx5IGluIHRoZSBwcm9jZXNzIG9mCisJICogZGV0
ZWN0aW5nIGEgbmV3IHJlc29sdXRpb247IGluIHRoZSBldmVudCBvZiBubyBzaWduYWwgb3Ig
dGltZW91dAorCSAqIHRoaXMgZnVuY3Rpb24gaXMgd29rZW4gdXAuCisJICovCisJaWYgKGZp
bGUtPmZfZmxhZ3MgJiBPX05PTkJMT0NLKSB7CisJCWlmICh0ZXN0X2JpdChWSURFT19SRVNf
Q0hBTkdFLCAmdmlkZW8tPmZsYWdzKSkKKwkJCXJldHVybiAtRUFHQUlOOworCX0gZWxzZSB7
CisJCXJjID0gd2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxlKHZpZGVvLT53YWl0LAorCQkJCQkg
ICAgICAhdGVzdF9iaXQoVklERU9fUkVTX0NIQU5HRSwKKwkJCQkJCQkmdmlkZW8tPmZsYWdz
KSk7CisJCWlmIChyYykKKwkJCXJldHVybiAtRUlOVFI7CisJfQorCisJdGltaW5ncy0+dHlw
ZSA9IFY0TDJfRFZfQlRfNjU2XzExMjA7CisJdGltaW5ncy0+YnQgPSB2aWRlby0+ZGV0ZWN0
ZWRfdGltaW5nczsKKworCXJldHVybiB2aWRlby0+djRsMl9pbnB1dF9zdGF0dXMgPyAtRU5P
TElOSyA6IDA7Cit9CisKK3N0YXRpYyBpbnQgYXNwZWVkX3ZpZGVvX2VudW1fZHZfdGltaW5n
cyhzdHJ1Y3QgZmlsZSAqZmlsZSwgdm9pZCAqZmgsCisJCQkJCXN0cnVjdCB2NGwyX2VudW1f
ZHZfdGltaW5ncyAqdGltaW5ncykKK3sKKwlyZXR1cm4gdjRsMl9lbnVtX2R2X3RpbWluZ3Nf
Y2FwKHRpbWluZ3MsICZhc3BlZWRfdmlkZW9fdGltaW5nc19jYXAsCisJCQkJCU5VTEwsIE5V
TEwpOworfQorCitzdGF0aWMgaW50IGFzcGVlZF92aWRlb19kdl90aW1pbmdzX2NhcChzdHJ1
Y3QgZmlsZSAqZmlsZSwgdm9pZCAqZmgsCisJCQkJICAgICAgIHN0cnVjdCB2NGwyX2R2X3Rp
bWluZ3NfY2FwICpjYXApCit7CisJKmNhcCA9IGFzcGVlZF92aWRlb190aW1pbmdzX2NhcDsK
KworCXJldHVybiAwOworfQorCitzdGF0aWMgaW50IGFzcGVlZF92aWRlb19zdWJfZXZlbnQo
c3RydWN0IHY0bDJfZmggKmZoLAorCQkJCSAgY29uc3Qgc3RydWN0IHY0bDJfZXZlbnRfc3Vi
c2NyaXB0aW9uICpzdWIpCit7CisJc3dpdGNoIChzdWItPnR5cGUpIHsKKwljYXNlIFY0TDJf
RVZFTlRfU09VUkNFX0NIQU5HRToKKwkJcmV0dXJuIHY0bDJfc3JjX2NoYW5nZV9ldmVudF9z
dWJzY3JpYmUoZmgsIHN1Yik7CisJfQorCisJcmV0dXJuIHY0bDJfY3RybF9zdWJzY3JpYmVf
ZXZlbnQoZmgsIHN1Yik7Cit9CisKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgdjRsMl9pb2N0bF9v
cHMgYXNwZWVkX3ZpZGVvX2lvY3RsX29wcyA9IHsKKwkudmlkaW9jX3F1ZXJ5Y2FwID0gYXNw
ZWVkX3ZpZGVvX3F1ZXJ5Y2FwLAorCisJLnZpZGlvY19lbnVtX2ZtdF92aWRfY2FwID0gYXNw
ZWVkX3ZpZGVvX2VudW1fZm9ybWF0LAorCS52aWRpb2NfZ19mbXRfdmlkX2NhcCA9IGFzcGVl
ZF92aWRlb19nZXRfZm9ybWF0LAorCS52aWRpb2Nfc19mbXRfdmlkX2NhcCA9IGFzcGVlZF92
aWRlb19nZXRfZm9ybWF0LAorCS52aWRpb2NfdHJ5X2ZtdF92aWRfY2FwID0gYXNwZWVkX3Zp
ZGVvX2dldF9mb3JtYXQsCisKKwkudmlkaW9jX3JlcWJ1ZnMgPSB2YjJfaW9jdGxfcmVxYnVm
cywKKwkudmlkaW9jX3F1ZXJ5YnVmID0gdmIyX2lvY3RsX3F1ZXJ5YnVmLAorCS52aWRpb2Nf
cWJ1ZiA9IHZiMl9pb2N0bF9xYnVmLAorCS52aWRpb2NfZXhwYnVmID0gdmIyX2lvY3RsX2V4
cGJ1ZiwKKwkudmlkaW9jX2RxYnVmID0gdmIyX2lvY3RsX2RxYnVmLAorCS52aWRpb2NfY3Jl
YXRlX2J1ZnMgPSB2YjJfaW9jdGxfY3JlYXRlX2J1ZnMsCisJLnZpZGlvY19wcmVwYXJlX2J1
ZiA9IHZiMl9pb2N0bF9wcmVwYXJlX2J1ZiwKKwkudmlkaW9jX3N0cmVhbW9uID0gdmIyX2lv
Y3RsX3N0cmVhbW9uLAorCS52aWRpb2Nfc3RyZWFtb2ZmID0gdmIyX2lvY3RsX3N0cmVhbW9m
ZiwKKworCS52aWRpb2NfZW51bV9pbnB1dCA9IGFzcGVlZF92aWRlb19lbnVtX2lucHV0LAor
CS52aWRpb2NfZ19pbnB1dCA9IGFzcGVlZF92aWRlb19nZXRfaW5wdXQsCisJLnZpZGlvY19z
X2lucHV0ID0gYXNwZWVkX3ZpZGVvX3NldF9pbnB1dCwKKworCS52aWRpb2NfZ19wYXJtID0g
YXNwZWVkX3ZpZGVvX2dldF9wYXJtLAorCS52aWRpb2Nfc19wYXJtID0gYXNwZWVkX3ZpZGVv
X3NldF9wYXJtLAorCS52aWRpb2NfZW51bV9mcmFtZXNpemVzID0gYXNwZWVkX3ZpZGVvX2Vu
dW1fZnJhbWVzaXplcywKKwkudmlkaW9jX2VudW1fZnJhbWVpbnRlcnZhbHMgPSBhc3BlZWRf
dmlkZW9fZW51bV9mcmFtZWludGVydmFscywKKworCS52aWRpb2Nfc19kdl90aW1pbmdzID0g
YXNwZWVkX3ZpZGVvX3NldF9kdl90aW1pbmdzLAorCS52aWRpb2NfZ19kdl90aW1pbmdzID0g
YXNwZWVkX3ZpZGVvX2dldF9kdl90aW1pbmdzLAorCS52aWRpb2NfcXVlcnlfZHZfdGltaW5n
cyA9IGFzcGVlZF92aWRlb19xdWVyeV9kdl90aW1pbmdzLAorCS52aWRpb2NfZW51bV9kdl90
aW1pbmdzID0gYXNwZWVkX3ZpZGVvX2VudW1fZHZfdGltaW5ncywKKwkudmlkaW9jX2R2X3Rp
bWluZ3NfY2FwID0gYXNwZWVkX3ZpZGVvX2R2X3RpbWluZ3NfY2FwLAorCisJLnZpZGlvY19z
dWJzY3JpYmVfZXZlbnQgPSBhc3BlZWRfdmlkZW9fc3ViX2V2ZW50LAorCS52aWRpb2NfdW5z
dWJzY3JpYmVfZXZlbnQgPSB2NGwyX2V2ZW50X3Vuc3Vic2NyaWJlLAorfTsKKworc3RhdGlj
IHZvaWQgYXNwZWVkX3ZpZGVvX3VwZGF0ZV9qcGVnX3F1YWxpdHkoc3RydWN0IGFzcGVlZF92
aWRlbyAqdmlkZW8pCit7CisJdTMyIGNvbXBfY3RybCA9IEZJRUxEX1BSRVAoVkVfQ09NUF9D
VFJMX0RDVF9MVU0sIHZpZGVvLT5qcGVnX3F1YWxpdHkpIHwKKwkJRklFTERfUFJFUChWRV9D
T01QX0NUUkxfRENUX0NIUiwgdmlkZW8tPmpwZWdfcXVhbGl0eSB8IDB4MTApOworCisJYXNw
ZWVkX3ZpZGVvX3VwZGF0ZSh2aWRlbywgVkVfQ09NUF9DVFJMLAorCQkJICAgIFZFX0NPTVBf
Q1RSTF9EQ1RfTFVNIHwgVkVfQ09NUF9DVFJMX0RDVF9DSFIsCisJCQkgICAgY29tcF9jdHJs
KTsKK30KKworc3RhdGljIHZvaWQgYXNwZWVkX3ZpZGVvX3VwZGF0ZV9zdWJzYW1wbGluZyhz
dHJ1Y3QgYXNwZWVkX3ZpZGVvICp2aWRlbykKK3sKKwlpZiAodmlkZW8tPmpwZWcudmlydCkK
KwkJYXNwZWVkX3ZpZGVvX2luaXRfanBlZ190YWJsZSh2aWRlby0+anBlZy52aXJ0LCB2aWRl
by0+eXV2NDIwKTsKKworCWlmICh2aWRlby0+eXV2NDIwKQorCQlhc3BlZWRfdmlkZW9fdXBk
YXRlKHZpZGVvLCBWRV9TRVFfQ1RSTCwgMCwgVkVfU0VRX0NUUkxfWVVWNDIwKTsKKwllbHNl
CisJCWFzcGVlZF92aWRlb191cGRhdGUodmlkZW8sIFZFX1NFUV9DVFJMLCBWRV9TRVFfQ1RS
TF9ZVVY0MjAsIDApOworfQorCitzdGF0aWMgaW50IGFzcGVlZF92aWRlb19zZXRfY3RybChz
dHJ1Y3QgdjRsMl9jdHJsICpjdHJsKQoreworCXN0cnVjdCBhc3BlZWRfdmlkZW8gKnZpZGVv
ID0gY29udGFpbmVyX29mKGN0cmwtPmhhbmRsZXIsCisJCQkJCQkgIHN0cnVjdCBhc3BlZWRf
dmlkZW8sCisJCQkJCQkgIGN0cmxfaGFuZGxlcik7CisKKwlzd2l0Y2ggKGN0cmwtPmlkKSB7
CisJY2FzZSBWNEwyX0NJRF9KUEVHX0NPTVBSRVNTSU9OX1FVQUxJVFk6CisJCXZpZGVvLT5q
cGVnX3F1YWxpdHkgPSBjdHJsLT52YWw7CisJCWFzcGVlZF92aWRlb191cGRhdGVfanBlZ19x
dWFsaXR5KHZpZGVvKTsKKwkJYnJlYWs7CisJY2FzZSBWNEwyX0NJRF9KUEVHX0NIUk9NQV9T
VUJTQU1QTElORzoKKwkJaWYgKGN0cmwtPnZhbCA9PSBWNEwyX0pQRUdfQ0hST01BX1NVQlNB
TVBMSU5HXzQyMCkgeworCQkJdmlkZW8tPnl1djQyMCA9IHRydWU7CisJCQlhc3BlZWRfdmlk
ZW9fdXBkYXRlX3N1YnNhbXBsaW5nKHZpZGVvKTsKKwkJfSBlbHNlIHsKKwkJCXZpZGVvLT55
dXY0MjAgPSBmYWxzZTsKKwkJCWFzcGVlZF92aWRlb191cGRhdGVfc3Vic2FtcGxpbmcodmlk
ZW8pOworCQl9CisJCWJyZWFrOworCWRlZmF1bHQ6CisJCXJldHVybiAtRUlOVkFMOworCX0K
KworCXJldHVybiAwOworfQorCitzdGF0aWMgY29uc3Qgc3RydWN0IHY0bDJfY3RybF9vcHMg
YXNwZWVkX3ZpZGVvX2N0cmxfb3BzID0geworCS5zX2N0cmwgPSBhc3BlZWRfdmlkZW9fc2V0
X2N0cmwsCit9OworCitzdGF0aWMgdm9pZCBhc3BlZWRfdmlkZW9fcmVzb2x1dGlvbl93b3Jr
KHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKK3sKKwlzdHJ1Y3QgZGVsYXllZF93b3JrICpk
d29yayA9IHRvX2RlbGF5ZWRfd29yayh3b3JrKTsKKwlzdHJ1Y3QgYXNwZWVkX3ZpZGVvICp2
aWRlbyA9IGNvbnRhaW5lcl9vZihkd29yaywgc3RydWN0IGFzcGVlZF92aWRlbywKKwkJCQkJ
CSAgcmVzX3dvcmspOworCXUzMiBpbnB1dF9zdGF0dXMgPSB2aWRlby0+djRsMl9pbnB1dF9z
dGF0dXM7CisKKwlhc3BlZWRfdmlkZW9fb24odmlkZW8pOworCisJLyogRXhpdCBlYXJseSBp
biBjYXNlIG5vIGNsaWVudHMgcmVtYWluICovCisJaWYgKHRlc3RfYml0KFZJREVPX1NUT1BQ
RUQsICZ2aWRlby0+ZmxhZ3MpKQorCQlnb3RvIGRvbmU7CisKKwlhc3BlZWRfdmlkZW9faW5p
dF9yZWdzKHZpZGVvKTsKKworCWFzcGVlZF92aWRlb19nZXRfcmVzb2x1dGlvbih2aWRlbyk7
CisKKwlpZiAodmlkZW8tPmRldGVjdGVkX3RpbWluZ3Mud2lkdGggIT0gdmlkZW8tPmFjdGl2
ZV90aW1pbmdzLndpZHRoIHx8CisJICAgIHZpZGVvLT5kZXRlY3RlZF90aW1pbmdzLmhlaWdo
dCAhPSB2aWRlby0+YWN0aXZlX3RpbWluZ3MuaGVpZ2h0IHx8CisJICAgIGlucHV0X3N0YXR1
cyAhPSB2aWRlby0+djRsMl9pbnB1dF9zdGF0dXMpIHsKKwkJc3RhdGljIGNvbnN0IHN0cnVj
dCB2NGwyX2V2ZW50IGV2ID0geworCQkJLnR5cGUgPSBWNEwyX0VWRU5UX1NPVVJDRV9DSEFO
R0UsCisJCQkudS5zcmNfY2hhbmdlLmNoYW5nZXMgPSBWNEwyX0VWRU5UX1NSQ19DSF9SRVNP
TFVUSU9OLAorCQl9OworCisJCXY0bDJfZXZlbnRfcXVldWUoJnZpZGVvLT52ZGV2LCAmZXYp
OworCX0gZWxzZSBpZiAodGVzdF9iaXQoVklERU9fU1RSRUFNSU5HLCAmdmlkZW8tPmZsYWdz
KSkgeworCQkvKiBObyByZXNvbHV0aW9uIGNoYW5nZSBzbyBqdXN0IHJlc3RhcnQgc3RyZWFt
aW5nICovCisJCWFzcGVlZF92aWRlb19zdGFydF9mcmFtZSh2aWRlbyk7CisJfQorCitkb25l
OgorCWNsZWFyX2JpdChWSURFT19SRVNfQ0hBTkdFLCAmdmlkZW8tPmZsYWdzKTsKKwl3YWtl
X3VwX2ludGVycnVwdGlibGVfYWxsKCZ2aWRlby0+d2FpdCk7Cit9CisKK3N0YXRpYyBpbnQg
YXNwZWVkX3ZpZGVvX29wZW4oc3RydWN0IGZpbGUgKmZpbGUpCit7CisJaW50IHJjOworCXN0
cnVjdCBhc3BlZWRfdmlkZW8gKnZpZGVvID0gdmlkZW9fZHJ2ZGF0YShmaWxlKTsKKworCW11
dGV4X2xvY2soJnZpZGVvLT52aWRlb19sb2NrKTsKKworCXJjID0gdjRsMl9maF9vcGVuKGZp
bGUpOworCWlmIChyYykgeworCQltdXRleF91bmxvY2soJnZpZGVvLT52aWRlb19sb2NrKTsK
KwkJcmV0dXJuIHJjOworCX0KKworCWlmICh2NGwyX2ZoX2lzX3Npbmd1bGFyX2ZpbGUoZmls
ZSkpCisJCWFzcGVlZF92aWRlb19zdGFydCh2aWRlbyk7CisKKwltdXRleF91bmxvY2soJnZp
ZGVvLT52aWRlb19sb2NrKTsKKworCXJldHVybiAwOworfQorCitzdGF0aWMgaW50IGFzcGVl
ZF92aWRlb19yZWxlYXNlKHN0cnVjdCBmaWxlICpmaWxlKQoreworCWludCByYzsKKwlzdHJ1
Y3QgYXNwZWVkX3ZpZGVvICp2aWRlbyA9IHZpZGVvX2RydmRhdGEoZmlsZSk7CisKKwltdXRl
eF9sb2NrKCZ2aWRlby0+dmlkZW9fbG9jayk7CisKKwlpZiAodjRsMl9maF9pc19zaW5ndWxh
cl9maWxlKGZpbGUpKQorCQlhc3BlZWRfdmlkZW9fc3RvcCh2aWRlbyk7CisKKwlyYyA9IF92
YjJfZm9wX3JlbGVhc2UoZmlsZSwgTlVMTCk7CisKKwltdXRleF91bmxvY2soJnZpZGVvLT52
aWRlb19sb2NrKTsKKworCXJldHVybiByYzsKK30KKworc3RhdGljIGNvbnN0IHN0cnVjdCB2
NGwyX2ZpbGVfb3BlcmF0aW9ucyBhc3BlZWRfdmlkZW9fdjRsMl9mb3BzID0geworCS5vd25l
ciA9IFRISVNfTU9EVUxFLAorCS5yZWFkID0gdmIyX2ZvcF9yZWFkLAorCS5wb2xsID0gdmIy
X2ZvcF9wb2xsLAorCS51bmxvY2tlZF9pb2N0bCA9IHZpZGVvX2lvY3RsMiwKKwkubW1hcCA9
IHZiMl9mb3BfbW1hcCwKKwkub3BlbiA9IGFzcGVlZF92aWRlb19vcGVuLAorCS5yZWxlYXNl
ID0gYXNwZWVkX3ZpZGVvX3JlbGVhc2UsCit9OworCitzdGF0aWMgaW50IGFzcGVlZF92aWRl
b19xdWV1ZV9zZXR1cChzdHJ1Y3QgdmIyX3F1ZXVlICpxLAorCQkJCSAgICB1bnNpZ25lZCBp
bnQgKm51bV9idWZmZXJzLAorCQkJCSAgICB1bnNpZ25lZCBpbnQgKm51bV9wbGFuZXMsCisJ
CQkJICAgIHVuc2lnbmVkIGludCBzaXplc1tdLAorCQkJCSAgICBzdHJ1Y3QgZGV2aWNlICph
bGxvY19kZXZzW10pCit7CisJc3RydWN0IGFzcGVlZF92aWRlbyAqdmlkZW8gPSB2YjJfZ2V0
X2Rydl9wcml2KHEpOworCisJaWYgKCpudW1fcGxhbmVzKSB7CisJCWlmIChzaXplc1swXSA8
IHZpZGVvLT5tYXhfY29tcHJlc3NlZF9zaXplKQorCQkJcmV0dXJuIC1FSU5WQUw7CisKKwkJ
cmV0dXJuIDA7CisJfQorCisJKm51bV9wbGFuZXMgPSAxOworCXNpemVzWzBdID0gdmlkZW8t
Pm1heF9jb21wcmVzc2VkX3NpemU7CisKKwlyZXR1cm4gMDsKK30KKworc3RhdGljIGludCBh
c3BlZWRfdmlkZW9fYnVmX3ByZXBhcmUoc3RydWN0IHZiMl9idWZmZXIgKnZiKQoreworCXN0
cnVjdCBhc3BlZWRfdmlkZW8gKnZpZGVvID0gdmIyX2dldF9kcnZfcHJpdih2Yi0+dmIyX3F1
ZXVlKTsKKworCWlmICh2YjJfcGxhbmVfc2l6ZSh2YiwgMCkgPCB2aWRlby0+bWF4X2NvbXBy
ZXNzZWRfc2l6ZSkKKwkJcmV0dXJuIC1FSU5WQUw7CisKKwlyZXR1cm4gMDsKK30KKworc3Rh
dGljIGludCBhc3BlZWRfdmlkZW9fc3RhcnRfc3RyZWFtaW5nKHN0cnVjdCB2YjJfcXVldWUg
KnEsCisJCQkJCXVuc2lnbmVkIGludCBjb3VudCkKK3sKKwlpbnQgcmM7CisJc3RydWN0IGFz
cGVlZF92aWRlbyAqdmlkZW8gPSB2YjJfZ2V0X2Rydl9wcml2KHEpOworCisJdmlkZW8tPnNl
cXVlbmNlID0gMDsKKworCXJjID0gYXNwZWVkX3ZpZGVvX3N0YXJ0X2ZyYW1lKHZpZGVvKTsK
KwlpZiAocmMpIHsKKwkJYXNwZWVkX3ZpZGVvX2J1ZnNfZG9uZSh2aWRlbywgVkIyX0JVRl9T
VEFURV9RVUVVRUQpOworCQlyZXR1cm4gcmM7CisJfQorCisJc2V0X2JpdChWSURFT19TVFJF
QU1JTkcsICZ2aWRlby0+ZmxhZ3MpOworCXJldHVybiAwOworfQorCitzdGF0aWMgdm9pZCBh
c3BlZWRfdmlkZW9fc3RvcF9zdHJlYW1pbmcoc3RydWN0IHZiMl9xdWV1ZSAqcSkKK3sKKwlp
bnQgcmM7CisJc3RydWN0IGFzcGVlZF92aWRlbyAqdmlkZW8gPSB2YjJfZ2V0X2Rydl9wcml2
KHEpOworCisJY2xlYXJfYml0KFZJREVPX1NUUkVBTUlORywgJnZpZGVvLT5mbGFncyk7CisK
KwlyYyA9IHdhaXRfZXZlbnRfdGltZW91dCh2aWRlby0+d2FpdCwKKwkJCQkhdGVzdF9iaXQo
VklERU9fRlJBTUVfSU5QUkcsICZ2aWRlby0+ZmxhZ3MpLAorCQkJCVNUT1BfVElNRU9VVCk7
CisJaWYgKCFyYykgeworCQlkZXZfZXJyKHZpZGVvLT5kZXYsICJUaW1lZCBvdXQgd2hlbiBz
dG9wcGluZyBzdHJlYW1pbmdcbiIpOworCisJCS8qCisJCSAqIE5lZWQgdG8gZm9yY2Ugc3Rv
cCBhbnkgRE1BIGFuZCB0cnkgYW5kIGdldCBIVyBpbnRvIGEgZ29vZAorCQkgKiBzdGF0ZSBm
b3IgZnV0dXJlIGNhbGxzIHRvIHN0YXJ0IHN0cmVhbWluZyBhZ2Fpbi4KKwkJICovCisJCWFz
cGVlZF92aWRlb19yZXNldCh2aWRlbyk7CisJCWFzcGVlZF92aWRlb19pbml0X3JlZ3Modmlk
ZW8pOworCisJCWFzcGVlZF92aWRlb19nZXRfcmVzb2x1dGlvbih2aWRlbyk7CisJfQorCisJ
YXNwZWVkX3ZpZGVvX2J1ZnNfZG9uZSh2aWRlbywgVkIyX0JVRl9TVEFURV9FUlJPUik7Cit9
CisKK3N0YXRpYyB2b2lkIGFzcGVlZF92aWRlb19idWZfcXVldWUoc3RydWN0IHZiMl9idWZm
ZXIgKnZiKQoreworCWJvb2wgZW1wdHk7CisJc3RydWN0IGFzcGVlZF92aWRlbyAqdmlkZW8g
PSB2YjJfZ2V0X2Rydl9wcml2KHZiLT52YjJfcXVldWUpOworCXN0cnVjdCB2YjJfdjRsMl9i
dWZmZXIgKnZidWYgPSB0b192YjJfdjRsMl9idWZmZXIodmIpOworCXN0cnVjdCBhc3BlZWRf
dmlkZW9fYnVmZmVyICphdmIgPSB0b19hc3BlZWRfdmlkZW9fYnVmZmVyKHZidWYpOworCXVu
c2lnbmVkIGxvbmcgZmxhZ3M7CisKKwlzcGluX2xvY2tfaXJxc2F2ZSgmdmlkZW8tPmxvY2ss
IGZsYWdzKTsKKwllbXB0eSA9IGxpc3RfZW1wdHkoJnZpZGVvLT5idWZmZXJzKTsKKwlsaXN0
X2FkZF90YWlsKCZhdmItPmxpbmssICZ2aWRlby0+YnVmZmVycyk7CisJc3Bpbl91bmxvY2tf
aXJxcmVzdG9yZSgmdmlkZW8tPmxvY2ssIGZsYWdzKTsKKworCWlmICh0ZXN0X2JpdChWSURF
T19TVFJFQU1JTkcsICZ2aWRlby0+ZmxhZ3MpICYmCisJICAgICF0ZXN0X2JpdChWSURFT19G
UkFNRV9JTlBSRywgJnZpZGVvLT5mbGFncykgJiYgZW1wdHkpCisJCWFzcGVlZF92aWRlb19z
dGFydF9mcmFtZSh2aWRlbyk7Cit9CisKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgdmIyX29wcyBh
c3BlZWRfdmlkZW9fdmIyX29wcyA9IHsKKwkucXVldWVfc2V0dXAgPSBhc3BlZWRfdmlkZW9f
cXVldWVfc2V0dXAsCisJLndhaXRfcHJlcGFyZSA9IHZiMl9vcHNfd2FpdF9wcmVwYXJlLAor
CS53YWl0X2ZpbmlzaCA9IHZiMl9vcHNfd2FpdF9maW5pc2gsCisJLmJ1Zl9wcmVwYXJlID0g
YXNwZWVkX3ZpZGVvX2J1Zl9wcmVwYXJlLAorCS5zdGFydF9zdHJlYW1pbmcgPSBhc3BlZWRf
dmlkZW9fc3RhcnRfc3RyZWFtaW5nLAorCS5zdG9wX3N0cmVhbWluZyA9IGFzcGVlZF92aWRl
b19zdG9wX3N0cmVhbWluZywKKwkuYnVmX3F1ZXVlID0gIGFzcGVlZF92aWRlb19idWZfcXVl
dWUsCit9OworCitzdGF0aWMgaW50IGFzcGVlZF92aWRlb19zZXR1cF92aWRlbyhzdHJ1Y3Qg
YXNwZWVkX3ZpZGVvICp2aWRlbykKK3sKKwljb25zdCB1NjQgbWFzayA9IH4oQklUKFY0TDJf
SlBFR19DSFJPTUFfU1VCU0FNUExJTkdfNDQ0KSB8CisJCQkgICBCSVQoVjRMMl9KUEVHX0NI
Uk9NQV9TVUJTQU1QTElOR180MjApKTsKKwlzdHJ1Y3QgdjRsMl9kZXZpY2UgKnY0bDJfZGV2
ID0gJnZpZGVvLT52NGwyX2RldjsKKwlzdHJ1Y3QgdmIyX3F1ZXVlICp2YnEgPSAmdmlkZW8t
PnF1ZXVlOworCXN0cnVjdCB2aWRlb19kZXZpY2UgKnZkZXYgPSAmdmlkZW8tPnZkZXY7CisJ
aW50IHJjOworCisJdmlkZW8tPnBpeF9mbXQucGl4ZWxmb3JtYXQgPSBWNEwyX1BJWF9GTVRf
SlBFRzsKKwl2aWRlby0+cGl4X2ZtdC5maWVsZCA9IFY0TDJfRklFTERfTk9ORTsKKwl2aWRl
by0+cGl4X2ZtdC5jb2xvcnNwYWNlID0gVjRMMl9DT0xPUlNQQUNFX1NSR0I7CisJdmlkZW8t
PnBpeF9mbXQucXVhbnRpemF0aW9uID0gVjRMMl9RVUFOVElaQVRJT05fRlVMTF9SQU5HRTsK
Kwl2aWRlby0+djRsMl9pbnB1dF9zdGF0dXMgPSBWNEwyX0lOX1NUX05PX1NJR05BTDsKKwor
CXJjID0gdjRsMl9kZXZpY2VfcmVnaXN0ZXIodmlkZW8tPmRldiwgdjRsMl9kZXYpOworCWlm
IChyYykgeworCQlkZXZfZXJyKHZpZGVvLT5kZXYsICJGYWlsZWQgdG8gcmVnaXN0ZXIgdjRs
MiBkZXZpY2VcbiIpOworCQlyZXR1cm4gcmM7CisJfQorCisJdjRsMl9jdHJsX2hhbmRsZXJf
aW5pdCgmdmlkZW8tPmN0cmxfaGFuZGxlciwgMik7CisJdjRsMl9jdHJsX25ld19zdGQoJnZp
ZGVvLT5jdHJsX2hhbmRsZXIsICZhc3BlZWRfdmlkZW9fY3RybF9vcHMsCisJCQkgIFY0TDJf
Q0lEX0pQRUdfQ09NUFJFU1NJT05fUVVBTElUWSwgMCwKKwkJCSAgQVNQRUVEX1ZJREVPX0pQ
RUdfTlVNX1FVQUxJVElFUyAtIDEsIDEsIDApOworCXY0bDJfY3RybF9uZXdfc3RkX21lbnUo
JnZpZGVvLT5jdHJsX2hhbmRsZXIsICZhc3BlZWRfdmlkZW9fY3RybF9vcHMsCisJCQkgICAg
ICAgVjRMMl9DSURfSlBFR19DSFJPTUFfU1VCU0FNUExJTkcsCisJCQkgICAgICAgVjRMMl9K
UEVHX0NIUk9NQV9TVUJTQU1QTElOR180MjAsIG1hc2ssCisJCQkgICAgICAgVjRMMl9KUEVH
X0NIUk9NQV9TVUJTQU1QTElOR180NDQpOworCisJaWYgKHZpZGVvLT5jdHJsX2hhbmRsZXIu
ZXJyb3IpIHsKKwkJdjRsMl9jdHJsX2hhbmRsZXJfZnJlZSgmdmlkZW8tPmN0cmxfaGFuZGxl
cik7CisJCXY0bDJfZGV2aWNlX3VucmVnaXN0ZXIodjRsMl9kZXYpOworCisJCWRldl9lcnIo
dmlkZW8tPmRldiwgIkZhaWxlZCB0byBpbml0IGNvbnRyb2xzOiAlZFxuIiwKKwkJCXZpZGVv
LT5jdHJsX2hhbmRsZXIuZXJyb3IpOworCQlyZXR1cm4gcmM7CisJfQorCisJdjRsMl9kZXYt
PmN0cmxfaGFuZGxlciA9ICZ2aWRlby0+Y3RybF9oYW5kbGVyOworCisJdmJxLT50eXBlID0g
VjRMMl9CVUZfVFlQRV9WSURFT19DQVBUVVJFOworCXZicS0+aW9fbW9kZXMgPSBWQjJfTU1B
UCB8IFZCMl9SRUFEIHwgVkIyX0RNQUJVRjsKKwl2YnEtPmRldiA9IHY0bDJfZGV2LT5kZXY7
CisJdmJxLT5sb2NrID0gJnZpZGVvLT52aWRlb19sb2NrOworCXZicS0+b3BzID0gJmFzcGVl
ZF92aWRlb192YjJfb3BzOworCXZicS0+bWVtX29wcyA9ICZ2YjJfZG1hX2NvbnRpZ19tZW1v
cHM7CisJdmJxLT5kcnZfcHJpdiA9IHZpZGVvOworCXZicS0+YnVmX3N0cnVjdF9zaXplID0g
c2l6ZW9mKHN0cnVjdCBhc3BlZWRfdmlkZW9fYnVmZmVyKTsKKwl2YnEtPnRpbWVzdGFtcF9m
bGFncyA9IFY0TDJfQlVGX0ZMQUdfVElNRVNUQU1QX01PTk9UT05JQzsKKwl2YnEtPm1pbl9i
dWZmZXJzX25lZWRlZCA9IDM7CisKKwlyYyA9IHZiMl9xdWV1ZV9pbml0KHZicSk7CisJaWYg
KHJjKSB7CisJCXY0bDJfY3RybF9oYW5kbGVyX2ZyZWUoJnZpZGVvLT5jdHJsX2hhbmRsZXIp
OworCQl2NGwyX2RldmljZV91bnJlZ2lzdGVyKHY0bDJfZGV2KTsKKworCQlkZXZfZXJyKHZp
ZGVvLT5kZXYsICJGYWlsZWQgdG8gaW5pdCB2YjIgcXVldWVcbiIpOworCQlyZXR1cm4gcmM7
CisJfQorCisJdmRldi0+cXVldWUgPSB2YnE7CisJdmRldi0+Zm9wcyA9ICZhc3BlZWRfdmlk
ZW9fdjRsMl9mb3BzOworCXZkZXYtPmRldmljZV9jYXBzID0gVjRMMl9DQVBfVklERU9fQ0FQ
VFVSRSB8IFY0TDJfQ0FQX1JFQURXUklURSB8CisJCVY0TDJfQ0FQX1NUUkVBTUlORzsKKwl2
ZGV2LT52NGwyX2RldiA9IHY0bDJfZGV2OworCXN0cnNjcHkodmRldi0+bmFtZSwgREVWSUNF
X05BTUUsIHNpemVvZih2ZGV2LT5uYW1lKSk7CisJdmRldi0+dmZsX3R5cGUgPSBWRkxfVFlQ
RV9HUkFCQkVSOworCXZkZXYtPnZmbF9kaXIgPSBWRkxfRElSX1JYOworCXZkZXYtPnJlbGVh
c2UgPSB2aWRlb19kZXZpY2VfcmVsZWFzZV9lbXB0eTsKKwl2ZGV2LT5pb2N0bF9vcHMgPSAm
YXNwZWVkX3ZpZGVvX2lvY3RsX29wczsKKwl2ZGV2LT5sb2NrID0gJnZpZGVvLT52aWRlb19s
b2NrOworCisJdmlkZW9fc2V0X2RydmRhdGEodmRldiwgdmlkZW8pOworCXJjID0gdmlkZW9f
cmVnaXN0ZXJfZGV2aWNlKHZkZXYsIFZGTF9UWVBFX0dSQUJCRVIsIDApOworCWlmIChyYykg
eworCQl2YjJfcXVldWVfcmVsZWFzZSh2YnEpOworCQl2NGwyX2N0cmxfaGFuZGxlcl9mcmVl
KCZ2aWRlby0+Y3RybF9oYW5kbGVyKTsKKwkJdjRsMl9kZXZpY2VfdW5yZWdpc3Rlcih2NGwy
X2Rldik7CisKKwkJZGV2X2Vycih2aWRlby0+ZGV2LCAiRmFpbGVkIHRvIHJlZ2lzdGVyIHZp
ZGVvIGRldmljZVxuIik7CisJCXJldHVybiByYzsKKwl9CisKKwlyZXR1cm4gMDsKK30KKwor
c3RhdGljIGludCBhc3BlZWRfdmlkZW9faW5pdChzdHJ1Y3QgYXNwZWVkX3ZpZGVvICp2aWRl
bykKK3sKKwlpbnQgaXJxOworCWludCByYzsKKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSB2aWRl
by0+ZGV2OworCisJaXJxID0gaXJxX29mX3BhcnNlX2FuZF9tYXAoZGV2LT5vZl9ub2RlLCAw
KTsKKwlpZiAoIWlycSkgeworCQlkZXZfZXJyKGRldiwgIlVuYWJsZSB0byBmaW5kIElSUVxu
Iik7CisJCXJldHVybiAtRU5PREVWOworCX0KKworCXJjID0gZGV2bV9yZXF1ZXN0X2lycShk
ZXYsIGlycSwgYXNwZWVkX3ZpZGVvX2lycSwgSVJRRl9TSEFSRUQsCisJCQkgICAgICBERVZJ
Q0VfTkFNRSwgdmlkZW8pOworCWlmIChyYyA8IDApIHsKKwkJZGV2X2VycihkZXYsICJVbmFi
bGUgdG8gcmVxdWVzdCBJUlEgJWRcbiIsIGlycSk7CisJCXJldHVybiByYzsKKwl9CisKKwl2
aWRlby0+ZWNsayA9IGRldm1fY2xrX2dldChkZXYsICJlY2xrIik7CisJaWYgKElTX0VSUih2
aWRlby0+ZWNsaykpIHsKKwkJZGV2X2VycihkZXYsICJVbmFibGUgdG8gZ2V0IEVDTEtcbiIp
OworCQlyZXR1cm4gUFRSX0VSUih2aWRlby0+ZWNsayk7CisJfQorCisJdmlkZW8tPnZjbGsg
PSBkZXZtX2Nsa19nZXQoZGV2LCAidmNsayIpOworCWlmIChJU19FUlIodmlkZW8tPnZjbGsp
KSB7CisJCWRldl9lcnIoZGV2LCAiVW5hYmxlIHRvIGdldCBWQ0xLXG4iKTsKKwkJcmV0dXJu
IFBUUl9FUlIodmlkZW8tPnZjbGspOworCX0KKworCXZpZGVvLT5yc3QgPSBkZXZtX3Jlc2V0
X2NvbnRyb2xfZ2V0X2V4Y2x1c2l2ZShkZXYsIE5VTEwpOworCWlmIChJU19FUlIodmlkZW8t
PnJzdCkpIHsKKwkJZGV2X2VycihkZXYsICJVbmFibGUgdG8gZ2V0IFZFIHJlc2V0XG4iKTsK
KwkJcmV0dXJuIFBUUl9FUlIodmlkZW8tPnJzdCk7CisJfQorCisJcmMgPSBvZl9yZXNlcnZl
ZF9tZW1fZGV2aWNlX2luaXQoZGV2KTsKKwlpZiAocmMpIHsKKwkJZGV2X2VycihkZXYsICJV
bmFibGUgdG8gcmVzZXJ2ZSBtZW1vcnlcbiIpOworCQlyZXR1cm4gcmM7CisJfQorCisJcmMg
PSBkbWFfc2V0X21hc2tfYW5kX2NvaGVyZW50KGRldiwgRE1BX0JJVF9NQVNLKDMyKSk7CisJ
aWYgKHJjKSB7CisJCWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIHNldCBETUEgbWFza1xuIik7
CisJCW9mX3Jlc2VydmVkX21lbV9kZXZpY2VfcmVsZWFzZShkZXYpOworCQlyZXR1cm4gcmM7
CisJfQorCisJaWYgKCFhc3BlZWRfdmlkZW9fYWxsb2NfYnVmKHZpZGVvLCAmdmlkZW8tPmpw
ZWcsCisJCQkJICAgIFZFX0pQRUdfSEVBREVSX1NJWkUpKSB7CisJCWRldl9lcnIoZGV2LCAi
RmFpbGVkIHRvIGFsbG9jYXRlIERNQSBmb3IgSlBFRyBoZWFkZXJcbiIpOworCQlvZl9yZXNl
cnZlZF9tZW1fZGV2aWNlX3JlbGVhc2UoZGV2KTsKKwkJcmV0dXJuIHJjOworCX0KKworCWFz
cGVlZF92aWRlb19pbml0X2pwZWdfdGFibGUodmlkZW8tPmpwZWcudmlydCwgdmlkZW8tPnl1
djQyMCk7CisKKwlyZXR1cm4gMDsKK30KKworc3RhdGljIGludCBhc3BlZWRfdmlkZW9fcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKK3sKKwlpbnQgcmM7CisJc3RydWN0
IHJlc291cmNlICpyZXM7CisJc3RydWN0IGFzcGVlZF92aWRlbyAqdmlkZW8gPSBremFsbG9j
KHNpemVvZigqdmlkZW8pLCBHRlBfS0VSTkVMKTsKKworCWlmICghdmlkZW8pCisJCXJldHVy
biAtRU5PTUVNOworCisJdmlkZW8tPmZyYW1lX3JhdGUgPSAzMDsKKwl2aWRlby0+ZGV2ID0g
JnBkZXYtPmRldjsKKwltdXRleF9pbml0KCZ2aWRlby0+dmlkZW9fbG9jayk7CisJaW5pdF93
YWl0cXVldWVfaGVhZCgmdmlkZW8tPndhaXQpOworCUlOSVRfREVMQVlFRF9XT1JLKCZ2aWRl
by0+cmVzX3dvcmssIGFzcGVlZF92aWRlb19yZXNvbHV0aW9uX3dvcmspOworCUlOSVRfTElT
VF9IRUFEKCZ2aWRlby0+YnVmZmVycyk7CisKKwlyZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3Vy
Y2UocGRldiwgSU9SRVNPVVJDRV9NRU0sIDApOworCisJdmlkZW8tPmJhc2UgPSBkZXZtX2lv
cmVtYXBfcmVzb3VyY2UodmlkZW8tPmRldiwgcmVzKTsKKworCWlmIChJU19FUlIodmlkZW8t
PmJhc2UpKQorCQlyZXR1cm4gUFRSX0VSUih2aWRlby0+YmFzZSk7CisKKwlyYyA9IGFzcGVl
ZF92aWRlb19pbml0KHZpZGVvKTsKKwlpZiAocmMpCisJCXJldHVybiByYzsKKworCXJjID0g
YXNwZWVkX3ZpZGVvX3NldHVwX3ZpZGVvKHZpZGVvKTsKKwlpZiAocmMpCisJCXJldHVybiBy
YzsKKworCXJldHVybiAwOworfQorCitzdGF0aWMgaW50IGFzcGVlZF92aWRlb19yZW1vdmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKK3sKKwlzdHJ1Y3QgZGV2aWNlICpkZXYg
PSAmcGRldi0+ZGV2OworCXN0cnVjdCB2NGwyX2RldmljZSAqdjRsMl9kZXYgPSBkZXZfZ2V0
X2RydmRhdGEoZGV2KTsKKwlzdHJ1Y3QgYXNwZWVkX3ZpZGVvICp2aWRlbyA9IHRvX2FzcGVl
ZF92aWRlbyh2NGwyX2Rldik7CisKKwl2aWRlb191bnJlZ2lzdGVyX2RldmljZSgmdmlkZW8t
PnZkZXYpOworCisJdmIyX3F1ZXVlX3JlbGVhc2UoJnZpZGVvLT5xdWV1ZSk7CisKKwl2NGwy
X2N0cmxfaGFuZGxlcl9mcmVlKCZ2aWRlby0+Y3RybF9oYW5kbGVyKTsKKworCXY0bDJfZGV2
aWNlX3VucmVnaXN0ZXIodjRsMl9kZXYpOworCisJZG1hX2ZyZWVfY29oZXJlbnQodmlkZW8t
PmRldiwgVkVfSlBFR19IRUFERVJfU0laRSwgdmlkZW8tPmpwZWcudmlydCwKKwkJCSAgdmlk
ZW8tPmpwZWcuZG1hKTsKKworCW9mX3Jlc2VydmVkX21lbV9kZXZpY2VfcmVsZWFzZShkZXYp
OworCisJcmV0dXJuIDA7Cit9CisKK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lk
IGFzcGVlZF92aWRlb19vZl9tYXRjaFtdID0geworCXsgLmNvbXBhdGlibGUgPSAiYXNwZWVk
LGFzdDI0MDAtdmlkZW8tZW5naW5lIiB9LAorCXsgLmNvbXBhdGlibGUgPSAiYXNwZWVkLGFz
dDI1MDAtdmlkZW8tZW5naW5lIiB9LAorCXt9Cit9OworTU9EVUxFX0RFVklDRV9UQUJMRShv
ZiwgYXNwZWVkX3ZpZGVvX29mX21hdGNoKTsKKworc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9k
cml2ZXIgYXNwZWVkX3ZpZGVvX2RyaXZlciA9IHsKKwkuZHJpdmVyID0geworCQkubmFtZSA9
IERFVklDRV9OQU1FLAorCQkub2ZfbWF0Y2hfdGFibGUgPSBhc3BlZWRfdmlkZW9fb2ZfbWF0
Y2gsCisJfSwKKwkucHJvYmUgPSBhc3BlZWRfdmlkZW9fcHJvYmUsCisJLnJlbW92ZSA9IGFz
cGVlZF92aWRlb19yZW1vdmUsCit9OworCittb2R1bGVfcGxhdGZvcm1fZHJpdmVyKGFzcGVl
ZF92aWRlb19kcml2ZXIpOworCitNT0RVTEVfREVTQ1JJUFRJT04oIkFTUEVFRCBWaWRlbyBF
bmdpbmUgRHJpdmVyIik7CitNT0RVTEVfQVVUSE9SKCJFZGRpZSBKYW1lcyIpOworTU9EVUxF
X0xJQ0VOU0UoIkdQTCB2MiIpOwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9j
bG9jay9hc3BlZWQtY2xvY2suaCBiL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svYXNwZWVk
LWNsb2NrLmgKaW5kZXggZjQzNzM4NjA3ZDc3Li4xNWE5MDU5ZDAzMDMgMTAwNjQ0Ci0tLSBh
L2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svYXNwZWVkLWNsb2NrLmgKKysrIGIvaW5jbHVk
ZS9kdC1iaW5kaW5ncy9jbG9jay9hc3BlZWQtY2xvY2suaApAQCAtNTAsNSArNTAsNiBAQAog
I2RlZmluZSBBU1BFRURfUkVTRVRfSTJDCQk3CiAjZGVmaW5lIEFTUEVFRF9SRVNFVF9BSEIJ
CTgKICNkZWZpbmUgQVNQRUVEX1JFU0VUX0NSVDEJCTkKKyNkZWZpbmUgQVNQRUVEX1JFU0VU
X1ZJREVPCQkxMAogCiAjZW5kaWYKLS0gCjIuNy40Cgo=
--------------4F3533E2E7D29D0387E49B67--
