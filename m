Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::241; helo=mail-qt0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="TbRlSYw9"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="Vj0eJCKb"; 
 dkim-atps=neutral
Received: from mail-qt0-x241.google.com (mail-qt0-x241.google.com
 [IPv6:2607:f8b0:400d:c0d::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40fgdl5PWKzF1QD
 for <openbmc@lists.ozlabs.org>; Mon,  7 May 2018 21:39:55 +1000 (AEST)
Received: by mail-qt0-x241.google.com with SMTP id g13-v6so35708360qth.8
 for <openbmc@lists.ozlabs.org>; Mon, 07 May 2018 04:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Q/lNPp3VEMEPAyxHojZE0wNeS/dwZ8evgras63kriwI=;
 b=TbRlSYw95gYdQ63HzrhLzAjcMT+QOUQrCuG3XYpfp6PnzH3Gvvxn8lOoJj6NFh1TSn
 4EK2wUDWY7/hQAA721drmY5NFAf/rfn6lMJTVzJZH8AIjrwW7GUvxuMARnxF22mNQOxI
 /BtwBCJy1mGWe8QMRY69VhvrwqAUZVVxRAf5StIL7uFzJdmGP/7D3kO4EW//TOdn6hu4
 3UsEbafljkErPAeTA5UHPdO4YGCU8Ep3VQq9d1YpGqHkXvSVkoL3ATE9f27YTuOidEbW
 2Up+ixX5Jwo+O/8LE/H53Qcxmmo8s4mLQ34qZayK+78fmIkSA43BKO9MYyq+rpL7g/Sk
 C8CA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Q/lNPp3VEMEPAyxHojZE0wNeS/dwZ8evgras63kriwI=;
 b=Vj0eJCKbcdicKqEuVzM1oRWlD0Ry0os93mTLrVI35auVoj2A/1q9VWXzQoKu4H+nyV
 7Z3f/91pQssjOmbIyZqftXK9l3uVX5lMvwQyIqYLtlADV+xYgXscvtApXqGFoiD0cRhG
 hIrx1G/CtQFJVm8WuzPWk4YUWdL9ScHyWqIAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Q/lNPp3VEMEPAyxHojZE0wNeS/dwZ8evgras63kriwI=;
 b=VIPNEMLYUhQEsJcZou/pXo6JrD2sByKAIF+OOD1bMRCapaAInXOrNR+r/jnbmYoJnD
 vPkqJOscli0Zn/FRsi7hvks/GWbiPMrVApCVPSF3S14bNnOQQP+ngIsKHm1Zy0H0VnJy
 bVLvDJkPTgKIqCKBQ9E2fG8OIJNq/qGqDbX9vuNR385II/clxHWt+pUOyBpRY29KSutE
 qr5LE2CGkDXEDQXS5v9cmi8EO1S9KDCsnZsptZjrM/jyCHfbQBBzWubfINbOEWVMjCQI
 k3EmTKkv2tNx4gW+5Rp7ZEOlPKSjShpV9wPBKnwcX3rvfeRCqkMLrfbvafTfzrK7FShr
 41vA==
X-Gm-Message-State: ALQs6tCIgks3MvMnzSwsVcdsD8vkWtEu/BON/c7cZSC/PB84OA2gA3ZW
 ZuqU66lOjtRIvW8zIzLaS7BLQU9VKNfYaZL+C64=
X-Google-Smtp-Source: AB8JxZrK5bls28opMF1FbuadcjQlGQUiZQ3cWhjl0IVA3fhny6nkz81TCJjkYud6IskyoAM1F5qtd++E+89vjtTf2ac=
X-Received: by 2002:ac8:1a02:: with SMTP id
 v2-v6mr34028299qtj.342.1525693191330; 
 Mon, 07 May 2018 04:39:51 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.24.79 with HTTP; Mon, 7 May 2018 04:39:30 -0700 (PDT)
In-Reply-To: <1525361013-19896-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1525361013-19896-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 7 May 2018 21:09:30 +0930
X-Google-Sender-Auth: NCZCAgzmjzUbBFTJN1l1XamKV3w
Message-ID: <CACPK8XdpeawrSMH_msZWPuNkwTPaYrLKwsKJBMgE=3Y5qsJZsA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13] ARM: configs: aspeed: Add watchdog sysfs
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 07 May 2018 11:39:58 -0000

Hi Eddie,

On 4 May 2018 at 00:53, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> This kernel config adds sysfs entries for watchdog devices. This is
> needed in order to access the bootstatus sysfs file that will indicate
> whether or not the BMC has tripped the watchdog and subsequently
> switched sides.
>
> Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
> ---
>  arch/arm/configs/aspeed_g4_defconfig | 1 +
>  arch/arm/configs/aspeed_g5_defconfig | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/arm/configs/aspeed_g4_defconfig b/arch/arm/configs/aspeed_g4_defconfig
> index 74d9343..ed1c470 100644
> --- a/arch/arm/configs/aspeed_g4_defconfig
> +++ b/arch/arm/configs/aspeed_g4_defconfig
> @@ -219,6 +219,7 @@ CONFIG_SCHED_STACK_END_CHECK=y
>  CONFIG_FUNCTION_TRACER=y
>  # CONFIG_TRACING_EVENTS_GPIO is not set
>  CONFIG_DEBUG_USER=y
> +CONFIG_WATCHDOG_SYSFS=y
>  # CONFIG_CRYPTO_ECHAINIV is not set
>  # CONFIG_CRYPTO_HW is not set
>  # CONFIG_XZ_DEC_X86 is not set
> diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
> index 538e30b..66450bd 100644
> --- a/arch/arm/configs/aspeed_g5_defconfig
> +++ b/arch/arm/configs/aspeed_g5_defconfig
> @@ -222,6 +222,7 @@ CONFIG_SCHED_STACK_END_CHECK=y
>  CONFIG_FUNCTION_TRACER=y
>  # CONFIG_TRACING_EVENTS_GPIO is not set
>  CONFIG_DEBUG_USER=y
> +CONFIG_WATCHDOG_SYSFS=y

When you update a defconfig you must follow these steps:

make aspeed_g5_defconfig

enable the options you require

make savedefconig
cp aspeed_g5_defconfig arc/arm/boot/config/

And create your commit based on that.

I have done this for you in this case and applied the result to dev-4.13.

Cheers,

Joel
