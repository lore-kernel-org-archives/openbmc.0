Return-Path: <raltherr@google.com>
Received: from mail-wm0-x22a.google.com (mail-wm0-x22a.google.com
 [IPv6:2a00:1450:400c:c09::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x83hb6zyKzDqgP
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jul 2017 17:09:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="kv9JMc6/"; 
 dkim-atps=neutral
Received: by mail-wm0-x22a.google.com with SMTP id 62so12194128wmw.1
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jul 2017 00:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=lSJ8g5Eg35k91U8Nlupa2MvnJ33fxMxLKynasjJLXxQ=;
 b=kv9JMc6/MumkouHLFbiXaHNv42Af76cdZYpR++n7McZNuY8a7wHbgv+75uBpfJPRD3
 d5rY99m0Nkqxz1zH7RtXyAjlrBP0Xauv6Fyb0aWlT2ciHCCUoK4gA8nnZlis4FYTmaZr
 otl3rd7s/m1yWqlS+wYCbHnaNuKjfPWwt0MGMM/XM2e/mvavg4PjS589RIlLNj7fA9wh
 7UpFtpweMGmM2CnDDaCxA9Z7OUI4SysFfmPa/33OA6uFcP67Yo+RgjyIewz2vm8SwMwl
 LAXjBz7+Bsu0Uc6yT9Topb4EUr4DThsVyOomqudFpgwT+TL7mKXraq9Lt/clnPIx6O0v
 GPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=lSJ8g5Eg35k91U8Nlupa2MvnJ33fxMxLKynasjJLXxQ=;
 b=mnQucvHzwzBiaBQ6vP/5ijpnqwNwFZdOgWUAelpqVjB5PlwEbhjRcdwwUuu/zf8QW2
 dmrYppc3Vb8HH5QnL/cPnxT2UxQJwb3AW2v63uU/6vi78nlGXW+wr52CzURiH1Om0giC
 /cIxuBdLbbg1FGPa4UmWRFf77bbWSciguSSL/hdbNbWIhK2eQ0BjB92vOmRxudlh6jjl
 cmJOks7424m2TC5UqWNBCfNfWbGZtepDUvSlDPbthm5IoRs0/stlxhB7ak3ke5UwKaP8
 xu579E17y1iZ8VtPTt38vCFzL2DcisGH60p4X5G84mMrJOVeF3MzmQHj51DA65h6iYXr
 3zMQ==
X-Gm-Message-State: AIVw113k6g8XyEal1oq5IkSVAFgrQn+mg25aH26CzmmjWp7flxw7WqaU
 aWpjXOdXhpvSXrdEkM7ARQzy9dzzWUFB
X-Received: by 10.28.228.134 with SMTP id b128mr1807028wmh.64.1500016156036;
 Fri, 14 Jul 2017 00:09:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.153.69 with HTTP; Fri, 14 Jul 2017 00:09:14 -0700 (PDT)
Received: by 10.28.153.69 with HTTP; Fri, 14 Jul 2017 00:09:14 -0700 (PDT)
In-Reply-To: <DB5PR05MB12243A3B21C02B7A4B5B639BEFAD0@DB5PR05MB1224.eurprd05.prod.outlook.com>
References: <20170713142856.25302-1-c_mykolak@mellanox.com>
 <CAPLgG==vk4AHm5V8PG66QDx-M1GUvahRhsYu=YtOHwXEXm_=Lw@mail.gmail.com>
 <DB5PR05MB12243A3B21C02B7A4B5B639BEFAD0@DB5PR05MB1224.eurprd05.prod.outlook.com>
From: Rick Altherr <raltherr@google.com>
Date: Fri, 14 Jul 2017 00:09:14 -0700
Message-ID: <CAPLgG=nh7JNUsCiGr6oToLZcmzRMceAP22W0Tm6FsTdVfXzCQA@mail.gmail.com>
Subject: RE: [PATCH linux dev-4.10] iio: aspeed-adc: wait for initial sequence.
To: Mykola Kostenok <c_mykolak@mellanox.com>
Cc: Vadim Pasternak <vadimp@mellanox.com>, Ohad Oz <ohado@mellanox.com>, 
 Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="001a114b103223c41d055441ba5a"
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
X-List-Received-Date: Fri, 14 Jul 2017 07:09:21 -0000

--001a114b103223c41d055441ba5a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Better to extend the match data struct that is set in the OF match table.
That is already used to specify the reference voltage as it is different
between ast2400 and ast2500.  Either add a bool or a hook for running init
code.

On Jul 13, 2017 11:35 PM, "Mykola Kostenok" <c_mykolak@mellanox.com> wrote:

> Hi, Rick.
>
> Thanks for reply.
>
>
>
> We definitely have an issue with adc, without this initialization.
>
>
>
> This without our changes:
>
> root@msn:~# cat /sys/bus/iio/devices/iio\:device0/i*
>
> 653
>
> 0
>
> 0
>
> 0
>
> 0
>
> 0
>
> 0
>
> 0
>
> 0
>
> 0
>
> 0
>
> 0
>
> 0
>
> 0
>
> 0
>
> 0
>
> And with:
>
> root@msn:~# cat /sys/bus/iio/devices/iio\:device0/i*
>
> 755
>
> 776
>
> 715
>
> 681
>
> 657
>
> 0
>
> 0
>
> 0
>
> 771
>
> 770
>
> 759
>
> 0
>
> 0
>
> 0
>
> 0
>
> 0
>
>
>
> We using AST2520, but it should not make any difference.
>
> According to our output, this initialization is necessary. Possibly it
> could work without it, but in our case it doesn=E2=80=99t.
>
>
>
> Will it be OK to do this initialization only for ast2500:
>
> if (strcmp(model_data->model_name , ast2500_model_data.model_name) =3D=3D=
 0)
>
> ?
>
>
>
>
>
> Best regards. Mykola Kostenok.
>
>
>
> *From:* Rick Altherr [mailto:raltherr@google.com]
> *Sent:* Thursday, July 13, 2017 9:33 PM
> *To:* Mykola Kostenok <c_mykolak@mellanox.com>
> *Cc:* Joel Stanley <joel@jms.id.au>; OpenBMC Maillist <
> openbmc@lists.ozlabs.org>; Vadim Pasternak <vadimp@mellanox.com>; Ohad Oz
> <ohado@mellanox.com>
> *Subject:* Re: [PATCH linux dev-4.10] iio: aspeed-adc: wait for initial
> sequence.
>
>
>
> Huh.  We've been getting valid readings without this on our AST2500
> systems.  Regardless, it is correct for AST2500.  On AST2400 though, ther=
e
> is no INIT_RDY bit.
>
>
>
> On Thu, Jul 13, 2017 at 7:28 AM, Mykola Kostenok <c_mykolak@mellanox.com>
> wrote:
>
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
> +       ret =3D readl_poll_timeout(data->base + ASPEED_REG_ENGINE_CONTROL=
,
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
>         adc_engine_control_reg_val =3D GENMASK(31, 16) |
> --
> 2.8.4
>
>
>

--001a114b103223c41d055441ba5a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Better to extend the match data struct that is set in the=
 OF match table. That is already used to specify the reference voltage as i=
t is different between ast2400 and ast2500.=C2=A0 Either add a bool or a ho=
ok for running init code.</div><div class=3D"gmail_extra"><br><div class=3D=
"gmail_quote">On Jul 13, 2017 11:35 PM, &quot;Mykola Kostenok&quot; &lt;<a =
href=3D"mailto:c_mykolak@mellanox.com">c_mykolak@mellanox.com</a>&gt; wrote=
:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">





<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"m_-6752518815872725745WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif">Hi, Rick.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif">Thanks for reply.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif">We definitely have an issue with adc, without this =
initialization.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif">This without our changes:<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;color:black">root@msn:~# cat /sys/bus/iio/=
devices/iio\:<wbr>device0/i*<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;color:black">653<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;color:black">0<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;color:black">0<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;color:black">0<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;color:black">0<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;color:black">0<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;color:black">0<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;color:black">0<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;color:black">0<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;color:black">0<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;color:black">0<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;color:black">0<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;color:black">0<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;color:black">0<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;color:black">0<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;color:black">0<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif">And with:<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;color:black">root@msn:~# cat /sys/bus/iio/=
devices/iio\:<wbr>device0/i*<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;color:black">755<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;color:black">776<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;color:black">715<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;color:black">681<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;color:black">657<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;color:black">0<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;color:black">0<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;color:black">0<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;color:black">771<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;color:black">770<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;color:black">759<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;color:black">0<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;color:black">0<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;color:black">0<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;color:black">0<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;color:black">0<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif">We using AST2520, but it should not make any differ=
ence.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif">According to our output, this initialization is nec=
essary. Possibly it could work without it, but in our case it doesn=E2=80=
=99t.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif">Will it be OK to do this initialization only for as=
t2500:<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><span style=3D"font-size:=
11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#1f497d">if (strcmp=
(model_data-&gt;model_name , ast2500_model_data.model_name) =3D=3D 0)<u></u=
><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif">?<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif">Best regards. Mykola Kostenok.<u></u><u></u></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif"><u></u>=C2=A0<u></u></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #e1e1e1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11.0pt;=
font-family:&quot;Calibri&quot;,sans-serif"> Rick Altherr [mailto:<a href=
=3D"mailto:raltherr@google.com" target=3D"_blank">raltherr@google.com</a>]
<br>
<b>Sent:</b> Thursday, July 13, 2017 9:33 PM<br>
<b>To:</b> Mykola Kostenok &lt;<a href=3D"mailto:c_mykolak@mellanox.com" ta=
rget=3D"_blank">c_mykolak@mellanox.com</a>&gt;<br>
<b>Cc:</b> Joel Stanley &lt;<a href=3D"mailto:joel@jms.id.au" target=3D"_bl=
ank">joel@jms.id.au</a>&gt;; OpenBMC Maillist &lt;<a href=3D"mailto:openbmc=
@lists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;; Vadi=
m Pasternak &lt;<a href=3D"mailto:vadimp@mellanox.com" target=3D"_blank">va=
dimp@mellanox.com</a>&gt;; Ohad Oz &lt;<a href=3D"mailto:ohado@mellanox.com=
" target=3D"_blank">ohado@mellanox.com</a>&gt;<br>
<b>Subject:</b> Re: [PATCH linux dev-4.10] iio: aspeed-adc: wait for initia=
l sequence.<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">Huh.=C2=A0 We&#39;ve been getting valid readings wit=
hout this on our AST2500 systems.=C2=A0 Regardless, it is correct for AST25=
00.=C2=A0 On AST2400 though, there is no INIT_RDY bit.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">On Thu, Jul 13, 2017 at 7:28 AM, Mykola Kostenok &lt=
;<a href=3D"mailto:c_mykolak@mellanox.com" target=3D"_blank">c_mykolak@mell=
anox.com</a>&gt; wrote:<u></u><u></u></p>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">This patch enables ad=
c engine at initialization time and waits<br>
for the initial sequence completion before enabling adc channels.<br>
<br>
Without this code adc channels are not functional and shows<br>
zeros for all connected channels.<br>
<br>
Tested on mellanox msn platform.<br>
<br>
Signed-off-by: Mykola Kostenok &lt;<a href=3D"mailto:c_mykolak@mellanox.com=
" target=3D"_blank">c_mykolak@mellanox.com</a>&gt;<br>
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
<span class=3D"m_-6752518815872725745hoenzb"><span style=3D"color:#888888">=
--</span></span><span style=3D"color:#888888"><br>
<span class=3D"m_-6752518815872725745hoenzb">2.8.4</span></span><u></u><u><=
/u></p>
</blockquote>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>
</div>
</div>

</blockquote></div></div>

--001a114b103223c41d055441ba5a--
