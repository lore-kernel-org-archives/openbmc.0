Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75ABBC5478C
	for <openbmc@archiver.kernel.org>; Fri,  1 Mar 2024 23:12:19 +0000 (UTC)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=21WBm76q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TmkPt0dl2z3f0P
	for <openbmc@archiver.kernel.org>; Sat,  2 Mar 2024 10:12:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=21WBm76q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
X-Greylist: delayed 2071 seconds by postgrey-1.37 at boromir; Sat, 02 Mar 2024 10:11:14 AEDT
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TmkNf1y4Vz3c5P;
	Sat,  2 Mar 2024 10:11:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=PG+oytNfd+recud757xU3maYgbs21CX5ihLnnh8yEe4=; b=21WBm76qNLnnqHkiK9DvL5yQQP
	j2XVibxgLKK7bA7jYmasBOqXHLyhy48eOeqq3bxYRJQtQjtBfyCyvk0rhL10gVC59K2aAZQP0kRL6
	vQyU0rxXYYBnDLOjmNoYJBftYXJ+tNsO6AvLkQVDq3VYtHJEpC4skyOd/GsCtGrx+v2g=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rgBUf-009B2N-CJ; Fri, 01 Mar 2024 23:36:41 +0100
Date: Fri, 1 Mar 2024 23:36:41 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
Subject: Re: [PATCH v2 1/1] ARM:dts:aspeed: Initial device tree for AMD Onyx
 Platform
Message-ID: <c8686f40-e6e9-4652-b450-217de604b216@lunn.ch>
References: <20240301222257.3309541-1-supreeth.venkatesh@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240301222257.3309541-1-supreeth.venkatesh@amd.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, joel@jms.id.au, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

> +&mdio0 {
> +	status = "okay";
> +	ethphy0: ethernet-phy@0 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0>;
> +	};
> +};
> +
> +&mac3 {
> +	status = "okay";
> +	phy-mode = "rgmii";
> +	phy-handle = <&ethphy0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rgmii4_default>;
> +};

That looks odd. Where are the RGMII delays coming from? Normally its
"rgmii-id", which asks the PHY to insert the delays.

	Andrew
