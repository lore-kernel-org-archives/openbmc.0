Return-Path: <maxims@google.com>
Received: from mail-yw0-x22e.google.com (mail-yw0-x22e.google.com
 [IPv6:2607:f8b0:4002:c05::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3slNHy48nnzDskT
 for <openbmc@lists.ozlabs.org>; Fri, 30 Sep 2016 04:23:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=nv0IuLuE; 
 dkim-atps=neutral
Received: by mail-yw0-x22e.google.com with SMTP id t67so54306639ywg.3
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 11:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=5LYa5dPFh6IfvOAYylrtTBoBaH1a0BQ400X8Xa3KQvo=;
 b=nv0IuLuEKZAaTpC+H7hlVxTOVOb1468PrMyc5/1Mt/u3euc/I4QJoqvGQhRU/Ogdt1
 WMjDoxwCkauxO9dKWJVBzo6w4pINJfaj7W2WwYW3NlATTsqt0KxmiTYxx7xa8PvJ6UIn
 sNqQX/0k+NAGn7hyVt5ITvKeqSfxgYJtZ37BN1Og9f2ix4tlcbQAbG933TNMgZR0Y53C
 UXnk8lotkCryHZnrm0N4MerkNtCwukzDimgAAAFIMVS22LBB4dX3y0KhgIjacXok7RQ4
 0FMZ3UO39Kf7cUlT8txU8kf3CWF/e36+6QcbLsdH4jUIyoWtZCa7pLpu1+80Xxug6S/V
 Ke8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=5LYa5dPFh6IfvOAYylrtTBoBaH1a0BQ400X8Xa3KQvo=;
 b=LBM8P/R41gaohbU6JuvMchYilVHENF5YY0tSenhCDGWUSuO5vgNNecAVmsSt65wVV3
 NzU0kxUURz9EkPmojXNkkMPq2JptR+AZfng+nbMWWW6BqHjhI5JdO1Tp1BGRdLvLsxYu
 /Pjfy+68zneMi7nblkvVRUKMg0dslnmut0tqRPqAMd3Ou37LBgcllQvhcY5eE8/3HZNS
 fpJLgIJDVRnc3dtXR/xF/d3dq3trnaZS/QDzyHj4u8d2dMqSiS7kvqTAlOUZFQfkNBhl
 mz+qhsTfR/6XRpc3h64vM1sgCjSe2wW5QTd6J7lWVVf5ndiKiXlZdsxoZA5VQiObtnMQ
 hbNg==
X-Gm-Message-State: AA6/9RlmVnD6ouoewf7TyCY/HBRKdt4Fc+Jq/yntflrksRH4ziUfhJ17oiMLBN9vzWu0PGsfokQUfk7jqViABfmi
X-Received: by 10.13.246.199 with SMTP id g190mr1887490ywf.124.1475173435617; 
 Thu, 29 Sep 2016 11:23:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.38.80 with HTTP; Thu, 29 Sep 2016 11:23:55 -0700 (PDT)
In-Reply-To: <CACPK8XfgUCEfcgmZ8P2wpMCRHn-jaVup_X5cpq93bYMkZy-jTw@mail.gmail.com>
References: <1474306018-101166-1-git-send-email-maxims@google.com>
 <1474998214-12720-1-git-send-email-maxims@google.com>
 <1474998214-12720-2-git-send-email-maxims@google.com>
 <CACPK8XfgUCEfcgmZ8P2wpMCRHn-jaVup_X5cpq93bYMkZy-jTw@mail.gmail.com>
From: Maxim Sloyko <maxims@google.com>
Date: Thu, 29 Sep 2016 11:23:55 -0700
Message-ID: <CAFR_W8rc=2XkpUwPokx2_00wMnZfxq9VTHTOVrXgJ8r7DkJ=0w@mail.gmail.com>
Subject: Re: [PATCH 2/3] aspeed/g5: helper SCU functions for configuring
 aspeed I2C
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=94eb2c03116c9d4762053da9945a
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
X-List-Received-Date: Thu, 29 Sep 2016 18:23:59 -0000

--94eb2c03116c9d4762053da9945a
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 28, 2016 at 6:03 PM, Joel Stanley <joel@jms.id.au> wrote:

> On Wed, Sep 28, 2016 at 3:13 AM,  <maxims@google.com> wrote:
>
> You need a commit message.
>
> > From: Maxim Sloyko <maxims@google.com>
> >
> > ---
> >  arch/arm/include/asm/arch-aspeed/ast_scu.h  |  6 +++
> >  arch/arm/include/asm/arch-aspeed/regs-scu.h | 74
> ++++++++++++++++-------------
>
> Please put the reformatting of header files in a seperate patch.
>

What do you mean by reformatting?


>
> >  arch/arm/mach-aspeed/ast-scu.c              | 30 +++++++++++-
> >  3 files changed, 75 insertions(+), 35 deletions(-)
> >
> > diff --git a/arch/arm/include/asm/arch-aspeed/ast_scu.h
> b/arch/arm/include/asm/arch-aspeed/ast_scu.h
> > index d248416..80ebd6f 100644
> > --- a/arch/arm/include/asm/arch-aspeed/ast_scu.h
> > +++ b/arch/arm/include/asm/arch-aspeed/ast_scu.h
> > @@ -38,6 +38,7 @@ extern void ast_scu_get_who_init_dram(void);
> >  extern u32 ast_get_clk_source(void);
> >  extern u32 ast_get_h_pll_clk(void);
> >  extern u32 ast_get_ahbclk(void);
> > +extern u32 ast_get_apbclk(void);
> >
> >  extern u32 ast_scu_get_vga_memsize(void);
> >
> > @@ -45,4 +46,9 @@ extern void ast_scu_init_eth(u8 num);
> >  extern void ast_scu_multi_func_eth(u8 num);
> >  extern void ast_scu_multi_func_romcs(u8 num);
> >
> > +/* Enable I2C controller and pins for a particular device.
> > + * Device numbering starts at 1
> > + */
> > +extern void ast_scu_enable_i2c(u8 num);
> > +
> >  #endif
> > diff --git a/arch/arm/include/asm/arch-aspeed/regs-scu.h
> b/arch/arm/include/asm/arch-aspeed/regs-scu.h
> > index b89df82..92ce84a 100644
> > --- a/arch/arm/include/asm/arch-aspeed/regs-scu.h
> > +++ b/arch/arm/include/asm/arch-aspeed/regs-scu.h
> > @@ -10,8 +10,8 @@
> >   *    1. 2012/12/29 Ryan Chen Create
> >   *
> >  ************************************************************
> ********************/
> > -#ifndef __AST_SCU_H
> > -#define __AST_SCU_H                     1
> > +#ifndef __AST_REGS_SCU_H
> > +#define __AST_REGS_SCU_H                     1
> >
> >  #include <asm/arch/aspeed.h>
> >
> > @@ -830,49 +830,50 @@
> >  /* AST_SCU_FUN_PIN_CTRL5               0x90 - Multi-function Pin
> Control#5 */
> >  #define SCU_FUN_PIN_SPICS1             (0x1 << 31)
> >  #define SCU_FUN_PIN_LPC_PLUS           (0x1 << 30)
> > -#define SCU_FUC_PIN_USB20_HOST         (0x1 << 29)
> > -#define SCU_FUC_PIN_USB11_PORT4                (0x1 << 28)
> > -#define SCU_FUC_PIN_I2C14              (0x1 << 27)
> > -#define SCU_FUC_PIN_I2C13              (0x1 << 26)
> > -#define SCU_FUC_PIN_I2C12              (0x1 << 25)
> > -#define SCU_FUC_PIN_I2C11              (0x1 << 24)
> > -#define SCU_FUC_PIN_I2C10              (0x1 << 23)
> > -#define SCU_FUC_PIN_I2C9               (0x1 << 22)
> > -#define SCU_FUC_PIN_I2C8               (0x1 << 21)
> > -#define SCU_FUC_PIN_I2C7               (0x1 << 20)
> > -#define SCU_FUC_PIN_I2C6               (0x1 << 19)
> > -#define SCU_FUC_PIN_I2C5               (0x1 << 18)
> > -#define SCU_FUC_PIN_I2C4               (0x1 << 17)
> > -#define SCU_FUC_PIN_I2C3               (0x1 << 16)
> > -#define SCU_FUC_PIN_MII2_RX_DWN_DIS    (0x1 << 15)
> > -#define SCU_FUC_PIN_MII2_TX_DWN_DIS    (0x1 << 14)
> > -#define SCU_FUC_PIN_MII1_RX_DWN_DIS    (0x1 << 13)
> > -#define SCU_FUC_PIN_MII1_TX_DWN_DIS    (0x1 << 12)
> > -
> > -#define SCU_FUC_PIN_MII2_TX_DRIV(x)    (x << 10)
> > -#define SCU_FUC_PIN_MII2_TX_DRIV_MASK  (0x3 << 10)
> > -#define SCU_FUC_PIN_MII1_TX_DRIV(x)    (x << 8)
> > -#define SCU_FUC_PIN_MII1_TX_DRIV_MASK  (0x3 << 8)
> > +#define SCU_FUN_PIN_USB20_HOST         (0x1 << 29)
> > +#define SCU_FUN_PIN_USB11_PORT4                (0x1 << 28)
> > +#define SCU_FUN_PIN_I2C14              (0x1 << 27)
> > +#define SCU_FUN_PIN_I2C13              (0x1 << 26)
> > +#define SCU_FUN_PIN_I2C12              (0x1 << 25)
> > +#define SCU_FUN_PIN_I2C11              (0x1 << 24)
> > +#define SCU_FUN_PIN_I2C10              (0x1 << 23)
> > +#define SCU_FUN_PIN_I2C9               (0x1 << 22)
> > +#define SCU_FUN_PIN_I2C8               (0x1 << 21)
> > +#define SCU_FUN_PIN_I2C7               (0x1 << 20)
> > +#define SCU_FUN_PIN_I2C6               (0x1 << 19)
> > +#define SCU_FUN_PIN_I2C5               (0x1 << 18)
> > +#define SCU_FUN_PIN_I2C4               (0x1 << 17)
> > +#define SCU_FUN_PIN_I2C3               (0x1 << 16)
> > +#define SCU_FUN_PIN_I2C(n)             (0x1 << (16 + (n) - 3))
> > +#define SCU_FUN_PIN_MII2_RX_DWN_DIS    (0x1 << 15)
> > +#define SCU_FUN_PIN_MII2_TX_DWN_DIS    (0x1 << 14)
> > +#define SCU_FUN_PIN_MII1_RX_DWN_DIS    (0x1 << 13)
> > +#define SCU_FUN_PIN_MII1_TX_DWN_DIS    (0x1 << 12)
>
> It looks like you're just changing the SCU_FUC_ to SCU_FUN. Without a
> commit message I'm not sure why you're doing this, can you explain
> why?
>
> I don't think it is required.
>
> If you were to make a change like this you should perform the renaming
> and update the call sites in a separate patch to any other changes.
> This makes it easier to review.
>

Because that's a typo that got out of hand. FUN supposed to stand for
FUNCTION,
FUC ... no guesses.


>
>
> > diff --git a/arch/arm/mach-aspeed/ast-scu.c b/arch/arm/mach-aspeed/ast-
> scu.c
> > index 0cc0d67..1452b93 100644
> > --- a/arch/arm/mach-aspeed/ast-scu.c
> > +++ b/arch/arm/mach-aspeed/ast-scu.c
> > @@ -318,6 +318,14 @@ u32 ast_get_ahbclk(void)
> >
> >  #endif /* AST_SOC_G5 */
> >
> > +u32 ast_get_apbclk(void)
> > +{
> > +       u32 h_pll = ast_get_h_pll_clk();
> > +       u32 apb_div = SCU_GET_PCLK_DIV(ast_scu_read(AST_SCU_CLK_SEL));
> > +       return h_pll / apb_div;
> > +}
>
> This will do for now. We suspect need to write a clock driver that
> will live in drivers/clk/ to do it properly.
>
> Can apb_div ever be zero?
>
>
Oh, this is actually wrong... Fixed.


> > +
> > +
> >  void ast_scu_show_system_info(void)
> >  {
> >
> > @@ -394,7 +402,7 @@ void ast_scu_multi_func_eth(u8 num)
> >                               AST_SCU_FUN_PIN_CTRL1);
> >
> >                 ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
> > -                             SCU_FUC_PIN_MAC1_MDIO,
> > +                             SCU_FUN_PIN_MAC1_MDIO,
> >                               AST_SCU_FUN_PIN_CTRL5);
> >
> >                 break;
> > @@ -496,3 +504,23 @@ void ast_scu_get_who_init_dram(void)
> >                 break;
> >         }
> >  }
> > +
> > +void ast_scu_enable_i2c(u8 num)
> > +{
>
> Is num the bus? Perhaps a better name would be "bus_enable" or similar.
>
> I think you mentioned that num must be > 0. If so, check for zero, log
> an error and return.
>
>
> > +       /* Enable I2C Controllers */
> > +       clrbits_le32(AST_SCU_BASE + AST_SCU_RESET, SCU_RESET_I2C);
> > +
> > +       if (num < 3) {
>
> How do we enable buses number 1 and 2 when AST_SOC_G5 is not set?
>

I don't know. My guess is we don't, as in, the pins are always assigned
these functions. In datasheet these bits in PIN CTRL8 register are marked
as "new in ast2500" and there is no mention of sda{1,2},scl{1,2} in ast2500
datasheet.
Also, this part is basically taken from aspeed's sdk, this is why I assume
they are always on.


>
> > +#ifdef AST_SOC_G5
> > +               if (num == 1) {
> > +                       setbits_le32(AST_SCU_BASE +
> AST_SCU_FUN_PIN_CTRL8,
> > +                                                SCU_FUN_PIN_SDA1 |
> SCU_FUN_PIN_SCL1);
> > +               } else {
>
> Make the else check for num == 2, as that's what you're looking for.
>
> > +                       setbits_le32(AST_SCU_BASE +
> AST_SCU_FUN_PIN_CTRL8,
> > +                                                SCU_FUN_PIN_SDA2 |
> SCU_FUN_PIN_SCL2);
> > +               }
> > +#endif
> > +       } else {
> > +               setbits_le32(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL5,
> SCU_FUN_PIN_I2C(num));
> > +       }
>
>
> > +}
> > --
> > 2.8.0.rc3.226.g39d4020
> >
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc
>



