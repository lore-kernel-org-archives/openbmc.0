Return-Path: <raltherr@google.com>
Received: from mail-it0-x22c.google.com (mail-it0-x22c.google.com
 [IPv6:2607:f8b0:4001:c0b::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v95gb223rzDq5k
 for <openbmc@lists.ozlabs.org>; Sat, 28 Jan 2017 04:41:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Lkepvr48"; 
 dkim-atps=neutral
Received: by mail-it0-x22c.google.com with SMTP id r185so61178191ita.0
 for <openbmc@lists.ozlabs.org>; Fri, 27 Jan 2017 09:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=1EAQmDQh9ebxOhDVWnSviR7ZyRj8NwnguXTS8pW4QTE=;
 b=Lkepvr48XPLow+qpDfsJL7Lv544BNYa6JY+z6o4MzTjU6GeT5YBTE9UwD1o1r9jOik
 /gVCgFOBSK1UIBdfb49lkc8evwfonc8WlSmwtuyNEA0BfxZ/Oe55ZsOp3U79i76X0dTh
 yZqxYn186wPTXCU6TtCTkhbttzvDQgG03NZAfCJgY/w/h4zQ/hXCNaWJzLUXk+spBCSi
 b6kalSUbUwvHOUQmPxQTzaA1edW/homR0bH1juNSXwZvkNy6uWK3FJljzhhf3LCrLBBb
 7sKCV6LjW90rmy/voo0fVd23T/DzGYJw6Fmx/HcQ/vGEUOGO3SKcwVvGyse/Q0FMk+JP
 L3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=1EAQmDQh9ebxOhDVWnSviR7ZyRj8NwnguXTS8pW4QTE=;
 b=FBPyXn+wMZITDejsDx3no84Fn8KxAnKgTNJcfN79xYUSeGvEfG8wRmlYOh8SxtxXsA
 ZYEkOyWEJz4hqoY+pPBeZu+ExpJm9ZDaeKz9NofEKA5qksKOuPeZfa431ypn2nCh/UPA
 gnwoOnEGc0Vm1g90uaJuXHCHYfSvAgjDM5D2Q6ATxeSXu6NMOsP/MQDAiWo9rE82V3pK
 HxbsVHjx2Abr1YhMqGtQEtucghTseC5cpb3IHCJXwl8gBBdOMPTTM8aFFuBc1BC8iJH3
 30yWig0AGgdg7pbSHpLkazQsAj7GOjXVM85AEImywl8PlylKrgUs8kHpqRb00fkiSBJj
 v2Nw==
X-Gm-Message-State: AIkVDXLH9JHRQZV004mHsBJYrXBYb3vwvoQWn+6FWhBnsdSTIQ+N6gtFV8+i8lO4YBb3Eezl8kojvGf7qqw0mCR1
X-Received: by 10.36.224.140 with SMTP id c134mr3948303ith.105.1485538888287; 
 Fri, 27 Jan 2017 09:41:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.133.226 with HTTP; Fri, 27 Jan 2017 09:41:27 -0800 (PST)
In-Reply-To: <20170127170814.120771-1-xow@google.com>
References: <20170127170814.120771-1-xow@google.com>
From: Rick Altherr <raltherr@google.com>
Date: Fri, 27 Jan 2017 09:41:27 -0800
Message-ID: <CAPLgG==T01hpZd8pn7YyK2cEx-FBqHXGKK8LR07B2Jfq00retA@mail.gmail.com>
Subject: Re: [PATCH linux] arm: aspeed: zaius: Disable LPC reset for UART1
To: Xo Wang <xow@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=94eb2c19e204bd1305054716f9bc
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
X-List-Received-Date: Fri, 27 Jan 2017 17:41:32 -0000

--94eb2c19e204bd1305054716f9bc
Content-Type: text/plain; charset=UTF-8

From the patch, I can't tell what your change is doing.  You've described
the problem but not the solution.

On Fri, Jan 27, 2017 at 9:08 AM, Xo Wang <xow@google.com> wrote:

> Currently, UART1 on Zaius BMC is unusable until brought out of reset by
> powering the host on. In this reset state, ttyS0 can still be opened
> and UART1 silently drops bytes, which is not obviously expected
> behavior.
>
> Signed-off-by: Xo Wang <xow@google.com
> ---
>  arch/arm/mach-aspeed/aspeed.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
> index 4bd3680d742d..9f06191f1630 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -185,6 +185,10 @@ static void __init do_zaius_setup(void)
>
>         /* Set SPI1 CE0 decoding window to 0x30000000 */
>         writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30));
> +
> +       /* Disable LPC reset for UART1 */
> +       reg = readl(AST_IO(AST_BASE_LPC | 0x98));
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

--94eb2c19e204bd1305054716f9bc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">From the patch, I can&#39;t tell what your change is doing=
.=C2=A0 You&#39;ve described the problem but not the solution.</div><div cl=
ass=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Jan 27, 2017 at =
9:08 AM, Xo Wang <span dir=3D"ltr">&lt;<a href=3D"mailto:xow@google.com" ta=
rget=3D"_blank">xow@google.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Currently, UART1 on Zaius BMC is unusable until brought out o=
f reset by<br>
powering the host on. In this reset state, ttyS0 can still be opened<br>
and UART1 silently drops bytes, which is not obviously expected<br>
behavior.<br>
<br>
Signed-off-by: Xo Wang &lt;<a href=3D"mailto:xow@google.com">xow@google.com=
</a><br>
---<br>
=C2=A0arch/arm/mach-aspeed/aspeed.c | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/arch/arm/mach-aspeed/aspeed.<wbr>c b/arch/arm/mach-aspeed/aspe=
ed.<wbr>c<br>
index 4bd3680d742d..9f06191f1630 100644<br>
--- a/arch/arm/mach-aspeed/aspeed.<wbr>c<br>
+++ b/arch/arm/mach-aspeed/aspeed.<wbr>c<br>
@@ -185,6 +185,10 @@ static void __init do_zaius_setup(void)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Set SPI1 CE0 decoding window to 0x30000000 *=
/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30))=
;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Disable LPC reset for UART1 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D readl(AST_IO(AST_BASE_LPC | 0x98));<br>
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

--94eb2c19e204bd1305054716f9bc--
