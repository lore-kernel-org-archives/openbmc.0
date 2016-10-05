Return-Path: <maxims@google.com>
Received: from mail-yw0-x231.google.com (mail-yw0-x231.google.com
 [IPv6:2607:f8b0:4002:c05::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sq1Bq2P36zDrKS
 for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2016 03:17:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=XEbjREhs; 
 dkim-atps=neutral
Received: by mail-yw0-x231.google.com with SMTP id g192so164936556ywh.1
 for <openbmc@lists.ozlabs.org>; Wed, 05 Oct 2016 09:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=1+0JsHDEogtPcNHlRU4pR2lgRqxVnzlz9ymWlWDncJs=;
 b=XEbjREhs+o8KjVPYzqDS9g9VNPD/d4wiKO/cPGSKQ1nvYXssGaSF+Y57qw/8VnGRwJ
 nkOmGy/Yq0AejDVIg/ay1yB0NoD8jCHdUqfiVp0mJnm1xztFkPhA32rz+/Ji6wpv/Ezi
 7hEaktD3mCCWPnijIq/2YHvGJsAXWVPykDMIetwg95PjeXjLskl5Q8nt+ml7fa2j+FTQ
 zdIjklupEdWbO1aI/T5yyIAm8JfBFr2jYJeCHyWGK5LIxbffptUW5fqFNZjxglCkHJw9
 Q2cbFQcjFwV/euNIaFph2TsHxQVMwjtuKgwnv2L/5Asij2+oTeT5pin8JS7qIrOflXtG
 o4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=1+0JsHDEogtPcNHlRU4pR2lgRqxVnzlz9ymWlWDncJs=;
 b=eUf14YHPBeUZXLfNtl8qtBdtNcC4W5Lw/PQYlTaqHC1YjXBOT7JR/YGREq4DbBPvXJ
 e5WKHaHUelKRQUPk4spgFYohCoYRfN59EngHCDrtTCUrAS8k6zOEvkFVcTG95Dc6KlGB
 k7E1A0whxfgm4GEdk8vEKRTnGc657YSnuSVx4rqJPPIlgfvHaLl6K/XSIX9FCA934Bat
 iS2cO6Q3tcEBYM8yRdD+3mIXwBamikZUHhwzL42Tt3H94LNmMwa35SqVexHd7rV7IRNf
 hZSwQovhjSsMXGfQj4UYvzTDlsk7rHOe7EnacGWin5C0VrgCq6/CE/CQzakPF4UX8VIg
 wk8w==
X-Gm-Message-State: AA6/9RlTWI6frNaxQwKp2hHtCwVfUBqEU08VnHTaTblCvdym5KKDUoL5dmG+Qf3YdrUc71c4hpc6950lXeFq2Yl4
X-Received: by 10.129.153.6 with SMTP id q6mr7382855ywg.356.1475684222192;
 Wed, 05 Oct 2016 09:17:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.38.80 with HTTP; Wed, 5 Oct 2016 09:17:01 -0700 (PDT)
In-Reply-To: <1475184427-144121-2-git-send-email-maxims@google.com>
References: <1474998214-12720-2-git-send-email-maxims@google.com>
 <1475184427-144121-1-git-send-email-maxims@google.com>
 <1475184427-144121-2-git-send-email-maxims@google.com>
From: Maxim Sloyko <maxims@google.com>
Date: Wed, 5 Oct 2016 09:17:01 -0700
Message-ID: <CAFR_W8rMeriuOg6Lr+FS4Gr=YCRbVdy3u0P3hP3rw6Q6-Y-e5w@mail.gmail.com>
Subject: Re: [PATCH 2/3] aspeed: Fixed FUC -> FUN typo in SCU.
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=94eb2c0bd254f59ce6053e2081a8
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
X-List-Received-Date: Wed, 05 Oct 2016 16:17:08 -0000

--94eb2c0bd254f59ce6053e2081a8
Content-Type: text/plain; charset=UTF-8

Ping

On Thu, Sep 29, 2016 at 2:27 PM, <maxims@google.com> wrote:

> From: Maxim Sloyko <maxims@google.com>
>
> Fixed FUC -> FUN typo in SCU.
> ---
>  arch/arm/include/asm/arch-aspeed/regs-scu.h | 65
> +++++++++++++++--------------
>  arch/arm/mach-aspeed/ast-scu.c              |  2 +-
>  2 files changed, 34 insertions(+), 33 deletions(-)
>
> diff --git a/arch/arm/include/asm/arch-aspeed/regs-scu.h
> b/arch/arm/include/asm/arch-aspeed/regs-scu.h
> index b714fa9..aab032a 100644
> --- a/arch/arm/include/asm/arch-aspeed/regs-scu.h
> +++ b/arch/arm/include/asm/arch-aspeed/regs-scu.h
> @@ -830,49 +830,50 @@
>  /* AST_SCU_FUN_PIN_CTRL5               0x90 - Multi-function Pin
> Control#5 */
>  #define SCU_FUN_PIN_SPICS1             (0x1 << 31)
>  #define SCU_FUN_PIN_LPC_PLUS           (0x1 << 30)
> -#define SCU_FUC_PIN_USB20_HOST         (0x1 << 29)
> -#define SCU_FUC_PIN_USB11_PORT4                (0x1 << 28)
> -#define SCU_FUC_PIN_I2C14              (0x1 << 27)
> -#define SCU_FUC_PIN_I2C13              (0x1 << 26)
> -#define SCU_FUC_PIN_I2C12              (0x1 << 25)
> -#define SCU_FUC_PIN_I2C11              (0x1 << 24)
> -#define SCU_FUC_PIN_I2C10              (0x1 << 23)
> -#define SCU_FUC_PIN_I2C9               (0x1 << 22)
> -#define SCU_FUC_PIN_I2C8               (0x1 << 21)
> -#define SCU_FUC_PIN_I2C7               (0x1 << 20)
> -#define SCU_FUC_PIN_I2C6               (0x1 << 19)
> -#define SCU_FUC_PIN_I2C5               (0x1 << 18)
> -#define SCU_FUC_PIN_I2C4               (0x1 << 17)
> -#define SCU_FUC_PIN_I2C3               (0x1 << 16)
> -#define SCU_FUC_PIN_MII2_RX_DWN_DIS    (0x1 << 15)
> -#define SCU_FUC_PIN_MII2_TX_DWN_DIS    (0x1 << 14)
> -#define SCU_FUC_PIN_MII1_RX_DWN_DIS    (0x1 << 13)
> -#define SCU_FUC_PIN_MII1_TX_DWN_DIS    (0x1 << 12)
> -
> -#define SCU_FUC_PIN_MII2_TX_DRIV(x)    (x << 10)
> -#define SCU_FUC_PIN_MII2_TX_DRIV_MASK  (0x3 << 10)
> -#define SCU_FUC_PIN_MII1_TX_DRIV(x)    (x << 8)
> -#define SCU_FUC_PIN_MII1_TX_DRIV_MASK  (0x3 << 8)
> +#define SCU_FUN_PIN_USB20_HOST         (0x1 << 29)
> +#define SCU_FUN_PIN_USB11_PORT4                (0x1 << 28)
> +#define SCU_FUN_PIN_I2C14              (0x1 << 27)
> +#define SCU_FUN_PIN_I2C13              (0x1 << 26)
> +#define SCU_FUN_PIN_I2C12              (0x1 << 25)
> +#define SCU_FUN_PIN_I2C11              (0x1 << 24)
> +#define SCU_FUN_PIN_I2C10              (0x1 << 23)
> +#define SCU_FUN_PIN_I2C9               (0x1 << 22)
> +#define SCU_FUN_PIN_I2C8               (0x1 << 21)
> +#define SCU_FUN_PIN_I2C7               (0x1 << 20)
> +#define SCU_FUN_PIN_I2C6               (0x1 << 19)
> +#define SCU_FUN_PIN_I2C5               (0x1 << 18)
> +#define SCU_FUN_PIN_I2C4               (0x1 << 17)
> +#define SCU_FUN_PIN_I2C3               (0x1 << 16)
> +#define SCU_FUN_PIN_I2C(n)             (0x1 << (16 + (n) - 3))
> +#define SCU_FUN_PIN_MII2_RX_DWN_DIS    (0x1 << 15)
> +#define SCU_FUN_PIN_MII2_TX_DWN_DIS    (0x1 << 14)
> +#define SCU_FUN_PIN_MII1_RX_DWN_DIS    (0x1 << 13)
> +#define SCU_FUN_PIN_MII1_TX_DWN_DIS    (0x1 << 12)
> +
> +#define SCU_FUN_PIN_MII2_TX_DRIV(x)    (x << 10)
> +#define SCU_FUN_PIN_MII2_TX_DRIV_MASK  (0x3 << 10)
> +#define SCU_FUN_PIN_MII1_TX_DRIV(x)    (x << 8)
> +#define SCU_FUN_PIN_MII1_TX_DRIV_MASK  (0x3 << 8)
>
>  #define MII_NORMAL_DRIV                        0x0
>  #define MII_HIGH_DRIV                  0x2
>
> -#define SCU_FUC_PIN_UART6              (0x1 << 7)
> -#define SCU_FUC_PIN_ROM_16BIT          (0x1 << 6)
> -#define SCU_FUC_PIN_DIGI_V_OUT(x)      (x)
> -#define SCU_FUC_PIN_DIGI_V_OUT_MASK    (0x3)
> +#define SCU_FUN_PIN_UART6              (0x1 << 7)
> +#define SCU_FUN_PIN_ROM_16BIT          (0x1 << 6)
> +#define SCU_FUN_PIN_DIGI_V_OUT(x)      (x)
> +#define SCU_FUN_PIN_DIGI_V_OUT_MASK    (0x3)
>
>  #define VIDEO_DISABLE                  0x0
>  #define VIDEO_12BITS                   0x1
>  #define VIDEO_24BITS                   0x2
>  //#define VIDEO_DISABLE                        0x3
>
> -#define SCU_FUC_PIN_USB11_PORT2                (0x1 << 3)
> -#define SCU_FUC_PIN_SD1_8BIT           (0x1 << 3)
> +#define SCU_FUN_PIN_USB11_PORT2                (0x1 << 3)
> +#define SCU_FUN_PIN_SD1_8BIT           (0x1 << 3)
>
> -#define SCU_FUC_PIN_MAC1_MDIO          (0x1 << 2)
> -#define SCU_FUC_PIN_SD2                        (0x1 << 1)
> -#define SCU_FUC_PIN_SD1                        (0x1 << 0)
> +#define SCU_FUN_PIN_MAC1_MDIO          (0x1 << 2)
> +#define SCU_FUN_PIN_SD2                        (0x1 << 1)
> +#define SCU_FUN_PIN_SD1                        (0x1 << 0)
>
>
>  /* AST_SCU_FUN_PIN_CTRL6               0x94 - Multi-function Pin
> Control#6*/
> diff --git a/arch/arm/mach-aspeed/ast-scu.c b/arch/arm/mach-aspeed/ast-
> scu.c
> index 0cc0d67..280c421 100644
> --- a/arch/arm/mach-aspeed/ast-scu.c
> +++ b/arch/arm/mach-aspeed/ast-scu.c
> @@ -394,7 +394,7 @@ void ast_scu_multi_func_eth(u8 num)
>                               AST_SCU_FUN_PIN_CTRL1);
>
>                 ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
> -                             SCU_FUC_PIN_MAC1_MDIO,
> +                             SCU_FUN_PIN_MAC1_MDIO,
>                               AST_SCU_FUN_PIN_CTRL5);
>
>                 break;
> --
> 2.8.0.rc3.226.g39d4020
>
>


