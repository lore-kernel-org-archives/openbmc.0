Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AAD606A9B3
	for <openbmc@archiver.kernel.org>; Wed, 18 Nov 2026 22:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U+gX5IcC
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jVGgJ1rDsz30T2;
	Thu, 19 Nov 2026 09:37:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795009521;
	cv=none; b=QTgOa5Y8CmCyWIlMU7mhxcfD7ws7iB1WY6SNUhtOv9o0pythTeUGW7tlbv6V4TYd914cXzNfNkkyurG1OhmUwmPMTwqv8DxPkZ5jFqFLL2zDMgpRjXdv0nRIvo+hOJqECyHDztt4oQZZ/mgHdnqaJG/jtdxxrbf02mjubpY55vVjcABPdZToMd2xfyG+5ud8ZGtT8BM+PMxvm1SZcCy5I0/DbEaB7i9ikUDdQ62ZI9XLpYGbKVHuudc2vdOliPRNfvFpaF/g+mQIDzDBjf/BxqeWXaYpwgPoNDX6AFIW+MZAZW9pVNrR5a0Q4n6Whe9X2gF1P6DsqtWmxeQOT0ywZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795009521; c=relaxed/relaxed;
	bh=zbYI8uP1li72NzJh/wjWDJ72bmhe8G4M88p9Kdrkgp4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i9O7zABG98cBjQ8VFSR9QwCB+U8dPBPUFVB89Z2pLKuqtpW67p4gbELnT/Cr6O9LnVyuhIU1B9IAy1G2cpCdnEtfqP5q1gYAu4Yn7OSukMez4TFzTri4mT+YUkmB3iY4RqlgBUXU/YW1P3hgshUHtn//t/4mEXJZtrGnnZkUDhRsiGNQWpVxsstT5j8s0GM9wQwxlfYeR/5BY09zYzxF/GMGg8FRhhcgqOXu8a2xp90EVthSA4dHUDb+POhKG9a6EUvjmp5fYvXQAaFPH6oAAftUldBtEICAfO78HwsZSqJOKO3iptESRGTXuD+UciPY8JaY+xEALGQibEZ4m2tDPQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U+gX5IcC; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=wens@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U+gX5IcC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=wens@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jV2sr4vQRz2xSl
	for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2026 00:45:20 +1100 (AEDT)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 10D8A460B7
	for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2026 13:45:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC5461F000C8
	for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2026 13:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795009519;
	bh=zbYI8uP1li72NzJh/wjWDJ72bmhe8G4M88p9Kdrkgp4=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=U+gX5IcCnae1OPx6ZSuTFfFyMK7BhsKM9bSn7IAHoP48t23uhTlkG4LMUIEoc3YaN
	 F5VzYt/OSZkMIcMAjthhu0xjucHPupHssAnfkmPxYAetMowUXS0V/qJwYxRPg1/lWk
	 f/WWEYp3fv3gQPednuHZ0t3QUc4h0mEtv1b0OZgjQah0l4/okMQnIhxtMnBkO4QrC/
	 sRMfGsSUWbduX698jPrAoHjM0iHxDsnrxRjyxd6S1YJFQUBOzTO3tLsgAQ6UmbsQ+H
	 lcauzf+edQHhCO4xOP7J+CcHMBLHRo7Mc+f6e+tOv7O3fkogcU578Y/c7SFDQCJIaY
	 Skc0RQ+Vr20sA==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3acef9307c7so9690731fa.2
        for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2026 05:45:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHde9cOQQN10Rq0bGRVnXlShm9Ee7yg1qZSQSaCdyPAqImIobThwksgV2Le/DWsAa/MZS95z63v@lists.ozlabs.org
X-Gm-Message-State: APuU4Z9CS+yQAyZstr987V1pVIDqh+/LS1XscS8m2tnKT/Y8VOmnbCmh
	D6i0wA9zZwJcQqQqY9OgshJaZoNZpxlw/wC8BtX3YWpDW5DZMSPKn2hchvHx0KUG+hCabstMqpu
	PLezZ91478gkTGdOJ609nqYAcjEvNM9Y=
X-Received: by 2002:a05:651c:b27:b0:3ab:3b73:4560 with SMTP id
 38308e7fff4ca-3ae670b2ef1mr8658421fa.11.1795009516447; Wed, 18 Nov 2026
 05:45:16 -0800 (PST)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261114-irqchip-cleanup-api-v1-1-4a9d598b0bdb@nxp.com>
