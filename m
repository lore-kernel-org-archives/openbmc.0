Return-Path: <kuiying.wang@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=kuiying.wang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43DXVn3llQzDqfb
 for <openbmc@lists.ozlabs.org>; Tue, 11 Dec 2018 19:02:53 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Dec 2018 00:02:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,341,1539673200"; 
 d="scan'208,217";a="302813901"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga005.fm.intel.com with ESMTP; 11 Dec 2018 00:02:51 -0800
Received: from fmsmsx120.amr.corp.intel.com (10.18.124.208) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 11 Dec 2018 00:02:50 -0800
Received: from shsmsx152.ccr.corp.intel.com (10.239.6.52) by
 fmsmsx120.amr.corp.intel.com (10.18.124.208) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 11 Dec 2018 00:02:49 -0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.182]) by
 SHSMSX152.ccr.corp.intel.com ([169.254.6.222]) with mapi id 14.03.0415.000;
 Tue, 11 Dec 2018 16:02:48 +0800
From: "Wang, Kuiying" <kuiying.wang@intel.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Geissler <geissonator@gmail.com>,
 Andrew Jeffery <andrew@aj.id.au>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Mauery, Vernon"
 <vernon.mauery@intel.com>, "Feist, James" <james.feist@intel.com>, "Yoo, Jae
 Hyun" <jae.hyun.yoo@intel.com>
Subject: Enable buttons GPIO passthrough 
Thread-Topic: Enable buttons GPIO passthrough 
Thread-Index: AdSRJmQpdKkHGMIOQneqw0Mzic5pdA==
Date: Tue, 11 Dec 2018 08:02:47 +0000
Message-ID: <959CAFA1E282D14FB901BE9A7BF4E7724E41D8EE@shsmsx102.ccr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
Content-Type: multipart/alternative;
 boundary="_000_959CAFA1E282D14FB901BE9A7BF4E7724E41D8EEshsmsx102ccrcor_"
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 11 Dec 2018 08:02:58 -0000

--_000_959CAFA1E282D14FB901BE9A7BF4E7724E41D8EEshsmsx102ccrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Joel/Andrew,
I write a drive to enable GPIO passthrough for buttons (like power/reset/id=
 button) as following attached patch.
Do you think it is acceptable?
Or we could do it in pinmux and extend gpio driver? Design passthrough stat=
e except in/out.
What's your suggestions?

Thanks Kwin.

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index f2062546250c..e94ee86820d3 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -4,6 +4,12 @@
 menu "Misc devices"
