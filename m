Return-Path: <openbmc+bounces-1603-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF42FCD0D3
	for <openbmc@archiver.kernel.org>; Wed, 18 Mar 2026 08:24:17 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fbMLM3RV1z2yjm;
	Wed, 18 Mar 2026 19:24:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773822251;
	cv=none; b=RzmiLHwh5GZDrLrWIlkSbjDtXO53tSxlLE6Vxyl+e30v/jD5VtvkSsDtWv7heo0JFksmifRLsu5HpI/5bZMHOLSZo/z0T9Rl/zorGgiOb6Wi5Xpul31ioNPhtzrBq9sY/+iAj6QmRDGiLWHc8ix1jfC7G2TtQmIrO2gOV4sqa3O7Xl4W9B9GZkE2z2t9Em9s5/BfQBaqfJHH2RpPNMy8sT7ldgKMIXL3yroFoDKLZthMg4VJQ9EROiAf6pt+eoli5hxgnQ3jQFoc1RahlHsKkR0lweNQUk8tYDpurox7wS1lf/sxoUlJ2hKaUEowf5sG5ZRwpDXjVUZ+dbOE7XsTJg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773822251; c=relaxed/relaxed;
	bh=mrhLqIr375zkIF1P8tW7+p8P3V9w1E/lvaNsvQiZRKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cmVjMmtLJiS2daJnPM2vmv44AdokGrfdl7nWylT28+w1IcRQeGbNpf2cB04IXWMRL6ZpwhrDFBh8yynt5pmN44VHLMbc38zU9DzjJJwJA/SOaz1iNIHMU2TKxlsN+Cqdd/nhm1L34QktVuBkvApRKq/51C2CbuUP/g2/ZT89Ahmpqvgb6PCZmgju677nQr9A0YGJM7mxbqX/wqOSJdzaQrugELGb/m2cs5MS3f+YalwAQkB74hpI3cQUIYbaM6VsRCVolZV9NmE603BAXb70aQgEruod8BcFQioaYmzvwTAFL87qQYnO3zpscvugFsPpIv51xEF6nu/LdIuHkl7+oQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FdWYyowz; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FdWYyowz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fbMLL1q0Sz2xQB
	for <openbmc@lists.ozlabs.org>; Wed, 18 Mar 2026 19:24:10 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E3CA5417BA;
	Wed, 18 Mar 2026 08:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53225C19421;
	Wed, 18 Mar 2026 08:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773822247;
	bh=zbrEzDQ0AblNhXke6/7cPNOTm3Avyhavj22x1LcfmRs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FdWYyowzn9WA2aJGuHLNRqX/QEe2NLHcUNCkhDUY64ztt4svOZmzxFrWlzmUHI6xU
	 /uZ6hPer+e0gNtoBPTWwrX/4/7Y7NvBA8sBZlt870hhJjKBW7mlNFErn5jRqmcWzUI
	 ZvuE9nLCPHP31SJgQXUPwHPO6asgJzE8clgaERBQLzu6N9cYSGvueZs5NEtbkDxERW
	 0uJbhCBwzFOmdXng/YhTB1b3/JQeJfKObJH/IhHBdmBsZiqjuYj2FAYfYX/gYxNizC
	 3PxPrHxwNqCsWYeU/7l/EP6+bQvr/f/z2ZIb4fdI4QjIBTDeTbHHgHvFBmLlYCncbE
	 OJTQxjRlH3XgQ==
From: Simon Horman <horms@kernel.org>
To: a0987203069@gmail.com
Cc: Simon Horman <horms@kernel.org>,
	richardcochran@gmail.com,
	devicetree@vger.kernel.org,
	edumazet@google.com,
	linux-stm32@st-md-mailman.stormreply.com,
	joabreu@synopsys.com,
	linux-kernel@vger.kernel.org,
	krzk+dt@kernel.org,
	pabeni@redhat.com,
	kuba@kernel.org,
	andrew+netdev@lunn.ch,
	netdev@vger.kernel.org,
	conor+dt@kernel.org,
	schung@nuvoton.com,
	linux-arm-kernel@lists.infradead.org,
	davem@davemloft.net,
	robh@kernel.org,
	yclu4@nuvoton.com,
	andrew@lunn.ch,
	mcoquelin.stm32@gmail.com,
	ychuang3@nuvoton.com,
	openbmc@lists.ozlabs.org,
	peppe.cavallaro@st.com,
	alexandre.torgue@foss.st.com
Subject: Re: [net-next,v14,3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family
Date: Wed, 18 Mar 2026 08:23:46 +0000
Message-ID: <20260318082346.1825390-1-horms@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260316055427.1310569-4-a0987203069@gmail.com>
References: <20260316055427.1310569-4-a0987203069@gmail.com>
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
Content-Transfer-Encoding: 8bit

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family

Add support for Gigabit Ethernet on Nuvoton MA35 series using dwmac
driver.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig

[ ... ]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile

[ ... ]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
> @@ -0,0 +1,136 @@

[ ... ]

> +static int nvt_gmac_probe(struct platform_device *pdev)
> +{
> +	struct plat_stmmacenet_data *plat_dat;
> +	struct stmmac_resources stmmac_res;
> +	struct device *dev = &pdev->dev;
> +	struct nvt_priv_data *priv;
> +	int ret;
> +
> +	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get platform resources\n");
> +
> +	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
> +	if (IS_ERR(plat_dat))
> +		return dev_err_probe(dev, PTR_ERR(plat_dat), "Failed to get platform data\n");
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return dev_err_probe(dev, -ENOMEM, "Failed to allocate private data\n");
> +
> +	priv->regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node, "nuvoton,sys",
> +							    1, &priv->macid);
> +	if (IS_ERR(priv->regmap))
> +		ret = dev_err_probe(dev, PTR_ERR(priv->regmap), "Failed to get sys register\n");
> +
> +	if (priv->macid > 1)
> +		ret = dev_err_probe(dev, -EINVAL, "Invalid sys arguments\n");
>                                                                                   ^^^^

Does this code return the error on failure? The dev_err_probe() result is
assigned to ret but the function continues execution without returning.

Russell King's v12 review suggested using set_phy_intf_sel callback,
which led to significant refactoring in v12. This refactoring appears to
have inadvertently broken the error handling here and below.

The code should be:
	if (IS_ERR(priv->regmap))
		return dev_err_probe(dev, PTR_ERR(priv->regmap), "Failed to get sys register\n");

	if (priv->macid > 1)
		return dev_err_probe(dev, -EINVAL, "Invalid sys arguments\n");

See Russell's v12 review:
https://lore.kernel.org/netdev/aYsurPBMnzWDZCco@shell.armlinux.org.uk/

> +
> +	plat_dat->bsp_priv = priv;
> +	plat_dat->set_phy_intf_sel = nvt_set_phy_intf_sel;
> +
> +	return stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
> +}

[ ... ]

