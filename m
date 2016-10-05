Return-Path: <maxims@google.com>
Received: from mail-yw0-x22b.google.com (mail-yw0-x22b.google.com
 [IPv6:2607:f8b0:4002:c05::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sq1BG3gBCzDqQq
 for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2016 03:16:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=cgxA2Gxi; 
 dkim-atps=neutral
Received: by mail-yw0-x22b.google.com with SMTP id t193so85418125ywc.2
 for <openbmc@lists.ozlabs.org>; Wed, 05 Oct 2016 09:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=td21VOvKRtd2h6GMxr3hNTnClN+0GoSoqMDOc7rabUo=;
 b=cgxA2GxiUmfsvGWGzxa2dnmrhSbUO7gW7RqC80dZTp62porf4SwHdbMvuN95mH0j46
 +0POO3e7y0wvczGSAgAOEBpWSVDUCy122zzpyywXBO9JEPapsj4aUowe1NAcHTGA8E1k
 b84H6Z3HFn0A8XuHlJoqFfmXVzmPE9U36/GduWhVuHFO7FOsorWkEzRfbGOjEaJ8Su6s
 hwXuazvHetbUCwJOzUCxDX58ZV5OGqGYMAeFmZtTyFTKxnWnL4dGdlvqOnRg2U7UgugO
 t45cqw43fAKh/oRIOFCcGnS982kT0Z51s3gs431LZAHBcZQrbm2F/hnx8OLm3mgcV9Pr
 hv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=td21VOvKRtd2h6GMxr3hNTnClN+0GoSoqMDOc7rabUo=;
 b=jH248zfFXqY+AGdxQph+FgsncXTSaZ/FlT2z+hvCQj0SLAltZl23mV4qUEedPEdd04
 pk0pFDx+1Oj/rhPf1f+oxLCSDUSYsjKmg50cormrqEygdldwO+VjFwYLeLZlqejaaMPX
 lLDs0F0M0sJdm8vfCI5iWx0BNU3+fu3C++9JmMEZeOvkWFCtpCJQdssVBQXkTLNjdFAE
 lWQq1DgTNDSDXE93oZnsaBHcHvxpMXA0XX4tt7C+HaBUWogNeAz+rUtg+GlJwUiBkpRg
 YFnXueipSe8Sx7TEM88Zj4LAe/zBN1FntbF5kkbg0ySNkY46Qo9lRQcKbiFZZqLbxhJ6
 sEeQ==
X-Gm-Message-State: AA6/9Rn03ypuSeSTZRgoHQHaVfARuRH0p8u4wC754mv5sn8BVHWOek10BI7RJSyWbxHA04RKPvbgLhv//lr/QgZ/
X-Received: by 10.37.4.203 with SMTP id 194mr7817697ybe.10.1475684196049; Wed,
 05 Oct 2016 09:16:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.38.80 with HTTP; Wed, 5 Oct 2016 09:16:35 -0700 (PDT)
In-Reply-To: <1475520957-78581-1-git-send-email-maxims@google.com>
References: <1475184427-144121-3-git-send-email-maxims@google.com>
 <1475520957-78581-1-git-send-email-maxims@google.com>
From: Maxim Sloyko <maxims@google.com>
Date: Wed, 5 Oct 2016 09:16:35 -0700
Message-ID: <CAFR_W8r2zQG2SrJYMxUNNLT850_0XV0y9oh9xXB-2JesqZYv2Q@mail.gmail.com>
Subject: Re: [PATCH] aspeed: SCU helper functions for I2C.
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a11c001e84eea3b053e208091
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
X-List-Received-Date: Wed, 05 Oct 2016 16:16:39 -0000

--001a11c001e84eea3b053e208091
Content-Type: text/plain; charset=UTF-8

Ping

On Mon, Oct 3, 2016 at 11:55 AM, <maxims@google.com> wrote:

> From: Maxim Sloyko <maxims@google.com>
>
> SCU helper functions for configuring I2C pins and accessing APB clock.
> ---
>  arch/arm/include/asm/arch-aspeed/ast_scu.h  |  6 +++++
>  arch/arm/include/asm/arch-aspeed/regs-scu.h |  8 ++++++
>  arch/arm/mach-aspeed/ast-scu.c              | 38
> +++++++++++++++++++++++++++++
>  3 files changed, 52 insertions(+)
>
> diff --git a/arch/arm/include/asm/arch-aspeed/ast_scu.h
> b/arch/arm/include/asm/arch-aspeed/ast_scu.h
> index d248416..80ebd6f 100644
> --- a/arch/arm/include/asm/arch-aspeed/ast_scu.h
> +++ b/arch/arm/include/asm/arch-aspeed/ast_scu.h
> @@ -38,6 +38,7 @@ extern void ast_scu_get_who_init_dram(void);
>  extern u32 ast_get_clk_source(void);
>  extern u32 ast_get_h_pll_clk(void);
>  extern u32 ast_get_ahbclk(void);
> +extern u32 ast_get_apbclk(void);
>
>  extern u32 ast_scu_get_vga_memsize(void);
>
> @@ -45,4 +46,9 @@ extern void ast_scu_init_eth(u8 num);
>  extern void ast_scu_multi_func_eth(u8 num);
>  extern void ast_scu_multi_func_romcs(u8 num);
>
> +/* Enable I2C controller and pins for a particular device.
> + * Device numbering starts at 1
> + */
> +extern void ast_scu_enable_i2c(u8 num);
> +
>  #endif
> diff --git a/arch/arm/include/asm/arch-aspeed/regs-scu.h
> b/arch/arm/include/asm/arch-aspeed/regs-scu.h
> index aab032a..4c869c1 100644
> --- a/arch/arm/include/asm/arch-aspeed/regs-scu.h
> +++ b/arch/arm/include/asm/arch-aspeed/regs-scu.h
> @@ -915,6 +915,11 @@
>  #define SCU_FUN_PIN_ROMA4              (0x1 << 18)
>  #define SCU_FUN_PIN_ROMA3              (0x1 << 17)
>  #define SCU_FUN_PIN_ROMA2              (0x1 << 16)
> +/* AST2500 only */
> +#define SCU_FUN_PIN_SDA2               (0x1 << 15)
> +#define SCU_FUN_PIN_SCL2               (0x1 << 14)
> +#define SCU_FUN_PIN_SDA1               (0x1 << 13)
> +#define SCU_FUN_PIN_SCL1               (0x1 << 12)
>
>  /* AST_SCU_FUN_PIN_CTRL9               0xA8 - Multi-function Pin
> Control#9 */
>  #define SCU_FUN_PIN_ROMA21             (0x1 << 3)
> @@ -950,4 +955,7 @@
>  /* AST_SCU_BMC_CLASS                   0x19C - BMC device class code and
> revision ID */
>  /* AST_SCU_BMC_DEV_ID                  0x1A4 - BMC device ID */
>
> +#define SCU_I2C_MIN_BUS_NUM                    (1)
> +#define SCU_I2C_MAX_BUS_NUM                    (14)
> +
>  #endif
> diff --git a/arch/arm/mach-aspeed/ast-scu.c b/arch/arm/mach-aspeed/ast-
> scu.c
> index 280c421..1dbd667 100644
> --- a/arch/arm/mach-aspeed/ast-scu.c
> +++ b/arch/arm/mach-aspeed/ast-scu.c
> @@ -318,6 +318,17 @@ u32 ast_get_ahbclk(void)
>
>  #endif /* AST_SOC_G5 */
>
> +u32 ast_get_apbclk(void)
> +{
> +       u32 h_pll = ast_get_h_pll_clk();
> +       /* The formula for converting the bit pattern to divisor is
> +        * (4 + 4 * DIV), according to datasheet
> +        */
> +       u32 apb_div = 4 + 4 * SCU_GET_PCLK_DIV(ast_scu_read(
> AST_SCU_CLK_SEL));
> +       return h_pll / apb_div;
> +}
> +
> +
>  void ast_scu_show_system_info(void)
>  {
>
> @@ -496,3 +507,30 @@ void ast_scu_get_who_init_dram(void)
>                 break;
>         }
>  }
> +
> +void ast_scu_enable_i2c(u8 bus_num)
> +{
> +       if (bus_num < SCU_I2C_MIN_BUS_NUM || bus_num >
> SCU_I2C_MAX_BUS_NUM) {
> +               debug("%s: bus_num is out of range, must be [%d - %d]\n",
> __func__,
> +                         SCU_I2C_MIN_BUS_NUM, SCU_I2C_MAX_BUS_NUM);
> +               return;
> +       }
> +
> +       /* Enable I2C Controllers */
> +       clrbits_le32(AST_SCU_BASE + AST_SCU_RESET, SCU_RESET_I2C);
> +
> +       if (bus_num >= 3) {
> +               setbits_le32(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL5,
> +                                        SCU_FUN_PIN_I2C(bus_num));
> +#ifdef AST_SOC_G5
> +       /* In AST2400 aka AST_SOC_G4 SDA{1,2}/SCL{1,2} are fixed function
> pins,
> +        * so no need to change their function. */
> +       } else if (bus_num == 1) {
> +               setbits_le32(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL8,
> +                                        SCU_FUN_PIN_SDA1 |
> SCU_FUN_PIN_SCL1);
> +       } else if (bus_num == 2) {
> +               setbits_le32(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL8,
> +                                        SCU_FUN_PIN_SDA2 |
> SCU_FUN_PIN_SCL2);
> +#endif
> +       }
> +}
> --
> 2.8.0.rc3.226.g39d4020
>
>


-- 
*M*axim *S*loyko

--001a11c001e84eea3b053e208091
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ping</div><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On Mon, Oct 3, 2016 at 11:55 AM,  <span dir=3D"ltr">&lt;<a href=
=3D"mailto:maxims@google.com" target=3D"_blank">maxims@google.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">From: Maxim=
 Sloyko &lt;<a href=3D"mailto:maxims@google.com">maxims@google.com</a>&gt;<=
br>
<br>
SCU helper functions for configuring I2C pins and accessing APB clock.<br>
---<br>
=C2=A0arch/arm/include/asm/arch-<wbr>aspeed/ast_scu.h=C2=A0 |=C2=A0 6 +++++=
<br>
=C2=A0arch/arm/include/asm/arch-<wbr>aspeed/regs-scu.h |=C2=A0 8 ++++++<br>
</span>=C2=A0arch/arm/mach-aspeed/ast-scu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 38 +++++++++++++++++++++++++++++<br>
=C2=A03 files changed, 52 insertions(+)<br>
<div><div class=3D"h5"><br>
diff --git a/arch/arm/include/asm/arch-<wbr>aspeed/ast_scu.h b/arch/arm/inc=
lude/asm/arch-<wbr>aspeed/ast_scu.h<br>
index d248416..80ebd6f 100644<br>
--- a/arch/arm/include/asm/arch-<wbr>aspeed/ast_scu.h<br>
+++ b/arch/arm/include/asm/arch-<wbr>aspeed/ast_scu.h<br>
@@ -38,6 +38,7 @@ extern void ast_scu_get_who_init_dram(<wbr>void);<br>
=C2=A0extern u32 ast_get_clk_source(void);<br>
=C2=A0extern u32 ast_get_h_pll_clk(void);<br>
=C2=A0extern u32 ast_get_ahbclk(void);<br>
+extern u32 ast_get_apbclk(void);<br>
<br>
=C2=A0extern u32 ast_scu_get_vga_memsize(void);<br>
<br>
@@ -45,4 +46,9 @@ extern void ast_scu_init_eth(u8 num);<br>
=C2=A0extern void ast_scu_multi_func_eth(u8 num);<br>
=C2=A0extern void ast_scu_multi_func_romcs(u8 num);<br>
<br>
+/* Enable I2C controller and pins for a particular device.<br>
+ * Device numbering starts at 1<br>
+ */<br>
+extern void ast_scu_enable_i2c(u8 num);<br>
+<br>
=C2=A0#endif<br>
diff --git a/arch/arm/include/asm/arch-<wbr>aspeed/regs-scu.h b/arch/arm/in=
clude/asm/arch-<wbr>aspeed/regs-scu.h<br>
index aab032a..4c869c1 100644<br>
--- a/arch/arm/include/asm/arch-<wbr>aspeed/regs-scu.h<br>
+++ b/arch/arm/include/asm/arch-<wbr>aspeed/regs-scu.h<br>
@@ -915,6 +915,11 @@<br>
=C2=A0#define SCU_FUN_PIN_ROMA4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (0x1 &lt;&lt; 18)<br>
=C2=A0#define SCU_FUN_PIN_ROMA3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (0x1 &lt;&lt; 17)<br>
=C2=A0#define SCU_FUN_PIN_ROMA2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (0x1 &lt;&lt; 16)<br>
+/* AST2500 only */<br>
+#define SCU_FUN_PIN_SDA2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(0x1 &lt;&lt; 15)<br>
+#define SCU_FUN_PIN_SCL2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(0x1 &lt;&lt; 14)<br>
+#define SCU_FUN_PIN_SDA1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(0x1 &lt;&lt; 13)<br>
+#define SCU_FUN_PIN_SCL1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(0x1 &lt;&lt; 12)<br>
<br>
=C2=A0/* AST_SCU_FUN_PIN_CTRL9=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00xA8 - Multi-function Pin Control#9 */<br>
=C2=A0#define SCU_FUN_PIN_ROMA21=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(0x1 &lt;&lt; 3)<br>
@@ -950,4 +955,7 @@<br>
=C2=A0/* AST_SCU_BMC_CLASS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00x19C - BMC device class code and revision ID */<br>
=C2=A0/* AST_SCU_BMC_DEV_ID=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 0x1A4 - BMC device ID */<br>
<br>
+#define SCU_I2C_MIN_BUS_NUM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (1)<br>
+#define SCU_I2C_MAX_BUS_NUM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (14)<br>
+<br>
=C2=A0#endif<br>
diff --git a/arch/arm/mach-aspeed/ast-<wbr>scu.c b/arch/arm/mach-aspeed/ast=
-<wbr>scu.c<br>
</div></div>index 280c421..1dbd667 100644<br>
<span class=3D"">--- a/arch/arm/mach-aspeed/ast-<wbr>scu.c<br>
+++ b/arch/arm/mach-aspeed/ast-<wbr>scu.c<br>
@@ -318,6 +318,17 @@ u32 ast_get_ahbclk(void)<br>
<br>
=C2=A0#endif /* AST_SOC_G5 */<br>
<br>
+u32 ast_get_apbclk(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 h_pll =3D ast_get_h_pll_clk();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The formula for converting the bit pattern t=
o divisor is<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * (4 + 4 * DIV), according to datasheet<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 apb_div =3D 4 + 4 * SCU_GET_PCLK_DIV(ast_sc=
u_read(<wbr>AST_SCU_CLK_SEL));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return h_pll / apb_div;<br>
+}<br>
+<br>
+<br>
=C2=A0void ast_scu_show_system_info(void)<br>
=C2=A0{<br>
<br>
</span>@@ -496,3 +507,30 @@ void ast_scu_get_who_init_dram(<wbr>void)<br>
<span class=3D"">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 br=
eak;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0}<br>
+<br>
+void ast_scu_enable_i2c(u8 bus_num)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (bus_num &lt; SCU_I2C_MIN_BUS_NUM || bus_num=
 &gt; SCU_I2C_MAX_BUS_NUM) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0debug(&quot;%s: bus=
_num is out of range, must be [%d - %d]\n&quot;, __func__,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0SCU_I2C_MIN_BUS_NUM, SCU_I2C_MAX_BUS_NUM);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Enable I2C Controllers */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clrbits_le32(AST_SCU_BASE + AST_SCU_RESET, SCU_=
RESET_I2C);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (bus_num &gt;=3D 3) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0setbits_le32(AST_SC=
U_BASE + AST_SCU_FUN_PIN_CTRL5,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SCU_FUN_=
PIN_I2C(bus_num));<br>
+#ifdef AST_SOC_G5<br>
</span>+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* In AST2400 aka AST_SOC_G4 SDA{1,2}/SC=
L{1,2} are fixed function pins,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * so no need to change their function. */<br>
<div class=3D"HOEnZb"><div class=3D"h5">+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else =
if (bus_num =3D=3D 1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0setbits_le32(AST_SC=
U_BASE + AST_SCU_FUN_PIN_CTRL8,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SCU_FUN_=
PIN_SDA1 | SCU_FUN_PIN_SCL1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (bus_num =3D=3D 2) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0setbits_le32(AST_SC=
U_BASE + AST_SCU_FUN_PIN_CTRL8,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SCU_FUN_=
PIN_SDA2 | SCU_FUN_PIN_SCL2);<br>
+#endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+}<br>
--<br>
2.8.0.rc3.226.g39d4020<br>
<br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div><b>M=
</b>axim <b>S</b>loyko</div></div>
</div>

--001a11c001e84eea3b053e208091--