+config GPIO_PASS_THROUGH
+             tristate "GPIO Pass Through"
+             depends on (ARCH_ASPEED || COMPILE_TEST)
+             help
+               Enable this for buttons GPIO pass through.
+
config SENSORS_LIS3LV02D
              tristate
              depends on INPUT
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index bb89694e6b4b..13b8b8edbb70 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -61,3 +61,4 @@ obj-$(CONFIG_ASPEED_LPC_SIO)   +=3D aspeed-lpc-sio.o
obj-$(CONFIG_PCI_ENDPOINT_TEST)      +=3D pci_endpoint_test.o
obj-$(CONFIG_OCXL)                     +=3D ocxl/
obj-$(CONFIG_MISC_RTSX)                         +=3D cardreader/
+obj-$(CONFIG_GPIO_PASS_THROUGH)   +=3D gpio-passthrough.o
diff --git a/drivers/misc/gpio-passthrough.c b/drivers/misc/gpio-passthroug=
h.c
new file mode 100644
index 000000000000..0126fc08ae55
--- /dev/null
+++ b/drivers/misc/gpio-passthrough.c
@@ -0,0 +1,260 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018 Intel Corporation
+*/
+
+#include "gpio-passthrough.h"
+
+struct aspeed_gpio_pass_through_dev {
+             struct miscdevice              miscdev;
+             unsigned int        addr;
+             unsigned int        size;
+};
+
+static struct aspeed_gpio_pass_through_dev ast_cdev_gpio_pass_through;
+
+static long ast_passthru_ioctl(struct file *filp, unsigned int cmd, unsign=
ed long arg)
+{
+             long ret =3D 0;
+             struct passthru_ioctl_data passthru_data;
+
+             if (cmd =3D=3D GPIO_IOC_PASSTHRU)
+             {
+                            if (copy_from_user(&passthru_data,
+                                           (void __user*)arg, sizeof(passt=
hru_data)))
+                                           return -EFAULT;
+                            if (passthru_data.idx >=3D GPIO_PASSTHRU_MAX)
+                                           return -EINVAL;
+
+                            switch (passthru_data.cmd) {
+                            case SET_GPIO_PASSTHRU_ENABLE:
+                                           ast_set_passthru_enable(passthr=
u_data.idx,
+                                                                         p=
assthru_data.data);
+                                           break;
+                            case GET_GPIO_PASSTHRU_ENABLE:
+                                           passthru_data.data =3D ast_get_=
passthru_enable(passthru_data.idx);
+                                           if (copy_to_user((void __user*)=
arg, &passthru_data,
+                                                                          =
                             sizeof(passthru_data)))
+                                           ret =3D -EFAULT;
+                            break;
+
+                            case SET_GPIO_PASSTHRU_OUT:
+                                           ast_set_passthru_out(passthru_d=
ata.idx, passthru_data.data);
+                            break;
+
+                            default:
+                                           ret =3D -EINVAL;
+                            break;
+                            }
+             }
+             return ret;
+
+}
+
+static int ast_passthru_open(struct inode *inode, struct file *filp)
+{
+             return container_of(filp->private_data,
+                            struct aspeed_gpio_pass_through_dev, miscdev);
+}
+
+static const struct file_operations ast_gpio_pth_fops =3D {
+             .owner          =3D THIS_MODULE,
+             .llseek         =3D no_llseek,
+             .unlocked_ioctl =3D ast_passthru_ioctl,
+             .open           =3D ast_passthru_open,
+};
+
+static struct miscdevice ast_gpio_pth_miscdev =3D {
+             .minor =3D MISC_DYNAMIC_MINOR,
+             .name =3D GPIO_PASS_THROUGH_NAME,
+             .fops =3D &ast_gpio_pth_fops,
+};
+
+static u32 ast_scu_base  =3D IO_ADDRESS(AST_SCU_BASE);
+
+static inline u32 ast_scu_read(u32 reg)
+{
+             return readl((void *)(ast_scu_base + reg));
+}
+
+static inline void ast_scu_write(u32 val, u32 reg)
+{
+#ifdef CONFIG_AST_SCU_LOCK
+             writel(SCU_PROTECT_UNLOCK, (void *)(ast_scu_base + AST_SCU_PR=
OTECT));
+             writel(val,                (void *)(ast_scu_base + reg));
+             writel(0x000000AA,         (void *)(ast_scu_base + AST_SCU_PR=
OTECT));
+#else
+             writel(SCU_PROTECT_UNLOCK, (void *)(ast_scu_base + AST_SCU_PR=
OTECT));
+             writel(val,                (void *)(ast_scu_base + reg));
+#endif
+}
+
+static int gpio_pass_through_probe(struct platform_device *pdev)
+{
+             struct aspeed_gpio_pass_through_dev   *gpio_pth_dev =3D &ast_=
cdev_gpio_pass_through;
+             struct device *dev =3D &pdev->dev;
+             struct resource *rc;
+
+             dev_set_drvdata(&pdev->dev, gpio_pth_dev);
+             rc =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
+             if (!rc) {
+                            dev_err(dev, "Fail to platform_get_resource\n"=
);
+                            return -ENXIO;
+             }
+             gpio_pth_dev->addr =3D rc->start;
+             gpio_pth_dev->size =3D resource_size(rc);
+             gpio_pth_dev->miscdev =3D ast_gpio_pth_miscdev;
+             ast_passthru_init();
+             printk("GPIO PASS THROUGH DRIVER is loaded \n");
+             return misc_register(&gpio_pth_dev->miscdev);
+}
+
+static int gpio_pass_through_remove(struct platform_device *pdev)
+{
+             struct aspeed_gpio_pass_through_dev *gpio_pth_dev =3D
+                                                          dev_get_drvdata(=
&pdev->dev);
+             misc_deregister(&gpio_pth_dev->miscdev);
+             printk("GPIO PASS THROUGH DRIVER is removing \n");
+
+             return 0;
+}
+
+static struct platform_driver gpio_pass_through_driver =3D {
+             .probe     =3D gpio_pass_through_probe,
+             .remove    =3D gpio_pass_through_remove,
+             .driver    =3D {
+                            .name  =3D "gpio-pass-through",
+        .owner =3D THIS_MODULE,
+
+             },
+};
+
+/* GPIOE group only */
+struct gpio_passthru {
+             u32 passthru_mask;
+             u16 pin_in;
+             u16 pin_out;
+};
+
+static struct gpio_passthru passthru_settings[GPIO_PASSTHRU_MAX] =3D {
+             [GPIO_PASSTHRU0] =3D {
+                                           .passthru_mask =3D (1 << 12), /=
* SCU8C[12] */
+                                           .pin_in        =3D PGPIO_PIN(GP=
IOE, 0),
+                                           .pin_out       =3D PGPIO_PIN(GP=
IOE, 1),
+                            },
+
+             [GPIO_PASSTHRU1] =3D {
+                                           .passthru_mask =3D (1 << 13), /=
* SCU8C[13] */
+                                           .pin_in        =3D PGPIO_PIN(GP=
IOE, 2),
+                                           .pin_out       =3D PGPIO_PIN(GP=
IOE, 3),
+                            },
+
+             [GPIO_PASSTHRU2] =3D {
+                                           .passthru_mask =3D (1 << 14), /=
* SCU8C[14] */
+                                           .pin_in        =3D PGPIO_PIN(GP=
IOE, 4),
+                                           .pin_out       =3D PGPIO_PIN(GP=
IOE, 5),
+                            },
+
+             [GPIO_PASSTHRU3] =3D {
+                                           .passthru_mask =3D (1 << 15), /=
* SCU8C[15] */
+                                           .pin_in        =3D PGPIO_PIN(GP=
IOE, 6),
+                                           .pin_out       =3D PGPIO_PIN(GP=
IOE, 7),
+                            },
+};
+
+static void ast_set_passthru_enable(
+                                           unsigned short idx, unsigned in=
t enable)
+{
+             u32 val;
+             unsigned long flags;
+             struct gpio_passthru *passthru =3D &passthru_settings[idx];
+
+             local_irq_save(flags);
+
+             val =3D ast_scu_read(AST_SCU_FUN_PIN_CTRL4);
+             if (enable)
+                            val |=3D  (passthru->passthru_mask);
+             else
+                            val &=3D ~(passthru->passthru_mask);
+             ast_scu_write(val, AST_SCU_FUN_PIN_CTRL4);
+
+             local_irq_restore(flags);
+}
+
+static unsigned int ast_get_passthru_enable(unsigned short idx)
+{
+             unsigned int enable;
+             unsigned long flags;
+             struct gpio_passthru *passthru =3D &passthru_settings[idx];
+
+             local_irq_save(flags);
+
+             enable =3D (ast_scu_read(AST_SCU_FUN_PIN_CTRL4) & passthru->p=
assthru_mask) !=3D 0 ? 1 : 0;
+
+             local_irq_restore(flags);
+
+             return enable;
+}
+
+static void ast_set_passthru_out(
+                                           unsigned short idx, unsigned in=
t val)
+{
+             unsigned long flags;
+             struct gpio_passthru *passthru =3D &passthru_settings[idx];
+
+             local_irq_save(flags);
+
+             /* Disable PASSTHRU */
+             val  =3D ast_scu_read(AST_SCU_FUN_PIN_CTRL4);
+             val &=3D ~(passthru->passthru_mask);
+             ast_scu_write(val, AST_SCU_FUN_PIN_CTRL4);
+
+             local_irq_restore(flags);
+}
+
+static void ast_passthru_init(void)
+{
+             int i;
+             u32 val;
+             unsigned long flags;
+             struct gpio_passthru *passthru;
+
+             local_irq_save(flags);
+
+             /* 1. Enable GPIOE pin mode, SCU80[16:23] =3D 00 */
+             ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL1) & (~0x00FF0=
000),
+                           AST_SCU_FUN_PIN_CTRL1);
+
+             /* 2. Enable them by setting SCU8C[12:15] */
+             for (i =3D 0; i < GPIO_PASSTHRU_MAX; i++) {
+                            passthru =3D &passthru_settings[i];
+
+                            val  =3D ast_scu_read(AST_SCU_FUN_PIN_CTRL4);
+                            val |=3D passthru->passthru_mask;
+                            ast_scu_write(val, AST_SCU_FUN_PIN_CTRL4);
+             }
+
+             /************************************************************=
**
+             * 3. Disable HWTrap for GPIOE pass-through mode
+             *
+             * Hardware strap register (SCU70) programming method.
+             *   #Write '1' to SCU70 can set the specific bit with value '=
1'
+             *    Write '0' has no effect.
+             *   #Write '1' to SCU7C can clear the specific bit of SCU70 t=
o
+             *    value '0'. Write '0' has no effect.
+             *************************************************************=
*/
+             if (ast_scu_read(AST_SCU_HW_STRAP1) & (0x1 << 22))
+                            ast_scu_write((0x1 << 22), AST_SCU_REVISION_ID=
);
+
+             local_irq_restore(flags);
+
+             printk("HW_STRAP1 =3D 0x%08X\n", ast_scu_read(AST_SCU_HW_STRA=
P1));
+}
+
+module_platform_driver(gpio_pass_through_driver);
+
+MODULE_AUTHOR("Kuiying Wang <kuiying.wang@intel.com>");
+MODULE_DESCRIPTION("GPIO Pass Through Control Driver for all buttons like =
Power/Reset/ID button");
+MODULE_LICENSE("GPL v2");
+
diff --git a/drivers/misc/gpio-passthrough.h b/drivers/misc/gpio-passthroug=
h.h
new file mode 100644
index 000000000000..a7274b8ab31e
--- /dev/null
+++ b/drivers/misc/gpio-passthrough.h
@@ -0,0 +1,60 @@
+#ifndef __GPIO_PASS_THROUGH_H__
+#define __GPIO_PASS_THROUGH_H__
+
+#include <linux/kernel.h>
+#include <linux/miscdevice.h>
+#include <linux/uaccess.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/mm.h>
+#include <asm/io.h>
+
+#define PGPIO_PIN(PORT, PIN)   (((PORT) << 3) | ((PIN) & 0x07))
+#define GPIOE    4
+#define AST_SCU_BASE                    0x1E6E2000  /* SCU */
+#define AST_SCU_PROTECT                 0x00        /*  protection key reg=
ister */
+#define SCU_PROTECT_UNLOCK              0x1688A8A8
+#define AST_SCU_FUN_PIN_CTRL4           0x8C        /*  Multi-function Pin=
 Control#4*/
+#define AST_SCU_FUN_PIN_CTRL1           0x80        /*  Multi-function Pin=
 Control#1*/
+#define AST_SCU_HW_STRAP1               0x70        /*  hardware strapping=
 register */
+#define AST_SCU_REVISION_ID             0x7C        /*  Silicon revision I=
D register */
+#define GPIO_PASS_THROUGH_NAME          "gpiopassthrough"
+#define IO_ADDRESS(x)                   (x)
+
+enum GPIO_PASSTHRU_INDEX {
+             GPIO_PASSTHRU0 =3D 0,  /* GPIOE0 -> GPIOE1 */
+             GPIO_PASSTHRU1,      /* GPIOE2 -> GPIOE3 */
+             GPIO_PASSTHRU2,      /* GPIOE4 -> GPIOE5 */
+             GPIO_PASSTHRU3,      /* GPIOE6 -> GPIOE7 */
+
+             GPIO_PASSTHRU_MAX
+};
+
+enum GPIO_PASSTHRU_CMD {
+             SET_GPIO_PASSTHRU_ENABLE =3D 0,
+             GET_GPIO_PASSTHRU_ENABLE,
+             GET_GPIO_PASSTHRU_IN,
+             SET_GPIO_PASSTHRU_OUT, /* !!! The PASSTHRU will be disabled !=
!! */
+};
+
+struct passthru_ioctl_data {
+             unsigned short cmd;
+             unsigned short idx;
+             unsigned int   data;
+};
+
+static void ast_set_passthru_enable(
+                                           unsigned short idx, unsigned in=
t enable);
+static unsigned int ast_get_passthru_enable(unsigned short idx);
+static void ast_set_passthru_out(
+                                           unsigned short idx, unsigned in=
t val);
+static void ast_passthru_init(void);
+static inline u32 ast_scu_read(u32 reg);
+static inline void ast_scu_write(u32 val, u32 reg);
+
+/* IOCTL */
+#define GPIO_IOC_BASE       'G'
+#define GPIO_IOC_PASSTHRU   _IOWR(GPIO_IOC_BASE, 1, struct passthru_ioctl_=
data)
+
+
+#endif
--
2.16.2

