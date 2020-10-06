Return-Path: <SRS0=c1sS=DN=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19755C4363D
	for <openbmc@archiver.kernel.org>; Tue,  6 Oct 2020 03:23:56 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1FE820782
	for <openbmc@archiver.kernel.org>; Tue,  6 Oct 2020 03:23:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="YeSzy3k4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1FE820782
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C52qr2RJ4zDqHl
	for <openbmc@archiver.kernel.org>; Tue,  6 Oct 2020 14:23:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=YeSzy3k4; dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C52pL2FGtzDqGt
 for <openbmc@lists.ozlabs.org>; Tue,  6 Oct 2020 14:22:34 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id g3so11890322qtq.10
 for <openbmc@lists.ozlabs.org>; Mon, 05 Oct 2020 20:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4RtzM2p7XTCt6afUxkhKizxc+DcNPnWDoOipy2MIXsA=;
 b=YeSzy3k4O8Rv857gu1tK2ACckUn1uFusNqvJi6D2Aj/06J/1la4zOxCirS8wrPSRcj
 A5HVK9PkY3HhSa1Hfqxibn7BVFJ760GvEM4FYu0TTXjs9ZZL+pPXFNQ5Yx1IvAzhVoY8
 5/akwa6ajwrWknIaadukp8vMpLU122mL9n/nI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4RtzM2p7XTCt6afUxkhKizxc+DcNPnWDoOipy2MIXsA=;
 b=qgCvd/giR5N61N1KtziHCyrfHoGomxCWYVxnFGAYp6JmdOhsa12xDkcZjLH74CjgFI
 bOX4qrnaKAU/aNJLQM9sdWslmOLsHyR73c0jj9OMyQtj/ocETn3bW8yUyFqP6JANwxud
 n/JzOvQBO0rVs78JwOQ1xUFrTvrfc+T2y8hdpp2KLIfMlHZ0zdJy1Et4pe0RvK/LG5ZV
 bzdkDOAHT6gCzwFZ2VVHRCV4552iOZ5sIlFZx/AbKyh0Obfpwzqt5NSTBKdjAz5zwV6c
 CgKIZRoUZB7CrQb7zhZXjOCzWV8SliE8TlwKE/ECdWWmhjr1ENU2e6ja18u059wJib+4
 uLUQ==
X-Gm-Message-State: AOAM532cxxvS/9pSLIxZESrW2aJ3GAXrHkIbEoyquieIRU1LYXQX+8Xw
 ONt13gs+md9oNomp38bY/tPYR2PuYqXQjdMIls4=
X-Google-Smtp-Source: ABdhPJwkoXz8xJpgyrHX/7tIJTBdBJo7QNh8Lxi+YIBwGIA1vNayaF/q77mmHRKONjUrlrz/TOX8SmRdTDCg6u8kPVU=
X-Received: by 2002:ac8:36ca:: with SMTP id b10mr3086320qtc.135.1601954550501; 
 Mon, 05 Oct 2020 20:22:30 -0700 (PDT)
MIME-Version: 1.0
References: <20201002063414.275161-1-andrew@aj.id.au>
 <20201002063414.275161-2-andrew@aj.id.au>
In-Reply-To: <20201002063414.275161-2-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 6 Oct 2020 03:22:18 +0000
Message-ID: <CACPK8Xd-3e+6EO1dz7aQZqTpxamDcVPfqAgbneg2_W=vpto3Kw@mail.gmail.com>
Subject: Re: [PATCH 1/3] ARM: dts: rainier: Add reserved memory for ramoops
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
> Reserve a 1MiB region of memory to record kmsg dumps and console state
> into 16kiB ring-buffer slots. The sizing allows for up to 32 dumps to be
> captured and read out.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index e6f422edf454..46a0e95049fd 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -47,6 +47,14 @@ reserved-memory {
>                 #size-cells = <1>;
>                 ranges;
>
> +               ramoops@b7f00000 {
> +                       compatible = "ramoops";
> +                       reg = <0xb7f00000 0x100000>;
> +                       record-size = <0x4000>;
> +                       console-size = <0x4000>;

This is conserative. We've got plenty of space, how about we make it bigger?

$ git grep console-size *.dts* | grep -Po "0x([0-9]+)" | xargs printf
"%x\n" | sort -n
8000
8000
10000
10000
20000
20000
20000
20000
20000
60000
100000

The median is 128KB, which sounds reasonable.

$ git grep record-size *.dts* | grep -Po "0x([0-9]+)" | xargs printf "%x\n"
20000
400
400
20000
20000
20000
10000
10000
10000
10000
20000

64KB is the median record size.

> +                       pmsg-size = <0x4000>;

Do we want to add ftrace too?

Should we also add max-reason = KMSG_DUMP_EMERG?

Logging reboots and shutdowns is informative (you know if a reboot was
intentional or due to a crash that wasn't recorded) and allows for
testing.

Cheers,

Joel

> +               };
> +
>                 flash_memory: region@B8000000 {
>                         no-map;
>                         reg = <0xB8000000 0x04000000>; /* 64M */
> --
> 2.25.1
>
