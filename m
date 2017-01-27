Return-Path: <raltherr@google.com>
Received: from mail-io0-x235.google.com (mail-io0-x235.google.com
 [IPv6:2607:f8b0:4001:c06::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v9FSw3mddzDq60
 for <openbmc@lists.ozlabs.org>; Sat, 28 Jan 2017 10:32:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="q4NCrKTT"; 
 dkim-atps=neutral
Received: by mail-io0-x235.google.com with SMTP id j18so72297886ioe.2
 for <openbmc@lists.ozlabs.org>; Fri, 27 Jan 2017 15:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=+u5kB992pE9Xus7hYdOveQ3uzPUfiry/iJJ+KlZQl78=;
 b=q4NCrKTT7Qr+J+wg+wlA9Tem/6RmwvP1SLfT3nbl9+6xlnVcTpu7dOxMpCRqFRIODa
 KhOTlt/1apOBDO2qWEx4sns6BhCtZyaTqYsEsunssbxCGjB2kNQvfS3dYMgl01Tjg8X9
 sZ3mQA+2Iz7G/VAw4rhrytTqhb/vcmcx+uZ3/9T90sXkw56KY+LrYnJ7DQ3+bncwIgvl
 yTCp3gWlBZFNnTlioS1pap5G2vTZkcjkBmQQzp4JN9VyIi4ybK+5nf7TyxS5HISQvXkD
 cqdKMCxXy44Iou3zrCYRP6MM92JUxGSV3iBH55ME/Zy7bmfjnF/uJVGXEiQMsWdpLNkM
 Ftig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=+u5kB992pE9Xus7hYdOveQ3uzPUfiry/iJJ+KlZQl78=;
 b=t6/hKYZ7NoP52QeXZb3B9i4dYssRjwt1pd1Wu0KxcGUqfZVY1aip3KrHEr0P80txHb
 lHpgTMp3TPPel2ws+kEPdeANi7WowzF0hjfN/RXVHVLUUALyX7yCvjSEmVuiQJK70tBd
 WOeAzjcxiLldLKCj/8Z14WKSg7ak+wmXiwJVq8SFChNEbhnn37wQuoEbo57YX4fHlxFq
 tsL/xvGqV/exhLYnqrOMQjwW143fcn8hRq3utdXxjCjmnz7uz0leqU6+jGOucS6iDr0l
 o3Hw86NAPXF6OKsaDs/OJ1R4wOUjIB0vE0BpIZk+aEB2LgyPMoeF2KhRFHxSe/02BmeG
 intw==
X-Gm-Message-State: AIkVDXJzllgKims5SQBs99wXhzkRtmci/nHTS4ThMpDIOTCIXca8TWVbhe2m7+nA4LQDMW+b9XHJqbgCNvYlID17
X-Received: by 10.107.180.8 with SMTP id d8mr9832613iof.101.1485559965693;
 Fri, 27 Jan 2017 15:32:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.133.226 with HTTP; Fri, 27 Jan 2017 15:32:45 -0800 (PST)
In-Reply-To: <20170127232307.110483-1-xow@google.com>
References: <20170127232307.110483-1-xow@google.com>
From: Rick Altherr <raltherr@google.com>
Date: Fri, 27 Jan 2017 15:32:45 -0800
Message-ID: <CAPLgG==oWWy8pTpLszLOECXK7pQMXW8uE_NgpFz7Awx51q5ohA@mail.gmail.com>
Subject: Re: [PATCH linux v2] arm: aspeed: zaius: Disable LPC reset for UART1
To: Xo Wang <xow@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=94eb2c05a6560c871d05471be2f2
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
X-List-Received-Date: Fri, 27 Jan 2017 23:32:49 -0000

--94eb2c05a6560c871d05471be2f2
Content-Type: text/plain; charset=UTF-8

I still don't follow.  Is this changing it to drop bytes until the host
powers on?  Is this change making it so the device won't open?

On Fri, Jan 27, 2017 at 3:23 PM, Xo Wang <xow@google.com> wrote:

> Currently, UART1 on Zaius BMC is unusable until brought out of reset by
> powering the host on. In this reset state, ttyS0 can still be opened
> and UART1 silently drops bytes, which is not obviously expected
> behavior.
>
> Clear the LPC block control bit that enables LPCRST# as a reset source
> for UART1.
>
> Signed-off-by: Xo Wang <xow@google.com
> ---
>  arch/arm/mach-aspeed/aspeed.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
> index 4bd3680d742d..fa99d8bde5e0 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -185,6 +185,13 @@ static void __init do_zaius_setup(void)
>
>         /* Set SPI1 CE0 decoding window to 0x30000000 */
>         writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30));
> +
> +       /* Disable LPC reset for UART1, otherwise held in reset by LPCRST#,
> +        * silently dropping bytes until released (usually by host power
> on)
> +        * */
> +       reg = readl(AST_IO(AST_BASE_LPC | 0x98));
> +       /* Clear "Enable UART1 reset source from LPC" */
> +       writel(reg & ~BIT(4), AST_IO(AST_BASE_LPC | 0x98));
>  }
>
>  static void __init do_witherspoon_setup(void)
> --
> 2.11.0.483.g087da7b7c-goog
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>

