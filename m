Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9E0611A01D8
 for <openbmc@lists.ozlabs.org>; Sat, 30 Jan 2016 13:23:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=dbQzyhEI; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=TYQuM+1Z; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id r14so3301426oie.2
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 18:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=9ip2nJI4QMUYvLwf71EUL0LZwzqWgzGpYr2leC34+q8=;
 b=dbQzyhEIPMlre/LBjP3yRNdxOnAtEsI1hjL82lhk10DKNTGk/tBGiKr58V1tALNku2
 FOyLfQ/i5p+me+/HQ26Wb/6cqhn/1abndzdj4+wTL/gBtaRvIV2FQBye+ZyB4PtuCyuc
 MzaVkNhfPUx+IrcjQ7knap1hbOt5t6msp1nJqfLwCOARhz84iYAHa7u8hmukf3t9qoEJ
 IAOLI6r5bhode2aqYIjANXq3Mbvzk8YQSsMO1IOr8S72pdotfoexJQ1q7YY/pK2GelVj
 Es6rImT0FxqPvqnJqhKmoM99HF/yIAjE7bmdRs5F2T9smx7fGdhloanFK2qc6rDjB5ai
 4KhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=9ip2nJI4QMUYvLwf71EUL0LZwzqWgzGpYr2leC34+q8=;
 b=TYQuM+1Zuxx6U+wJGLUgse0fahlpJ4IabLcLTEi+wOHRBKeBdX9/VY5DiAtbTAQN9A
 vCKhGjqSoASFkRX8pnhyzRlYmDWLiYqSLW+c/YlRTDK7nLlrQuuHQGm2Oabsy5maAVsF
 yYKdM1qn3eQbGyAoW6pb+za15fQiR5hArlVOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-type;
 bh=9ip2nJI4QMUYvLwf71EUL0LZwzqWgzGpYr2leC34+q8=;
 b=S0rNUhZyCrYKsbRG8skqwIrAofQ57KHNO0fp6o3aaktfFStrhHNEbmgqgky+Upq0CT
 0hn1bhnYsJsAV9eJgBf9eIHB3iDo05NedsI9dmNpfffwFfRF9H+MVNzWoxur7mN9JbLo
 wKbxSL/F+nLwt8NLw2TU+NSu82E/JAOtHzZK2w8/qcZH+myugY2JHgpceBQtvlzye+TN
 c4VHvjTqx1lfuyyfolcSsDJfRO+bCg8p/kHa9A6x2fdNc2akYMoBlStGqubuA+HD1aSa
 htubA2m5obdxELvD84ACywiJVExWCEM0FEKWhrzefhdveMm67E4hPMu5nLCdc+HW4vOr
 MzOg==
X-Gm-Message-State: AG10YORN4Cz09crYsfC3gqraL4SgMOhztca6Bsx/8mvTUnZujVOj00hPe0lERj5FTWehSyEfRa4F7t0ii2XgyA==
X-Received: by 10.202.83.146 with SMTP id h140mr2239722oib.127.1454120616443; 
 Fri, 29 Jan 2016 18:23:36 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.121.1 with HTTP; Fri, 29 Jan 2016 18:23:17 -0800 (PST)
In-Reply-To: <1454043348-11432-2-git-send-email-jk@ozlabs.org>
References: <1454043348-11432-1-git-send-email-jk@ozlabs.org>
 <1454043348-11432-2-git-send-email-jk@ozlabs.org>
From: Joel Stanley <joel@jms.id.au>
Date: Sat, 30 Jan 2016 12:53:17 +1030
X-Google-Sender-Auth: kNpzvrTnh1l3zm2DKNkiNx1MYz8
Message-ID: <CACPK8XeZKa+_phqQ1MSM4m=P-98XxSwcy3wcpZ+bDVmY5L5mYQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm/aspeed: Enable VUART driver
To: Jeremy Kerr <jk@ozlabs.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Sat, 30 Jan 2016 02:23:39 -0000

On Fri, Jan 29, 2016 at 3:25 PM, Jeremy Kerr <jk@ozlabs.org> wrote:
> This change makes use of the new VUART device driver. We need a separate
> compatible property for the VUART node, and a fix for the interrupt
> definitions. We also change the SCU setup to notify host firmware that the
> VUART is available.
>
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> ---
>  arch/arm/boot/dts/ast2400.dtsi    | 7 ++++---
>  arch/arm/configs/aspeed_defconfig | 3 +++
>  arch/arm/mach-aspeed/aspeed.c     | 2 +-
>  3 files changed, 8 insertions(+), 4 deletions(-)
>

> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
> index cdab46b..2feb161 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -123,7 +123,7 @@ static void __init do_common_setup(void)
>
>         /* Setup scratch registers */
>         writel(0x00000042, AST_IO(AST_BASE_LPC | 0x170));
> -       writel(0x00004000, AST_IO(AST_BASE_LPC | 0x174));
> +       writel(0x00008000, AST_IO(AST_BASE_LPC | 0x174));

Perhaps a comment here to indicate what the values in the register indicate.

Where do we define what the scratch registers mean?

>  }
>
>  static void __init do_barreleye_setup(void)