-- 
*M*axim *S*loyko

--94eb2c03116c9d4762053da9945a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Sep 28, 2016 at 6:03 PM, Joel Stanley <span dir=3D"ltr">&lt;<a =
href=3D"mailto:joel@jms.id.au" target=3D"_blank">joel@jms.id.au</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">On Wed, Sep 28, 2016 at 3:13 A=
M,=C2=A0 &lt;<a href=3D"mailto:maxims@google.com">maxims@google.com</a>&gt;=
 wrote:<br>
<br>
You need a commit message.<br>
<span class=3D""><br>
&gt; From: Maxim Sloyko &lt;<a href=3D"mailto:maxims@google.com">maxims@goo=
gle.com</a>&gt;<br>
&gt;<br>
&gt; ---<br>
&gt;=C2=A0 arch/arm/include/asm/arch-<wbr>aspeed/ast_scu.h=C2=A0 |=C2=A0 6 =
+++<br>
&gt;=C2=A0 arch/arm/include/asm/arch-<wbr>aspeed/regs-scu.h | 74 ++++++++++=
++++++-------------<br>
<br>
</span>Please put the reformatting of header files in a seperate patch.<br>=
</blockquote><div><br></div><div>What do you mean by reformatting?</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
<div><div class=3D"h5"><br>
&gt;=C2=A0 arch/arm/mach-aspeed/ast-scu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | 30 +++++++++++-<br>
&gt;=C2=A0 3 files changed, 75 insertions(+), 35 deletions(-)<br>
&gt;<br>
&gt; diff --git a/arch/arm/include/asm/arch-<wbr>aspeed/ast_scu.h b/arch/ar=
m/include/asm/arch-<wbr>aspeed/ast_scu.h<br>
&gt; index d248416..80ebd6f 100644<br>
&gt; --- a/arch/arm/include/asm/arch-<wbr>aspeed/ast_scu.h<br>
&gt; +++ b/arch/arm/include/asm/arch-<wbr>aspeed/ast_scu.h<br>
&gt; @@ -38,6 +38,7 @@ extern void ast_scu_get_who_init_dram(<wbr>void);<br=
>
&gt;=C2=A0 extern u32 ast_get_clk_source(void);<br>
&gt;=C2=A0 extern u32 ast_get_h_pll_clk(void);<br>
&gt;=C2=A0 extern u32 ast_get_ahbclk(void);<br>
&gt; +extern u32 ast_get_apbclk(void);<br>
&gt;<br>
&gt;=C2=A0 extern u32 ast_scu_get_vga_memsize(void);<br>
&gt;<br>
&gt; @@ -45,4 +46,9 @@ extern void ast_scu_init_eth(u8 num);<br>
&gt;=C2=A0 extern void ast_scu_multi_func_eth(u8 num);<br>
&gt;=C2=A0 extern void ast_scu_multi_func_romcs(u8 num);<br>
&gt;<br>
&gt; +/* Enable I2C controller and pins for a particular device.<br>
&gt; + * Device numbering starts at 1<br>
&gt; + */<br>
&gt; +extern void ast_scu_enable_i2c(u8 num);<br>
&gt; +<br>
&gt;=C2=A0 #endif<br>
&gt; diff --git a/arch/arm/include/asm/arch-<wbr>aspeed/regs-scu.h b/arch/a=
rm/include/asm/arch-<wbr>aspeed/regs-scu.h<br>
&gt; index b89df82..92ce84a 100644<br>
&gt; --- a/arch/arm/include/asm/arch-<wbr>aspeed/regs-scu.h<br>
&gt; +++ b/arch/arm/include/asm/arch-<wbr>aspeed/regs-scu.h<br>
&gt; @@ -10,8 +10,8 @@<br>
&gt;=C2=A0 =C2=A0*=C2=A0 =C2=A0 1. 2012/12/29 Ryan Chen Create<br>
&gt;=C2=A0 =C2=A0*<br>
&gt;=C2=A0 ******************************<wbr>*****************************=
*<wbr>********************/<br>
&gt; -#ifndef __AST_SCU_H<br>
&gt; -#define __AST_SCU_H=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A01<br>
&gt; +#ifndef __AST_REGS_SCU_H<br>
&gt; +#define __AST_REGS_SCU_H=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01<br>
&gt;<br>
&gt;=C2=A0 #include &lt;asm/arch/aspeed.h&gt;<br>
&gt;<br>
&gt; @@ -830,49 +830,50 @@<br>
&gt;=C2=A0 /* AST_SCU_FUN_PIN_CTRL5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00x90 - Multi-function Pin Control#5 */<br>
&gt;=C2=A0 #define SCU_FUN_PIN_SPICS1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(0x1 &lt;&lt; 31)<br>
&gt;=C2=A0 #define SCU_FUN_PIN_LPC_PLUS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(0x1 &lt;&lt; 30)<br>
&gt; -#define SCU_FUC_PIN_USB20_HOST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 =
&lt;&lt; 29)<br>
&gt; -#define SCU_FUC_PIN_USB11_PORT4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (0x1 &lt;&lt; 28)<br>
&gt; -#define SCU_FUC_PIN_I2C14=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (0x1 &lt;&lt; 27)<br>
&gt; -#define SCU_FUC_PIN_I2C13=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (0x1 &lt;&lt; 26)<br>
&gt; -#define SCU_FUC_PIN_I2C12=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (0x1 &lt;&lt; 25)<br>
&gt; -#define SCU_FUC_PIN_I2C11=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (0x1 &lt;&lt; 24)<br>
&gt; -#define SCU_FUC_PIN_I2C10=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (0x1 &lt;&lt; 23)<br>
&gt; -#define SCU_FUC_PIN_I2C9=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(0x1 &lt;&lt; 22)<br>
&gt; -#define SCU_FUC_PIN_I2C8=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(0x1 &lt;&lt; 21)<br>
&gt; -#define SCU_FUC_PIN_I2C7=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(0x1 &lt;&lt; 20)<br>
&gt; -#define SCU_FUC_PIN_I2C6=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(0x1 &lt;&lt; 19)<br>
&gt; -#define SCU_FUC_PIN_I2C5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(0x1 &lt;&lt; 18)<br>
&gt; -#define SCU_FUC_PIN_I2C4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(0x1 &lt;&lt; 17)<br>
&gt; -#define SCU_FUC_PIN_I2C3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(0x1 &lt;&lt; 16)<br>
&gt; -#define SCU_FUC_PIN_MII2_RX_DWN_DIS=C2=A0 =C2=A0 (0x1 &lt;&lt; 15)<br=
>
&gt; -#define SCU_FUC_PIN_MII2_TX_DWN_DIS=C2=A0 =C2=A0 (0x1 &lt;&lt; 14)<br=
>
&gt; -#define SCU_FUC_PIN_MII1_RX_DWN_DIS=C2=A0 =C2=A0 (0x1 &lt;&lt; 13)<br=
>
&gt; -#define SCU_FUC_PIN_MII1_TX_DWN_DIS=C2=A0 =C2=A0 (0x1 &lt;&lt; 12)<br=
>
&gt; -<br>
&gt; -#define SCU_FUC_PIN_MII2_TX_DRIV(x)=C2=A0 =C2=A0 (x &lt;&lt; 10)<br>
&gt; -#define SCU_FUC_PIN_MII2_TX_DRIV_MASK=C2=A0 (0x3 &lt;&lt; 10)<br>
&gt; -#define SCU_FUC_PIN_MII1_TX_DRIV(x)=C2=A0 =C2=A0 (x &lt;&lt; 8)<br>
&gt; -#define SCU_FUC_PIN_MII1_TX_DRIV_MASK=C2=A0 (0x3 &lt;&lt; 8)<br>
&gt; +#define SCU_FUN_PIN_USB20_HOST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 =
&lt;&lt; 29)<br>
&gt; +#define SCU_FUN_PIN_USB11_PORT4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (0x1 &lt;&lt; 28)<br>
&gt; +#define SCU_FUN_PIN_I2C14=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (0x1 &lt;&lt; 27)<br>
&gt; +#define SCU_FUN_PIN_I2C13=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (0x1 &lt;&lt; 26)<br>
&gt; +#define SCU_FUN_PIN_I2C12=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (0x1 &lt;&lt; 25)<br>
&gt; +#define SCU_FUN_PIN_I2C11=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (0x1 &lt;&lt; 24)<br>
&gt; +#define SCU_FUN_PIN_I2C10=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (0x1 &lt;&lt; 23)<br>
&gt; +#define SCU_FUN_PIN_I2C9=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(0x1 &lt;&lt; 22)<br>
&gt; +#define SCU_FUN_PIN_I2C8=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(0x1 &lt;&lt; 21)<br>
&gt; +#define SCU_FUN_PIN_I2C7=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(0x1 &lt;&lt; 20)<br>
&gt; +#define SCU_FUN_PIN_I2C6=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(0x1 &lt;&lt; 19)<br>
&gt; +#define SCU_FUN_PIN_I2C5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(0x1 &lt;&lt; 18)<br>
&gt; +#define SCU_FUN_PIN_I2C4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(0x1 &lt;&lt; 17)<br>
&gt; +#define SCU_FUN_PIN_I2C3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(0x1 &lt;&lt; 16)<br>
&gt; +#define SCU_FUN_PIN_I2C(n)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(0x1 &lt;&lt; (16 + (n) - 3))<br>
&gt; +#define SCU_FUN_PIN_MII2_RX_DWN_DIS=C2=A0 =C2=A0 (0x1 &lt;&lt; 15)<br=
>
&gt; +#define SCU_FUN_PIN_MII2_TX_DWN_DIS=C2=A0 =C2=A0 (0x1 &lt;&lt; 14)<br=
>
&gt; +#define SCU_FUN_PIN_MII1_RX_DWN_DIS=C2=A0 =C2=A0 (0x1 &lt;&lt; 13)<br=
>
&gt; +#define SCU_FUN_PIN_MII1_TX_DWN_DIS=C2=A0 =C2=A0 (0x1 &lt;&lt; 12)<br=
>
<br>
</div></div>It looks like you&#39;re just changing the SCU_FUC_ to SCU_FUN.=
 Without a<br>
