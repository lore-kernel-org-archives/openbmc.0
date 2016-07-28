Return-Path: <clg@kaod.org>
X-Greylist: delayed 18172 seconds by postgrey-1.35 at bilbo;
 Thu, 28 Jul 2016 23:41:07 AEST
Received: from 14.mo7.mail-out.ovh.net (14.mo7.mail-out.ovh.net
 [178.33.251.19])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s0Y0g0JmDzDrP3
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jul 2016 23:41:06 +1000 (AEST)
Received: from player796.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 248731000FE0
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jul 2016 15:40:55 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player796.ha.ovh.net (Postfix) with ESMTPSA id 589F35C009F;
 Thu, 28 Jul 2016 15:40:52 +0200 (CEST)
Subject: Re: [PATCH 2/2] ast2500-edk: Configure HW strap register
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <20160728012534.29447-1-andrew@aj.id.au>
 <20160728012534.29447-3-andrew@aj.id.au>
 <0f2beb05-e04e-91c9-9772-e84cf0903684@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <76109eeb-31f4-00ac-6a31-5ae7f8b96217@kaod.org>
Date: Thu, 28 Jul 2016 15:40:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <0f2beb05-e04e-91c9-9772-e84cf0903684@kaod.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 821343984747449299
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrieejgdeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Jul 2016 13:41:07 -0000

On 07/28/2016 10:21 AM, Cédric Le Goater wrote:
> On 07/28/2016 03:25 AM, Andrew Jeffery wrote:
>> Strap register value was read off the hardware after boot.
>>
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> ---
>>  hw/arm/palmetto-bmc.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
>> index ec4aed306e7b..9e9c7e403133 100644
>> --- a/hw/arm/palmetto-bmc.c
>> +++ b/hw/arm/palmetto-bmc.c
>> @@ -47,7 +47,7 @@ enum {
>>  static const AspeedBoardConfig aspeed_boards[] = {
>>      [PALMETTO_BMC] = { AST2400_HW_STRAP1, AST2400_A0_SILICON_REV,
>>                           AST2400_SDRAM_BASE },
>> -    [AST2500_EDK]  = { 0x00000200, AST2500_A1_SILICON_REV,
>> +    [AST2500_EDK]  = { 0x7100c2e6, AST2500_A1_SILICON_REV,
>>                           AST2500_SDRAM_BASE },
> 
> so maybe we could define the ast2500 hw-strap1 value in :
> 
> 	include/hw/misc/aspeed_scu.h,
> 
> comments are sufficient enough. So you can replace the version I did
> for the ast2400. We can always come back to the macros when the u-boot 
> code is merged.

So after a second look, I think macros are better. 

The ast2500 eval board has a HW_STRAP1 value of 0xf100c2e6, so I came up 
with a definition of AST2500_HW_STRAP1 which is below. 

Cheers,

C.


+/*
+ * Hardware strapping register definition (for Aspeed AST2500 SOC and
+ * higher)
+ */
+#define SCU_AST2500_HW_STRAP_SPI_AUTOFETCH_ENABLE  (0x1 << 31)
+#define SCU_AST2500_HW_STRAP_GPIO_STRAP_ENABLE     (0x1 << 30)
+#define SCU_AST2500_HW_STRAP_UART_DEBUG            (0x1 << 29)
+#define     UART_DEBUG_UART1                           0
+#define     UART_DEBUG_UART5                           1
+#define SCU_AST2500_HW_STRAP_RESERVED28            (0x1 << 28)
+
+#define SCU_AST2500_HW_STRAP_FAST_RESET_DBG        (0x1 << 27)
+#define SCU_AST2500_HW_STRAP_ESPI_FLASH_ENABLE     (0x1 << 26)
+#define SCU_AST2500_HW_STRAP_ESPI_ENABLE           (0x1 << 25)
+#define SCU_AST2500_HW_STRAP_DDR4_ENABLE           (0x1 << 24)
+
+#define SCU_AST2500_HW_STRAP_ACPI_ENABLE           (0x1 << 19)
+#define SCU_AST2500_HW_STRAP_USBCKI_FREQ           (0x1 << 18)
+#define     USBCKI_FREQ_24MHZ                          0
+#define     USBCKI_FREQ_28MHZ                          1
+
+#define SCU_AST2500_HW_STRAP_SET_AXI_AHB_RATIO(x)  (x << 9)
+#define SCU_AST2500_HW_STRAP_GET_AXI_AHB_RATIO(x)  ((x >> 9) & 7)
+#define SCU_AST2500_HW_STRAP_CPU_AXI_RATIO_MASK    (0x7 << 9)
+#define     AXI_AHB_RATIO_UNDEFINED                    0
+#define     AXI_AHB_RATIO_2_1                          1
+#define     AXI_AHB_RATIO_3_1                          2
+#define     AXI_AHB_RATIO_4_1                          3
+#define     AXI_AHB_RATIO_5_1                          4
+#define     AXI_AHB_RATIO_6_1                          5
+#define     AXI_AHB_RATIO_7_1                          6
+#define     AXI_AHB_RATIO_8_1                          7
+
+#define SCU_AST2500_HW_STRAP_RESERVED1             (0x1 << 1)
+#define SCU_AST2500_HW_STRAP_DIS_BOOT              (0x1 << 0)
+
+#define AST2500_HW_STRAP1_DEFAULTS (                                    \
+        SCU_AST2500_HW_STRAP_RESERVED28 |                               \
+        SCU_HW_STRAP_2ND_BOOT_WDT |                                     \
+        SCU_HW_STRAP_VGA_CLASS_CODE |                                   \
+        SCU_HW_STRAP_LPC_RESET_PIN |                                    \
+        SCU_AST2500_HW_STRAP_SET_AXI_AHB_RATIO(AXI_AHB_RATIO_2_1) |     \
+        SCU_HW_STRAP_VGA_SIZE_SET(VGA_16M_DRAM) |                       \
+        SCU_AST2500_HW_STRAP_RESERVED1)
+
+#define AST2500_HW_STRAP1 ((                                            \
+        AST2500_HW_STRAP1_DEFAULTS |                                    \
+        SCU_AST2500_HW_STRAP_SPI_AUTOFETCH_ENABLE |                     \
+        SCU_AST2500_HW_STRAP_GPIO_STRAP_ENABLE |                        \
+        SCU_AST2500_HW_STRAP_UART_DEBUG |                               \
+        SCU_AST2500_HW_STRAP_DDR4_ENABLE |                              \
+        SCU_HW_STRAP_MAC1_RGMII |                                       \
+        SCU_HW_STRAP_MAC0_RGMII) &                                      \
+        ~SCU_HW_STRAP_2ND_BOOT_WDT)
+
 #endif /* ASPEED_SCU_H */
