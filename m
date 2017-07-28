Return-Path: <raltherr@google.com>
Received: from mail-wm0-x22a.google.com (mail-wm0-x22a.google.com
 [IPv6:2a00:1450:400c:c09::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xK1Q04Dd8zDrKR
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jul 2017 06:57:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="TR5QvMVQ"; 
 dkim-atps=neutral
Received: by mail-wm0-x22a.google.com with SMTP id m85so31212617wma.0
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jul 2017 13:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=9IWEF+KQ1rMBQFVq2+cpQndmegKkz+tFaT6ESGv57Ro=;
 b=TR5QvMVQXauHQ6Kki/rPtmKcYnUmQlwNCD8aGh1zF0mUNRhMxGwhRj89LJ0CpzOvGz
 y+xhtktmFtqzMkjtSoEwGHjZ+hrZmdCSI3f67Z3AgG9POyF/NMM9JAtHSfbTi6TMuUPS
 0t0FLDxrVMkMASxImx/WBr/rp90DW8UJ8SYSvak/S9hx/s/HZiZT1MlPjArHtEXSCPfs
 QBXKE1SAs8i9aS+PG4pjOSk4kiEQzKFGWcSXgbcRKGs0/FmPPt/eAs09y7GIB3VHN+gL
 tmfQ17Zo7mNOncyvItGKEOzgFTs0O9my1TkhXuwMH7B1qxWjn+59Up0MPMStJDvZBN4h
 IPWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=9IWEF+KQ1rMBQFVq2+cpQndmegKkz+tFaT6ESGv57Ro=;
 b=ArZxnYIukbARv5e6N8BH8+CGKEXRMlLhClCl51cGSUoorBLCMRsUgUxkTqsPaAkeW8
 aLRz3Qa74a2HRpG4FH3fWEmlvBXV3yIG34HmP5e1P4FdGT79fJp4YqLXEwhZ1KLKbYeZ
 6RZr0JG9MswQmqaLjd+DUR225zQn64wlTxRHnzTVU+/VW1lKZl1W/VjWPlJH1FcfMLEB
 Uwqd9v1feY1f9K6VqttLW3qLzaIOD9EtxR/HFvywFKKFvOa3vW77X1XxhZm+PfJ/AFVA
 HbwU/da/xkjG2x8SJiUwSAe9/PtfDdgjm+jEzQtVPmkBOAQsRUrxTIAWCUCheFAoXELn
 WgKA==
X-Gm-Message-State: AIVw110B3kj2JV5WTupccJZCPBw5yTdTzey5ySr/EOuC7ziSYeazrjH3
 5GVORsJlkBZUg4DAL2RaTixiHyR/nlt2
X-Received: by 10.28.66.14 with SMTP id p14mr6640462wma.174.1501275460348;
 Fri, 28 Jul 2017 13:57:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.153.69 with HTTP; Fri, 28 Jul 2017 13:57:39 -0700 (PDT)
In-Reply-To: <20170728204558.6455-2-brendanhiggins@google.com>
References: <20170728204558.6455-1-brendanhiggins@google.com>
 <20170728204558.6455-2-brendanhiggins@google.com>
From: Rick Altherr <raltherr@google.com>
Date: Fri, 28 Jul 2017 13:57:39 -0700
Message-ID: <CAPLgG==69mNpqoqKUf-0tT4iJJ5-aCg+1uaAoLJ5QSe+8LGYkw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] i2c: aspeed: add proper support fo 24xx clock
 params
To: Brendan Higgins <brendanhiggins@google.com>
Cc: wsa@the-dreams.de, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Joel Stanley <joel@jms.id.au>, Robi Buranyi <rburanyi@google.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-i2c@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/alternative; boundary="001a114e334e86c4c3055566ee69"
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
X-List-Received-Date: Fri, 28 Jul 2017 20:57:45 -0000

--001a114e334e86c4c3055566ee69
Content-Type: text/plain; charset="UTF-8"

Is clk_fractional_divider from include/linux/clk-provider.h appropriate
here?

On Fri, Jul 28, 2017 at 1:45 PM, Brendan Higgins <brendanhiggins@google.com>
wrote:

> 24xx BMCs have larger clock divider granularity which can cause problems
> when trying to set them as 25xx clock dividers; this adds clock setting
> code specific to 24xx.
>
> This also fixes a potential issue where clock dividers were rounded down
> instead of up.
>
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> ---
> Changes for v2:
>   - Fixed off by one error to check for divisors with base_clk == 0
>   - Simplified some of the divisor math
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 74 ++++++++++++++++++++++++++++++
> +----------
>  1 file changed, 56 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-
> aspeed.c
> index f19348328a71..60afab866494 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -132,6 +132,7 @@ struct aspeed_i2c_bus {
>         /* Synchronizes I/O mem access to base. */
>         spinlock_t                      lock;
>         struct completion               cmd_complete;
> +       u32                             (*get_clk_reg_val)(u32 divisor);
>         unsigned long                   parent_clk_frequency;
>         u32                             bus_frequency;
>         /* Transaction state. */
> @@ -674,7 +675,7 @@ static const struct i2c_algorithm aspeed_i2c_algo = {
>  #endif /* CONFIG_I2C_SLAVE */
>  };
>
> -static u32 aspeed_i2c_get_clk_reg_val(u32 divisor)
> +static u32 aspeed_i2c_get_clk_reg_val(u32 clk_high_low_max, u32 divisor)
>  {
>         u32 base_clk, clk_high, clk_low, tmp;
>
> @@ -694,16 +695,22 @@ static u32 aspeed_i2c_get_clk_reg_val(u32 divisor)
>          * Thus,
>          *      SCL_freq = APB_freq /
>          *              ((1 << base_clk) * (clk_high + 1 + clk_low + 1))
> -        * The documentation recommends clk_high >= 8 and clk_low >= 7 when
> -        * possible; this last constraint gives us the following solution:
> +        * The documentation recommends clk_high >= clk_high_max / 2 and
> +        * clk_low >= clk_low_max / 2 - 1 when possible; this last
> constraint
> +        * gives us the following solution:
>          */
> -       base_clk = divisor > 33 ? ilog2((divisor - 1) / 32) + 1 : 0;
> -       tmp = divisor / (1 << base_clk);
> -       clk_high = tmp / 2 + tmp % 2;
> -       clk_low = tmp - clk_high;
> +       base_clk = divisor > clk_high_low_max ?
> +                       ilog2((divisor - 1) / clk_high_low_max) + 1 : 0;
> +       tmp = (divisor + (1 << base_clk) - 1) >> base_clk;
> +       clk_low = tmp / 2;
> +       clk_high = tmp - clk_low;
> +
> +       if (clk_high)
> +               clk_high--;
> +
> +       if (clk_low)
> +               clk_low--;
>
> -       clk_high -= 1;
> -       clk_low -= 1;
>
>         return ((clk_high << ASPEED_I2CD_TIME_SCL_HIGH_SHIFT)
>                 & ASPEED_I2CD_TIME_SCL_HIGH_MASK)
> @@ -712,13 +719,31 @@ static u32 aspeed_i2c_get_clk_reg_val(u32 divisor)
>                         | (base_clk & ASPEED_I2CD_TIME_BASE_DIVISOR_MASK);
>  }
>
> +static u32 aspeed_i2c_24xx_get_clk_reg_val(u32 divisor)
> +{
> +       /*
> +        * clk_high and clk_low are each 3 bits wide, so each can hold a
> max
> +        * value of 8 giving a clk_high_low_max of 16.
> +        */
> +       return aspeed_i2c_get_clk_reg_val(16, divisor);
> +}
> +
> +static u32 aspeed_i2c_25xx_get_clk_reg_val(u32 divisor)
> +{
> +       /*
> +        * clk_high and clk_low are each 4 bits wide, so each can hold a
> max
> +        * value of 16 giving a clk_high_low_max of 32.
> +        */
> +       return aspeed_i2c_get_clk_reg_val(32, divisor);
> +}
> +
>  /* precondition: bus.lock has been acquired. */
>  static int aspeed_i2c_init_clk(struct aspeed_i2c_bus *bus)
>  {
>         u32 divisor, clk_reg_val;
>
> -       divisor = bus->parent_clk_frequency / bus->bus_frequency;
> -       clk_reg_val = aspeed_i2c_get_clk_reg_val(divisor);
> +       divisor = DIV_ROUND_UP(bus->parent_clk_frequency,
> bus->bus_frequency);
> +       clk_reg_val = bus->get_clk_reg_val(divisor);
>         writel(clk_reg_val, bus->base + ASPEED_I2C_AC_TIMING_REG1);
>         writel(ASPEED_NO_TIMEOUT_CTRL, bus->base +
> ASPEED_I2C_AC_TIMING_REG2);
>
> @@ -777,8 +802,22 @@ static int aspeed_i2c_reset(struct aspeed_i2c_bus
> *bus)
>         return ret;
>  }
>
> +static const struct of_device_id aspeed_i2c_bus_of_table[] = {
> +       {
> +               .compatible = "aspeed,ast2400-i2c-bus",
> +               .data = aspeed_i2c_24xx_get_clk_reg_val,
> +       },
> +       {
> +               .compatible = "aspeed,ast2500-i2c-bus",
> +               .data = aspeed_i2c_25xx_get_clk_reg_val,
> +       },
> +       { },
> +};
> +MODULE_DEVICE_TABLE(of, aspeed_i2c_bus_of_table);
> +
>  static int aspeed_i2c_probe_bus(struct platform_device *pdev)
>  {
> +       const struct of_device_id *match;
>         struct aspeed_i2c_bus *bus;
>         struct clk *parent_clk;
>         struct resource *res;
> @@ -808,6 +847,12 @@ static int aspeed_i2c_probe_bus(struct
> platform_device *pdev)
>                 bus->bus_frequency = 100000;
>         }
>
> +       match = of_match_node(aspeed_i2c_bus_of_table, pdev->dev.of_node);
> +       if (!match)
> +               bus->get_clk_reg_val = aspeed_i2c_24xx_get_clk_reg_val;
> +       else
> +               bus->get_clk_reg_val = match->data;
> +
>         /* Initialize the I2C adapter */
>         spin_lock_init(&bus->lock);
>         init_completion(&bus->cmd_complete);
> @@ -869,13 +914,6 @@ static int aspeed_i2c_remove_bus(struct
> platform_device *pdev)
>         return 0;
>  }
>
> -static const struct of_device_id aspeed_i2c_bus_of_table[] = {
> -       { .compatible = "aspeed,ast2400-i2c-bus", },
> -       { .compatible = "aspeed,ast2500-i2c-bus", },
> -       { },
> -};
> -MODULE_DEVICE_TABLE(of, aspeed_i2c_bus_of_table);
> -
>  static struct platform_driver aspeed_i2c_bus_driver = {
>         .probe          = aspeed_i2c_probe_bus,
>         .remove         = aspeed_i2c_remove_bus,
> --
> 2.14.0.rc0.400.g1c36432dff-goog
>
>

--001a114e334e86c4c3055566ee69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Is clk_fractional_divider from include/linux/clk-provider.=
h appropriate here?</div><div class=3D"gmail_extra"><br><div class=3D"gmail=
_quote">On Fri, Jul 28, 2017 at 1:45 PM, Brendan Higgins <span dir=3D"ltr">=
&lt;<a href=3D"mailto:brendanhiggins@google.com" target=3D"_blank">brendanh=
iggins@google.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">2=
4xx BMCs have larger clock divider granularity which can cause problems<br>
when trying to set them as 25xx clock dividers; this adds clock setting<br>
code specific to 24xx.<br>
<br>
This also fixes a potential issue where clock dividers were rounded down<br=
>
instead of up.<br>
<br>
Signed-off-by: Brendan Higgins &lt;<a href=3D"mailto:brendanhiggins@google.=
com">brendanhiggins@google.com</a>&gt;<br>
---<br>
Changes for v2:<br>
=C2=A0 - Fixed off by one error to check for divisors with base_clk =3D=3D =
0<br>
=C2=A0 - Simplified some of the divisor math<br>
---<br>
=C2=A0drivers/i2c/busses/i2c-aspeed.<wbr>c | 74 +++++++++++++++++++++++++++=
+++<wbr>+----------<br>
=C2=A01 file changed, 56 insertions(+), 18 deletions(-)<br>
<br>
diff --git a/drivers/i2c/busses/i2c-<wbr>aspeed.c b/drivers/i2c/busses/i2c-=
<wbr>aspeed.c<br>
index f19348328a71..60afab866494 100644<br>
--- a/drivers/i2c/busses/i2c-<wbr>aspeed.c<br>
+++ b/drivers/i2c/busses/i2c-<wbr>aspeed.c<br>
@@ -132,6 +132,7 @@ struct aspeed_i2c_bus {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Synchronizes I/O mem access to base. */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 spinlock_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lock;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct completion=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd_complete;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(*get_clk_reg=
_val)(u32 divisor);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0parent_clk_frequency;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bus_frequency=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Transaction state. */<br>
@@ -674,7 +675,7 @@ static const struct i2c_algorithm aspeed_i2c_algo =3D {=
<br>
=C2=A0#endif /* CONFIG_I2C_SLAVE */<br>
=C2=A0};<br>
<br>
-static u32 aspeed_i2c_get_clk_reg_val(u32 divisor)<br>
+static u32 aspeed_i2c_get_clk_reg_val(u32 clk_high_low_max, u32 divisor)<b=
r>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 base_clk, clk_high, clk_low, tmp;<br>
<br>
@@ -694,16 +695,22 @@ static u32 aspeed_i2c_get_clk_reg_val(u32 divisor)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Thus,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 SCL_freq =3D APB_fr=
eq /<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ((1 &lt;&lt; base_clk) * (clk_high + 1 + clk_low + 1))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * The documentation recommends clk_high &gt;=
=3D 8 and clk_low &gt;=3D 7 when<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * possible; this last constraint gives us the =
following solution:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * The documentation recommends clk_high &gt;=
=3D clk_high_max / 2 and<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * clk_low &gt;=3D clk_low_max / 2 - 1 when pos=
sible; this last constraint<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * gives us the following solution:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0base_clk =3D divisor &gt; 33 ? ilog2((divisor -=
 1) / 32) + 1 : 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tmp =3D divisor / (1 &lt;&lt; base_clk);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_high =3D tmp / 2 + tmp % 2;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_low =3D tmp - clk_high;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0base_clk =3D divisor &gt; clk_high_low_max ?<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ilog2((divisor - 1) / clk_high_low_max) + 1 : 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tmp =3D (divisor + (1 &lt;&lt; base_clk) - 1) &=
gt;&gt; base_clk;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_low =3D tmp / 2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_high =3D tmp - clk_low;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (clk_high)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clk_high--;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (clk_low)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clk_low--;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_high -=3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_low -=3D 1;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ((clk_high &lt;&lt; ASPEED_I2CD_TIME_SCL=
_HIGH_<wbr>SHIFT)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp; ASPEED_I2CD_T=
IME_SCL_HIGH_<wbr>MASK)<br>
@@ -712,13 +719,31 @@ static u32 aspeed_i2c_get_clk_reg_val(u32 divisor)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | (base_clk &amp; ASPEED_I2CD_TIME_BASE_DIVISOR_<wbr>MASK);<br>
=C2=A0}<br>
<br>
+static u32 aspeed_i2c_24xx_get_clk_reg_<wbr>val(u32 divisor)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * clk_high and clk_low are each 3 bits wide, s=
o each can hold a max<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * value of 8 giving a clk_high_low_max of 16.<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return aspeed_i2c_get_clk_reg_val(16, divisor);=
<br>
+}<br>
+<br>
+static u32 aspeed_i2c_25xx_get_clk_reg_<wbr>val(u32 divisor)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * clk_high and clk_low are each 4 bits wide, s=
o each can hold a max<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * value of 16 giving a clk_high_low_max of 32.=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return aspeed_i2c_get_clk_reg_val(32, divisor);=
<br>
+}<br>
+<br>
=C2=A0/* precondition: bus.lock has been acquired. */<br>
=C2=A0static int aspeed_i2c_init_clk(struct aspeed_i2c_bus *bus)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 divisor, clk_reg_val;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0divisor =3D bus-&gt;parent_clk_frequency / bus-=
&gt;bus_frequency;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_reg_val =3D aspeed_i2c_get_clk_reg_val(<wbr=
>divisor);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0divisor =3D DIV_ROUND_UP(bus-&gt;parent_clk_<wb=
r>frequency, bus-&gt;bus_frequency);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_reg_val =3D bus-&gt;get_clk_reg_val(divisor=
);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 writel(clk_reg_val, bus-&gt;base + ASPEED_I2C_A=
C_TIMING_REG1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 writel(ASPEED_NO_TIMEOUT_CTRL, bus-&gt;base + A=
SPEED_I2C_AC_TIMING_REG2);<br>
<br>
@@ -777,8 +802,22 @@ static int aspeed_i2c_reset(struct aspeed_i2c_bus *bus=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0}<br>
<br>
+static const struct of_device_id aspeed_i2c_bus_of_table[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.compatible =3D &qu=
ot;aspeed,ast2400-i2c-bus&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data =3D aspeed_i2=
c_24xx_get_clk_reg_<wbr>val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.compatible =3D &qu=
ot;aspeed,ast2500-i2c-bus&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data =3D aspeed_i2=
c_25xx_get_clk_reg_<wbr>val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ },<br>
+};<br>
+MODULE_DEVICE_TABLE(of, aspeed_i2c_bus_of_table);<br>
+<br>
=C2=A0static int aspeed_i2c_probe_bus(struct platform_device *pdev)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct of_device_id *match;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct aspeed_i2c_bus *bus;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct clk *parent_clk;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct resource *res;<br>
@@ -808,6 +847,12 @@ static int aspeed_i2c_probe_bus(struct platform_device=
 *pdev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bus-&gt;bus_frequen=
cy =3D 100000;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0match =3D of_match_node(aspeed_i2c_bus_<wbr>of_=
table, pdev-&gt;dev.of_node);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!match)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bus-&gt;get_clk_reg=
_val =3D aspeed_i2c_24xx_get_clk_reg_<wbr>val;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bus-&gt;get_clk_reg=
_val =3D match-&gt;data;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Initialize the I2C adapter */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_lock_init(&amp;bus-&gt;lock);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 init_completion(&amp;bus-&gt;cmd_<wbr>complete)=
;<br>
@@ -869,13 +914,6 @@ static int aspeed_i2c_remove_bus(struct platform_devic=
e *pdev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0}<br>
<br>
-static const struct of_device_id aspeed_i2c_bus_of_table[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;aspeed,ast2400-i2c-bus&=
quot;, },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;aspeed,ast2500-i2c-bus&=
quot;, },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ },<br>
-};<br>
-MODULE_DEVICE_TABLE(of, aspeed_i2c_bus_of_table);<br>
-<br>
=C2=A0static struct platform_driver aspeed_i2c_bus_driver =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .probe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D as=
peed_i2c_probe_bus,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D as=
peed_i2c_remove_bus,<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.14.0.rc0.400.g1c36432dff-<wbr>goog<br>
<br>
</font></span></blockquote></div><br></div>

--001a114e334e86c4c3055566ee69--
