Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qyn9Z2s48zDqC8
 for <openbmc@lists.ozlabs.org>; Mon,  2 May 2016 11:42:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=cd003pkb; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=CTmj5L9S; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id f63so25910566oig.0
 for <openbmc@lists.ozlabs.org>; Sun, 01 May 2016 18:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=vhfoJMfJtJ49NSs5/fHWt38a+HdiWTb25uc5VoI2gk4=;
 b=cd003pkbsQuxO2f1LjmiHADcmMtFOnh7hmXSSKQtItWQvAYdCPMGeKGygLT7FK3BqH
 66tFImx1ek5Ll3CdQM+UIXo8/wW2mzilkmq13gw2ZzSjyQVq7txGyeK57/EB421gHqoc
 PhkJTzJGBoMs8Z9PuSOVA6JbnTGc/fCE9+Lvc+ApCgZt9CHYFCThmcVKrMa9uI79Ih7Q
 bzdOu/PK1yTpxyO+RH68R8w1SYisffnYH10BxybBd88ibR1ShCeyZeOideZ/CzRWEyr2
 +81dxeaL7z6IDIRygu67kx9e690M0yRgo2ymGmLyYMq3URV0oUnUCrdCveF9v1kAMB6f
 wklg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=vhfoJMfJtJ49NSs5/fHWt38a+HdiWTb25uc5VoI2gk4=;
 b=CTmj5L9SUU0heYny3GrV8lbnEVYwD2zBkFkdThewyV+wUk37V6cbXbF924iqNlxu1C
 ilsXR9C01THZNC57tzAOC0WbHfYOonSFiaTZJiPBl2VwKYiG/qWTFIz07523FsZPbb8q
 61ZaIYSXiBSl+XAVPZjBy+9L6rfQXcgmBhG/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=vhfoJMfJtJ49NSs5/fHWt38a+HdiWTb25uc5VoI2gk4=;
 b=JXnOAS6qeLRnxvaMRJeFuTZwkEvnGh2L0dzfd0P+7mPhwgo3DsBo2MOr0NUwTiIlcH
 TpPVZJJaY2YGHDB0W1E2dI6+fRt9XL23PJXUi4RoRiamJQTtZXCTff+ddl+GholZpqMn
 PcphwP82o8OlOmtZ811BvQm2Jh9tXB8/rRX/X21n3TDXyEXS8dN/u3yltADFmZzmvFv2
 6F9390zdUE5OzdbCwhjQtOyGtF7ol3m4GRY4WD0R/aXDF8t0LFLUHh6dfBWStCWxU1FC
 kGiGfHDvvJUi2R1AhViMGeN/p2OrqccmxxaNKjbMb4HCrMxEfdJSVMJeUrtxkjjX/Yf4
 QieQ==
X-Gm-Message-State: AOPr4FX0C3PeICLJn3R5vL2TxCykMuRxSaGd099L4k4WF7wv9Ca0NyiRVYUhFxRNgo0UyruqdyBk2+qvnmsV7w==
X-Received: by 10.202.199.71 with SMTP id x68mr12174062oif.150.1462153343412; 
 Sun, 01 May 2016 18:42:23 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.79.200 with HTTP; Sun, 1 May 2016 18:42:03 -0700 (PDT)
In-Reply-To: <1461908454-24209-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1461908454-24209-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1461908454-24209-2-git-send-email-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 2 May 2016 11:12:03 +0930
X-Google-Sender-Auth: rX0GadqCoJndVAVycUueZmacAa4
Message-ID: <CACPK8XdBaCC5npZ8UvfxEaeLuDL72n3p98-sx_XnpwbaRqYuHQ@mail.gmail.com>
Subject: Re: [PATCH linux] Add debounce for power button, pull down gpioQ7 to
 unlock identify LED
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ken <ken.sk.lai@mail.foxconn.com>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 02 May 2016 01:42:28 -0000

Hello Ken,

On Fri, Apr 29, 2016 at 3:10 PM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Ken <ken.sk.lai@mail.foxconn.com>
>

We need to include a description of why this change is being made.
What does it fix? Why does the previous behaviour need to be modified?

> ---
>  arch/arm/mach-aspeed/aspeed.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>  mode change 100644 => 100755 arch/arm/mach-aspeed/aspeed.c
>
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
> old mode 100644
> new mode 100755
> index 594a781..fa5d467
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -138,9 +138,10 @@ static void __init do_barreleye_setup(void)
>         /* GPIO setup */
>         writel(0x9E82FCE7, AST_IO(AST_BASE_GPIO | 0x00));
>         writel(0x0370E677, AST_IO(AST_BASE_GPIO | 0x04));
> -
> +       writel(0x00001080, AST_IO(AST_BASE_GPIO | 0x84));

We have a GPIO driver that handles setting this register.

>         /* SCU setup */
>         writel(0x01C00000, AST_IO(AST_BASE_SCU | 0x88));
> +       writel(0x010FFFFF, AST_IO(AST_BASE_SCU | 0xA8));

Can you explain each of these you're setting each of these bits?

>         /*
>          * Do read/modify/write on power gpio to prevent resetting power on
> @@ -150,7 +151,10 @@ static void __init do_barreleye_setup(void)
>         reg |= 0xCFC8F7FD;
>         writel(reg, AST_IO(AST_BASE_GPIO | 0x20));
>         writel(0xC738F20A, AST_IO(AST_BASE_GPIO | 0x24));
> -       writel(0x0031FFAF, AST_IO(AST_BASE_GPIO | 0x80));
> +       writel(0x0031FF2F, AST_IO(AST_BASE_GPIO | 0x80));
> +       writel(0x00000001, AST_IO(AST_BASE_GPIO | 0x48));
> +       writel(0x00000001, AST_IO(AST_BASE_GPIO | 0x4C));
> +       writel(0x00075300, AST_IO(AST_BASE_GPIO | 0x58));

As above; we have a GPIO driver that handles setting this register.
Changing these states needs to be done from userspace. See
https://github.com/openbmc/skeleton/blob/master/bin/Barreleye.py#L531
