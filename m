Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x244.google.com (mail-yb0-x244.google.com
 [IPv6:2607:f8b0:4002:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wrd2D5v8JzDqgs
 for <openbmc@lists.ozlabs.org>; Mon, 19 Jun 2017 14:16:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nKaFWMuO"; 
 dkim-atps=neutral
Received: by mail-yb0-x244.google.com with SMTP id j65so4162940ybj.3
 for <openbmc@lists.ozlabs.org>; Sun, 18 Jun 2017 21:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=dshGD5aB1H9hVNon4Uw3bejyTT0b1MMEa5+i8/sowLQ=;
 b=nKaFWMuO+n0rsSifiYkvKojQoQEiRVXPXrJHLLfJPME37cfwMDOWyEoOFYeALAou0i
 QZsSdmCCw2h64vWlonZTqzwnbWQzTnZtULd5/OzwIIG0Oq36pSFbfpHmsAAWsQjNNroc
 0ZYpiK9Nqm8Hk5C/tRcbv25eG+MmhPKeBWJLdvqpHRfKrKRbmEQIzSYx5pIIiMROEY2F
 nQdC/6R/NdcKNEP5jdnaXB1/FmlP9UMU2dVttqKk85niuaX4lNjEG2atYwczEf/G5Ius
 fReveK53NK8iuGKEhfOdFPUy9sqfmwEWS/GJSLLv9baPvpNfBkn4hDWfLnRYB5TNX+7+
 EuFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=dshGD5aB1H9hVNon4Uw3bejyTT0b1MMEa5+i8/sowLQ=;
 b=GRJtG2X+EqLwruhncKs82sXG6RycYukRbEdcVPdBmSgWLmUW+y1rTw0lcrC6HUj15x
 hYl7cP1M0cfaQ19KH880LNNZV7r0j0lUqd5ulWnl6hKChX+B9ViVN0Y4uOxSCrlGxkdF
 eKxAsVlQ/M7pbaOKzswNqXCCBKxGGBlUlUejgl9wjntSRTOJZHjYDGyycdxhdkd6Cu0b
 n3Qo2AfJbjCAihMVpuB++DP1hgMW364wc6NW6xVoBK+qhle0ArYqFZ1tZRySxOoLZFj8
 xt4Hr8BhRkBFn6E+++byccClcbpTfL4FKhJOkYdThqY5ds2KF6ZmkW6wDQoIxcaRGMF2
 3stw==
X-Gm-Message-State: AKS2vOz/wq3nDfAR3GvLkfBC7GwI38m7cJ7VFdWGDwTV0JSKl8Ob7Z5W
 7At2hLxPizMkb871qNtx0P1l1I2bwZTq
X-Received: by 10.37.11.68 with SMTP id 65mr11883062ybl.94.1497845762321; Sun,
 18 Jun 2017 21:16:02 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.174.2 with HTTP; Sun, 18 Jun 2017 21:15:41 -0700 (PDT)
In-Reply-To: <20170616204330.25401-1-mspinler@linux.vnet.ibm.com>
References: <20170616204330.25401-1-mspinler@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 19 Jun 2017 13:45:41 +0930
X-Google-Sender-Auth: D4X0W7zgUGN5ek6STBBjBwmnddc
Message-ID: <CACPK8XdADqAsv9xPDJcb+NE7pa3q1JbzMiZZCWjOaRMHcbs98A@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: witherspoon: enable wdt2
To: Matt Spinler <mspinler@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Matt Spinler <spinler@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 19 Jun 2017 04:16:06 -0000

On Sat, Jun 17, 2017 at 6:13 AM, Matt Spinler
<mspinler@linux.vnet.ibm.com> wrote:
> From: Matt Spinler <spinler@us.ibm.com>
>
> WDT1 is used for a fan watchdog, so enable WDT2
> for use by others.
>

Thanks Matt. I like this idea so much that I've gone and created a
patch to do it for all platforms.

This is so we can update to the latest u-boot build which enables WDT2
by default.

Cheers,

Joel


> Signed-off-by: Matt Spinler <spinler@us.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 99003b9fb54b..d1c455606a32 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -84,6 +84,10 @@
>
>  #include "ibm-power9-cfam.dtsi"
>
> +&wdt2 {
> +    status = "okay";
> +};
> +
>  &fmc {
>         status = "okay";
>         flash@0 {
> --
> 2.13.0
>
