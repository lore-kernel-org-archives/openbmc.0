Return-Path: <clg@kaod.org>
X-Greylist: delayed 39083 seconds by postgrey-1.36 at bilbo;
 Thu, 24 Nov 2016 06:08:45 AEDT
Received: from 1.mo5.mail-out.ovh.net (1.mo5.mail-out.ovh.net [188.165.57.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tPBhF0jcFzDvys
 for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2016 06:08:44 +1100 (AEDT)
Received: from player773.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 1409F476A6
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 20:08:40 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player773.ha.ovh.net (Postfix) with ESMTPSA id 1C5DD60007B;
 Wed, 23 Nov 2016 20:08:38 +0100 (CET)
Subject: Re: [PATCH qemu 11/38] aspeed/smc: get the number of flash modules
 from hw strapping
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-12-git-send-email-clg@kaod.org>
 <1479734036.2503.5.camel@aj.id.au>
 <45ccee63-6edd-9e1a-4214-cb93cb1c0395@kaod.org>
 <1479735302.2503.10.camel@aj.id.au>
 <85a1b91c-3efe-5b93-bdbf-91a0741fd853@kaod.org>
 <1479784251.2503.18.camel@aj.id.au>
 <b6082460-d8a0-9dfb-9b84-9f98a660e6aa@kaod.org>
 <1479864143.2503.44.camel@aj.id.au>
 <0187082e-64b6-4b84-61bc-bc3014c24d0c@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <33a36155-627e-1b51-2e60-6e1cd39b60a5@kaod.org>
Date: Wed, 23 Nov 2016 20:08:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <0187082e-64b6-4b84-61bc-bc3014c24d0c@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16804900534987557634
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrvdejgdduvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Wed, 23 Nov 2016 19:08:45 -0000

On 11/23/2016 10:33 AM, Cédric Le Goater wrote:
> On 11/23/2016 02:22 AM, Andrew Jeffery wrote:
>> On Tue, 2016-11-22 at 08:21 +0100, Cédric Le Goater wrote:
>>>>> So we should set or unset these SCU regs when the SoC is created
>>>>> and 
>>>>> derive the wdt2 enablement from them. I suppose that the helper
>>>>> routine 
>>>>> to check for the conditions would be under SCU. 
>>>>>
>>>>> or do we start a simple pinctrl model and slowly add the
>>>>> enablement
>>>>> of the pins we need ? 
>>>>>
>>>>
>>>> From the discussion on IRC last night between Cédric, Joel and
>>>> myself
>>>> we decided to start on a pinmux backend to help manage these
>>>> issues.
>>>
>>> Do you have a rough idea of an API that the SoC could use ? 
>>>
>>> 	enum AspeedAST2500Function {
>>> 		FWSPICS0,
>>> 		FWSPICS1,
>>> 		FWSPICS2,
>>> 	};
>>>
>>> 	enum AspeedAST2400Function {
>>> 		ROMCS1,
>>> 		ROMCS2,
>>> 		ROMCS3,
>>> 		ROMCS4,
>>> 	};
>>>
>>> 	bool aspeed_pin_is_enabled(AspeedPinmux *p, int func);
>>
>> Largely this looks good.
>>
>> But bikeshedding a bit, but I think the function name should focus on
>> functions, not pins. The function maps to some pin in the physical
>> case, but for qemu's purposes we don't care about that just yet. Even
>> if we do care in the future we can internally map functions to pins
>> behind a pinmux abstraction. As such I think we can get away with a
>> small tweak:
>>
>> bool aspeed_pinmux_is_enabled(AspeedPinmux *p, int func);
> 
> ok Looks good to me. I will fake this in the patchset to ease the 
> change in the future.
> 
>> Did you have any thought about how we hoist ourselves from a
>> AspeedPinmux to say an AspeedAST2500Pinmux with this interface? 
> 
> There are different solutions. We could introduce a class like
> 
> #define TYPE_ASPEED_PINMUX "aspeed-pinmux"
> #define ASPEED_PINMUX(obj)
>      OBJECT_CHECK(AspeedPinmux, (obj), TYPE_ASPEED_PINMUX)
> #define ASPEED_PINMUX_CLASS(klass) \
>      OBJECT_CLASS_CHECK(AspeedPinmuxClass, (klass), TYPE_ASPEED_PINMUX)
> #define ASPEED_PINMUX_GET_CLASS(obj) \
>      OBJECT_GET_CLASS(AspeedPinmuxClass, (obj), TYPE_ASPEED_PINMUX)
> 
> typedef struct AspeedPinmux {
> 	...
> } AspeedPinmux;
> 
> typedef struct AspeedPinmuxClass {
> 	...
> 	AspeedPinmuxType pinmux_type;
>         ... 
> 
> or
> 	... 
>         bool (*is_enabled)(AspeedPinmux *pmux, int func);
> 	....
> } AspeedPinmuxClass;
> 
> #define TYPE_ASPEED_PINMUX_POWER8E TYPE_ASPEED_PINMUX "-ast2500"
> #define ASPEED_PINMUX_AST2500(obj) \
>     OBJECT_CHECK(AspeedPinmux, (obj), TYPE_ASPEED_PINMUX_AST2500)
> 
> #define TYPE_ASPEED_PINMUX_POWER8E TYPE_ASPEED_PINMUX "-ast2400"
> #define ASPEED_PINMUX_AST2400(obj) \
>     OBJECT_CHECK(AspeedPinmux, (obj), TYPE_ASPEED_PINMUX_AST2400)
> 
> 
> and use 'pinmux_type' to dispatch to specific handlers or directly
> include the handlers we need under the class. 
> 
> If we only have handlers and no state, we could define a Interface
> and tie it to the soc object.
> 
> typedef struct AspeedPinmuxInterface {
>     Object parent;
> } AspeedPinmuxInterface;
> 
> #define TYPE_ASPEED_PINMUX_INTERFACE "aspeed-pinmux-interface"
> #define ASPEED_PINMUX_INTERFACE(obj) \
>      OBJECT_CHECK(AspeedPinmuxInterface, (obj), TYPE_ASPEED_PINMUX_INTERFACE)
> #define ASPEED_PINMUX_INTERFACE_CLASS(klass)                \
>     OBJECT_CLASS_CHECK(AspeedPinmuxInterfaceClass, (klass), \
>                        TYPE_ASPEED_PINMUX_INTERFACE)
> #define ASPEED_PINMUX_INTERFACE_GET_CLASS(obj) \
>      OBJECT_GET_CLASS(AspeedPinmuxInterfaceClass, (obj), TYPE_ASPEED_PINMUX_INTERFACE)
> 
> typedef struct AspeedPinmuxInterfaceClass {
>     InterfaceClass parent;
>     bool (*is_enabled)(AspeedPinmuxInterface *dev, int func);
>     ...
> } AspeedPinmuxInterfaceClass;
> 
> 
> Conceptually, the SoC object would have a set of routines to handle
> muxing. that seems ok to me as pinmux is a rather invasive component 
> needing access to all controllers to be able to set the functions. 

Here is a quick patch for it to get an overall feeling.

C.


Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c              |    6 +++
 hw/arm/aspeed_soc.c          |   86 ++++++++++++++++++++++++++++++++++++++++++-
 hw/misc/aspeed_scu.c         |    2 +
 include/hw/arm/aspeed_soc.h  |    2 +
 include/hw/misc/aspeed_scu.h |    1 
 5 files changed, 96 insertions(+), 1 deletion(-)

Index: qemu-aspeed.git/hw/arm/aspeed_soc.c
===================================================================
--- qemu-aspeed.git.orig/hw/arm/aspeed_soc.c
+++ qemu-aspeed.git/hw/arm/aspeed_soc.c
@@ -47,6 +47,9 @@ static const hwaddr aspeed_soc_ast2500_s
 static const char *aspeed_soc_ast2500_typenames[] = {
     "aspeed.smc.ast2500-spi1", "aspeed.smc.ast2500-spi2" };
 
+static bool aspeed_soc_ast2400_is_enabled(AspeedSoCState *obj, int func);
+static bool aspeed_soc_ast2500_is_enabled(AspeedSoCState *obj, int func);
+
 static const AspeedSoCInfo aspeed_socs[] = {
     {
         .name         = "ast2400-a0",
@@ -58,6 +61,7 @@ static const AspeedSoCInfo aspeed_socs[]
         .spi_bases    = aspeed_soc_ast2400_spi_bases,
         .fmc_typename = "aspeed.smc.fmc",
         .spi_typename = aspeed_soc_ast2400_typenames,
+        .is_enabled   = aspeed_soc_ast2400_is_enabled,
     }, {
         .name         = "ast2400-a1",
         .cpu_model    = "arm926",
@@ -68,6 +72,7 @@ static const AspeedSoCInfo aspeed_socs[]
         .spi_bases    = aspeed_soc_ast2400_spi_bases,
         .fmc_typename = "aspeed.smc.fmc",
         .spi_typename = aspeed_soc_ast2400_typenames,
+        .is_enabled   = aspeed_soc_ast2400_is_enabled,
     }, {
         .name         = "ast2400",
         .cpu_model    = "arm926",
@@ -78,6 +83,7 @@ static const AspeedSoCInfo aspeed_socs[]
         .spi_bases    = aspeed_soc_ast2400_spi_bases,
         .fmc_typename = "aspeed.smc.fmc",
         .spi_typename = aspeed_soc_ast2400_typenames,
+        .is_enabled   = aspeed_soc_ast2500_is_enabled,
     }, {
         .name         = "ast2500-a1",
         .cpu_model    = "arm1176",
@@ -88,6 +94,7 @@ static const AspeedSoCInfo aspeed_socs[]
         .spi_bases    = aspeed_soc_ast2500_spi_bases,
         .fmc_typename = "aspeed.smc.ast2500-fmc",
         .spi_typename = aspeed_soc_ast2500_typenames,
+        .is_enabled   = aspeed_soc_ast2500_is_enabled,
     },
 };
 
@@ -149,6 +156,8 @@ static void aspeed_soc_init(Object *obj)
                               "hw-strap1", &error_abort);
     object_property_add_alias(obj, "hw-strap2", OBJECT(&s->scu),
                               "hw-strap2", &error_abort);
+    object_property_add_alias(obj, "pinmux-ctrl3", OBJECT(&s->scu),
+                              "pinmux-ctrl3", &error_abort);
 
     object_initialize(&s->fmc, sizeof(s->fmc), sc->info->fmc_typename);
     object_property_add_child(obj, "fmc", OBJECT(&s->fmc), NULL);
@@ -170,12 +179,81 @@ static void aspeed_soc_init(Object *obj)
                               "ram-size", &error_abort);
 }
 