In-Reply-To: <20261114-irqchip-cleanup-api-v1-1-4a9d598b0bdb@nxp.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 18 Nov 2026 21:45:03 +0800
X-Gmail-Original-Message-ID: <CAGb2v65uyYnE-sryit44oXBwstxkG7HRtYWip5nyuHeZ034TbQ@mail.gmail.com>
X-Gm-Features: AclHuK_Ko1utGgb-Cp6pja7wJidoLs_raftCWPKZ3OajYizpg1rSK6L9ElxDv8s
Message-ID: <CAGb2v65uyYnE-sryit44oXBwstxkG7HRtYWip5nyuHeZ034TbQ@mail.gmail.com>
Subject: Re: [PATCH] irqchip: Convert chained handlers to guard_chained_irq()
To: Peng Fan <peng.fan@linux.dev>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Tan Siewert <tan.siewert@9elements.com>, Eddie James <eajames@linux.ibm.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Caleb James DeLisle <cjd@cjdns.fr>, 
	Marc Zyngier <maz@kernel.org>, Miodrag Dinic <miodrag.dinic@mips.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Herve Codina <herve.codina@bootlin.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
	Qin Jian <qinjian@cqplus1.com>, Changhuang Liang <changhuang.liang@starfivetech.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Anirudha Sarangi <anirudha.sarangi@amd.com>, 
	Tushar Nimkar <tushar.nimkar@amd.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-aspeed@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, git@amd.com, linux-arm-msm@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 14, 2026 at 11:06=E2=80=AFPM Peng Fan <peng.fan@linux.dev> wrot=
e:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Use the scope-based guard_chained_irq() helper in all chained handlers
> under drivers/irqchip/ so that chained_irq_exit() is always invoked when
> the handler returns. Handlers that duplicated the exit call on an error
> path or jumped to a common exit label simply return now and rely on the
> guard.
>
> No functional changes.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> With [1] now merged in irq/drivers, convert the chained IRQ handlers in
> drivers/irqchip/ to use guard_chained_irq(). This removes the explicit
> chained_irq_exit() calls and the gotos that only existed to reach them,
> reducing boilerplate.
>
> I use a script to do the job, and after that, do mannual checking.
>
> No functional changes.
>
> [1] https://lore.kernel.org/all/179417458323.2093942.14330197609841896598=
.tip-bot2@tip-bot2/#t
> ---
>  drivers/irqchip/exynos-combiner.c          | 7 ++-----
>  drivers/irqchip/irq-aclint-sswi.c          | 4 +---
>  drivers/irqchip/irq-armada-370-xp.c        | 4 +---
>  drivers/irqchip/irq-aspeed-i2c-ic.c        | 4 +---
>  drivers/irqchip/irq-aspeed-scu-ic.c        | 8 ++------
>  drivers/irqchip/irq-ast2700-intc1.c        | 4 +---
>  drivers/irqchip/irq-ath79-misc.c           | 5 +----
>  drivers/irqchip/irq-bcm2836.c              | 4 +---
>  drivers/irqchip/irq-bcm6345-l1.c           | 4 +---
>  drivers/irqchip/irq-bcm7038-l1.c           | 4 +---
>  drivers/irqchip/irq-bcm7120-l2.c           | 4 +---
>  drivers/irqchip/irq-brcmstb-l2.c           | 4 +---
>  drivers/irqchip/irq-dw-apb-ictl.c          | 4 +---
>  drivers/irqchip/irq-econet-en751221.c      | 4 +---
>  drivers/irqchip/irq-gic.c                  | 6 ++----
>  drivers/irqchip/irq-goldfish-pic.c         | 4 +---
>  drivers/irqchip/irq-idt3243x.c             | 4 +---
>  drivers/irqchip/irq-imx-intmux.c           | 4 +---
>  drivers/irqchip/irq-imx-irqsteer.c         | 7 ++-----
>  drivers/irqchip/irq-imx-mu-msi.c           | 3 +--
>  drivers/irqchip/irq-ingenic-tcu.c          | 4 +---
>  drivers/irqchip/irq-lan966x-oic.c          | 3 +--
>  drivers/irqchip/irq-loongarch-avec.c       | 4 +---
>  drivers/irqchip/irq-loongson-eiointc.c     | 4 +---
>  drivers/irqchip/irq-loongson-htpic.c       | 3 +--
>  drivers/irqchip/irq-loongson-htvec.c       | 4 +---
>  drivers/irqchip/irq-loongson-liointc.c     | 4 +---
>  drivers/irqchip/irq-loongson-pch-lpc.c     | 3 +--
>  drivers/irqchip/irq-lpc32xx.c              | 4 +---
>  drivers/irqchip/irq-ls-scfg-msi.c          | 4 +---
>  drivers/irqchip/irq-ls1x.c                 | 4 +---
>  drivers/irqchip/irq-mmp.c                  | 7 ++-----
>  drivers/irqchip/irq-mscc-ocelot.c          | 4 +---
>  drivers/irqchip/irq-mvebu-pic.c            | 4 +---
>  drivers/irqchip/irq-mvebu-sei.c            | 4 +---
>  drivers/irqchip/irq-pruss-intc.c           | 4 +---
>  drivers/irqchip/irq-realtek-rtl.c          | 7 ++-----
>  drivers/irqchip/irq-riscv-aplic-direct.c   | 4 +---
>  drivers/irqchip/irq-riscv-imsic-early.c    | 4 +---
>  drivers/irqchip/irq-sifive-plic.c          | 8 ++------
>  drivers/irqchip/irq-sp7021-intc.c          | 4 +---
>  drivers/irqchip/irq-starfive-jhb100-intc.c | 4 +---
>  drivers/irqchip/irq-stm32-exti.c           | 4 +---

>  drivers/irqchip/irq-sunxi-nmi.c            | 3 +--

Acked-by: Chen-Yu Tsai <wens@kernel.org> # sunxi-nmi