-- 
*M*axim *S*loyko

--94eb2c0bd254f59ce6053e2081a8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ping</div><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On Thu, Sep 29, 2016 at 2:27 PM,  <span dir=3D"ltr">&lt;<a href=
=3D"mailto:maxims@google.com" target=3D"_blank">maxims@google.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">From: Maxim Sloyko &lt;<a hr=
ef=3D"mailto:maxims@google.com">maxims@google.com</a>&gt;<br>
<br>
Fixed FUC -&gt; FUN typo in SCU.<br>
---<br>
=C2=A0arch/arm/include/asm/arch-<wbr>aspeed/regs-scu.h | 65 +++++++++++++++=
--------------<br>
=C2=A0arch/arm/mach-aspeed/ast-scu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A02 files changed, 34 insertions(+), 33 deletions(-)<br>
<br>
diff --git a/arch/arm/include/asm/arch-<wbr>aspeed/regs-scu.h b/arch/arm/in=
clude/asm/arch-<wbr>aspeed/regs-scu.h<br>
index b714fa9..aab032a 100644<br>
--- a/arch/arm/include/asm/arch-<wbr>aspeed/regs-scu.h<br>
+++ b/arch/arm/include/asm/arch-<wbr>aspeed/regs-scu.h<br>
@@ -830,49 +830,50 @@<br>
=C2=A0/* AST_SCU_FUN_PIN_CTRL5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x90 - Multi-function Pin Control#5 */<br>
=C2=A0#define SCU_FUN_PIN_SPICS1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(0x1 &lt;&lt; 31)<br>
=C2=A0#define SCU_FUN_PIN_LPC_PLUS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
(0x1 &lt;&lt; 30)<br>
-#define SCU_FUC_PIN_USB20_HOST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&=
lt; 29)<br>
-#define SCU_FUC_PIN_USB11_PORT4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 (0x1 &lt;&lt; 28)<br>
-#define SCU_FUC_PIN_I2C14=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
(0x1 &lt;&lt; 27)<br>
-#define SCU_FUC_PIN_I2C13=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
(0x1 &lt;&lt; 26)<br>
-#define SCU_FUC_PIN_I2C12=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
(0x1 &lt;&lt; 25)<br>
-#define SCU_FUC_PIN_I2C11=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
(0x1 &lt;&lt; 24)<br>
-#define SCU_FUC_PIN_I2C10=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
(0x1 &lt;&lt; 23)<br>
-#define SCU_FUC_PIN_I2C9=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(0x1 &lt;&lt; 22)<br>
-#define SCU_FUC_PIN_I2C8=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(0x1 &lt;&lt; 21)<br>
-#define SCU_FUC_PIN_I2C7=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(0x1 &lt;&lt; 20)<br>
-#define SCU_FUC_PIN_I2C6=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(0x1 &lt;&lt; 19)<br>
-#define SCU_FUC_PIN_I2C5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(0x1 &lt;&lt; 18)<br>
-#define SCU_FUC_PIN_I2C4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(0x1 &lt;&lt; 17)<br>
-#define SCU_FUC_PIN_I2C3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(0x1 &lt;&lt; 16)<br>
-#define SCU_FUC_PIN_MII2_RX_DWN_DIS=C2=A0 =C2=A0 (0x1 &lt;&lt; 15)<br>
-#define SCU_FUC_PIN_MII2_TX_DWN_DIS=C2=A0 =C2=A0 (0x1 &lt;&lt; 14)<br>
-#define SCU_FUC_PIN_MII1_RX_DWN_DIS=C2=A0 =C2=A0 (0x1 &lt;&lt; 13)<br>
-#define SCU_FUC_PIN_MII1_TX_DWN_DIS=C2=A0 =C2=A0 (0x1 &lt;&lt; 12)<br>
-<br>
-#define SCU_FUC_PIN_MII2_TX_DRIV(x)=C2=A0 =C2=A0 (x &lt;&lt; 10)<br>
-#define SCU_FUC_PIN_MII2_TX_DRIV_MASK=C2=A0 (0x3 &lt;&lt; 10)<br>
-#define SCU_FUC_PIN_MII1_TX_DRIV(x)=C2=A0 =C2=A0 (x &lt;&lt; 8)<br>
-#define SCU_FUC_PIN_MII1_TX_DRIV_MASK=C2=A0 (0x3 &lt;&lt; 8)<br>
+#define SCU_FUN_PIN_USB20_HOST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&=
lt; 29)<br>
+#define SCU_FUN_PIN_USB11_PORT4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 (0x1 &lt;&lt; 28)<br>
+#define SCU_FUN_PIN_I2C14=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
(0x1 &lt;&lt; 27)<br>
+#define SCU_FUN_PIN_I2C13=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
(0x1 &lt;&lt; 26)<br>
+#define SCU_FUN_PIN_I2C12=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
(0x1 &lt;&lt; 25)<br>
+#define SCU_FUN_PIN_I2C11=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
(0x1 &lt;&lt; 24)<br>
+#define SCU_FUN_PIN_I2C10=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
(0x1 &lt;&lt; 23)<br>
+#define SCU_FUN_PIN_I2C9=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(0x1 &lt;&lt; 22)<br>
+#define SCU_FUN_PIN_I2C8=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(0x1 &lt;&lt; 21)<br>
+#define SCU_FUN_PIN_I2C7=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(0x1 &lt;&lt; 20)<br>
+#define SCU_FUN_PIN_I2C6=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(0x1 &lt;&lt; 19)<br>
+#define SCU_FUN_PIN_I2C5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(0x1 &lt;&lt; 18)<br>
+#define SCU_FUN_PIN_I2C4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(0x1 &lt;&lt; 17)<br>
+#define SCU_FUN_PIN_I2C3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(0x1 &lt;&lt; 16)<br>
+#define SCU_FUN_PIN_I2C(n)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
(0x1 &lt;&lt; (16 + (n) - 3))<br>
+#define SCU_FUN_PIN_MII2_RX_DWN_DIS=C2=A0 =C2=A0 (0x1 &lt;&lt; 15)<br>
+#define SCU_FUN_PIN_MII2_TX_DWN_DIS=C2=A0 =C2=A0 (0x1 &lt;&lt; 14)<br>
+#define SCU_FUN_PIN_MII1_RX_DWN_DIS=C2=A0 =C2=A0 (0x1 &lt;&lt; 13)<br>
+#define SCU_FUN_PIN_MII1_TX_DWN_DIS=C2=A0 =C2=A0 (0x1 &lt;&lt; 12)<br>
+<br>
+#define SCU_FUN_PIN_MII2_TX_DRIV(x)=C2=A0 =C2=A0 (x &lt;&lt; 10)<br>
+#define SCU_FUN_PIN_MII2_TX_DRIV_MASK=C2=A0 (0x3 &lt;&lt; 10)<br>
+#define SCU_FUN_PIN_MII1_TX_DRIV(x)=C2=A0 =C2=A0 (x &lt;&lt; 8)<br>
+#define SCU_FUN_PIN_MII1_TX_DRIV_MASK=C2=A0 (0x3 &lt;&lt; 8)<br>
<br>
=C2=A0#define MII_NORMAL_DRIV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0<br>
=C2=A0#define MII_HIGH_DRIV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 0x2<br>
<br>
-#define SCU_FUC_PIN_UART6=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
(0x1 &lt;&lt; 7)<br>
-#define SCU_FUC_PIN_ROM_16BIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x1 &lt;&=
lt; 6)<br>
-#define SCU_FUC_PIN_DIGI_V_OUT(x)=C2=A0 =C2=A0 =C2=A0 (x)<br>
-#define SCU_FUC_PIN_DIGI_V_OUT_MASK=C2=A0 =C2=A0 (0x3)<br>
+#define SCU_FUN_PIN_UART6=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
(0x1 &lt;&lt; 7)<br>
+#define SCU_FUN_PIN_ROM_16BIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x1 &lt;&=
lt; 6)<br>
+#define SCU_FUN_PIN_DIGI_V_OUT(x)=C2=A0 =C2=A0 =C2=A0 (x)<br>
+#define SCU_FUN_PIN_DIGI_V_OUT_MASK=C2=A0 =C2=A0 (0x3)<br>
<br>
=C2=A0#define VIDEO_DISABLE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 0x0<br>
=C2=A0#define VIDEO_12BITS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00x1<br>
=C2=A0#define VIDEO_24BITS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00x2<br>
=C2=A0//#define VIDEO_DISABLE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x3<br>
<br>
-#define SCU_FUC_PIN_USB11_PORT2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 (0x1 &lt;&lt; 3)<br>
-#define SCU_FUC_PIN_SD1_8BIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 =
&lt;&lt; 3)<br>
+#define SCU_FUN_PIN_USB11_PORT2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 (0x1 &lt;&lt; 3)<br>
+#define SCU_FUN_PIN_SD1_8BIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 =
&lt;&lt; 3)<br>
<br>
-#define SCU_FUC_PIN_MAC1_MDIO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x1 &lt;&=
lt; 2)<br>
-#define SCU_FUC_PIN_SD2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x1 &lt;&lt; 1)<br>
-#define SCU_FUC_PIN_SD1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x1 &lt;&lt; 0)<br>
+#define SCU_FUN_PIN_MAC1_MDIO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x1 &lt;&=
lt; 2)<br>
+#define SCU_FUN_PIN_SD2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x1 &lt;&lt; 1)<br>
+#define SCU_FUN_PIN_SD1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x1 &lt;&lt; 0)<br>
<br>
<br>
=C2=A0/* AST_SCU_FUN_PIN_CTRL6=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x94 - Multi-function Pin Control#6*/<br>
diff --git a/arch/arm/mach-aspeed/ast-<wbr>scu.c b/arch/arm/mach-aspeed/ast=
-<wbr>scu.c<br>
index 0cc0d67..280c421 100644<br>
--- a/arch/arm/mach-aspeed/ast-<wbr>scu.c<br>
+++ b/arch/arm/mach-aspeed/ast-<wbr>scu.c<br>
@@ -394,7 +394,7 @@ void ast_scu_multi_func_eth(u8 num)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AST_SCU_FUN_PIN_CTRL1);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ast_scu_write(ast_s=
cu_read(<wbr>AST_SCU_FUN_PIN_CTRL5) |<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SCU_FUC_PIN_MAC1_MDIO,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SCU_FUN_PIN_MAC1_MDIO,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AST_SCU_FUN_PIN_CTRL5);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.8.0.rc3.226.g39d4020<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div><b=
>M</b>axim <b>S</b>loyko</div></div>
</div>

--94eb2c0bd254f59ce6053e2081a8--