+/* AST2400 */
+enum {
+    ROMCS1,
+    ROMCS2,
+    ROMCS3,
+    ROMCS4,
+};
+
+static bool aspeed_soc_ast2400_is_enabled(AspeedSoCState *soc, int function)
+{
+    switch (function) {
+    case ROMCS1:
+        return soc->scu.pinmux_ctrl3 & (1 << 24);
+    case ROMCS2:
+        return soc->scu.pinmux_ctrl3 & (1 << 25);
+    case ROMCS3:
+        return soc->scu.pinmux_ctrl3 & (1 << 26);
+    case ROMCS4:
+        return soc->scu.pinmux_ctrl3 & (1 << 27);
+    default:
+        return false;
+    }
+}
+
+/* AST2500 */
+enum {
+    FWSPICS1,
+    FWSPICS2,
+};
+
+static bool aspeed_soc_ast2500_is_enabled(AspeedSoCState *soc, int function)
+{
+    bool cond2 = !(soc->scu.regs[0x94 >> 2] & 0x3);
+
+    switch (function) {
+    case FWSPICS1:
+        return (soc->scu.pinmux_ctrl3 & (1 << 24)) && cond2;
+    case FWSPICS2:
+        return (soc->scu.pinmux_ctrl3 & (1 << 25)) && cond2;
+    default:
+        return false;
+    }
+}
+
+static int aspeed_fmc_get_cs(AspeedSoCState *soc, Error **errp)
+{
+    AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(soc);
+    int cs = 1;
+
+    switch (sc->info->silicon_rev) {
+    case AST2400_A0_SILICON_REV:
+    case AST2400_A1_SILICON_REV:
+        cs += sc->info->is_enabled(soc, ROMCS1);
+        cs += sc->info->is_enabled(soc, ROMCS2);
+        cs += sc->info->is_enabled(soc, ROMCS3);
+        cs += sc->info->is_enabled(soc, ROMCS4);
+        break;
+    case AST2500_A0_SILICON_REV:
+    case AST2500_A1_SILICON_REV:
+        cs += sc->info->is_enabled(soc, FWSPICS1);
+        cs += sc->info->is_enabled(soc, FWSPICS2);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    return cs;
+}
+
 static void aspeed_soc_realize(DeviceState *dev, Error **errp)
 {
     int i;
     AspeedSoCState *s = ASPEED_SOC(dev);
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
     Error *err = NULL, *local_err = NULL;
+    int fmc_num_cs;
 
     /* IO space */
     memory_region_init_io(&s->iomem, NULL, &aspeed_soc_io_ops, NULL,
@@ -251,7 +329,13 @@ static void aspeed_soc_realize(DeviceSta
                        qdev_get_gpio_in(DEVICE(&s->vic), 12));
 
     /* FMC */
-    object_property_set_int(OBJECT(&s->fmc), 1, "num-cs", &err);
+    fmc_num_cs = aspeed_fmc_get_cs(s, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    object_property_set_int(OBJECT(&s->fmc), fmc_num_cs, "num-cs", &err);
     object_property_set_bool(OBJECT(&s->fmc), true, "realized", &local_err);
     error_propagate(&err, local_err);
     if (err) {
Index: qemu-aspeed.git/include/hw/arm/aspeed_soc.h
===================================================================
--- qemu-aspeed.git.orig/include/hw/arm/aspeed_soc.h
+++ qemu-aspeed.git/include/hw/arm/aspeed_soc.h
@@ -52,6 +52,8 @@ typedef struct AspeedSoCInfo {
     const hwaddr *spi_bases;
     const char *fmc_typename;
     const char **spi_typename;
+
+    bool (*is_enabled)(AspeedSoCState *obj, int function);
 } AspeedSoCInfo;
 
 typedef struct AspeedSoCClass {
Index: qemu-aspeed.git/hw/misc/aspeed_scu.c
===================================================================
--- qemu-aspeed.git.orig/hw/misc/aspeed_scu.c
+++ qemu-aspeed.git/hw/misc/aspeed_scu.c
@@ -246,6 +246,7 @@ static void aspeed_scu_reset(DeviceState
     s->regs[SILICON_REV] = s->silicon_rev;
     s->regs[HW_STRAP1] = s->hw_strap1;
     s->regs[HW_STRAP2] = s->hw_strap2;
+    s->regs[PINMUX_CTRL3] = s->pinmux_ctrl3;
 }
 
 static uint32_t aspeed_silicon_revs[] = {
@@ -299,6 +300,7 @@ static Property aspeed_scu_properties[]
     DEFINE_PROP_UINT32("silicon-rev", AspeedSCUState, silicon_rev, 0),
     DEFINE_PROP_UINT32("hw-strap1", AspeedSCUState, hw_strap1, 0),
     DEFINE_PROP_UINT32("hw-strap2", AspeedSCUState, hw_strap2, 0),
+    DEFINE_PROP_UINT32("pinmux-ctrl3", AspeedSCUState, pinmux_ctrl3, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
Index: qemu-aspeed.git/include/hw/misc/aspeed_scu.h
===================================================================
--- qemu-aspeed.git.orig/include/hw/misc/aspeed_scu.h
+++ qemu-aspeed.git/include/hw/misc/aspeed_scu.h
@@ -29,6 +29,7 @@ typedef struct AspeedSCUState {
     uint32_t silicon_rev;
     uint32_t hw_strap1;
     uint32_t hw_strap2;
+    uint32_t pinmux_ctrl3;
 } AspeedSCUState;
 
 #define AST2400_A0_SILICON_REV   0x02000303U
Index: qemu-aspeed.git/hw/arm/aspeed.c
===================================================================
--- qemu-aspeed.git.orig/hw/arm/aspeed.c
+++ qemu-aspeed.git/hw/arm/aspeed.c
@@ -34,6 +34,7 @@ typedef struct AspeedBoardState {
 typedef struct AspeedBoardConfig {
     const char *soc_name;
     uint32_t hw_strap1;
+    uint32_t pinmux_ctrl3;
     const char *fmc_model;
     const char *spi_model;
 } AspeedBoardConfig;
@@ -84,18 +85,21 @@ static const AspeedBoardConfig aspeed_bo
     [PALMETTO_BMC] = {
         .soc_name  = "ast2400-a1",
         .hw_strap1 = PALMETTO_BMC_HW_STRAP1,
+        .pinmux_ctrl3 = 0x00000000U,
         .fmc_model = "n25q256a",
         .spi_model = "mx25l25635e",
     },
     [AST2500_EVB]  = {
         .soc_name  = "ast2500-a1",
         .hw_strap1 = AST2500_EVB_HW_STRAP1,
+        .pinmux_ctrl3 = 0x00000000U,
         .fmc_model = "n25q256a",
         .spi_model = "mx25l25635e",
     },
     [ROMULUS_BMC]  = {
         .soc_name  = "ast2500-a1",
         .hw_strap1 = ROMULUS_BMC_HW_STRAP1,
+        .pinmux_ctrl3 = 0x01000000U,
         .fmc_model = "n25q256a",
         .spi_model = "mx66l1g45g",
     },
@@ -144,6 +148,8 @@ static void aspeed_board_init(MachineSta
                            &error_abort);
     object_property_set_int(OBJECT(&bmc->soc), cfg->hw_strap1, "hw-strap1",
                             &error_abort);
+    object_property_set_int(OBJECT(&bmc->soc), cfg->pinmux_ctrl3,
+                            "pinmux-ctrl3", &error_abort);
     object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
                              &error_abort);
 
