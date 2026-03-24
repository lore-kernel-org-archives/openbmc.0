Return-Path: <openbmc+bounces-1704-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1269EF54AC5
	for <openbmc@archiver.kernel.org>; Tue, 24 Mar 2026 15:04:46 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fgCxf5Sbqz2ynf;
	Wed, 25 Mar 2026 02:04:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a00:1450:4864:20::12b" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774364678;
	cv=pass; b=E5W3iDGM74Ss0M3MKVvD3Tvngm34EoIRbae55BH6qDr6GadgIGRaUwqkI4svdeR3wLMkL8CVJmaeY9UMTF0jdlixPeZPjN26F95+r/bfZfVq/eY3J/+YwFY9Wsfd0lX2ZQr0i0G6gN/hmaxnh4HlAYWDwaKlVRT2wmBfkfqMnD7F3h/DIIK1q0+04ANxHV9Iq3kvZfNhF7uNhL80KJ8Cl1BfLkRwYPZzRNACskd29OHyiTUh4TzgC979g7a9O5DeeU2YqO4LkpaV6eCesbbSZtOFLY/sE88f9dmbpyjpugcTmC2SF99q2Jc3Ad3xPwZW64BMIhpPsSX2rRf/ga+Ljw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774364678; c=relaxed/relaxed;
	bh=EF8mh8aKz3LIz19P1c3H9JBQd1g9ZFsPluy4phQ6zIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pi/8+1rPY+XvDZ7zod7G9YtbN0e6FSIMbznAmptaDqmwcAR0KAnEIRBrRhBhy18uwUbZteM0+848cQUq/3XiKN7AB++1XvBOQfojEInv/e8VZG8w+0cWn6qzdhJQqogyuBbkDtwMgYQ2uhX6fGi/6q1Pwn32SSpVkIL6jrxkg1UcB9yf2gt7ZOuulA6DKnn8LFWq8n5iAvbW3+8L67CEjAjwuG4U06a9oJeyEotZTmPVzhfStCWKw76t654XjvYO6qPyPQ2pqi8cpcqM7rpfduzsZMFK37s/4voDOkGHmUYFswZy58EXu3rWiF00nINoz8gLpJHQ8PeAP/aUHw47ew==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UmRpkGBZ; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=ulf.hansson@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UmRpkGBZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=ulf.hansson@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fgCxc53kTz2yhZ
	for <openbmc@lists.ozlabs.org>; Wed, 25 Mar 2026 02:04:35 +1100 (AEDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5a297a69089so740298e87.1
        for <openbmc@lists.ozlabs.org>; Tue, 24 Mar 2026 08:04:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774364670; cv=none;
        d=google.com; s=arc-20240605;
        b=Mz1019sQeBCfom4d7fn20M4dBtKD/SQbGgXl8a2YwVixEP0z16icVOo/dINN3R6cDo
         99xcXDWKfOPSRGxZ37c8U8LY6CGhp0DJGUPsh8w5OBYXHy4uDZd2/32v7hdy/kag0SOK
         qTmXW7arv6bazBbyasS++Xo1p57yXzyMjyPH4b/usQlCVsphvX3LCbeX/Qt2rGlMjKpV
         StxEntDI+Z7HtquYTXkzgBbcaGNvOJ7wBmfM2zf0hHc/cYQmEUzI8m0Zi4pKr261Q5BJ
         wyknTdDI9pQldGJ8YLL4l9TvgNOEGT+X4l2EvjnNUyUK5nlOfHf3YwwRvZlxBr7hUTFk
         SqsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EF8mh8aKz3LIz19P1c3H9JBQd1g9ZFsPluy4phQ6zIg=;
        fh=UPcxxOiSiEZSOoIW6JwMUmxNKAb6qF6HvQMsd7fLi/Y=;
        b=Csn2M9DRMu4vUjxW8hWWI8y7v2mm79sxcoJq9VLxsFMnFMozOsp/JWvmwgTsLMwD5y
         3kd7U+lxruS58y/EBiOUgfzJwR9WELHYxeq4KtG8tCnFtIJfJfEZoe0YGFIiubDbJjj/
         BmVaJGUxqdjOKAjpzE2yMDIjyJzbnAUfN4XR7zveDlsAxrNWFkF+VKcxA2Kl96qJ9kGH
         8/rbfhh+ma3Z5WGGynWBtIOPkOUIh7MIja48c/CAR+g3He43kYLEGYOt8QmySsF5YLHe
         ZAj8QW9mRv55BgS1Q5kesDJoYDPQ9he566lfPDBwEMVZVVZyGGRRCjwyLUmMaYCt5eg3
         D/7Q==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774364670; x=1774969470; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EF8mh8aKz3LIz19P1c3H9JBQd1g9ZFsPluy4phQ6zIg=;
        b=UmRpkGBZCrMoOnte2ssfGrUyzBdH06mjCh3OeysoTfX2/FdilVfbYlpyZOQ7dCi/1N
         IjzkVMkzM5d2FuuZ567SF8DIY6ecLP/rBU4664iQ8Mm7lmtWbXwD9jTmqDEXpSXPvuGW
         j+W37qk4ibPyOcAzMN0ssUa14Yb5v4UOr6hbZzYDGsrZz8O5CtqNjDJ13VUb0T/bBlAp
         z3L2MLBILDfvbmCKfdPySTbyQGxUc8W0of2tZEqhG/lCh4YxPDiOKZ3eSCtVDYvNoYL/
         guwi+onJHobW0HmEM90vIncSLnvokiMChMqcFhMnyiOhg21o+3TJ564scM2nxKTbRrha
         0O/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774364670; x=1774969470;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EF8mh8aKz3LIz19P1c3H9JBQd1g9ZFsPluy4phQ6zIg=;
        b=jW62FrXfJuMIHX6bQkPr8my6w9hTMdepwFTmLCrQMtbXmpwBZke0/kY7VL+hjkvzdi
         B8Lo/KPXZ+oJiOi6tPM/UJ1U5YLDhawbdxkiDajB55f1L2GobQL0ku0p8krxnjPUHpE/
         1veMMkaz87TtmnLRmTjesqoDD2Ugukyi84y31i0nHU24e26eywduTvLEz0FGadWHakg3
         91odtSpSaIb2pHjwTTR7McZtmY/YXvvEeaFCrYGfoo/7uxTKguUCpSvV0GbBnCqeTK5V
         hrTgd2+3tHMDdQ+neAEVYmYxJ7iiDbgCgfZMhf9GBngPjPDiik4NmTJwy5eLOg3gksEe
         VOJw==
X-Forwarded-Encrypted: i=1; AJvYcCUIuhuCx48gr76IQ04b+gZLcdVguEsA+s2P6xTKWcONnbxEx/9nwAD6pTWPMuJumnWw9/NxUJpu@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzgciYo7BWgXoLSAMYWALx5hBknfZ+s8iu3SfWlg7nnkRZKY9t9
	2yRjxv2WXVdT+M1QdbtWb4xUQMeBuFcVE9wl7yiYVtXPFxyBYCPxhii9zkI1d+0fE1byieOQwl1
	XtyDJ1t7VgrvKWeJMD1SrQIaOxgq7tJirRWhWUq9WyA==
X-Gm-Gg: ATEYQzwC3jbYmiLjzdX9VYpr7/PR5I12sBw2ZkG7Re7okoS35Ql/s/BRV9XAXd/GhP9
	Zb+6ekeJHdGDsIGSpANjqLFYpjUumGjF8t5ve0Zi31+m2TYZhNsB5cL19HMWNbYvk6rgezqH53S
	644KIXFQpGbzKEWSoqYu5bzb+Lp5mJ+r3OZ0S8v3ilBmZCgn7WnIXOQS8auAdPl4cs6FOBDzESc
	/Y9JRToeu0/OeMu4l7L/GaVEnrlRazlihUCjyVH6WJgvh6r501Ht8KUZ8Ygk02AUX6VqI1zF6Ja
	3lHT1XMx
X-Received: by 2002:a05:6512:15a9:b0:5a2:7d84:6a44 with SMTP id
 2adb3069b0e04-5a285ae4b8dmr5600779e87.6.1774364670294; Tue, 24 Mar 2026
 08:04:30 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20260324-sdhci-v4-0-c8c2060ccb5c@aspeedtech.com>
In-Reply-To: <20260324-sdhci-v4-0-c8c2060ccb5c@aspeedtech.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 24 Mar 2026 16:03:54 +0100
X-Gm-Features: AQROBzDGb2O61nTd0QV3ZdTm6lrh7bdMvQHr7qGN2e1GOEsGjRP5W0BZL_IWEd0
Message-ID: <CAPDyKFqwCahQCw7kB495Ym1JmSkn0PAkXVn==oV9_pKcb9zj9w@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Add AST2700 support for aspeed sdhci
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Ryan Chen <ryanchen.aspeed@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrew Jeffery <andrew@aj.id.au>, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Mar 2026 at 02:58, Ryan Chen <ryan_chen@aspeedtech.com> wrote:
>
> This series add aspeed sdhci support for AST2700. The AST2700 sdhci
> requires an reset. This series updates the binding and driver to
> support reset requirements.
>
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
> Changes in v4:
> - 2/2 rebase git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git
>   next branch fix the conflit.
> - Link to v3: https://lore.kernel.org/r/20260323-sdhci-v3-0-93555b8f6411@aspeedtech.com
>

The series applied for next, thanks!

[...]

Kind regards
Uffe

