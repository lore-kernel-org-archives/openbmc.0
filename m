Return-Path: <raltherr@google.com>
Received: from mail-wr0-x230.google.com (mail-wr0-x230.google.com
 [IPv6:2a00:1450:400c:c0c::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x8Hbl205gzDqg2
 for <openbmc@lists.ozlabs.org>; Sat, 15 Jul 2017 02:05:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="TJMx/NAe"; 
 dkim-atps=neutral
Received: by mail-wr0-x230.google.com with SMTP id v60so3287693wrc.3
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jul 2017 09:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=GO6CZofcJKse9OditLhIzJXwHRB1tIHrcTFE6JQT9iQ=;
 b=TJMx/NAelNr69Wx3BnMy6kGqr7hWypfQZlW3Wi7pRsHhTYt96dXkMSIMt8qPnBYui2
 exiGpRNfL+8NxKJ9PNT6TYm+vOQ9OgXKemrZemHXo1Ox+ChGn/ulcrUzbdQB3wYvXTK4
 amExKBAmxx6RW1YtHQzNp0aC/E2nMpcHAFknWRElu2tOKcMUHQHu7vvbS+XaVZv1MaZr
 uj2d/DJhxhEF4p4r7lPrNMZY/diigdvnCqSbWrm5ZtSEFNkz5g9zgYQRC4t7mB41u7hx
 rFTJoma+MxdPTGCQgepmIraco4sZDGeq3H61/+hgWYt9FxdH+7MroyhCOrNGlJ7cTE13
 Mnaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=GO6CZofcJKse9OditLhIzJXwHRB1tIHrcTFE6JQT9iQ=;
 b=Db5jA8Kt/IpjPU+W1BiD2W7blQ9Ve7EVwBwulnVWIZ+s42+o0wjOmnbIqexFhgrmSN
 1V3HNn+RNhFY2PLYh+SKaRC0XNz+ZwZZHtzVhIdKXdDrHiS3btCQcn+rXK9AsCDpH5o3
 zhGnDn+W54XoIPk4/fOTt7fIAWqHFUzXtaEa17qz3o/X2iD/yX3OEBkoucQcDigLdvj/
 rsQb8T8GtWqbCmfOVbCBgqSvPvJUl25JRB26fOFj3Ga3lxulXzwrh4A0YAX4w0W+HH8p
 fVOWwU2dKC8BtiIdwawV2LQAWykrc2dMRlICUn6lToyDgS+1QSZDdO295lhOR2z4dI21
 j1GQ==
X-Gm-Message-State: AIVw110/XIIF3GzfCXTgEO7PQMo7iO8/gMS013dqGCI/fx/owk2YY/+S
 lBEfyg7/7n3OQZHsfPz1Oq2b/WZJzY28
X-Received: by 10.223.171.3 with SMTP id q3mr4681617wrc.12.1500048351799; Fri,
 14 Jul 2017 09:05:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.153.69 with HTTP; Fri, 14 Jul 2017 09:05:50 -0700 (PDT)
Received: by 10.28.153.69 with HTTP; Fri, 14 Jul 2017 09:05:50 -0700 (PDT)
In-Reply-To: <20170714080941.8400-1-c_mykolak@mellanox.com>
References: <20170714080941.8400-1-c_mykolak@mellanox.com>
From: Rick Altherr <raltherr@google.com>
Date: Fri, 14 Jul 2017 09:05:50 -0700
Message-ID: <CAPLgG==g_tTX-33tT7q143Dxg3o4P=t__5q1TaWR6k1KZ6M5UQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2] iio: aspeed-adc: wait for initial
 sequence.
To: Mykola Kostenok <c_mykolak@mellanox.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vadim Pasternak <vadimp@mellanox.com>, 
 Ohad Oz <ohado@mellanox.com>, Joel Stanley <joel@jms.id.au>
Content-Type: multipart/alternative; boundary="94eb2c1b440a283d3905544939a4"
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
X-List-Received-Date: Fri, 14 Jul 2017 16:05:56 -0000

--94eb2c1b440a283d3905544939a4
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Rick Altherr <raltherr@google.com>

On Jul 14, 2017 1:12 AM, "Mykola Kostenok" <c_mykolak@mellanox.com> wrote:

> This patch enables adc engine at initialization time and waits
> for the initial sequence completion before enabling adc channels.
>
> Without this code adc channels are not functional and shows
> zeros for all connected channels.
>
> Tested on mellanox msn platform.
>
> v1 -> v2:
> Pointed by Rick Altherr:
>  - Wait init sequence code enabled by bool
> from OF match table.
>
> Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
> ---
>  drivers/iio/adc/aspeed_adc.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
> index 2283ed2..cfa7ee1 100644
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
> @@ -38,11 +39,17 @@
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
>         unsigned int max_sampling_rate; // Hz
>         unsigned int vref_voltage;      // mV
> +       bool wait_init_sequence;
>  };
>
>  struct aspeed_adc_data {
> @@ -210,6 +217,24 @@ static int aspeed_adc_probe(struct platform_device
> *pdev)
>                 goto scaler_error;
>         }
>
> +       model_data = of_device_get_match_data(&pdev->dev);
> +
> +       if (model_data->wait_init_sequence) {
> +               /* Enable engine in normal mode. */
> +               writel(ASPEED_OPERATION_MODE_NORMAL |
> ASPEED_ENGINE_ENABLE,
> +                      data->base + ASPEED_REG_ENGINE_CONTROL);
> +
> +               /* Wait for initial sequence complete. */
> +               ret = readl_poll_timeout(data->base +
> ASPEED_REG_ENGINE_CONTROL,
> +                                        adc_engine_control_reg_val,
> +                                        adc_engine_control_reg_val &
> +                                        ASPEED_ADC_CTRL_INIT_RDY,
> +                                        ASPEED_ADC_INIT_POLLING_TIME,
> +                                        ASPEED_ADC_INIT_TIMEOUT);
> +               if (ret)
> +                       goto scaler_error;
> +       }
> +
>         /* Start all channels in normal mode. */
>         clk_prepare_enable(data->clk_scaler->clk);
>         adc_engine_control_reg_val = GENMASK(31, 16) |
> @@ -269,6 +294,7 @@ static const struct aspeed_adc_model_data
> ast2500_model_data = {
>         .vref_voltage = 1800, // mV
>         .min_sampling_rate = 1,
>         .max_sampling_rate = 1000000,
> +       .wait_init_sequence = true,
>  };
>
>  static const struct of_device_id aspeed_adc_matches[] = {
> --
> 2.8.4
>
>

--94eb2c1b440a283d3905544939a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Reviewed-by: Rick Altherr &lt;<a href=3D"mailto:raltherr@=
google.com">raltherr@google.com</a>&gt;</div><div class=3D"gmail_extra"><br=
><div class=3D"gmail_quote">On Jul 14, 2017 1:12 AM, &quot;Mykola Kostenok&=
quot; &lt;<a href=3D"mailto:c_mykolak@mellanox.com">c_mykolak@mellanox.com<=
/a>&gt; wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This =
patch enables adc engine at initialization time and waits<br>
for the initial sequence completion before enabling adc channels.<br>
<br>
Without this code adc channels are not functional and shows<br>
zeros for all connected channels.<br>
<br>
Tested on mellanox msn platform.<br>
<br>
v1 -&gt; v2:<br>
Pointed by Rick Altherr:<br>
=C2=A0- Wait init sequence code enabled by bool<br>
from OF match table.<br>
<br>
Signed-off-by: Mykola Kostenok &lt;<a href=3D"mailto:c_mykolak@mellanox.com=
">c_mykolak@mellanox.com</a>&gt;<br>
---<br>
=C2=A0drivers/iio/adc/aspeed_adc.c | 26 ++++++++++++++++++++++++++<br>
=C2=A01 file changed, 26 insertions(+)<br>
<br>
diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c<br=
>
index 2283ed2..cfa7ee1 100644<br>
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
@@ -38,11 +39,17 @@<br>
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
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int max_sampling_rate; // Hz<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int vref_voltage;=C2=A0 =C2=A0 =C2=A0 =
// mV<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool wait_init_sequence;<br>
=C2=A0};<br>
<br>
=C2=A0struct aspeed_adc_data {<br>
@@ -210,6 +217,24 @@ static int aspeed_adc_probe(struct platform_device *pd=
ev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto scaler_error;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0model_data =3D of_device_get_match_data(&amp;<w=
br>pdev-&gt;dev);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (model_data-&gt;wait_init_<wbr>sequence) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Enable engine in=
 normal mode. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0writel(ASPEED_OPERA=
TION_MODE_<wbr>NORMAL | ASPEED_ENGINE_ENABLE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 data-&gt;base + ASPEED_REG_ENGINE_CONTROL);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Wait for initial=
 sequence complete. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D readl_poll_=
timeout(data-&gt;base + ASPEED_REG_ENGINE_CONTROL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adc_engi=
ne_control_reg_val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adc_engi=
ne_control_reg_val &amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ASPEED_A=
DC_CTRL_INIT_RDY,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ASPEED_A=
DC_INIT_POLLING_TIME,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ASPEED_A=
DC_INIT_TIMEOUT);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0goto scaler_error;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Start all channels in normal mode. */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 clk_prepare_enable(data-&gt;clk_<wbr>scaler-&gt=
;clk);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 adc_engine_control_reg_val =3D GENMASK(31, 16) =
|<br>
@@ -269,6 +294,7 @@ static const struct aspeed_adc_model_data ast2500_model=
_data =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .vref_voltage =3D 1800, // mV<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .min_sampling_rate =3D 1,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .max_sampling_rate =3D 1000000,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.wait_init_sequence =3D true,<br>
=C2=A0};<br>
<br>
=C2=A0static const struct of_device_id aspeed_adc_matches[] =3D {<br>
--<br>
2.8.4<br>
<br>
</blockquote></div></div>

--94eb2c1b440a283d3905544939a4--
