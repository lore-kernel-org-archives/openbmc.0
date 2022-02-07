Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B6EC433F5
	for <openbmc@archiver.kernel.org>; Mon,  7 Feb 2022 06:46:17 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jsc9g3Fx1z3bN9
	for <openbmc@archiver.kernel.org>; Mon,  7 Feb 2022 17:46:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=du5XHP/K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82d;
 helo=mail-qt1-x82d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=du5XHP/K; dkim-atps=neutral
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jsc8z6YqCz2xrt
 for <openbmc@lists.ozlabs.org>; Mon,  7 Feb 2022 17:45:37 +1100 (AEDT)
Received: by mail-qt1-x82d.google.com with SMTP id y8so11135265qtn.8
 for <openbmc@lists.ozlabs.org>; Sun, 06 Feb 2022 22:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+UbY9TKJRyt20CePqUTrZB/Qg9zX6+BMA6wGMCCt6Fk=;
 b=du5XHP/KsmZ1PBIF1P6CFMTAlpp1iKnmE1PAC86ygoJUOiUW9xi2coDnwH1sU1fkKX
 j86fUimVIpTIBgI5PPOk95aIms5vwmR8+TpkGAeaMb5GYAjU3hdUbIIqK2AtLGdgMcY7
 D2uFGiPcnpRp8DklAE2lzZFmhd0Z4sVhMTvYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+UbY9TKJRyt20CePqUTrZB/Qg9zX6+BMA6wGMCCt6Fk=;
 b=ZdiXmoWY3G+plRazW30a0pRMW0SG6DKAaPA7oBURG5HyDTQaueMm91DX9btpqDFJee
 cMcgWu4c7QZMBHMsGoWHu+Qd6EsXt3gs8mJvEZ7c5sPtGRgCdkaH6t9Bsacgkgy0cfSP
 M9VFFcPZbJCatZtrXv7vfh6dcjdS8Ungi/ODy1ud4xY6348GbtBOhSEWX178C/Afj5wG
 TcARrJR1CZWrM/Xw5o5l6NeyqNOWDNE0jrWHfI/DbCjgXCoEEGFBuKSspCzcvLChN97w
 R7iNS8y/mV/bcsah6XhsE+Hq76KRNP+eLRW0ZTi2FdzT+lC+7wabqzK+xjPNJ337LfLq
 EbHA==
X-Gm-Message-State: AOAM531aDoRPvpypMeeU4d0jgCYqJp5PxxoMewVu7plbK6YPWJmoB3oO
 6T6iQY96Td2Iv/+qKLO2YKTTOxnJTW9kSAzPteBeEtdh
X-Google-Smtp-Source: ABdhPJyOQ3myXZoGgddRtZfym1DY1qFDOEFB7Oa2Jgk9nP2FOzdw+feFrcyCrXghivvQVOzbyNHzYxSP7KVPQKUuZ3o=
X-Received: by 2002:ac8:7f06:: with SMTP id f6mr6929657qtk.625.1644216334511; 
 Sun, 06 Feb 2022 22:45:34 -0800 (PST)
MIME-Version: 1.0
References: <5c24d89c-4e58-4d1c-ffe2-d1586c6eceeb@linux.intel.com>
 <70fda031-ea0a-4155-81d4-74f398134bf8@www.fastmail.com>
In-Reply-To: <70fda031-ea0a-4155-81d4-74f398134bf8@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 7 Feb 2022 06:45:22 +0000
Message-ID: <CACPK8Xf+6cLOWNYpMH21KDxRX3w5W=EwheTwL-ZktJvbG_pGeg@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: aspeed: Enable pass-through on GPIOE1 and
 GPIOE3 free
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
Cc: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Wed, 2 Feb 2022 at 22:49, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Thu, 3 Feb 2022, at 06:29, Bills, Jason M wrote:
> > This change adds a gpio_disable_free() implementation that checks
> > if the GPIO being freed is GPIOE1 (33) or GPIOE3 (35) and will
> > re-enable the pass-through mux.
>
> Okay. So trying to pull back from the implementation for a moment:
>
> Perhaps we can view pass-through as a property on a pair of GPIOs, rather than a mux state? I think it would be better if we could, for instance, annotate this in the devicetree?
>
> If we did that I don't think we're require this awkward and pin-specific implementation of the free callback for GPIOs.
>
> If pass-through is enabled it puts constraints on how the pins are used if they're requested as GPIOs, but we can add those dynamic checks in the GPIO driver.
>
> Let me think about it some more.
>
> Thanks for surfacing the patch.

This is for the kernel, I assume.

Jason, you should send the patch to the upstream lists (use
get_maintainers.pl) for review.

Cheers,

Joel
