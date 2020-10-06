Return-Path: <SRS0=c1sS=DN=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69C90C4363D
	for <openbmc@archiver.kernel.org>; Tue,  6 Oct 2020 03:52:47 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16824208A9
	for <openbmc@archiver.kernel.org>; Tue,  6 Oct 2020 03:52:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="i6gFPjcs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16824208A9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C53T74yzqzDqHf
	for <openbmc@archiver.kernel.org>; Tue,  6 Oct 2020 14:52:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::841;
 helo=mail-qt1-x841.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=i6gFPjcs; dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C53Rn4CXSzDqHK
 for <openbmc@lists.ozlabs.org>; Tue,  6 Oct 2020 14:51:30 +1100 (AEDT)
Received: by mail-qt1-x841.google.com with SMTP id m9so11295652qth.7
 for <openbmc@lists.ozlabs.org>; Mon, 05 Oct 2020 20:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vVPvRXE5CRLSWV7myUGVbbxhTr2X6WdeR4tA6o158vw=;
 b=i6gFPjcsL5M4sVABliWh6WwwX3ZVyiBxmXXcTMGJsp/cCdQ4cU3UERxIgSvXS0NJrG
 JLYq3izNE8BNF3bH1xjmNIJ0PoWmVh1vDgeT0O0ppQ525xhPlJDPkoCZ6OJ9hiOmq6SM
 ypqedUYQ4PMYQ5HbSmyqSIi1NB4Un88K075/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vVPvRXE5CRLSWV7myUGVbbxhTr2X6WdeR4tA6o158vw=;
 b=plMaS2YJpRSggQnwpmQ69QJSHRMcu7G9A69PYtUVKZUvsmLhP7voWLelqmvRp7BrVI
 SJtSeJI67Dhv5m+V7OzL0dnSxeopm3jpOtOETZ1/bfNdyShRiDwVZ7FgDg3+jEtr/Xxb
 lQ84VFeqqqb/xdkDzh1Ihw6LEWP6cw1AEgs3X/YodFoegTcEqinzMF4IZNxl7/KOh07e
 mtnM+YiZTmWqy0aqyw5l+biafzLvaLqBdnOjZjD8NJ5XaEjAjj6Zea6sSnNuQ2M6RbD5
 /klpRMJlGKkRSC9QCongLcW8vcfRVZe3SzxYd9PBmaUO9hytYCuHCaGovLrr/j/Nwndn
 Fvrw==
X-Gm-Message-State: AOAM530RjJq/AsbD8g9GEsjrCJhkdDHS6+8VgsUH2se8E52jTo50xPJA
 XVvYkiPoymiMHH4H7NN//MNnfQIDj6MimBp+T2Pt4Wg2
X-Google-Smtp-Source: ABdhPJxtsU0LZPcFpk+UiPMzNC2Aw8cv1rbOadxD4oRLMokKVmnp8yNebWUmrPvGsnlZEaPNiuAZ+3iQHI2U2ujHjss=
X-Received: by 2002:ac8:2612:: with SMTP id u18mr3409038qtu.363.1601956286077; 
 Mon, 05 Oct 2020 20:51:26 -0700 (PDT)
MIME-Version: 1.0
References: <20201002063414.275161-1-andrew@aj.id.au>
 <20201002063414.275161-3-andrew@aj.id.au>
In-Reply-To: <20201002063414.275161-3-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 6 Oct 2020 03:51:12 +0000
Message-ID: <CACPK8XfwMsxfJ01FbLDugJpKMHbeH7TZjc+Tb4eStYSH4qKrng@mail.gmail.com>
Subject: Re: [PATCH 2/3] ARM: config: Enable PSTORE in aspeed_g5_defconfig
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Fri, 2 Oct 2020 at 06:35, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> We're making use of it on IBM's Rainier system.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/configs/aspeed_g5_defconfig | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
> index 2bacd8c90f4b..c52db992b84e 100644
> --- a/arch/arm/configs/aspeed_g5_defconfig
> +++ b/arch/arm/configs/aspeed_g5_defconfig
> @@ -274,6 +274,10 @@ CONFIG_UBIFS_FS=y
>  CONFIG_SQUASHFS=y
>  CONFIG_SQUASHFS_XZ=y
>  CONFIG_SQUASHFS_ZSTD=y
> +CONFIG_PSTORE=y
> +CONFIG_PSTORE_CONSOLE=y
> +CONFIG_PSTORE_PMSG=y
> +CONFIG_PSTORE_RAM=y
>  # CONFIG_NETWORK_FILESYSTEMS is not set
>  CONFIG_HARDENED_USERCOPY=y
>  CONFIG_FORTIFY_SOURCE=y
> --
> 2.25.1
>