commit message I&#39;m not sure why you&#39;re doing this, can you explain<=
br>
why?<br>
<br>
I don&#39;t think it is required.<br>
<br>
If you were to make a change like this you should perform the renaming<br>
and update the call sites in a separate patch to any other changes.<br>
This makes it easier to review.<br></blockquote><div><br></div><div>Because=
 that&#39;s a typo that got out of hand. FUN supposed to stand for FUNCTION=
,</div><div>FUC ... no guesses.</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">
<span class=3D""><br>
<br>
&gt; diff --git a/arch/arm/mach-aspeed/ast-<wbr>scu.c b/arch/arm/mach-aspee=
d/ast-<wbr>scu.c<br>
&gt; index 0cc0d67..1452b93 100644<br>
&gt; --- a/arch/arm/mach-aspeed/ast-<wbr>scu.c<br>
&gt; +++ b/arch/arm/mach-aspeed/ast-<wbr>scu.c<br>
&gt; @@ -318,6 +318,14 @@ u32 ast_get_ahbclk(void)<br>
&gt;<br>
&gt;=C2=A0 #endif /* AST_SOC_G5 */<br>
&gt;<br>
&gt; +u32 ast_get_apbclk(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 h_pll =3D ast_get_h_pll_clk();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 apb_div =3D SCU_GET_PCLK_DIV(ast_scu_r=
ead(<wbr>AST_SCU_CLK_SEL));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return h_pll / apb_div;<br>
&gt; +}<br>
<br>
</span>This will do for now. We suspect need to write a clock driver that<b=
r>
will live in drivers/clk/ to do it properly.<br>
<br>
Can apb_div ever be zero?<br>
<span class=3D""><br></span></blockquote><div><br></div><div>Oh, this is ac=
tually wrong... Fixed.=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><span class=3D"">
&gt; +<br>
&gt; +<br>
&gt;=C2=A0 void ast_scu_show_system_info(void)<br>
&gt;=C2=A0 {<br>
&gt;<br>
&gt; @@ -394,7 +402,7 @@ void ast_scu_multi_func_eth(u8 num)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AST_SCU_FUN_PIN_CTRL1);<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_scu_w=
rite(ast_scu_read(<wbr>AST_SCU_FUN_PIN_CTRL5) |<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SCU_FUC_PIN_MAC1_MDIO,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SCU_FUN_PIN_MAC1_MDIO,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AST_SCU_FUN_PIN_CTRL5);<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br=
>
&gt; @@ -496,3 +504,23 @@ void ast_scu_get_who_init_dram(<wbr>void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 }<br>
&gt; +<br>
&gt; +void ast_scu_enable_i2c(u8 num)<br>
&gt; +{<br>
<br>
</span>Is num the bus? Perhaps a better name would be &quot;bus_enable&quot=
; or similar.<br>
<br>
I think you mentioned that num must be &gt; 0. If so, check for zero, log<b=
r>
an error and return.<br>
<span class=3D""><br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Enable I2C Controllers */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0clrbits_le32(AST_SCU_BASE + AST_SCU_RESET,=
 SCU_RESET_I2C);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (num &lt; 3) {<br>
<br>
</span>How do we enable buses number 1 and 2 when AST_SOC_G5 is not set?<br=
></blockquote><div><br></div><div>I don&#39;t know. My guess is we don&#39;=
t, as in, the pins are always assigned these functions. In datasheet these =
bits in PIN CTRL8 register are marked as &quot;new in ast2500&quot; and the=
re is no mention of sda{1,2},scl{1,2} in ast2500 datasheet.</div><div>Also,=
 this part is basically taken from aspeed&#39;s sdk, this is why I assume t=
hey are always on.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<span class=3D""><br>
&gt; +#ifdef AST_SOC_G5<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (num =3D=3D=
 1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0setbits_le32(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL8,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 SCU_FUN_PIN_SDA1 | SCU_FUN_PIN_SCL1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
<br>
</span>Make the else check for num =3D=3D 2, as that&#39;s what you&#39;re =
looking for.<br>
<span class=3D""><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0setbits_le32(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL8,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 SCU_FUN_PIN_SDA2 | SCU_FUN_PIN_SCL2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +#endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0setbits_le32(A=
ST_SCU_BASE + AST_SCU_FUN_PIN_CTRL5, SCU_FUN_PIN_I2C(num));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
<br>
&gt; +}<br>
&gt; --<br>
&gt; 2.8.0.rc3.226.g39d4020<br>
&gt;<br>
</span>&gt; ______________________________<wbr>_________________<br>
&gt; openbmc mailing list<br>
&gt; <a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</=
a><br>
&gt; <a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferre=
r" target=3D"_blank">https://lists.ozlabs.org/<wbr>listinfo/openbmc</a><br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div><b>M</b>axim <=
b>S</b>loyko</div></div>
</div></div>

--94eb2c03116c9d4762053da9945a--
