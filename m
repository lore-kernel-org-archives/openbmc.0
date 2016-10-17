Return-Path: <maxims@google.com>
Received: from mail-yw0-x230.google.com (mail-yw0-x230.google.com
 [IPv6:2607:f8b0:4002:c05::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3syQs40wQnzDt2p
 for <openbmc@lists.ozlabs.org>; Tue, 18 Oct 2016 04:57:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=mdP00UPE; 
 dkim-atps=neutral
Received: by mail-yw0-x230.google.com with SMTP id w3so122007180ywg.1
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 10:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=tHEd3XewKcnrKKh2CLa9lmYNCVJ988MQbYSHM+ITr1A=;
 b=mdP00UPE6bJKJAdxGeAbOq/BaHwrPfAHud6EDGVI2e5cqW15x8JafEWyqRc6slPgDS
 ALqVefHLvnOuCjtaNVTzuhN4UtO5kDFQa0Sg4xVyn4KXOZzSuuvhqQbtVn8u6S1g575t
 7O77/cStSpIG8f0TTKj7Ky61pmqdJCYqtJUwJ0WFYeIAJfYG4ykAPiJ2Orjyyzb93Afy
 Z7qo8ppd+ihzz0QnSzdYztURQ1rIOtXGZYK27bt2Gm6ydSCcx3RIh9zsxB7X1kjcGbs6
 icpFcj6wzHNacmfMke/uKmzZyE4K4NmANo+BE+VQz1CVhhAbskqWaVgVqfIzlTkrv539
 c3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=tHEd3XewKcnrKKh2CLa9lmYNCVJ988MQbYSHM+ITr1A=;
 b=HNgqrzosPQ2Xv5PBRtCXDcWufXAOWlJ0KWCY6epBoImmWdlDyd3LMLwtF5ZXG0NFbS
 x8RGuxT6/o10W0GIU4sk6s58Ta9okd8qqEp7920x34M7Y1zodW0iU3QdJy6AyxhNTqZw
 RYGDEoocIov5Kw9qRMe7MutylFNnqTWw5vKSST72BkpT3v2f2sfF++WqHP2rlC9T5wUE
 UDu4MAz2YllyM/RX8sKthQTve/qvpb2RdUs4KgFdW310EAZOCI5MsEI8MDrhNvFfm/Av
 zMn/sgPLIkVFQJHVQaTWC3CJbB39NWsFe4RIiUYIgtJV190OJcNpDolljGf6Y/xkwOmg
 0v8g==
X-Gm-Message-State: AA6/9Rk2f9Y+U2AG07+HfU1KFn5PNgXcLxyjMYpbZVQMbR/vsxW1UuGtSU8+W3hebcvRkhy0V/weG3yEmOcHh8M+
X-Received: by 10.13.212.147 with SMTP id w141mr26505270ywd.180.1476727045386; 
 Mon, 17 Oct 2016 10:57:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.88.7 with HTTP; Mon, 17 Oct 2016 10:57:24 -0700 (PDT)
In-Reply-To: <CACPK8XfS3kY3PHK7r+aiGQ+5FXe8Wrs2p-FYr=_f58JrCRiQfg@mail.gmail.com>
References: <1474998214-12720-2-git-send-email-maxims@google.com>
 <1475184427-144121-1-git-send-email-maxims@google.com>
 <1475184427-144121-2-git-send-email-maxims@google.com>
 <CACPK8XfS3kY3PHK7r+aiGQ+5FXe8Wrs2p-FYr=_f58JrCRiQfg@mail.gmail.com>
From: Maxim Sloyko <maxims@google.com>
Date: Mon, 17 Oct 2016 10:57:24 -0700
Message-ID: <CAFR_W8qd0fOztUqzed=WMXc4KLsMbo3pnb9JYPezQrLV_YeW7g@mail.gmail.com>
Subject: Re: [PATCH 2/3] aspeed: Fixed FUC -> FUN typo in SCU.
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a114fba1af8ece3053f134ebd
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
X-List-Received-Date: Mon, 17 Oct 2016 17:57:29 -0000

--001a114fba1af8ece3053f134ebd
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 13, 2016 at 5:07 PM, Joel Stanley <joel@jms.id.au> wrote:

> On Fri, Sep 30, 2016 at 7:27 AM,  <maxims@google.com> wrote:
> > From: Maxim Sloyko <maxims@google.com>
> >
> > Fixed FUC -> FUN typo in SCU.
>
> This lacks a signed off by as previously discussed.
>
> You have not made a convincing argument for this change. I suggest you
> drop the patch from your series.
>

Are you against this change per se or just against it being in this patch
series?


>
> Cheers,
>
> Joel
>
> > ---
> >  arch/arm/include/asm/arch-aspeed/regs-scu.h | 65
> +++++++++++++++--------------
> >  arch/arm/mach-aspeed/ast-scu.c              |  2 +-
> >  2 files changed, 34 insertions(+), 33 deletions(-)
> >
> > diff --git a/arch/arm/include/asm/arch-aspeed/regs-scu.h
> b/arch/arm/include/asm/arch-aspeed/regs-scu.h
> > index b714fa9..aab032a 100644
> > --- a/arch/arm/include/asm/arch-aspeed/regs-scu.h
> > +++ b/arch/arm/include/asm/arch-aspeed/regs-scu.h
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
> > +
> > +#define SCU_FUN_PIN_MII2_TX_DRIV(x)    (x << 10)
> > +#define SCU_FUN_PIN_MII2_TX_DRIV_MASK  (0x3 << 10)
> > +#define SCU_FUN_PIN_MII1_TX_DRIV(x)    (x << 8)
> > +#define SCU_FUN_PIN_MII1_TX_DRIV_MASK  (0x3 << 8)
> >
> >  #define MII_NORMAL_DRIV                        0x0
> >  #define MII_HIGH_DRIV                  0x2
> >
> > -#define SCU_FUC_PIN_UART6              (0x1 << 7)
> > -#define SCU_FUC_PIN_ROM_16BIT          (0x1 << 6)
> > -#define SCU_FUC_PIN_DIGI_V_OUT(x)      (x)
> > -#define SCU_FUC_PIN_DIGI_V_OUT_MASK    (0x3)
> > +#define SCU_FUN_PIN_UART6              (0x1 << 7)
> > +#define SCU_FUN_PIN_ROM_16BIT          (0x1 << 6)
> > +#define SCU_FUN_PIN_DIGI_V_OUT(x)      (x)
> > +#define SCU_FUN_PIN_DIGI_V_OUT_MASK    (0x3)
> >
> >  #define VIDEO_DISABLE                  0x0
> >  #define VIDEO_12BITS                   0x1
> >  #define VIDEO_24BITS                   0x2
> >  //#define VIDEO_DISABLE                        0x3
> >
> > -#define SCU_FUC_PIN_USB11_PORT2                (0x1 << 3)
> > -#define SCU_FUC_PIN_SD1_8BIT           (0x1 << 3)
> > +#define SCU_FUN_PIN_USB11_PORT2                (0x1 << 3)
> > +#define SCU_FUN_PIN_SD1_8BIT           (0x1 << 3)
> >
> > -#define SCU_FUC_PIN_MAC1_MDIO          (0x1 << 2)
> > -#define SCU_FUC_PIN_SD2                        (0x1 << 1)
> > -#define SCU_FUC_PIN_SD1                        (0x1 << 0)
> > +#define SCU_FUN_PIN_MAC1_MDIO          (0x1 << 2)
> > +#define SCU_FUN_PIN_SD2                        (0x1 << 1)
> > +#define SCU_FUN_PIN_SD1                        (0x1 << 0)
> >
> >
> >  /* AST_SCU_FUN_PIN_CTRL6               0x94 - Multi-function Pin
> Control#6*/
> > diff --git a/arch/arm/mach-aspeed/ast-scu.c b/arch/arm/mach-aspeed/ast-
> scu.c
> > index 0cc0d67..280c421 100644
> > --- a/arch/arm/mach-aspeed/ast-scu.c
> > +++ b/arch/arm/mach-aspeed/ast-scu.c
> > @@ -394,7 +394,7 @@ void ast_scu_multi_func_eth(u8 num)
> >                               AST_SCU_FUN_PIN_CTRL1);
> >
> >                 ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
> > -                             SCU_FUC_PIN_MAC1_MDIO,
> > +                             SCU_FUN_PIN_MAC1_MDIO,
> >                               AST_SCU_FUN_PIN_CTRL5);
> >
> >                 break;
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