--94eb2c05a6560c871d05471be2f2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I still don&#39;t follow.=C2=A0 Is this changing it to dro=
p bytes until the host powers on?=C2=A0 Is this change making it so the dev=
ice won&#39;t open?</div><div class=3D"gmail_extra"><br><div class=3D"gmail=
_quote">On Fri, Jan 27, 2017 at 3:23 PM, Xo Wang <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:xow@google.com" target=3D"_blank">xow@google.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">Currently, UART1 on Zaius BMC i=
s unusable until brought out of reset by<br>
powering the host on. In this reset state, ttyS0 can still be opened<br>
and UART1 silently drops bytes, which is not obviously expected<br>
behavior.<br>
<br>
Clear the LPC block control bit that enables LPCRST# as a reset source<br>
for UART1.<br>
<br>
Signed-off-by: Xo Wang &lt;<a href=3D"mailto:xow@google.com">xow@google.com=
</a><br>
---<br>
=C2=A0arch/arm/mach-aspeed/aspeed.c | 7 +++++++<br>
=C2=A01 file changed, 7 insertions(+)<br>
<br>
diff --git a/arch/arm/mach-aspeed/aspeed.<wbr>c b/arch/arm/mach-aspeed/aspe=
ed.<wbr>c<br>
index 4bd3680d742d..fa99d8bde5e0 100644<br>
--- a/arch/arm/mach-aspeed/aspeed.<wbr>c<br>
+++ b/arch/arm/mach-aspeed/aspeed.<wbr>c<br>
@@ -185,6 +185,13 @@ static void __init do_zaius_setup(void)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Set SPI1 CE0 decoding window to 0x30000000 *=
/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30))=
;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Disable LPC reset for UART1, otherwise held =
in reset by LPCRST#,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * silently dropping bytes until released (usua=
lly by host power on)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D readl(AST_IO(AST_BASE_LPC | 0x98));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Clear &quot;Enable UART1 reset source from L=
PC&quot; */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(reg &amp; ~BIT(4), AST_IO(AST_BASE_LPC |=
 0x98));<br>
=C2=A0}<br>
<br>
=C2=A0static void __init do_witherspoon_setup(void)<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.11.0.483.g087da7b7c-goog<br>
<br>
______________________________<wbr>_________________<br>
openbmc mailing list<br>
<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br=
>
<a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lists.ozlabs.org/<wbr>listinfo/openbmc</a><br>
</font></span></blockquote></div><br></div>

--94eb2c05a6560c871d05471be2f2--
