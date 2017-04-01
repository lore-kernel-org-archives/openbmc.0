Return-Path: <raltherr@google.com>
Received: from mail-wm0-x234.google.com (mail-wm0-x234.google.com
 [IPv6:2a00:1450:400c:c09::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vvz8K1SlHzDqGx
 for <openbmc@lists.ozlabs.org>; Sat,  1 Apr 2017 11:02:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="TfuMbTBJ"; 
 dkim-atps=neutral
Received: by mail-wm0-x234.google.com with SMTP id x124so10179568wmf.0
 for <openbmc@lists.ozlabs.org>; Fri, 31 Mar 2017 17:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=0nGEGkEhUk6wknjkq+1MAoDAqufVBmKaqo1Gwazxdp4=;
 b=TfuMbTBJBv5mUpXco8DHjm8RX6r1MOeBLXK6JsDi1nNxQp8au9ZUHCtM7uLk66ak5F
 SZILaxlNiStCZDo63lRx5fghfn9almRCTo0l/d11G9b9JB0nug3yk96SgA/cuRni/QFE
 Dbh20zxP2BFapnDLCu69ykfH/ffeP6QFzlBm3943Y5R22TQLKEJKWfA52Ont75xRBIqo
 8T4cDC78y+bgXZ3uqk8OIeA2MvOM0NpwuOc3WWW76zdY4/oFxY3xHbWg/qwIOyzf99k+
 fbXHlPl3uJhC0j8csl0gcPQ1vM/ncdI1DkG42XKa4FAB9SbLwI8kIVClik+g5/YoApjQ
 MrgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=0nGEGkEhUk6wknjkq+1MAoDAqufVBmKaqo1Gwazxdp4=;
 b=BQQMhu3wFVfN01ABMg/A161vSAnyfinVAl/LvuA+AZWwXYJqVeTiusYAHUEU0xZXVc
 9PxkYhpZSzW3XoqSqrNQjkLQJPk5WPZMhXo2S+qgB3oCrVGKoGk3wHqr9WUE9HWK0xHA
 ofKElQw747bt6vi1Osqh54r9lMWdVCz50o5/n4NN0KKA56rs/ebyw/wP3CHWgygPbVWP
 Tl19dJDoJ76byYE4eX+BeWb0d0EJmCEQEhvhBu/dIFoHWAs6sHZbI+ay/aNXa3ybPQdy
 wlCDLI+jX8H1u5QrjhbsZZABbp8yfC8yfIZpzFhZnkeXg+4QHnLeR8To/BdcBwhmsPgJ
 y/DQ==
X-Gm-Message-State: AFeK/H3cgibJj7cKa9QxhI29QReBDm11zgC8giO6jYqN1l5QbVg0mY+QpAaQxOxtUP+KdDVZgAfeCeB1P/Jscc/d
X-Received: by 10.28.199.132 with SMTP id x126mr226167wmf.37.1491004956575;
 Fri, 31 Mar 2017 17:02:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.169.8 with HTTP; Fri, 31 Mar 2017 17:02:35 -0700 (PDT)
In-Reply-To: <20170331235727.78354-1-xow@google.com>
References: <20170331235727.78354-1-xow@google.com>
From: Rick Altherr <raltherr@google.com>
Date: Fri, 31 Mar 2017 17:02:35 -0700
Message-ID: <CAPLgG==SQ9Mn=xuTL7Mhp08hqgAZCbRpCznXh3u6FRiNompG1A@mail.gmail.com>
Subject: Re: [PATCH linux] ARM: dts: aspeed: zaius: Add iio-hwmon ADC bridge
To: Xo Wang <xow@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=94eb2c0d4d1ecbf0fb054c0fa41e
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
X-List-Received-Date: Sat, 01 Apr 2017 00:02:42 -0000

--94eb2c0d4d1ecbf0fb054c0fa41e
Content-Type: text/plain; charset=UTF-8

Acked-by: Rick Altherr <raltherr@google.com>

On Fri, Mar 31, 2017 at 4:57 PM, Xo Wang <xow@google.com> wrote:

> Add instantiation for iio-hwmon bridge that exports the ADC (an iio
> device) channels to hwmon as a device.
>
> This requires CONFIG_SENSORS_IIO_HWMON to function. Note that the hwmon
> input numbering is one-indexed, so each input will be numbered one
> greater than their corresponding ADC channel.
>
> Signed-off-by: Xo Wang <xow@google.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index dfd0dd7c16e4..7ea66de051d4 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -86,6 +86,14 @@
>                 enable-gpios = <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
>                 mux-gpios = <&gpio ASPEED_GPIO(P, 6) GPIO_ACTIVE_HIGH>;
>         };
> +
> +       iio-hwmon {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
> +                       <&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
> +                       <&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>,
> +                       <&adc 12>, <&adc 13>, <&adc 14>, <&adc 15>;
> +       };
>  };
>
>  &fmc {
> --
> 2.12.2.564.g063fe858b8-goog
>
>

--94eb2c0d4d1ecbf0fb054c0fa41e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Acked-by: Rick Altherr &lt;<a href=3D"mailto:raltherr@goog=
le.com">raltherr@google.com</a>&gt;</div><div class=3D"gmail_extra"><br><di=
v class=3D"gmail_quote">On Fri, Mar 31, 2017 at 4:57 PM, Xo Wang <span dir=
=3D"ltr">&lt;<a href=3D"mailto:xow@google.com" target=3D"_blank">xow@google=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Add instantiat=
ion for iio-hwmon bridge that exports the ADC (an iio<br>
device) channels to hwmon as a device.<br>
<br>
This requires CONFIG_SENSORS_IIO_HWMON to function. Note that the hwmon<br>
input numbering is one-indexed, so each input will be numbered one<br>
greater than their corresponding ADC channel.<br>
<br>
Signed-off-by: Xo Wang &lt;<a href=3D"mailto:xow@google.com">xow@google.com=
</a>&gt;<br>
---<br>
=C2=A0arch/arm/boot/dts/aspeed-bmc-<wbr>opp-zaius.dts | 8 ++++++++<br>
=C2=A01 file changed, 8 insertions(+)<br>
<br>
diff --git a/arch/arm/boot/dts/aspeed-<wbr>bmc-opp-zaius.dts b/arch/arm/boo=
t/dts/aspeed-<wbr>bmc-opp-zaius.dts<br>
index dfd0dd7c16e4..7ea66de051d4 100644<br>
--- a/arch/arm/boot/dts/aspeed-<wbr>bmc-opp-zaius.dts<br>
+++ b/arch/arm/boot/dts/aspeed-<wbr>bmc-opp-zaius.dts<br>
@@ -86,6 +86,14 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enable-gpios =3D &l=
t;&amp;gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mux-gpios =3D &lt;&=
amp;gpio ASPEED_GPIO(P, 6) GPIO_ACTIVE_HIGH&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0iio-hwmon {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quo=
t;iio-hwmon&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0io-channels =3D &lt=
;&amp;adc 0&gt;, &lt;&amp;adc 1&gt;, &lt;&amp;adc 2&gt;, &lt;&amp;adc 3&gt;=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&lt;&amp;adc 4&gt;, &lt;&amp;adc 5&gt;, &lt;&amp;adc 6&gt;, &lt;&=
amp;adc 7&gt;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&lt;&amp;adc 8&gt;, &lt;&amp;adc 9&gt;, &lt;&amp;adc 10&gt;, &lt;=
&amp;adc 11&gt;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&lt;&amp;adc 12&gt;, &lt;&amp;adc 13&gt;, &lt;&amp;adc 14&gt;, &l=
t;&amp;adc 15&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
=C2=A0};<br>
<br>
=C2=A0&amp;fmc {<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.12.2.564.g063fe858b8-goog<br>
<br>
</font></span></blockquote></div><br></div>

--94eb2c0d4d1ecbf0fb054c0fa41e--