--001a114fba1af8ece3053f134ebd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Oct 13, 2016 at 5:07 PM, Joel Stanley <span dir=3D"ltr">&lt;<a =
href=3D"mailto:joel@jms.id.au" target=3D"_blank">joel@jms.id.au</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Fri, Sep 3=
0, 2016 at 7:27 AM,=C2=A0 &lt;<a href=3D"mailto:maxims@google.com">maxims@g=
oogle.com</a>&gt; wrote:<br>
&gt; From: Maxim Sloyko &lt;<a href=3D"mailto:maxims@google.com">maxims@goo=
gle.com</a>&gt;<br>
&gt;<br>
&gt; Fixed FUC -&gt; FUN typo in SCU.<br>
<br>
</span>This lacks a signed off by as previously discussed.<br>
<br>
You have not made a convincing argument for this change. I suggest you<br>
drop the patch from your series.<br></blockquote><div><br></div><div>Are yo=
u against this change per se or just against it being in this patch series?=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Cheers,<br>
<br>
Joel<br>
<div><div class=3D"h5"><br>
&gt; ---<br>
&gt;=C2=A0 arch/arm/include/asm/arch-<wbr>aspeed/regs-scu.h | 65 ++++++++++=
+++++--------------<br>
&gt;=C2=A0 arch/arm/mach-aspeed/ast-scu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 2 files changed, 34 insertions(+), 33 deletions(-)<br>
&gt;<br>
&gt; diff --git a/arch/arm/include/asm/arch-<wbr>aspeed/regs-scu.h b/arch/a=
rm/include/asm/arch-<wbr>aspeed/regs-scu.h<br>
&gt; index b714fa9..aab032a 100644<br>
&gt; --- a/arch/arm/include/asm/arch-<wbr>aspeed/regs-scu.h<br>
&gt; +++ b/arch/arm/include/asm/arch-<wbr>aspeed/regs-scu.h<br>
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
&gt; +<br>
&gt; +#define SCU_FUN_PIN_MII2_TX_DRIV(x)=C2=A0 =C2=A0 (x &lt;&lt; 10)<br>
&gt; +#define SCU_FUN_PIN_MII2_TX_DRIV_MASK=C2=A0 (0x3 &lt;&lt; 10)<br>
&gt; +#define SCU_FUN_PIN_MII1_TX_DRIV(x)=C2=A0 =C2=A0 (x &lt;&lt; 8)<br>
&gt; +#define SCU_FUN_PIN_MII1_TX_DRIV_MASK=C2=A0 (0x3 &lt;&lt; 8)<br>
&gt;<br>
&gt;=C2=A0 #define MII_NORMAL_DRIV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0<br>
&gt;=C2=A0 #define MII_HIGH_DRIV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0x2<br>
&gt;<br>
&gt; -#define SCU_FUC_PIN_UART6=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (0x1 &lt;&lt; 7)<br>
&gt; -#define SCU_FUC_PIN_ROM_16BIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x1 =
&lt;&lt; 6)<br>
&gt; -#define SCU_FUC_PIN_DIGI_V_OUT(x)=C2=A0 =C2=A0 =C2=A0 (x)<br>
&gt; -#define SCU_FUC_PIN_DIGI_V_OUT_MASK=C2=A0 =C2=A0 (0x3)<br>
&gt; +#define SCU_FUN_PIN_UART6=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (0x1 &lt;&lt; 7)<br>
&gt; +#define SCU_FUN_PIN_ROM_16BIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x1 =
&lt;&lt; 6)<br>
&gt; +#define SCU_FUN_PIN_DIGI_V_OUT(x)=C2=A0 =C2=A0 =C2=A0 (x)<br>
&gt; +#define SCU_FUN_PIN_DIGI_V_OUT_MASK=C2=A0 =C2=A0 (0x3)<br>
&gt;<br>
&gt;=C2=A0 #define VIDEO_DISABLE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0x0<br>
&gt;=C2=A0 #define VIDEO_12BITS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00x1<br>
&gt;=C2=A0 #define VIDEO_24BITS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00x2<br>
&gt;=C2=A0 //#define VIDEO_DISABLE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x3<br>
&gt;<br>
&gt; -#define SCU_FUC_PIN_USB11_PORT2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (0x1 &lt;&lt; 3)<br>
&gt; -#define SCU_FUC_PIN_SD1_8BIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
(0x1 &lt;&lt; 3)<br>
&gt; +#define SCU_FUN_PIN_USB11_PORT2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (0x1 &lt;&lt; 3)<br>
&gt; +#define SCU_FUN_PIN_SD1_8BIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
(0x1 &lt;&lt; 3)<br>
&gt;<br>
&gt; -#define SCU_FUC_PIN_MAC1_MDIO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x1 =
&lt;&lt; 2)<br>
&gt; -#define SCU_FUC_PIN_SD2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x1 &lt;&lt; 1)<br>
&gt; -#define SCU_FUC_PIN_SD1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x1 &lt;&lt; 0)<br>
&gt; +#define SCU_FUN_PIN_MAC1_MDIO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x1 =
&lt;&lt; 2)<br>
&gt; +#define SCU_FUN_PIN_SD2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x1 &lt;&lt; 1)<br>
&gt; +#define SCU_FUN_PIN_SD1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x1 &lt;&lt; 0)<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 /* AST_SCU_FUN_PIN_CTRL6=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00x94 - Multi-function Pin Control#6*/<br>
&gt; diff --git a/arch/arm/mach-aspeed/ast-<wbr>scu.c b/arch/arm/mach-aspee=
d/ast-<wbr>scu.c<br>
&gt; index 0cc0d67..280c421 100644<br>
&gt; --- a/arch/arm/mach-aspeed/ast-<wbr>scu.c<br>
&gt; +++ b/arch/arm/mach-aspeed/ast-<wbr>scu.c<br>
&gt; @@ -394,7 +394,7 @@ void ast_scu_multi_func_eth(u8 num)<br>
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
&gt; --<br>
&gt; 2.8.0.rc3.226.g39d4020<br>
&gt;<br>
</div></div>&gt; ______________________________<wbr>_________________<br>
&gt; openbmc mailing list<br>
&gt; <a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</=
a><br>
&gt; <a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferre=
r" target=3D"_blank">https://lists.ozlabs.org/<wbr>listinfo/openbmc</a><br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div><b>M</b>axim <=
b>S</b>loyko</div></div>
</div></div>

--001a114fba1af8ece3053f134ebd--
