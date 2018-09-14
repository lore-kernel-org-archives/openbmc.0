Return-Path: <kunyi@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c0b::22b; helo=mail-it0-x22b.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="LhOaXyB2"; 
 dkim-atps=neutral
Received: from mail-it0-x22b.google.com (mail-it0-x22b.google.com
 [IPv6:2607:f8b0:4001:c0b::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Bs4n6rwwzF0R8
 for <openbmc@lists.ozlabs.org>; Sat, 15 Sep 2018 09:22:49 +1000 (AEST)
Received: by mail-it0-x22b.google.com with SMTP id f14-v6so4740905ita.4
 for <openbmc@lists.ozlabs.org>; Fri, 14 Sep 2018 16:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iBi/Qx9da2i37cVvlMN4oo4+wImQ50dF+Sg/UJ/1Ig8=;
 b=LhOaXyB2AXBXKlzA4alLEGXI/MbzMjzlByXd3DYOOToi2zGbx11og7rGeBo1ngdS7f
 3X3VHPG8omrA4OURb7x6T7pNS7ygLEUL2muIMRoSouN8U6VVXmuBQ4QsZE7v46IUTy5g
 MJMTBBFzGo3kl94e/uEqMcB+G6ildX1uIesHl/WxoKnvqcO+5/N/RIWArH59C9Dqb5Ha
 Y5jUxpDFw+lLFWZ/RxBh0DrMCidMEMs8gF12XrbkeVCWBIJNSu4YLWRbh6LBbAH4D88k
 Nl1mOrfIT96VDNKdoyYjtAKmB85v/jAvKI1lP2+qMsewtVfj3b+V+hLvJQ7KXowcKY0w
 HBYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iBi/Qx9da2i37cVvlMN4oo4+wImQ50dF+Sg/UJ/1Ig8=;
 b=ABFjn9clHViDrAphwYfzE9Nqg7mWz6P07E7Oj//s2YzV+ejzbOu6xQVV+6y3OJS23o
 8Q+h/9nevQ8tUR5qw58bTKfIq7MnovfKzjo3Az0rQBPxbYmKzhHgUN9ow5Wg4kZy0yoS
 RnuUIt036Ny7MBuAYE/fR6Zh0AR0VXiiBK4N3YTBLco+fjmhBGgFDN5E4O+Nt2UmKjIu
 xtJTz7ZAAyXIBVt+Jte3xbUVjd3Kj+dr76sBjE3Ef8p/94lTBg+LVKkgfov77waP/5RK
 iwQZLP6WsIXp+/y3sUuJfXqi6LNlZczjtFpopzT98AgbXv2Pejxf7HyoTpgJgETdNOTi
 dviQ==
X-Gm-Message-State: APzg51Apf8n6uJLUJQW+vLyBEN6sdU4+IUPMDarkiu9JXqtoUn0Jhg3A
 tyNZBcpLiGVQZuYLLsylomDAViG9AZtmV1iSVETTTAcW
X-Google-Smtp-Source: ANB0VdY39sYRKt1/D2xCYCCQR2d0A7vejQEEP892MGMwRZdm80Ao+CrpOr3S6g5lke7jgeA5A3nTYZ70qJ66RuIog1U=
X-Received: by 2002:a24:eec7:: with SMTP id
 b190-v6mr4304598iti.32.1536967364814; 
 Fri, 14 Sep 2018 16:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <20180723145840.17856-1-andrew@aj.id.au>
 <20180723145840.17856-5-andrew@aj.id.au>
In-Reply-To: <20180723145840.17856-5-andrew@aj.id.au>
From: Kun Yi <kunyi@google.com>
Date: Fri, 14 Sep 2018 16:22:18 -0700
Message-ID: <CAGMNF6VM9SDm1c0hFLBYwSdwPHdEjA=a5ikbhJk3GFrYFwKNRQ@mail.gmail.com>
Subject: Re: [PATCH u-boot 4/4] aspeed: Disable unnecessary features
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000d0183d0575dd1979"
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
X-List-Received-Date: Fri, 14 Sep 2018 23:22:52 -0000

--000000000000d0183d0575dd1979
Content-Type: text/plain; charset="UTF-8"

Thanks for sending the patch Andrew. I think it's a viable solution since
linux upstream didn't like the idea of misc controls.

My feature request would be that we add config options for selectively
turning these features on/off. For example, we actually use LPC2AHB and
PCIe2AHB downstream for host-BMC mailbox typed transfers.. It would be nice
if we could take this patch and define the flags to enable what we needed.

On Mon, Jul 23, 2018 at 8:03 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> Adjust board_init() to disable hardware features that we don't need
> available during normal BMC operation.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  arch/arm/include/asm/arch-aspeed/regs-lpc.h  | 29 +++++++++++++++
>  arch/arm/include/asm/arch-aspeed/regs-scu.h  |  8 +++-
>  arch/arm/include/asm/arch-aspeed/regs-sdmc.h |  4 ++
>  board/aspeed/ast-g4/ast-g4.c                 | 33 ++++++++++++++++-
>  board/aspeed/ast-g5/ast-g5.c                 | 39 +++++++++++++++++++-
>  5 files changed, 110 insertions(+), 3 deletions(-)
>  create mode 100644 arch/arm/include/asm/arch-aspeed/regs-lpc.h
>
> diff --git a/arch/arm/include/asm/arch-aspeed/regs-lpc.h
> b/arch/arm/include/asm/arch-aspeed/regs-lpc.h
> new file mode 100644
> index 000000000000..b0162ae4f37c
> --- /dev/null
> +++ b/arch/arm/include/asm/arch-aspeed/regs-lpc.h
> @@ -0,0 +1,29 @@
> +/* arch/arm/mach-aspeed/include/mach/regs-sdmc.h
> + *
> + * Copyright (C) 2018  IBM Corp
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + *   History      :
> + *    1. 2018/07/23 Andrew Jeffery Create
> + *
> +
> ******************************************************************************/
> +#ifndef __AST_REGS_LPC_H
> +#define __AST_REGS_LPC_H
> +
> +/*
> + *  Register for LPC
> + */
> +
> +#define AST_LPC_HICR5          0x80
> +#define AST_LPC_HICRB          0x100
> +
> +/*     AST_LPC_HICR5 : 0x80    Host Interface Control Register 5 */
> +#define LPC_HICR5_ENFWH                (0x1 << 10)
> +
> +/*     AST_LPC_HICRB : 0x100   Host Interface Control Register B */
> +#define LPC_HICRB_ILPC2AHB     (0x1 << 6)
> +
> +#endif
> diff --git a/arch/arm/include/asm/arch-aspeed/regs-scu.h
> b/arch/arm/include/asm/arch-aspeed/regs-scu.h
> index b714fa92341d..c9b91795d1aa 100644
> --- a/arch/arm/include/asm/arch-aspeed/regs-scu.h
> +++ b/arch/arm/include/asm/arch-aspeed/regs-scu.h
> @@ -466,6 +466,7 @@
>  #define SCU_MISC_JTAG__M_TO_PCIE_EN    (0x1 << 14)
>  #define SCU_MISC_VUART_TO_CTRL         (0x1 << 13)
>  #define SCU_MISC_DIV13_EN              (0x1 << 12)
> +#define SCU_MISC_DEBUG_UART             (0x1 << 10)
>  #define SCU_MISC_Y_CLK_INVERT          (0x1 << 11)
>  #define SCU_MISC_OUT_DELAY             (0x1 << 9)
>  #define SCU_MISC_PCI_TO_AHB_DIS                (0x1 << 8)
> @@ -548,6 +549,7 @@
>  /* AST_SCU_VGA_SCRATCH7                        0x6c - VGA Scratch
> register */
>
>  /* AST_SCU_HW_STRAP1                   0x70 - hardware strapping register
> */
> +#define SCU_HW_STRAP_LPC_DEC_SUPER_IO  (0x1 << 20)
>  #ifdef AST_SOC_G5
>
>  #define CLK_25M_IN                     (0x1 << 23)
> @@ -593,7 +595,6 @@
>
>  #define SCU_HW_STRAP_GPIOE_PT_EN       (0x1 << 22)
>  #define SCU_HW_STRAP_GPIOD_PT_EN       (0x1 << 21)
> -#define SCU_HW_STRAP_LPC_DEC_SUPER_IO  (0x1 << 20)
>  #define SCU_HW_STRAP_ACPI_DIS          (0x1 << 19)
>
>  /* bit 23, 18 [1,0] */
> @@ -940,6 +941,11 @@
>
>  /* AST_SCU_UART24_REF                  0x160 - Generate UART 24Mhz Ref
> from H-PLL when CLKIN is 25Mhz */
>  /* AST_SCU_PCIE_CONFIG_SET             0x180 - PCI-E Configuration
> Setting Control Register */
> +#define SCU_PCIE_CONFIG_SET_BMC_DMA     (0x1 << 14)
> +#define SCU_PCIE_CONFIG_SET_BMC_MMIO    (0x1 << 9)
> +#define SCU_PCIE_CONFIG_SET_BMC_EN      (0x1 << 8)
> +#define SCU_PCIE_CONFIG_SET_VGA_MMIO    (0x1 << 1)
> +
>  /* AST_SCU_BMC_MMIO_DEC                        0x184 - BMC MMIO Decode
> Setting Register */
>  /* AST_SCU_DEC_AREA1                   0x188 - 1st relocated controller
> decode area location */
>  /* AST_SCU_DEC_AREA2                   0x18C - 2nd relocated controller
> decode area location */
> diff --git a/arch/arm/include/asm/arch-aspeed/regs-sdmc.h
> b/arch/arm/include/asm/arch-aspeed/regs-sdmc.h
> index 2cc26d29aa9e..3b516ecccdde 100644
> --- a/arch/arm/include/asm/arch-aspeed/regs-sdmc.h
> +++ b/arch/arm/include/asm/arch-aspeed/regs-sdmc.h
> @@ -18,6 +18,7 @@
>   */
>  #define AST_SDMC_PROTECT       0x00            /* protection key register
> */
>  #define AST_SDMC_CONFIG                0x04            /* Configuration
> register */
> +#define AST_SDMC_GFX_PROT      0x08            /* Graphics protection
> register */
>
>  /*     AST_SDMC_PROTECT: 0x00  - protection key register */
>  #define SDMC_PROTECT_UNLOCK                    0xFC600309
> @@ -29,4 +30,7 @@
>  #define SDMC_CONFIG_CACHE_EN           (0x1 << 10)
>  #define SDMC_CONFIG_EEC_EN             (0x1 << 7)
>
> +/*     AST_SDMC_GFX_PROT : 0x08 - Graphics protection register */
> +#define SDMC_GFX_PROT_XDMA     (0x1 << 16)
> +
>  #endif
> diff --git a/board/aspeed/ast-g4/ast-g4.c b/board/aspeed/ast-g4/ast-g4.c
> index 656495307b03..eda087fa5c17 100644
> --- a/board/aspeed/ast-g4/ast-g4.c
> +++ b/board/aspeed/ast-g4/ast-g4.c
> @@ -1,6 +1,6 @@
>  /*
>   * (C) Copyright 2002 Ryan Chen
> - * Copyright 2016 IBM Corporation
> + * Copyright 2016,2018 IBM Corporation
>   *
>   * SPDX-License-Identifier:     GPL-2.0+
>   */
> @@ -12,13 +12,44 @@
>  #include <asm/arch/ast-sdmc.h>
>  #include <asm/arch/ast_scu.h>
>  #include <asm/arch/regs-ahbc.h>
> +#include <asm/arch/regs-lpc.h>
>  #include <asm/arch/regs-scu.h>
> +#include <asm/arch/regs-sdmc.h>
>  #include <asm/io.h>
>
>  DECLARE_GLOBAL_DATA_PTR;
>
>  int board_init(void)
>  {
> +       u32 val;
> +
> +       /* iLPC2AHB */
> +       val = readl(AST_SCU_BASE + AST_SCU_HW_STRAP1);
> +       val |= SCU_HW_STRAP_LPC_DEC_SUPER_IO;
> +       writel(val, AST_SCU_BASE + AST_SCU_HW_STRAP1);
> +
> +       val = readl(AST_LPC_BASE + AST_LPC_HICRB);
> +       val |= LPC_HICRB_ILPC2AHB;
> +       writel(val, AST_LPC_BASE + AST_LPC_HICRB);
> +
> +       /* P2A, PCIe BMC */
> +       val = readl(AST_SCU_BASE + AST_SCU_PCIE_CONFIG_SET);
> +       val &= ~(SCU_PCIE_CONFIG_SET_BMC_DMA
> +                       | SCU_PCIE_CONFIG_SET_BMC_MMIO
> +                       | SCU_PCIE_CONFIG_SET_BMC_EN
> +                       | SCU_PCIE_CONFIG_SET_VGA_MMIO);
> +       writel(val, AST_SCU_BASE + AST_SCU_PCIE_CONFIG_SET);
> +
> +       /* X-DMA */
> +       val = readl(AST_SDMC_BASE + AST_SDMC_GFX_PROT);
> +       val |= SDMC_GFX_PROT_XDMA;
> +       writel(val, AST_SDMC_BASE + AST_SDMC_GFX_PROT);
> +
> +       /* LPC2AHB */
> +       val = readl(AST_LPC_BASE + AST_LPC_HICR5);
> +       val &= ~LPC_HICR5_ENFWH;
> +       writel(val, AST_LPC_BASE + AST_LPC_HICR5);
> +
>         /* address of boot parameters */
>         gd->bd->bi_boot_params = CONFIG_SYS_SDRAM_BASE + 0x100;
>         gd->flags = 0;
> diff --git a/board/aspeed/ast-g5/ast-g5.c b/board/aspeed/ast-g5/ast-g5.c
> index e67a4bf8b2b4..e8827524e3b2 100644
> --- a/board/aspeed/ast-g5/ast-g5.c
> +++ b/board/aspeed/ast-g5/ast-g5.c
> @@ -1,5 +1,5 @@
>  /*
> - * Copyright 2016 IBM Corporation
> + * Copyright 2016,2018 IBM Corporation
>   *
>   * This program is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU General Public License
> @@ -12,12 +12,49 @@
>
>  #include <asm/arch/ast_scu.h>
>  #include <asm/arch/ast-sdmc.h>
> +#include <asm/arch/regs-lpc.h>
> +#include <asm/arch/regs-scu.h>
> +#include <asm/arch/regs-sdmc.h>
>  #include <asm/io.h>
>
>  DECLARE_GLOBAL_DATA_PTR;
>
>  int board_init(void)
>  {
> +       u32 val;
> +
> +       /* iLPC2AHB */
> +       val = readl(AST_SCU_BASE + AST_SCU_HW_STRAP1);
> +       val |= SCU_HW_STRAP_LPC_DEC_SUPER_IO;
> +       writel(val, AST_SCU_BASE + AST_SCU_HW_STRAP1);
> +
> +       val = readl(AST_LPC_BASE + AST_LPC_HICRB);
> +       val |= LPC_HICRB_ILPC2AHB;
> +       writel(val, AST_LPC_BASE + AST_LPC_HICRB);
> +
> +       /* P2A, PCIe BMC */
> +       val = readl(AST_SCU_BASE + AST_SCU_PCIE_CONFIG_SET);
> +       val &= ~(SCU_PCIE_CONFIG_SET_BMC_DMA
> +                       | SCU_PCIE_CONFIG_SET_BMC_MMIO
> +                       | SCU_PCIE_CONFIG_SET_BMC_EN
> +                       | SCU_PCIE_CONFIG_SET_VGA_MMIO);
> +       writel(val, AST_SCU_BASE + AST_SCU_PCIE_CONFIG_SET);
> +
> +       /* Debug UART */
> +       val = readl(AST_SCU_BASE + AST_SCU_MISC1_CTRL);
> +       val |= SCU_MISC_DEBUG_UART;
> +       writel(val, AST_SCU_BASE + AST_SCU_MISC1_CTRL);
> +
> +       /* X-DMA */
> +       val = readl(AST_SDMC_BASE + AST_SDMC_GFX_PROT);
> +       val |= SDMC_GFX_PROT_XDMA;
> +       writel(val, AST_SDMC_BASE + AST_SDMC_GFX_PROT);
> +
> +       /* LPC2AHB */
> +       val = readl(AST_LPC_BASE + AST_LPC_HICR5);
> +       val &= ~LPC_HICR5_ENFWH;
> +       writel(val, AST_LPC_BASE + AST_LPC_HICR5);
> +
>         gd->bd->bi_boot_params = CONFIG_SYS_SDRAM_BASE + 0x100;
>         gd->flags = 0;
>
> --
> 2.17.1
>
>

-- 
Regards,
Kun

--000000000000d0183d0575dd1979
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks for sending the patch Andrew. I think it&#39;s=
 a viable solution since linux upstream didn&#39;t like the idea of misc co=
ntrols.</div><div><br></div>My feature request would be that we add config =
options for selectively turning these features on/off. For example, we actu=
ally use LPC2AHB and PCIe2AHB downstream for host-BMC mailbox typed transfe=
rs.. It would be nice if we could take this patch and define the flags to e=
nable what we needed.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr">=
On Mon, Jul 23, 2018 at 8:03 AM Andrew Jeffery &lt;<a href=3D"mailto:andrew=
@aj.id.au" target=3D"_blank">andrew@aj.id.au</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">Adjust board_init() to disable hardware features t=
hat we don&#39;t need<br>
available during normal BMC operation.<br>
<br>
Signed-off-by: Andrew Jeffery &lt;<a href=3D"mailto:andrew@aj.id.au" target=
=3D"_blank">andrew@aj.id.au</a>&gt;<br>
---<br>
=C2=A0arch/arm/include/asm/arch-aspeed/regs-lpc.h=C2=A0 | 29 ++++++++++++++=
+<br>
=C2=A0arch/arm/include/asm/arch-aspeed/regs-scu.h=C2=A0 |=C2=A0 8 +++-<br>
=C2=A0arch/arm/include/asm/arch-aspeed/regs-sdmc.h |=C2=A0 4 ++<br>
=C2=A0board/aspeed/ast-g4/ast-g4.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 33 ++++++++++++++++-<br>
=C2=A0board/aspeed/ast-g5/ast-g5.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 39 +++++++++++++++++++-<br>
=C2=A05 files changed, 110 insertions(+), 3 deletions(-)<br>
=C2=A0create mode 100644 arch/arm/include/asm/arch-aspeed/regs-lpc.h<br>
<br>
diff --git a/arch/arm/include/asm/arch-aspeed/regs-lpc.h b/arch/arm/include=
/asm/arch-aspeed/regs-lpc.h<br>
new file mode 100644<br>
index 000000000000..b0162ae4f37c<br>
--- /dev/null<br>
+++ b/arch/arm/include/asm/arch-aspeed/regs-lpc.h<br>
@@ -0,0 +1,29 @@<br>
+/* arch/arm/mach-aspeed/include/mach/regs-sdmc.h<br>
+ *<br>
+ * Copyright (C) 2018=C2=A0 IBM Corp<br>
+ *<br>
+ * This program is free software; you can redistribute it and/or modify<br=
>
+ * it under the terms of the GNU General Public License version 2 as<br>
+ * published by the Free Software Foundation.<br>
+ *<br>
+ *=C2=A0 =C2=A0History=C2=A0 =C2=A0 =C2=A0 :<br>
+ *=C2=A0 =C2=A0 1. 2018/07/23 Andrew Jeffery Create<br>
+ *<br>
+ *************************************************************************=
*****/<br>
+#ifndef __AST_REGS_LPC_H<br>
+#define __AST_REGS_LPC_H<br>
+<br>
+/*<br>
+ *=C2=A0 Register for LPC<br>
+ */<br>
+<br>
+#define AST_LPC_HICR5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x80<br>
+#define AST_LPC_HICRB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x100<br>
+<br>
+/*=C2=A0 =C2=A0 =C2=A0AST_LPC_HICR5 : 0x80=C2=A0 =C2=A0 Host Interface Con=
trol Register 5 */<br>
+#define LPC_HICR5_ENFWH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (0x1 &lt;&lt; 10)<br>
+<br>
+/*=C2=A0 =C2=A0 =C2=A0AST_LPC_HICRB : 0x100=C2=A0 =C2=A0Host Interface Con=
trol Register B */<br>
+#define LPC_HICRB_ILPC2AHB=C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 6)<br>
+<br>
+#endif<br>
diff --git a/arch/arm/include/asm/arch-aspeed/regs-scu.h b/arch/arm/include=
/asm/arch-aspeed/regs-scu.h<br>
index b714fa92341d..c9b91795d1aa 100644<br>
--- a/arch/arm/include/asm/arch-aspeed/regs-scu.h<br>
+++ b/arch/arm/include/asm/arch-aspeed/regs-scu.h<br>
@@ -466,6 +466,7 @@<br>
=C2=A0#define SCU_MISC_JTAG__M_TO_PCIE_EN=C2=A0 =C2=A0 (0x1 &lt;&lt; 14)<br=
>
=C2=A0#define SCU_MISC_VUART_TO_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 =
&lt;&lt; 13)<br>
=C2=A0#define SCU_MISC_DIV13_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (0x1 &lt;&lt; 12)<br>
+#define SCU_MISC_DEBUG_UART=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(0x1 &lt;&lt; 10)<br>
=C2=A0#define SCU_MISC_Y_CLK_INVERT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x1 =
&lt;&lt; 11)<br>
=C2=A0#define SCU_MISC_OUT_DELAY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(0x1 &lt;&lt; 9)<br>
=C2=A0#define SCU_MISC_PCI_TO_AHB_DIS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (0x1 &lt;&lt; 8)<br>
@@ -548,6 +549,7 @@<br>
=C2=A0/* AST_SCU_VGA_SCRATCH7=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x6c - VGA Scratch register */<br>
<br>
=C2=A0/* AST_SCU_HW_STRAP1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00x70 - hardware strapping register */<br>
+#define SCU_HW_STRAP_LPC_DEC_SUPER_IO=C2=A0 (0x1 &lt;&lt; 20)<br>
=C2=A0#ifdef AST_SOC_G5<br>
<br>
=C2=A0#define CLK_25M_IN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 23)<br>
@@ -593,7 +595,6 @@<br>
<br>
=C2=A0#define SCU_HW_STRAP_GPIOE_PT_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&=
lt; 22)<br>
=C2=A0#define SCU_HW_STRAP_GPIOD_PT_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&=
lt; 21)<br>
-#define SCU_HW_STRAP_LPC_DEC_SUPER_IO=C2=A0 (0x1 &lt;&lt; 20)<br>
=C2=A0#define SCU_HW_STRAP_ACPI_DIS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x1 =
&lt;&lt; 19)<br>
<br>
=C2=A0/* bit 23, 18 [1,0] */<br>
@@ -940,6 +941,11 @@<br>
<br>
=C2=A0/* AST_SCU_UART24_REF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 0x160 - Generate UART 24Mhz Ref from H-PLL when CLKIN is 25M=
hz */<br>
=C2=A0/* AST_SCU_PCIE_CONFIG_SET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00x180 - PCI-E Configuration Setting Control Register */<br>
+#define SCU_PCIE_CONFIG_SET_BMC_DMA=C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 14)<b=
r>
+#define SCU_PCIE_CONFIG_SET_BMC_MMIO=C2=A0 =C2=A0 (0x1 &lt;&lt; 9)<br>
+#define SCU_PCIE_CONFIG_SET_BMC_EN=C2=A0 =C2=A0 =C2=A0 (0x1 &lt;&lt; 8)<br=
>
+#define SCU_PCIE_CONFIG_SET_VGA_MMIO=C2=A0 =C2=A0 (0x1 &lt;&lt; 1)<br>
+<br>
=C2=A0/* AST_SCU_BMC_MMIO_DEC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x184 - BMC MMIO Decode Setting Regi=
ster */<br>
=C2=A0/* AST_SCU_DEC_AREA1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00x188 - 1st relocated controller decode area location *=
/<br>
=C2=A0/* AST_SCU_DEC_AREA2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00x18C - 2nd relocated controller decode area location *=
/<br>
diff --git a/arch/arm/include/asm/arch-aspeed/regs-sdmc.h b/arch/arm/includ=
e/asm/arch-aspeed/regs-sdmc.h<br>
index 2cc26d29aa9e..3b516ecccdde 100644<br>
--- a/arch/arm/include/asm/arch-aspeed/regs-sdmc.h<br>
+++ b/arch/arm/include/asm/arch-aspeed/regs-sdmc.h<br>
@@ -18,6 +18,7 @@<br>
=C2=A0 */<br>
=C2=A0#define AST_SDMC_PROTECT=C2=A0 =C2=A0 =C2=A0 =C2=A00x00=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* protection key register */<br>
=C2=A0#define AST_SDMC_CONFIG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0x04=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Configuration r=
egister */<br>
+#define AST_SDMC_GFX_PROT=C2=A0 =C2=A0 =C2=A0 0x08=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /* Graphics protection register */<br>
<br>
=C2=A0/*=C2=A0 =C2=A0 =C2=A0AST_SDMC_PROTECT: 0x00=C2=A0 - protection key r=
egister */<br>
=C2=A0#define SDMC_PROTECT_UNLOCK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0xFC600309<br>
@@ -29,4 +30,7 @@<br>
=C2=A0#define SDMC_CONFIG_CACHE_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
(0x1 &lt;&lt; 10)<br>
=C2=A0#define SDMC_CONFIG_EEC_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(0x1 &lt;&lt; 7)<br>
<br>
+/*=C2=A0 =C2=A0 =C2=A0AST_SDMC_GFX_PROT : 0x08 - Graphics protection regis=
ter */<br>
+#define SDMC_GFX_PROT_XDMA=C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 16)<br>
+<br>
=C2=A0#endif<br>
diff --git a/board/aspeed/ast-g4/ast-g4.c b/board/aspeed/ast-g4/ast-g4.c<br=
>
index 656495307b03..eda087fa5c17 100644<br>
--- a/board/aspeed/ast-g4/ast-g4.c<br>
+++ b/board/aspeed/ast-g4/ast-g4.c<br>
@@ -1,6 +1,6 @@<br>
=C2=A0/*<br>
=C2=A0 * (C) Copyright 2002 Ryan Chen<br>
- * Copyright 2016 IBM Corporation<br>
+ * Copyright 2016,2018 IBM Corporation<br>
=C2=A0 *<br>
=C2=A0 * SPDX-License-Identifier:=C2=A0 =C2=A0 =C2=A0GPL-2.0+<br>
=C2=A0 */<br>
@@ -12,13 +12,44 @@<br>
=C2=A0#include &lt;asm/arch/ast-sdmc.h&gt;<br>
=C2=A0#include &lt;asm/arch/ast_scu.h&gt;<br>
=C2=A0#include &lt;asm/arch/regs-ahbc.h&gt;<br>
+#include &lt;asm/arch/regs-lpc.h&gt;<br>
=C2=A0#include &lt;asm/arch/regs-scu.h&gt;<br>
+#include &lt;asm/arch/regs-sdmc.h&gt;<br>
=C2=A0#include &lt;asm/io.h&gt;<br>
<br>
=C2=A0DECLARE_GLOBAL_DATA_PTR;<br>
<br>
=C2=A0int board_init(void)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* iLPC2AHB */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D readl(AST_SCU_BASE + AST_SCU_HW_STRAP1)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val |=3D SCU_HW_STRAP_LPC_DEC_SUPER_IO;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(val, AST_SCU_BASE + AST_SCU_HW_STRAP1);<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D readl(AST_LPC_BASE + AST_LPC_HICRB);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val |=3D LPC_HICRB_ILPC2AHB;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(val, AST_LPC_BASE + AST_LPC_HICRB);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* P2A, PCIe BMC */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D readl(AST_SCU_BASE + AST_SCU_PCIE_CONFI=
G_SET);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val &amp;=3D ~(SCU_PCIE_CONFIG_SET_BMC_DMA<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| SCU_PCIE_CONFIG_SET_BMC_MMIO<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| SCU_PCIE_CONFIG_SET_BMC_EN<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| SCU_PCIE_CONFIG_SET_VGA_MMIO);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(val, AST_SCU_BASE + AST_SCU_PCIE_CONFIG_=
SET);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* X-DMA */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D readl(AST_SDMC_BASE + AST_SDMC_GFX_PROT=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val |=3D SDMC_GFX_PROT_XDMA;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(val, AST_SDMC_BASE + AST_SDMC_GFX_PROT);=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* LPC2AHB */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D readl(AST_LPC_BASE + AST_LPC_HICR5);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val &amp;=3D ~LPC_HICR5_ENFWH;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(val, AST_LPC_BASE + AST_LPC_HICR5);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* address of boot parameters */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gd-&gt;bd-&gt;bi_boot_params =3D CONFIG_SYS_SDR=
AM_BASE + 0x100;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gd-&gt;flags =3D 0;<br>
diff --git a/board/aspeed/ast-g5/ast-g5.c b/board/aspeed/ast-g5/ast-g5.c<br=
>
index e67a4bf8b2b4..e8827524e3b2 100644<br>
--- a/board/aspeed/ast-g5/ast-g5.c<br>
+++ b/board/aspeed/ast-g5/ast-g5.c<br>
@@ -1,5 +1,5 @@<br>
=C2=A0/*<br>
- * Copyright 2016 IBM Corporation<br>
+ * Copyright 2016,2018 IBM Corporation<br>
=C2=A0 *<br>
=C2=A0 * This program is free software; you can redistribute it and/or<br>
=C2=A0 * modify it under the terms of the GNU General Public License<br>
@@ -12,12 +12,49 @@<br>
<br>
=C2=A0#include &lt;asm/arch/ast_scu.h&gt;<br>
=C2=A0#include &lt;asm/arch/ast-sdmc.h&gt;<br>
+#include &lt;asm/arch/regs-lpc.h&gt;<br>
+#include &lt;asm/arch/regs-scu.h&gt;<br>
+#include &lt;asm/arch/regs-sdmc.h&gt;<br>
=C2=A0#include &lt;asm/io.h&gt;<br>
<br>
=C2=A0DECLARE_GLOBAL_DATA_PTR;<br>
<br>
=C2=A0int board_init(void)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* iLPC2AHB */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D readl(AST_SCU_BASE + AST_SCU_HW_STRAP1)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val |=3D SCU_HW_STRAP_LPC_DEC_SUPER_IO;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(val, AST_SCU_BASE + AST_SCU_HW_STRAP1);<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D readl(AST_LPC_BASE + AST_LPC_HICRB);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val |=3D LPC_HICRB_ILPC2AHB;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(val, AST_LPC_BASE + AST_LPC_HICRB);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* P2A, PCIe BMC */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D readl(AST_SCU_BASE + AST_SCU_PCIE_CONFI=
G_SET);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val &amp;=3D ~(SCU_PCIE_CONFIG_SET_BMC_DMA<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| SCU_PCIE_CONFIG_SET_BMC_MMIO<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| SCU_PCIE_CONFIG_SET_BMC_EN<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| SCU_PCIE_CONFIG_SET_VGA_MMIO);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(val, AST_SCU_BASE + AST_SCU_PCIE_CONFIG_=
SET);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Debug UART */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D readl(AST_SCU_BASE + AST_SCU_MISC1_CTRL=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val |=3D SCU_MISC_DEBUG_UART;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(val, AST_SCU_BASE + AST_SCU_MISC1_CTRL);=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* X-DMA */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D readl(AST_SDMC_BASE + AST_SDMC_GFX_PROT=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val |=3D SDMC_GFX_PROT_XDMA;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(val, AST_SDMC_BASE + AST_SDMC_GFX_PROT);=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* LPC2AHB */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D readl(AST_LPC_BASE + AST_LPC_HICR5);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val &amp;=3D ~LPC_HICR5_ENFWH;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(val, AST_LPC_BASE + AST_LPC_HICR5);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gd-&gt;bd-&gt;bi_boot_params =3D CONFIG_SYS_SDR=
AM_BASE + 0x100;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gd-&gt;flags =3D 0;<br>
<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"m_6379003548251518587m_-7992730932912437700gmail_signature" data-=
smartmail=3D"gmail_signature"><div dir=3D"ltr">Regards,<div>Kun</div></div>=
</div>

--000000000000d0183d0575dd1979--
