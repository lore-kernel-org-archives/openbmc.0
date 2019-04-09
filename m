Return-Path: <jason.m.bills@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44f3wY33DlzDqJQ
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 09:51:39 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Apr 2019 16:51:36 -0700
X-IronPort-AV: E=Sophos;i="5.60,331,1549958400"; d="scan'208";a="132910107"
Received: from unknown (HELO [10.241.242.36]) ([10.241.242.36])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/AES128-SHA;
 09 Apr 2019 16:51:36 -0700
Subject: Re: QEMU and CI
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <bae4a921-6e20-899e-5139-4d479ffd9f47@linux.intel.com>
 <03df9961-3cb8-467b-adab-743544a05963@www.fastmail.com>
 <CACPK8XdpUh52GVEfH6KYrNV7zgLhLVuJtmpg4dNpQ2CdNfGVhg@mail.gmail.com>
 <e90ee19f-99b0-cdfb-fdf0-48a53be3098a@kaod.org>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <ae2a50ce-1ba0-e73e-3b92-aefbb83c7784@linux.intel.com>
Date: Tue, 9 Apr 2019 16:51:31 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e90ee19f-99b0-cdfb-fdf0-48a53be3098a@kaod.org>
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
X-List-Received-Date: Tue, 09 Apr 2019 23:51:42 -0000



>> You can boot your wolf pass image in the current qemu. To demonstrate
>> I grabbed a tiogapass flash image from CI and booted it:
>>
>> $ arm-softmmu/qemu-system-arm -M ast2500-evb -drive
>> file=flash-tiogapass,format=raw,if=mtd -serial mon:stdio  -nographic
>> ...
>> root@tiogapass:~# cat /etc/os-release
>> ID="openbmc-phosphor"
>> NAME="Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)"
>> VERSION="2.7.0-dev"
>> VERSION_ID="2.7.0-dev-347-gd631110d4"
>> PRETTY_NAME="Phosphor OpenBMC (Phosphor OpenBMC Project Reference
>> Distro) 2.7.0-dev"
>> BUILD_ID="2.7.0-dev"
>> OPENBMC_TARGET_MACHINE="tiogapass"
>>
>> As Andrew said, your next step would be to add a wolfpass machine type
>> to upstream qemu. Take a look at the aspeed_boards array in
>> hw/arm/aspeed.c.
> 
> Yes. it should be relatively easy to add the machine.
Thanks! I was able to get an initial s2600wf machine booted from one of 
my own builds.

One issue I have on my machine, that I don't see with witherspoon-bmc, 
is something in U-Boot that is preventing it from booting automatically. 
  When I start my image, it stops at the U-Boot prompt below where I can 
just run 'boot' and it will boot normally.  Is this something you have 
seen before?

qemu-system-arm: Aspeed iBT has no chardev backend


U-Boot 2016.07 (Apr 04 2019 - 23:46:17 +0000)

SOC : AST2500-A1
RST : 0x01
PLL :     24 MHz
CPU :    792 MHz
MEM :   2.240 MHz, EEC: Disable, Cache: Disable
VGA :    16 MiB
DRAM :   init by SOC
        Watchdog enabled
DRAM:  240 MiB
kcs_init Channel: 3
Flash: 64 MiB
In:    serial
Out:   serial
Err:   serial
Net:   MAC0 : RMII/NCSI
MAC1 : RGMII
FTGMAC100#0
Error: FTGMAC100#0 address not set.
, FTGMAC100#1
Error: FTGMAC100#1 address not set.

ast#


> 
>>  From there the next step is to add the peripherals that your machine
>> has. This will involve writing models for the i2c devices you have
>> attached, and perhaps emulators for host connected devices (PECI?).
>> This could be more involved so please use the list to discuss your
>> plans.
> 
> Yes please. It would be nice to have better support for I2C devices
> and work on a simple interface (QMP based) to interact with them, so
> that we can exercise the monitoring done by OpenBMC. PSU devices are
> a good topic for that.
I added some i2c temp sensor devices from the existing models. They were
detected and loaded properly by entity-manager, but the readings were 
all zeroes.  This is all new for me, so I assume I'm missing something. 
I still need to go through the existing QEMU tests on OpenBMC and see 
what is done there.

