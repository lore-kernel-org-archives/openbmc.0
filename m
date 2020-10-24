Return-Path: <SRS0=Fry3=D7=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E9D0C55178
	for <openbmc@archiver.kernel.org>; Sat, 24 Oct 2020 09:23:37 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C19EA2225F
	for <openbmc@archiver.kernel.org>; Sat, 24 Oct 2020 09:23:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="KqWlI/1c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C19EA2225F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=bytedance.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CJFyZ2cdnzDqxb
	for <openbmc@archiver.kernel.org>; Sat, 24 Oct 2020 20:23:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::c44;
 helo=mail-oo1-xc44.google.com; envelope-from=wangzhiqiang.bj@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=KqWlI/1c; dkim-atps=neutral
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CJFx42xVXzDqwP
 for <openbmc@lists.ozlabs.org>; Sat, 24 Oct 2020 20:22:11 +1100 (AEDT)
Received: by mail-oo1-xc44.google.com with SMTP id c25so1187806ooe.13
 for <openbmc@lists.ozlabs.org>; Sat, 24 Oct 2020 02:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5hGDeyu2JKNoOb3EJ0Ovni5Gl9hOI3by5lVnF3WgR3A=;
 b=KqWlI/1cGRQIpGuZGiwP0EosZRZp/48bHztPuaY9LQE04QavL+tx8NSJEXZS7goH7r
 wrp2XF7KMOPgYML4vPQNXNBN+MWXD/lrWaHxNK2KKtIFPNWYxZvifE++OJec+fu8UDJK
 TpbgHca89wacAImGO/gbd+Y1ItDeSWsqfsoQfGi/vlG2VL+v0Cyz0+lo5pxh8XEPets5
 SAhCh0R7WYXgNonAleRi5Rp192oUDk+Ydssa+478c8vfghTLjWB0ytAKNQsp2Izs27mK
 K/F7k2O4L6H3/36fZiVRZiSu6sSn1k8VKUBGGi8TCSBhfRH3F9uBBm2/mSO90/SoIbb+
 tLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5hGDeyu2JKNoOb3EJ0Ovni5Gl9hOI3by5lVnF3WgR3A=;
 b=dpHE9F8mTRwApBTiT91rH+kBACuFLFYnKjpW5arxPWwnoauo9ws8EuKiWoj0ilmqpq
 BDHyAVQvIzhWZ/1pk2fL4hRMsUEe2SERJhm940C1T7WWe03TueUYhVe5SBhcaAv83Dws
 gM4uuar25LdhzxiLZqsUeW5mMuyWiJG1W3Kc9w9s2oJSb7XBpHtlkXvgrMBdcvfHwKKh
 8kZkVnxd26aNz9V1JooFYhvTxzgb+JF5TihienCSPk1r9PZOCE8C99kJIOqqHxM3uEwF
 oZXchUTiBK94216tFd9Mb5z6exEFxmnRmp7gJPaXXNaC9dTkovrXd9lX1FmpnnBBx6T4
 kDvw==
X-Gm-Message-State: AOAM530q63z6cEXO0sNksX7O1m5hkBqfPJj6xlPb32RmS4Y03Qf/HxM/
 PVaWrTLSk9PWJXba5uhzbTjreHImHjsG/AL/YDby9g==
X-Google-Smtp-Source: ABdhPJx6c/j0fOjt2+d/5PDZ/g7eBNDKrcxbOAYtb00daIp9f++6gEjRsD1hPDPHoaSzkyGhU038aOHd7R8Pe0p4Bg4=
X-Received: by 2002:a4a:c68d:: with SMTP id m13mr5357342ooq.64.1603531328361; 
 Sat, 24 Oct 2020 02:22:08 -0700 (PDT)
MIME-Version: 1.0
References: <20201022081002.2665132-1-liuxiwei@inspur.com>
In-Reply-To: <20201022081002.2665132-1-liuxiwei@inspur.com>
From: John Wang <wangzhiqiang.bj@bytedance.com>
Date: Sat, 24 Oct 2020 17:21:59 +0800
Message-ID: <CAH0XSJvPN18GZW0WmOmkJ8WH-stpeVP8pq0ZzWb0KpJ1kUnwyg@mail.gmail.com>
Subject: Re: [External] [PATCH] ARM: dts: Fix label address for 64MiB OpenBMC
 flash layout
To: George Liu <liuxiwei1013@gmail.com>
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

On Thu, Oct 22, 2020 at 4:10 PM George Liu <liuxiwei1013@gmail.com> wrote:
>
> Signed-off-by: George Liu <liuxiwei@inspur.com>

Reviewed-by: John Wang <wangzhiqiang.bj@bytedance.com>

> ---
>  arch/arm/boot/dts/openbmc-flash-layout-64.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/boot/dts/openbmc-flash-layout-64.dtsi b/arch/arm/boot/dts/openbmc-flash-layout-64.dtsi
> index c8e0409d889e..91163867be34 100644
> --- a/arch/arm/boot/dts/openbmc-flash-layout-64.dtsi
> +++ b/arch/arm/boot/dts/openbmc-flash-layout-64.dtsi
> @@ -13,22 +13,22 @@ u-boot@0 {
>                 label = "u-boot";
>         };
>
> -       u-boot-env@e0000 {
> +       u-boot-env@60000 {
>                 reg = <0x60000 0x20000>; // 128KB
>                 label = "u-boot-env";
>         };
>
> -       kernel@100000 {
> +       kernel@80000 {
>                 reg = <0x80000 0x500000>; // 5MB
>                 label = "kernel";
>         };
>
> -       rofs@a00000 {
> +       rofs@580000 {
>                 reg = <0x580000 0x2a80000>; // 42.5MB
>                 label = "rofs";
>         };
>
> -       rwfs@6000000 {
> +       rwfs@3000000 {
>                 reg = <0x3000000 0x1000000>; // 16MB
>                 label = "rwfs";
>         };
> --
> 2.25.1
>
