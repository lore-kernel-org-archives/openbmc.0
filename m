Return-Path: <openbmc+bounces-1344-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A79EA810F
	for <openbmc@archiver.kernel.org>; Tue, 10 Feb 2026 13:12:55 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9MS04T7Bz2xRq;
	Wed, 11 Feb 2026 00:12:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4d48:ad52:32c8:5054:ff:fe00:142"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770729168;
	cv=none; b=blIfN3dZ+8lF71V+0I3b9tgxj4hAS29fYebk8yIGuW22KmkvNK9b3BFpghSQOrAH0NRTued0JVH5PhVUHxKo5aZSkCwAl4O7ZIY3RnXZ/JIABFLyKj1Ns+xxwc8tNas7wq49sRTev4E+RhDGs1Wpnff1cOzojhxBtIT4maYJxJDYOuhGKWPEnCYAgomznA9Weh74E9U1QiEQlqHnGb7y1SymEiJQME+yfWxcCFn9/Lqnm+OOoNfezLvwKb9SJRHK8LsLOZ+mCusobyRT3An7/BNc2V26Gx/En6dfWyUXxXujjbsr9tlQJ8FmSsHoIkSDWRKX1kFyjOJnepc7H0bfIg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770729168; c=relaxed/relaxed;
	bh=Z1pl4mFVhB9hfg+ucrkFR1J2Wb0obC6F6Knh+u+mA90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FMgZiOKowfdI15qWaWcpbnFhLzg82CeAigYNto19g/9Gmb3QafA/r/hlk6tbaU6D/XalpI4dj83ix3A+48v5jnMZZIBsCim5eV8+c6zXZlhsflWc4DZqDmhLWPWZYCJF5ls75gPac/9eV7rKoqQiu79EI+1pzCOZSEma/9o2xRVLbr5fo9fViYu87MFndLCaqLJ75aBf1KV0aQmxFAGgv/SF+ICJIFD649hsmrp6O4+dzp5HasmpbqN8hzoTSjgK2evulufPoQTEOeBqFvk72YT16EN/TEmFNUEL6I4OOJ1SnxLWBFsxcM1YQ0oix1FYP/Ki+0Cskc/YfzQiSqT2pQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=p6PGcWly; dkim-atps=neutral; spf=none (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk; envelope-from=linux+openbmc=lists.ozlabs.org@armlinux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=armlinux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=p6PGcWly;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk; envelope-from=linux+openbmc=lists.ozlabs.org@armlinux.org.uk; receiver=lists.ozlabs.org)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9MRx13twz2xKx
	for <openbmc@lists.ozlabs.org>; Wed, 11 Feb 2026 00:12:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Z1pl4mFVhB9hfg+ucrkFR1J2Wb0obC6F6Knh+u+mA90=; b=p6PGcWlyiQfZAFkq2CZ+DOPR3o
	h8dLZjcP61+iJDGRA9jqOxwbGjzEQvoPfMKLFu6cl+4ZTbmUae/ie2be/hV324xdFXfMgnyI9kfvN
	6mmD/xKm5og586Bacuz15OkBozwx4aUblkAIQaevvIVE9Gz0M+hczb6Kw8TI8p6/pJvU3VfDl38+f
	WyiHBYIiJ0decwdMgxUe/cC9sIMtplYQIz3agdqanOGbAp3crSidrbMaA9VqvCV7PPrvig0u/jQZA
	HYh4Y5fSp4kVQMahQPLQjPaV97j7/ahH3s97WNQYc7XPY5ytOtqt5XZGASd3nDJeQGFRjmNEfXyEl
	iY1nb29Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34334)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vpnXM-000000002Zp-3rxj;
	Tue, 10 Feb 2026 13:12:16 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vpnXI-000000002og-2bsV;
	Tue, 10 Feb 2026 13:12:12 +0000
Date: Tue, 10 Feb 2026 13:12:12 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Joey Lu <a0987203069@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com, alexandre.torgue@foss.st.com,
	joabreu@synopsys.com, ychuang3@nuvoton.com, schung@nuvoton.com,
	yclu4@nuvoton.com, peppe.cavallaro@st.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v12 3/3] net: stmmac: dwmac-nuvoton: Add dwmac
 glue for Nuvoton MA35 family
Message-ID: <aYsurPBMnzWDZCco@shell.armlinux.org.uk>
References: <20260210052226.3005666-1-a0987203069@gmail.com>
 <20260210052226.3005666-4-a0987203069@gmail.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210052226.3005666-4-a0987203069@gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

Please note that net-next is currently closed, so you should be sending
net-next patches with "RFC". See section 1.4 of:
https://docs.kernel.org/process/maintainer-netdev.html

On Tue, Feb 10, 2026 at 01:22:26PM +0800, Joey Lu wrote:
> +static int nvt_gmac_setup(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	phy_interface_t phy_mode;
> +	struct regmap *regmap;
> +	u32 macid, miscr, reg;
> +	int ret;
> +
> +	regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node, "nuvoton,sys", 1, &macid);
> +	if (IS_ERR(regmap))
> +		ret = dev_err_probe(dev, PTR_ERR(regmap), "Failed to get sys register\n");
> +
> +	if (macid > 1)
> +		ret = dev_err_probe(dev, -EINVAL, "Invalid sys arguments\n");
> +
> +	if (of_get_phy_mode(pdev->dev.of_node, &phy_mode))
> +		ret = dev_err_probe(dev, -EINVAL, "Missing phy mode property\n");

If you pass in the plat_dat to this function, then you have access to
plat_dat->phy_interface. I went through all the dwmac glue code and
removed such PHY interface gets, so please don't introduce new
instances.

> +
> +	miscr = (macid == 0) ? NVT_REG_SYS_GMAC0MISCR : NVT_REG_SYS_GMAC1MISCR;

I find the use of "miscr" to be the register offset, and "reg" to be
the register value is confusing. Normally they're the other way around.

> +
> +	switch (phy_mode) {
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +		ret = nvt_gmac_get_delay(dev, "rx-internal-delay-ps");
> +		if (ret < 0)
> +			return ret;
> +		reg = FIELD_PREP(NVT_RX_DELAY_MASK, ret);
> +
> +		ret = nvt_gmac_get_delay(dev, "tx-internal-delay-ps");
> +		if (ret < 0)
> +			return ret;
> +		reg |= FIELD_PREP(NVT_TX_DELAY_MASK, ret);
> +		break;
> +	case PHY_INTERFACE_MODE_RMII:
> +		reg = NVT_MISCR_RMII;
> +			break;
> +	default:
> +		return dev_err_probe(dev, -EINVAL, "Unsupported phy-mode (%d)\n", phy_mode);
> +	}
> +
> +	regmap_update_bits(regmap, miscr,
> +			   NVT_RX_DELAY_MASK | NVT_TX_DELAY_MASK | NVT_MISCR_RMII, reg);

Please consider programming the NVT_MISCR_RMII bit via the
plat_dat->set_phy_intf_sel() method.

Is this register preserved over suspend/resume ?

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