> 
>> There are also a large number of peripherals inside the ASPEED SoC
>> that lack models. Let us know on the list if you think you will start
>> working on one so we don't duplicate efforts.
>>
>> Submit your patches against the upstream qemu tree. Andrew, Cedric and
>> I are the upstream maintainers so we will be on cc there.
> 
> We are keeping the models in development under in this tree :
>    
>     https://github.com/openbmc/qemu
> 
> Some have been there a bit too long because we lacked time to make
> them ready but please prefer mainline. We rebase quite often anyhow.
> I should push today a new version on 4.0-rc3.
> 
> Check out this page before sending :
> 
>     https://wiki.qemu.org/Contribute/SubmitAPatch
> 

Thanks for the help!  Here is what I have for my s2600wf machine so far:
Subject: [PATCH] Add an s2600wf machine type

Include the HW strap setting and some I2C temperature sensors.

Signed-off-by: Jason M. Bills <jason.m.bills@linux.intel.com>
---
  hw/arm/aspeed.c | 36 ++++++++++++++++++++++++++++++++++++
  1 file changed, 36 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 465e65f323..c9d9c23995 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -60,6 +60,21 @@ struct AspeedBoardState {
          SCU_HW_STRAP_MAC0_RGMII) &                                      \
          ~SCU_HW_STRAP_2ND_BOOT_WDT)

+/* S2600WF hardware value: 0xF3CCC286 */
+#define S2600WF_BMC_HW_STRAP1 ((                                        \
+        AST2500_HW_STRAP1_DEFAULTS |                                    \
+        SCU_AST2500_HW_STRAP_SPI_AUTOFETCH_ENABLE |                     \
+        SCU_AST2500_HW_STRAP_GPIO_STRAP_ENABLE |                        \
+        SCU_AST2500_HW_STRAP_UART_DEBUG |                               \
+        SCU_AST2500_HW_STRAP_ESPI_ENABLE |                              \
+        SCU_AST2500_HW_STRAP_DDR4_ENABLE |                              \
+        SCU_HW_STRAP_GPIOE_PT_EN |                                      \
+        SCU_AST2400_HW_STRAP_ACPI_DIS |                                 \
+        SCU_HW_STRAP_CLK_48M_IN |                                       \
+        SCU_HW_STRAP_VGA_CLASS_CODE |                                   \
+        SCU_HW_STRAP_MAC1_RGMII) &                                      \
+        ~SCU_HW_STRAP_2ND_BOOT_WDT)
+
  /* Romulus hardware value: 0xF10AD206 */
  #define ROMULUS_BMC_HW_STRAP1 (                                         \
          AST2500_HW_STRAP1_DEFAULTS |                                    \
@@ -281,6 +296,18 @@ static void ast2500_evb_i2c_init(AspeedBoardState *bmc)
      i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), 
"ds1338", 0x32);
  }

+static void s2600wf_bmc_i2c_init(AspeedBoardState *bmc)
+{
+    AspeedSoCState *soc = &bmc->soc;
+
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 6), 
"tmp421", 0x4d);
+    /* The s2600wf expects a TMP75 but a TMP105 is compatible */
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 6), 
"tmp105", 0x48);
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 6), 
"tmp105", 0x49);
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 6), 
"tmp105", 0x4a);
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 6), 
"tmp105", 0x4b);
+}
+
  static void romulus_bmc_i2c_init(AspeedBoardState *bmc)
  {
      AspeedSoCState *soc = &bmc->soc;
@@ -390,6 +417,15 @@ static const AspeedBoardConfig aspeed_boards[] = {
          .spi_model = "mx25l25635e",
          .num_cs    = 1,
          .i2c_init  = ast2500_evb_i2c_init,
+    }, {
+        .name      = MACHINE_TYPE_NAME("s2600wf-bmc"),
+        .desc      = "Intel S2600WF BMC (ARM1176)",
+        .soc_name  = "ast2500-a1",
+        .hw_strap1 = S2600WF_BMC_HW_STRAP1,
+        .fmc_model = "n25q512a",
+        .spi_model = "n25q512a",
+        .num_cs    = 1,
+        .i2c_init  = s2600wf_bmc_i2c_init,
      }, {
          .name      = MACHINE_TYPE_NAME("romulus-bmc"),
          .desc      = "OpenPOWER Romulus BMC (ARM1176)",
--
2.17.1

-Jason