Thanks,
Kwin.


--_000_959CAFA1E282D14FB901BE9A7BF4E7724E41D8EEshsmsx102ccrcor_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.MsoDate, li.MsoDate, div.MsoDate
	{mso-style-priority:99;
	mso-style-link:"Date Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.DateChar
	{mso-style-name:"Date Char";
	mso-style-priority:99;
	mso-style-link:Date;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi Joel/Andrew,<o:p></o:p></p>
<p class=3D"MsoNormal">I write a drive to enable GPIO passthrough for butto=
ns (like power/reset/id button) as following attached patch.<o:p></o:p></p>
<p class=3D"MsoNormal">Do you think it is acceptable?<o:p></o:p></p>
<p class=3D"MsoNormal">Or we could do it in pinmux and extend gpio driver? =
Design passthrough state except in/out.<o:p></o:p></p>
<p class=3D"MsoNormal">What&#8217;s your suggestions?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks Kwin.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">diff --git a/drivers/misc/Kconfig b/drivers/misc/Kco=
nfig<o:p></o:p></p>
<p class=3D"MsoNormal">index f2062546250c..e94ee86820d3 100644<o:p></o:p></=
p>
<p class=3D"MsoNormal">--- a/drivers/misc/Kconfig<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&#43;&#43; b/drivers/misc/Kconfig<o:p></o:p></p=
>
<p class=3D"MsoNormal">@@ -4,6 &#43;4,12 @@<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;menu &quot;Misc devices&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">&#43;config GPIO_PASS_THROUGH<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; tristate &quot;GPIO Pass Through&quot;<o:p></o:p>=
</p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; depends on (ARCH_ASPEED || COMPILE_TEST)<o:p></o:=
p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; help<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Enable this for buttons GPIO pass through.=
<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">config SENSORS_LIS3LV02D<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; tristate<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; depends on INPUT<o:p></o:p></p>
<p class=3D"MsoNormal">diff --git a/drivers/misc/Makefile b/drivers/misc/Ma=
kefile<o:p></o:p></p>
<p class=3D"MsoNormal">index bb89694e6b4b..13b8b8edbb70 100644<o:p></o:p></=
p>
<p class=3D"MsoNormal">--- a/drivers/misc/Makefile<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&#43;&#43; b/drivers/misc/Makefile<o:p></o:p></=
p>
<p class=3D"MsoNormal">@@ -61,3 &#43;61,4 @@ obj-$(CONFIG_ASPEED_LPC_SIO)&n=
bsp;&nbsp; &#43;=3D aspeed-lpc-sio.o<o:p></o:p></p>
<p class=3D"MsoNormal">obj-$(CONFIG_PCI_ENDPOINT_TEST)&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &#43;=3D pci_endpoint_test.o<o:p></o:p></p>
<p class=3D"MsoNormal">obj-$(CONFIG_OCXL)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &#43;=3D ocxl/<o:p></o:p></p>
<p class=3D"MsoNormal">obj-$(CONFIG_MISC_RTSX)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#43;=3D cardreader/<o:p></o:p></p=
>
<p class=3D"MsoNormal">&#43;obj-$(CONFIG_GPIO_PASS_THROUGH)&nbsp;&nbsp; &#4=
3;=3D gpio-passthrough.o<o:p></o:p></p>
<p class=3D"MsoNormal">diff --git a/drivers/misc/gpio-passthrough.c b/drive=
rs/misc/gpio-passthrough.c<o:p></o:p></p>
<p class=3D"MsoNormal">new file mode 100644<o:p></o:p></p>
<p class=3D"MsoNormal">index 000000000000..0126fc08ae55<o:p></o:p></p>
<p class=3D"MsoNormal">--- /dev/null<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&#43;&#43; b/drivers/misc/gpio-passthrough.c<o:=
p></o:p></p>
<p class=3D"MsoNormal">@@ -0,0 &#43;1,260 @@<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;// SPDX-License-Identifier: GPL-2.0<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&#43;/*<o:p></o:p></p>
<p class=3D"MsoNormal">&#43; * Copyright (c) 2018 Intel Corporation<o:p></o=
:p></p>
<p class=3D"MsoNormal">&#43;*/<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#include &quot;gpio-passthrough.h&quot;<o:p></o=
:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;struct aspeed_gpio_pass_through_dev {<o:p></o:p=
></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; struct miscdevice&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; miscdev;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; addr;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; size;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;};<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;static struct aspeed_gpio_pass_through_dev ast_=
cdev_gpio_pass_through;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;static long ast_passthru_ioctl(struct file *fil=
p, unsigned int cmd, unsigned long arg)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;{<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; long ret =3D 0;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; struct passthru_ioctl_data passthru_data;<o:p></o=
:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; if (cmd =3D=3D GPIO_IOC_PASSTHRU)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (copy_from_user(&amp;passthru_d=
ata,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (void __user*)arg, =
sizeof(passthru_data)))<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -EFAULT;<o:p=
></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (passthru_data.idx &gt;=3D GPIO=
_PASSTHRU_MAX)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -EINVAL;<o:p=
></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (passthru_data.cmd) {<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SET_GPIO_PASSTHRU_ENABLE:<o:p=
></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ast_set_passthru_en=
able(passthru_data.idx,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; passthru_data.data);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<o:p></o:p></=
p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case GET_GPIO_PASSTHRU_ENABLE:<o:p=
></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; passthru_data.data =
=3D ast_get_passthru_enable(passthru_data.idx);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (copy_to_user((v=
oid __user*)arg, &amp;passthru_data,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof(passthru_data)))<o:p></o:p>=
</p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D -EFAULT;<o:=
p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SET_GPIO_PASSTHRU_OUT:<o:p></=
o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ast_set_passthru_ou=
t(passthru_data.idx, passthru_data.data);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D -EINVAL;<o:=
p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;}<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;static int ast_passthru_open(struct inode *inod=
e, struct file *filp)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;{<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; return container_of(filp-&gt;private_data,<o:p></=
o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct aspeed_gpio_pass_through_de=
v, miscdev);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;}<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;static const struct file_operations ast_gpio_pt=
h_fops =3D {<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; .owner&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; =3D THIS_MODULE,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; .llseek&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; =3D no_llseek,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; .unlocked_ioctl =3D ast_passthru_ioctl,<o:p></o:p=
></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; .open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; =3D ast_passthru_open,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;};<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;static struct miscdevice ast_gpio_pth_miscdev =
=3D {<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; .minor =3D MISC_DYNAMIC_MINOR,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; .name =3D GPIO_PASS_THROUGH_NAME,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; .fops =3D &amp;ast_gpio_pth_fops,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;};<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;static u32 ast_scu_base&nbsp; =3D IO_ADDRESS(AS=
T_SCU_BASE);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;static inline u32 ast_scu_read(u32 reg)<o:p></o=
:p></p>
<p class=3D"MsoNormal">&#43;{<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; return readl((void *)(ast_scu_base &#43; reg));<o=
:p></o:p></p>
<p class=3D"MsoNormal">&#43;}<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;static inline void ast_scu_write(u32 val, u32 r=
eg)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;{<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#ifdef CONFIG_AST_SCU_LOCK<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; writel(SCU_PROTECT_UNLOCK, (void *)(ast_scu_base =
&#43; AST_SCU_PROTECT));<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; writel(val,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (void *)(ast_scu_base =
&#43; reg));<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; writel(0x000000AA,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; (void *)(ast_scu_base &#43; AST_SCU_PROTECT));<o:p></o:p>=
</p>
<p class=3D"MsoNormal">&#43;#else<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; writel(SCU_PROTECT_UNLOCK, (void *)(ast_scu_base =
&#43; AST_SCU_PROTECT));<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; writel(val,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (void *)(ast_scu_base =
&#43; reg));<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#endif<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;}<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;static int gpio_pass_through_probe(struct platf=
orm_device *pdev)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;{<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; struct aspeed_gpio_pass_through_dev&nbsp;&nbsp; *=
gpio_pth_dev =3D &amp;ast_cdev_gpio_pass_through;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; struct device *dev =3D &amp;pdev-&gt;dev;<o:p></o=
:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; struct resource *rc;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; dev_set_drvdata(&amp;pdev-&gt;dev, gpio_pth_dev);=
<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; rc =3D platform_get_resource(pdev, IORESOURCE_MEM=
, 0);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; if (!rc) {<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_err(dev, &quot;Fail to platfor=
m_get_resource\n&quot;);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -ENXIO;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; gpio_pth_dev-&gt;addr =3D rc-&gt;start;<o:p></o:p=
></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; gpio_pth_dev-&gt;size =3D resource_size(rc);<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; gpio_pth_dev-&gt;miscdev =3D ast_gpio_pth_miscdev=
;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; ast_passthru_init();<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; printk(&quot;GPIO PASS THROUGH DRIVER is loaded \=
n&quot;);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; return misc_register(&amp;gpio_pth_dev-&gt;miscde=
v);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;}<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;static int gpio_pass_through_remove(struct plat=
form_device *pdev)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;{<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; struct aspeed_gpio_pass_through_dev *gpio_pth_dev=
 =3D<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_=
get_drvdata(&amp;pdev-&gt;dev);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; misc_deregister(&amp;gpio_pth_dev-&gt;miscdev);<o=
:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; printk(&quot;GPIO PASS THROUGH DRIVER is removing=
 \n&quot;);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;}<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;static struct platform_driver gpio_pass_through=
_driver =3D {<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; .probe&nbsp;&nbsp;&nbsp;&nbsp; =3D gpio_pass_thro=
ugh_probe,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; .remove&nbsp;&nbsp;&nbsp; =3D gpio_pass_through_r=
emove,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; .driver&nbsp;&nbsp;&nbsp; =3D {<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .name&nbsp; =3D &quot;gpio-pass-th=
rough&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .own=
er =3D THIS_MODULE,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;};<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;/* GPIOE group only */<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;struct gpio_passthru {<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; u32 passthru_mask;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; u16 pin_in;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; u16 pin_out;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;};<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;static struct gpio_passthru passthru_settings[G=
PIO_PASSTHRU_MAX] =3D {<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; [GPIO_PASSTHRU0] =3D {<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .passthru_mask =3D =
(1 &lt;&lt; 12), /* SCU8C[12] */<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pin_in&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D PGPIO_PIN(GPIOE, 0),<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pin_out&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; =3D PGPIO_PIN(GPIOE, 1),<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; [GPIO_PASSTHRU1] =3D {<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .passthru_mask =3D =
(1 &lt;&lt; 13), /* SCU8C[13] */<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pin_in&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D PGPIO_PIN(GPIOE, 2),<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pin_out&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; =3D PGPIO_PIN(GPIOE, 3),<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; [GPIO_PASSTHRU2] =3D {<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .passthru_mask =3D =
(1 &lt;&lt; 14), /* SCU8C[14] */<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pin_in&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D PGPIO_PIN(GPIOE, 4),<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pin_out&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; =3D PGPIO_PIN(GPIOE, 5),<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; [GPIO_PASSTHRU3] =3D {<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .passthru_mask =3D =
(1 &lt;&lt; 15), /* SCU8C[15] */<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pin_in&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D PGPIO_PIN(GPIOE, 6),<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pin_out&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; =3D PGPIO_PIN(GPIOE, 7),<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;};<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;static void ast_set_passthru_enable(<o:p></o:p>=
</p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned short idx,=
 unsigned int enable)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;{<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; u32 val;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; unsigned long flags;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; struct gpio_passthru *passthru =3D &amp;passthru_=
settings[idx];<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; local_irq_save(flags);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; val =3D ast_scu_read(AST_SCU_FUN_PIN_CTRL4);<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; if (enable)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; val |=3D&nbsp; (passthru-&gt;passt=
hru_mask);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; else<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; val &amp;=3D ~(passthru-&gt;passth=
ru_mask);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; ast_scu_write(val, AST_SCU_FUN_PIN_CTRL4);<o:p></=
o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; local_irq_restore(flags);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;}<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;static unsigned int ast_get_passthru_enable(uns=
igned short idx)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;{<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int enable;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; unsigned long flags;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; struct gpio_passthru *passthru =3D &amp;passthru_=
settings[idx];<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; local_irq_save(flags);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; enable =3D (ast_scu_read(AST_SCU_FUN_PIN_CTRL4) &=
amp; passthru-&gt;passthru_mask) !=3D 0 ? 1 : 0;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; local_irq_restore(flags);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; return enable;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;}<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;static void ast_set_passthru_out(<o:p></o:p></p=
>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned short idx,=
 unsigned int val)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;{<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; unsigned long flags;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; struct gpio_passthru *passthru =3D &amp;passthru_=
settings[idx];<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; local_irq_save(flags);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; /* Disable PASSTHRU */<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; val&nbsp; =3D ast_scu_read(AST_SCU_FUN_PIN_CTRL4)=
;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; val &amp;=3D ~(passthru-&gt;passthru_mask);<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; ast_scu_write(val, AST_SCU_FUN_PIN_CTRL4);<o:p></=
o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; local_irq_restore(flags);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;}<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;static void ast_passthru_init(void)<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&#43;{<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; int i;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; u32 val;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; unsigned long flags;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; struct gpio_passthru *passthru;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; local_irq_save(flags);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; /* 1. Enable GPIOE pin mode, SCU80[16:23] =3D 00 =
*/<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL1)=
 &amp; (~0x00FF0000),<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AST_SCU_FUN_PIN_CTRL1);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; /* 2. Enable them by setting SCU8C[12:15] */<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; GPIO_PASSTHRU_MAX; i&#43;&#4=
3;) {<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; passthru =3D &amp;passthru_setting=
s[i];<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; val&nbsp; =3D ast_scu_read(AST_SCU=
_FUN_PIN_CTRL4);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; val |=3D passthru-&gt;passthru_mas=
k;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ast_scu_write(val, AST_SCU_FUN_PIN_CTRL=
4);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; /************************************************=
**************<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; * 3. Disable HWTrap for GPIOE pass-through mode<o=
:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; *<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; * Hardware strap register (SCU70) programming met=
hod.<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp; #Write '1' to SCU70 can set the spe=
cific bit with value '1'<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp; Write '0' has no effect.<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp; #Write '1' to SCU7C can clear the s=
pecific bit of SCU70 to<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp; value '0'. Write '0' has no e=
ffect.<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; *************************************************=
*************/<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; if (ast_scu_read(AST_SCU_HW_STRAP1) &amp; (0x1 &l=
t;&lt; 22))<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ast_scu_write((0x1 &lt;&lt; 22), A=
ST_SCU_REVISION_ID);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; local_irq_restore(flags);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; printk(&quot;HW_STRAP1 =3D 0x%08X\n&quot;, ast_sc=
u_read(AST_SCU_HW_STRAP1));<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;}<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;module_platform_driver(gpio_pass_through_driver=
);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;MODULE_AUTHOR(&quot;Kuiying Wang &lt;kuiying.wa=
ng@intel.com&gt;&quot;);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;MODULE_DESCRIPTION(&quot;GPIO Pass Through Cont=
rol Driver for all buttons like Power/Reset/ID button&quot;);<o:p></o:p></p=
>
<p class=3D"MsoNormal">&#43;MODULE_LICENSE(&quot;GPL v2&quot;);<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">diff --git a/drivers/misc/gpio-passthrough.h b/drive=
rs/misc/gpio-passthrough.h<o:p></o:p></p>
<p class=3D"MsoNormal">new file mode 100644<o:p></o:p></p>
<p class=3D"MsoNormal">index 000000000000..a7274b8ab31e<o:p></o:p></p>
<p class=3D"MsoNormal">--- /dev/null<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&#43;&#43; b/drivers/misc/gpio-passthrough.h<o:=
p></o:p></p>
<p class=3D"MsoNormal">@@ -0,0 &#43;1,60 @@<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#ifndef __GPIO_PASS_THROUGH_H__<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#define __GPIO_PASS_THROUGH_H__<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#include &lt;linux/kernel.h&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#include &lt;linux/miscdevice.h&gt;<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&#43;#include &lt;linux/uaccess.h&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#include &lt;linux/module.h&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#include &lt;linux/of_platform.h&gt;<o:p></o:p>=
</p>
<p class=3D"MsoNormal">&#43;#include &lt;linux/mm.h&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#include &lt;asm/io.h&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#define PGPIO_PIN(PORT, PIN)&nbsp;&nbsp; (((POR=
T) &lt;&lt; 3) | ((PIN) &amp; 0x07))<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#define GPIOE&nbsp;&nbsp;&nbsp; 4<o:p></o:p></p=
>
<p class=3D"MsoNormal">&#43;#define AST_SCU_BASE&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;0x1E6E2000&nbsp; /* SCU */<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#define AST_SCU_PROTECT&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x=
00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*&nbsp; protection key regist=
er */<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#define SCU_PROTECT_UNLOCK&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x1688A8A8<o:p></=
o:p></p>
<p class=3D"MsoNormal">&#43;#define AST_SCU_FUN_PIN_CTRL4&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x8C&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; /*&nbsp; Multi-function Pin Control#4*/<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#define AST_SCU_FUN_PIN_CTRL1&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x80&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; /*&nbsp; Multi-function Pin Control#1*/<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#define AST_SCU_HW_STRAP1&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x70&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*&nbsp; hardware strapping register */<=
o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#define AST_SCU_REVISION_ID&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x7C&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; /*&nbsp; Silicon revision ID register */<o:p></o:p=
></p>
<p class=3D"MsoNormal">&#43;#define GPIO_PASS_THROUGH_NAME&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;gpiopassthrough&quot;<o:p></o:p=
></p>
<p class=3D"MsoNormal">&#43;#define IO_ADDRESS(x)&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; (x)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;enum GPIO_PASSTHRU_INDEX {<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; GPIO_PASSTHRU0 =3D 0,&nbsp; /* GPIOE0 -&gt; GPIOE=
1 */<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; GPIO_PASSTHRU1,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
GPIOE2 -&gt; GPIOE3 */<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; GPIO_PASSTHRU2,&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;/* =
GPIOE4 -&gt; GPIOE5 */<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; GPIO_PASSTHRU3,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
GPIOE6 -&gt; GPIOE7 */<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; GPIO_PASSTHRU_MAX<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;};<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;enum GPIO_PASSTHRU_CMD {<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; SET_GPIO_PASSTHRU_ENABLE =3D 0,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; GET_GPIO_PASSTHRU_ENABLE,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; GET_GPIO_PASSTHRU_IN,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; SET_GPIO_PASSTHRU_OUT, /* !!! The PASSTHRU will b=
e disabled !!! */<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;};<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;struct passthru_ioctl_data {<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; unsigned short cmd;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; unsigned short idx;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int&nbsp;&nbsp; data;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;};<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;static void ast_set_passthru_enable(<o:p></o:p>=
</p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned short idx,=
 unsigned int enable);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;static unsigned int ast_get_passthru_enable(uns=
igned short idx);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;static void ast_set_passthru_out(<o:p></o:p></p=
>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned short idx,=
 unsigned int val);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;static void ast_passthru_init(void);<o:p></o:p>=
</p>
<p class=3D"MsoNormal">&#43;static inline u32 ast_scu_read(u32 reg);<o:p></=
o:p></p>
<p class=3D"MsoNormal">&#43;static inline void ast_scu_write(u32 val, u32 r=
eg);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;/* IOCTL */<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#define GPIO_IOC_BASE&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; 'G'<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#define GPIO_IOC_PASSTHRU&nbsp;&nbsp; _IOWR(GPI=
O_IOC_BASE, 1, struct passthru_ioctl_data)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#endif<o:p></o:p></p>
<p class=3D"MsoNormal">-- <o:p></o:p></p>
<p class=3D"MsoNormal">2.16.2<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Kwin.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_959CAFA1E282D14FB901BE9A7BF4E7724E41D8EEshsmsx102ccrcor_--
