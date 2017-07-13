Return-Path: <raltherr@google.com>
Received: from mail-wm0-x229.google.com (mail-wm0-x229.google.com
 [IPv6:2a00:1450:400c:c09::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x7l086J5MzDqkY
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jul 2017 04:36:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Wu0+R3wE"; 
 dkim-atps=neutral
Received: by mail-wm0-x229.google.com with SMTP id 62so938020wmw.1
 for <openbmc@lists.ozlabs.org>; Thu, 13 Jul 2017 11:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=2P/eaUbXavrbZ17aUpJ24btcWvlFSRp3skFg5kcgxbM=;
 b=Wu0+R3wEHrushMr9m6zeiTa+rYZa682T30AJLZD3Bj7n1EQqohh7oaeGnL1qG5suvP
 +bw3UimSKdwA8UcL2J0za54oOps5BiarHH9XNP1TPxBcwLJsQBJ0NsoI4rwTdu/lqzRy
 +nh/ism7fu8K748tneBopVAu2f0PAsZWRCJf2iFt7pi9sw5gINaVamq6y3osZ9edT2wN
 bz4z3YhQ/6hT0sjvOqtDOBt8Xw8t+MrpZ+uY6gJduCNWCed9bcFVMrRrpMSBQz/tbRZI
 fjMicEppHrgFMSNMkl8tQTFUpAaOFiSZUKVQUdTH8+tjO0KLUGGwl4zCRFY4TLAdtH0x
 lK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=2P/eaUbXavrbZ17aUpJ24btcWvlFSRp3skFg5kcgxbM=;
 b=Wny/slvjA1+xlz8HX/j9mM1TgGK24h4wban0MaQkOZ643/pbPWLzAUcuOr7BNtYhb7
 zxyTTt7XKq777us9EY9GmS2eCOJLkaEe1i8sGer1OltMzxldGTwblnd0Hf6GMAmt7/gN
 Jvd2yN1iDdyaB9QKJRGHh9OSuuCyQ6qn4pqD6/waq3/CR+vcJjhqwHLUUgeMDkgz9BP7
 NDqAE0mrnU5HPP8Pubkm+oujHFuGyols7azxoHDUHaTHLSAAZBD6QGP+68pgmxqn41iA
 SyYK024vMThKaFcH43O7UK8Zp7+MPP8U+BbDj/2eoOWXtfzGWf6WBYTCUO8lujUuCvJZ
 mIuQ==
X-Gm-Message-State: AIVw112J6vj/fIaVCkfR0LQYJioiH5elrMGx5ZHSseRENCQxcx8ma9YQ
 Hvb+0P0dW+DYanCr+ADmxkI4cEWV0NzCEuM=
X-Received: by 10.28.109.26 with SMTP id i26mr116781wmc.64.1499970997406; Thu,
 13 Jul 2017 11:36:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.153.69 with HTTP; Thu, 13 Jul 2017 11:36:36 -0700 (PDT)
In-Reply-To: <20170713141537.4759-1-c_mykolak@mellanox.com>
References: <20170713141537.4759-1-c_mykolak@mellanox.com>
From: Rick Altherr <raltherr@google.com>
Date: Thu, 13 Jul 2017 11:36:36 -0700
Message-ID: <CAPLgG=nt=tJC-jWQdW_jf9T0=sqERo97u3uOEr=1mm1WZgn0KQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2] msn: add adc to msn dts.
To: Mykola Kostenok <c_mykolak@mellanox.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vadim Pasternak <vadimp@mellanox.com>, Ohad Oz <ohado@mellanox.com>
Content-Type: multipart/alternative; boundary="001a1146778679e3a9055437367e"
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
X-List-Received-Date: Thu, 13 Jul 2017 18:36:41 -0000

--001a1146778679e3a9055437367e
Content-Type: text/plain; charset="UTF-8"

This isn't necessary as the default set in aspeed-g5.dtsi is enabled.
You'll probably want the iio-hwmon bridge though.

On Thu, Jul 13, 2017 at 7:15 AM, Mykola Kostenok <c_mykolak@mellanox.com>
wrote:

> Add adc to Mellanox msn dts.
>
> v1 -> v2:
>  Pointed by Rick Altherr:
>  - Remove unsupported fileds. Make adc node match bindings.
>
> Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> index 0774959..17ad2d3 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> @@ -139,3 +139,6 @@
>         status = "okay";
>  };
>
> +&adc {
> +       status = "okay";
> +};
> --
> 2.8.4
>
>

--001a1146778679e3a9055437367e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This isn&#39;t necessary as the default set in aspeed-g5.d=
tsi is enabled.=C2=A0 You&#39;ll probably want the iio-hwmon bridge though.=
</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Jul=
 13, 2017 at 7:15 AM, Mykola Kostenok <span dir=3D"ltr">&lt;<a href=3D"mail=
to:c_mykolak@mellanox.com" target=3D"_blank">c_mykolak@mellanox.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">Add adc to Mellanox msn dt=
s.<br>
<br>
v1 -&gt; v2:<br>
=C2=A0Pointed by Rick Altherr:<br>
=C2=A0- Remove unsupported fileds. Make adc node match bindings.<br>
<br>
Signed-off-by: Mykola Kostenok &lt;<a href=3D"mailto:c_mykolak@mellanox.com=
">c_mykolak@mellanox.com</a>&gt;<br>
---<br>
=C2=A0arch/arm/boot/dts/aspeed-bmc-<wbr>mellanox-msn.dts | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/arch/arm/boot/dts/aspeed-<wbr>bmc-mellanox-msn.dts b/arch/arm/=
boot/dts/aspeed-<wbr>bmc-mellanox-msn.dts<br>
index 0774959..17ad2d3 100644<br>
--- a/arch/arm/boot/dts/aspeed-<wbr>bmc-mellanox-msn.dts<br>
+++ b/arch/arm/boot/dts/aspeed-<wbr>bmc-mellanox-msn.dts<br>
@@ -139,3 +139,6 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
=C2=A0};<br>
<br>
+&amp;adc {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+};<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.8.4<br>
<br>
</font></span></blockquote></div><br></div>

--001a1146778679e3a9055437367e--
