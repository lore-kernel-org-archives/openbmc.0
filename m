Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379D0606A320
	for <openbmc@archiver.kernel.org>; Wed, 18 Nov 2026 22:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lvlw2APD
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jVGhR6kTMz3bll;
	Thu, 19 Nov 2026 09:37:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1794987823;
	cv=none; b=d8TbJEdeKLzWqr44vL6yR/qCkgxxs9eAqgxFs0l3a5BubjALR/VAXJtiSCLrpf+nDmxoNlhRMcKvKr5pMJUxESjkPkqC80fA5Byk9Sn1XSk3A/H9/0mNrO76raRqG+M/VjOlHhv5/m/ebUmMkXvAo7AMPK5x6xBLRy3RdiKwM+d80cr9J4+OW7sl0fSiEMVPNUqLoBrNnqoF63Wp2ZUDY19HffNB8RRD8U2b2I6vluw7bLMak/4ybjz4iDYrWlWN9kmNQ9eocHbfWU7cyr4F9tSrqRynbzoHHWnsEvh+O64i06zsROADeDF62N2E/Z1zlIHdSH0lFzIPPegG+1YVNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1794987823; c=relaxed/relaxed;
	bh=5tdOi87MUQVrh0lDnm0y5zaT0nPUT+qlg7v5xkEiqMk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A0yxiVwn284Tcgf0j922y7PnC7QZ7NrXzXmS8icf5C+CyTkkNRAXFz+R2ZpGhwzzjHH94Xp8/U3fJlNZihku3Nt7EWcTjPrQPv1p6fLGneeBd7OkKZ2Y98a4Aj5Oq+F8i8IdRFFVPm00/woPkh0oDdCI9WcaR9s4vQfKa9XxVIHscWvZPTgZs+uH8yds50ZtQgmVXBsfCha9ijleimqvG28eWYSLP3PA1M6u84XKVB2NR0K4rAacMrPMJSevZlFujpVAiIUx55IkwpYC5giQTGg9i8AGiqlMNmgid7X0bCvlwtEKuCu/pEfbXQhERlMlS1na7kodp+mCjhEevJY5rw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lvlw2APD; dkim-atps=neutral; spf=pass (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lvlw2APD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jTtrY410Dz2yMK
	for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2026 18:43:39 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5E7754E4160A;
	Wed, 18 Nov 2026 07:43:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1DE395FE9B;
	Wed, 18 Nov 2026 07:43:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 77C8D11BC076C;
	Wed, 18 Nov 2026 08:42:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794987811; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5tdOi87MUQVrh0lDnm0y5zaT0nPUT+qlg7v5xkEiqMk=;
	b=lvlw2APDkLOsWdPZXrcTGO0SBvJt5AeVKx0Z42miklOsc8vPctTcjUfLvtwVkHahSrHPLo
	CGkq45BFyuEH8fedQgM6HJ/XMbau2Rz9aKP/PJ7PtvuBj2hMJXvtJKDgvO7p6Q3pjLfN6i
	0Ut1+LTYYEyg77hZo16dxZxUGEgStz4MKBFw9hj/2Tiw4koxWXy5yQ8yIHNJQ0YwvKbt02
	l/18CHS5c8YF9Wb/y9UNTxVZrOZMCPnkOtQCGZPI3/uD2p7Qv4dv6TVs+LHq5iTBVHSMvU
	434h8Tsq1BRLh2Btis1Fush6eJ7xmbr9hxqVcPbs2tV0AeddsTbxh0K8Mz1lOg==
Date: Wed, 18 Nov 2026 08:42:46 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Peng Fan <peng.fan@linux.dev>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Andrew
 Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Ryan Chen
 <ryan_chen@aspeedtech.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Billy Tsai <billy_tsai@aspeedtech.com>, Tan
 Siewert <tan.siewert@9elements.com>, Eddie James <eajames@linux.ibm.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Caleb
 James DeLisle <cjd@cjdns.fr>, Marc Zyngier <maz@kernel.org>, Miodrag Dinic
 <miodrag.dinic@mips.com>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk
 <piotr.wojtaszczyk@timesys.com>, Anup Patel <anup@brainfault.org>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland
 <samuel.holland@sifive.com>, Qin Jian <qinjian@cqplus1.com>, Changhuang
 Liang <changhuang.liang@starfivetech.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Nishanth Menon <nm@ti.com>, Tero Kristo
 <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Linus Walleij
 <linusw@kernel.org>, Michal Simek <michal.simek@amd.com>, Anirudha Sarangi
 <anirudha.sarangi@amd.com>, Tushar Nimkar <tushar.nimkar@amd.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org,
 linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, git@amd.com, linux-arm-msm@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] irqchip: Convert chained handlers to
 guard_chained_irq()
Message-ID: <20261118084246.5b5bf203@bootlin.com>
In-Reply-To: <20261114-irqchip-cleanup-api-v1-1-4a9d598b0bdb@nxp.com>
References: <20261114-irqchip-cleanup-api-v1-1-4a9d598b0bdb@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Peng,

On Sat, 14 Nov 2026 23:06:15 +0800
Peng Fan <peng.fan@linux.dev> wrote:

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

For the irq-lan966x-oic driver:

Reviewed-by: Herve Codina <herve.codina@bootlin.com> # irq-lan966x-oic.c

Best regards,
Hervé

