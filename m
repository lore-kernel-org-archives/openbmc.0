Return-Path: <openbmc+bounces-1483-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD3E106FD9B
	for <openbmc@archiver.kernel.org>; Fri, 13 Mar 2026 08:26:24 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fXHd61DwTz3cJy;
	Fri, 13 Mar 2026 19:26:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:edc0:2:b01:1d::104"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773390377;
	cv=none; b=NYvrRWarNFO4m5yr5yjnjDttkhLhNj6xX7bp57YiUKeuWOZc25PUYNBgr5b3Am+19rjWDHsJn/RMULrz1V7ERSizaXEDvt/ODRhLb2brIFhM1sq0nUiJQte9yQoJANkB3AlseKuxaDpHLwM+tECHGVJr6HW/zIzlwwnlhlpudj9/ORs5tb6Nvm+yoGnzquaG/dwXuqGw57xunvnkwKg7xQnUd1h0RMiT6KNQAbrZ8YQdtpDWOEzwxfl4Sy3lueL9L5zxPIEHKoRWtizYbx/Kr2UWDoOkS+TDB0Ick0ReKrMm+M9KPfaa4SG4hFWaDi90KQ5zBJUFCiVhh9vUg+nqlw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773390377; c=relaxed/relaxed;
	bh=R8tCMG/oPkaIeRaLZUuC0PLQ4SE/rg0PgKCK6kflpU8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JgifZg0GMqPf9aoaJXprlnr9phd1PtktrZS6j3vsiKkHrHiHLRDRlWoMFUJ7fBL/j/ll5omKwufnZDwznTmINXdulzpRSWQOyqk8DW/mos0Ez2an8p7jXmC+Ab1Uqc80GkFUCCUt7v2nZ8duMka9g6MUoRg7G35t/PwMaOfTJSU2ofup8dOCTzaqBId6f9QAOE1zszyWd7RqWs5SuO9kUthN+nf/6hCWgMR27k6NNEBn1EiLoFz7p0YA+FbEaC784L97ixVMNlu2xan+M/n5NiVCJQ31tjcplzNOfJwDmS5YXS31dnQpqi+62MbCKw/HrlplDHb/OCEc+xy8UmYTfA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=p.zabel@pengutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=pengutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=p.zabel@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fXHd45W0Tz2xlM
	for <openbmc@lists.ozlabs.org>; Fri, 13 Mar 2026 19:26:15 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w0xq3-0005Ai-PR; Fri, 13 Mar 2026 09:25:43 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w0xq1-00039e-0C;
	Fri, 13 Mar 2026 09:25:41 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w0xq0-000000002ma-45Cc;
	Fri, 13 Mar 2026 09:25:40 +0100
Message-ID: <352a522b5325e9db80c880dd7a3a052516f3b673.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] mmc: sdhci-of-aspeed: Add ast2700 support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Andrew Jeffery	
 <andrew@codeconstruct.com.au>, Ulf Hansson <ulf.hansson@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Ryan Chen	
 <ryanchen.aspeed@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Fri, 13 Mar 2026 09:25:40 +0100
In-Reply-To: <20260313-sdhci-v1-2-91cea19c8a67@aspeedtech.com>
References: <20260313-sdhci-v1-0-91cea19c8a67@aspeedtech.com>
	 <20260313-sdhci-v1-2-91cea19c8a67@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
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
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openbmc@lists.ozlabs.org

On Fr, 2026-03-13 at 13:27 +0800, Ryan Chen wrote:
> Add support for the AST2700 SOC in the sd controller driver. AST2700 sd
> controller requires an reset line, so hook up the optional reset control
> and deassert it during probe.
>=20
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  drivers/mmc/host/sdhci-of-aspeed.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-=
of-aspeed.c
> index ca97b01996b1..91c36245e506 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -520,6 +520,7 @@ static int aspeed_sdc_probe(struct platform_device *p=
dev)
> =20
>  {
>  	struct device_node *parent, *child;
> +	struct reset_control *reset;
>  	struct aspeed_sdc *sdc;
>  	int ret;
> =20
> @@ -529,6 +530,15 @@ static int aspeed_sdc_probe(struct platform_device *=
pdev)
> =20
>  	spin_lock_init(&sdc->lock);
> =20
> +	reset =3D reset_control_get_optional_exclusive(&pdev->dev, NULL);

This is missing a reset_control_put() in aspeed_sdc_remove(). Or use
devm_reset_control_get_optional_exclusive().

Is it ok to assert this reset control in _remove()? If so, you could
use devm_reset_control_get_optional_exclusive_deasserted().


regards
Philipp

