Return-Path: <raltherr@google.com>
Received: from mail-wm0-x232.google.com (mail-wm0-x232.google.com
 [IPv6:2a00:1450:400c:c09::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x7kvs3BF2zDqkY
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jul 2017 04:32:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="W97e+uPp"; 
 dkim-atps=neutral
Received: by mail-wm0-x232.google.com with SMTP id 62so860058wmw.1
 for <openbmc@lists.ozlabs.org>; Thu, 13 Jul 2017 11:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=UiMlh5RbBiMhbBTECev/4ujo+vwBVl0P6iZNxa/bRMU=;
 b=W97e+uPpt0JyJ88US3yYdFYzZQT+KykQmRmqmXaDB/c4h91AXl375QHqi0qEUFmmql
 71XOoTdlysxd2Smb+dM1OhJQN7stRFdc8olhZysuN7F9lRfSqPGyJqO8vvrqB+FlOlMV
 kH39p8TtaLs9SVr3MoqypMmnYsYzeU36nIqA6rDcKQDeTbT2GjHIM14dX6BAPNa+Q1Tq
 dSE+dvUAtJ7sCaopOscUGFCuX8SKROXK087ppTWtI8tyaU5h83vXc6j7Sjno3yo2WKT3
 4lIxX5hJuAv9y2LOBa0occGlZRy6wnV7TAHiaqPoxMmdEGrfzld4I3Sc+5yREqmosprR
 kyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=UiMlh5RbBiMhbBTECev/4ujo+vwBVl0P6iZNxa/bRMU=;
 b=cN+VDYF4ffhjTqRaeNzRhhrkh12vl45xLIU1nmqQjiYOuUCPp0hqbs7U8dbfD7nwge
 +hm/HFcYdmPJRQ+qQJsUrMLXG5b/yIk6zDQ69LuuXdCLh2hAYl/S81Euo4kBql0rIc4x
 8YkIa8ICbS/gJTUZJwyU1069Ll0xWNjRa8QVYZb9hfNWdwKxGIqAl21aUl6wRInwJBgw
 4qmG46qU9CHlwWKHH5kuXDBlTxsaeKhO0dYG8+xNfM4WOjWj8O8G/hieMsP+dWQbNNXc
 jckb7zDiZ7CIepzyTf7LyAAJnuGiKZL52Q+0TC2zWK0KW9l3SRxVs7EUfQQacH3ImE/I
 King==
X-Gm-Message-State: AIVw111+/CcVmmJ7h2yydCTPRy5KKDGF+GrnpHAjGB3Yzs77VLonya5O
 D2lBzaIt559kyAzrxGnWAdsKMXEFWhQr
X-Received: by 10.28.46.3 with SMTP id u3mr71869wmu.68.1499970773397; Thu, 13
 Jul 2017 11:32:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.153.69 with HTTP; Thu, 13 Jul 2017 11:32:52 -0700 (PDT)
In-Reply-To: <20170713142856.25302-1-c_mykolak@mellanox.com>
References: <20170713142856.25302-1-c_mykolak@mellanox.com>
From: Rick Altherr <raltherr@google.com>
Date: Thu, 13 Jul 2017 11:32:52 -0700
Message-ID: <CAPLgG==vk4AHm5V8PG66QDx-M1GUvahRhsYu=YtOHwXEXm_=Lw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] iio: aspeed-adc: wait for initial sequence.
To: Mykola Kostenok <c_mykolak@mellanox.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vadim Pasternak <vadimp@mellanox.com>, Ohad Oz <ohado@mellanox.com>
Content-Type: multipart/alternative; boundary="001a11424c1a1fe19005543729d3"
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
X-List-Received-Date: Thu, 13 Jul 2017 18:32:58 -0000

--001a11424c1a1fe19005543729d3
Content-Type: text/plain; charset="UTF-8"

Huh.  We've been getting valid readings without this on our AST2500
systems.  Regardless, it is correct for AST2500.  On AST2400 though, there
is no INIT_RDY bit.

On Thu, Jul 13, 2017 at 7:28 AM, Mykola Kostenok <c_mykolak@mellanox.com>
wrote:

> This patch enables adc engine at initialization time and waits
> for the initial sequence completion before enabling adc channels.
>
> Without this code adc channels are not functional and shows
> zeros for all connected channels.
>
> Tested on mellanox msn platform.
>
> Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
> ---
>  drivers/iio/adc/aspeed_adc.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
> index 2283ed2..e4ad6ef 100644
> --- a/drivers/iio/adc/aspeed_adc.c
> +++ b/drivers/iio/adc/aspeed_adc.c
> @@ -22,6 +22,7 @@
>
>  #include <linux/iio/iio.h>
>  #include <linux/iio/driver.h>
> +#include <linux/iopoll.h>
>
>  #define ASPEED_RESOLUTION_BITS         10
>  #define ASPEED_CLOCKS_PER_SAMPLE       12
> @@ -38,6 +39,11 @@
>
>  #define ASPEED_ENGINE_ENABLE           BIT(0)
>
> +#define ASPEED_ADC_CTRL_INIT_RDY       BIT(8)
> +
> +#define ASPEED_ADC_INIT_POLLING_TIME   500
> +#define ASPEED_ADC_INIT_TIMEOUT                500000
> +
>  struct aspeed_adc_model_data {
>         const char *model_name;
>         unsigned int min_sampling_rate; // Hz
> @@ -210,6 +216,20 @@ static int aspeed_adc_probe(struct platform_device
> *pdev)
>                 goto scaler_error;
>         }
>
> +       /* Enable engine in normal mode. */
> +       writel(ASPEED_OPERATION_MODE_NORMAL | ASPEED_ENGINE_ENABLE,
> +              data->base + ASPEED_REG_ENGINE_CONTROL);
> +
> +       /* Wait for initial sequence complete. */
> +       ret = readl_poll_timeout(data->base + ASPEED_REG_ENGINE_CONTROL,
> +                                adc_engine_control_reg_val,
> +                                adc_engine_control_reg_val &
> +                                ASPEED_ADC_CTRL_INIT_RDY,
> +                                ASPEED_ADC_INIT_POLLING_TIME,
> +                                ASPEED_ADC_INIT_TIMEOUT);
> +       if (ret)
> +               goto scaler_error;
> +
>         /* Start all channels in normal mode. */
>         clk_prepare_enable(data->clk_scaler->clk);
>         adc_engine_control_reg_val = GENMASK(31, 16) |
> --
> 2.8.4
>
>

--001a11424c1a1fe19005543729d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Huh.=C2=A0 We&#39;ve been getting valid readings without t=
his on our AST2500 systems.=C2=A0 Regardless, it is correct for AST2500.=C2=
=A0 On AST2400 though, there is no INIT_RDY bit.</div><div class=3D"gmail_e=
xtra"><br><div class=3D"gmail_quote">On Thu, Jul 13, 2017 at 7:28 AM, Mykol=
a Kostenok <span dir=3D"ltr">&lt;<a href=3D"mailto:c_mykolak@mellanox.com" =
target=3D"_blank">c_mykolak@mellanox.com</a>&gt;</span> wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">This patch enables adc engine at initialization time =
and waits<br>
for the initial sequence completion before enabling adc channels.<br>
<br>
Without this code adc channels are not functional and shows<br>
zeros for all connected channels.<br>
<br>
Tested on mellanox msn platform.<br>
<br>
Signed-off-by: Mykola Kostenok &lt;<a href=3D"mailto:c_mykolak@mellanox.com=
">c_mykolak@mellanox.com</a>&gt;<br>
---<br>
=C2=A0drivers/iio/adc/aspeed_adc.c | 20 ++++++++++++++++++++<br>
=C2=A01 file changed, 20 insertions(+)<br>
<br>
diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c<br=
>
index 2283ed2..e4ad6ef 100644<br>
--- a/drivers/iio/adc/aspeed_adc.c<br>
+++ b/drivers/iio/adc/aspeed_adc.c<br>
@@ -22,6 +22,7 @@<br>
<br>
=C2=A0#include &lt;linux/iio/iio.h&gt;<br>
=C2=A0#include &lt;linux/iio/driver.h&gt;<br>
+#include &lt;linux/iopoll.h&gt;<br>
<br>
=C2=A0#define ASPEED_RESOLUTION_BITS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A010<br=
>
=C2=A0#define ASPEED_CLOCKS_PER_SAMPLE=C2=A0 =C2=A0 =C2=A0 =C2=A012<br>
@@ -38,6 +39,11 @@<br>
<br>
=C2=A0#define ASPEED_ENGINE_ENABLE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
BIT(0)<br>
<br>
+#define ASPEED_ADC_CTRL_INIT_RDY=C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(8)<br>
+<br>
+#define ASPEED_ADC_INIT_POLLING_TIME=C2=A0 =C2=A0500<br>
+#define ASPEED_ADC_INIT_TIMEOUT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 500000<br>
+<br>
=C2=A0struct aspeed_adc_model_data {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *model_name;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int min_sampling_rate; // Hz<br>
@@ -210,6 +216,20 @@ static int aspeed_adc_probe(struct platform_device *pd=
ev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto scaler_error;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Enable engine in normal mode. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(ASPEED_OPERATION_MODE_<wbr>NORMAL | ASPE=
ED_ENGINE_ENABLE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data-&gt;base + ASPEED_RE=
G_ENGINE_CONTROL);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Wait for initial sequence complete. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D readl_poll_timeout(data-&gt;base + ASPE=
ED_REG_ENGINE_CONTROL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adc_engine_control_reg_val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adc_engine_control_reg_val &amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ASPEED_ADC_CTRL_INIT_RDY,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ASPEED_ADC_INIT_POLLING_TIME,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ASPEED_ADC_INIT_TIMEOUT);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto scaler_error;<=
br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Start all channels in normal mode. */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 clk_prepare_enable(data-&gt;clk_<wbr>scaler-&gt=
;clk);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 adc_engine_control_reg_val =3D GENMASK(31, 16) =
|<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.8.4<br>
<br>
</font></span></blockquote></div><br></div>

--001a11424c1a1fe19005543729d3--
