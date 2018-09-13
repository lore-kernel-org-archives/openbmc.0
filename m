Return-Path: <andrew@lunn.ch>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=lunn.ch header.i=@lunn.ch header.b="CjocuqAa"; 
 dkim-atps=neutral
X-Greylist: delayed 1031 seconds by postgrey-1.36 at bilbo;
 Fri, 14 Sep 2018 06:35:16 AEST
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42B9Pw6vW1zF1RG;
 Fri, 14 Sep 2018 06:35:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=X3rwluGpLmvRicTSFccI7sfupTtaP0otslkDBx9p20I=; 
 b=CjocuqAaRhw2W87pxVHMEHI1hfymjuiI90elzoBYA+4m4VAsfnhOu2D96SiKstut5U0s5m3F7vCpt92/1hJ2bffaN/ufBQvOTRyoKnrS9wXuvK5+sWS+G1cH8clFx5Ettu/eDAnO2kP8pAliJwapNNnwJreFPbwVioODCQ9nLgc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.84_2)
 (envelope-from <andrew@lunn.ch>)
 id 1g0Y3X-0000TD-DZ; Thu, 13 Sep 2018 22:17:39 +0200
Date: Thu, 13 Sep 2018 22:17:39 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Vijay Khemka <vijaykhemka@fb.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au,
 andrew@aj.id.au, afaerber@suse.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH] ARM: dts: aspeed: Adding Facebook TioagaPass BMC
Message-ID: <20180913201739.GG23892@lunn.ch>
References: <20180913195751.1833227-1-vijaykhemka@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180913195751.1833227-1-vijaykhemka@fb.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
X-List-Received-Date: Thu, 13 Sep 2018 20:35:20 -0000

> +++ b/arch/arm/boot/dts/Makefile
> @@ -1206,4 +1206,5 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-opp-witherspoon.dtb \
>  	aspeed-bmc-opp-zaius.dtb \
>  	aspeed-bmc-portwell-neptune.dtb \
> +	aspeed-bmc-facebook-tiogapass.dtb \

Hi Vijay

These entries are normally kept in alphabetic order.

> +	leds {
> +		compatible = "gpio-leds";
> +		postcode0 {
> +			label="BMC_UP";

Documentation/leds/leds-class.txt

LED Device Naming
=================

Is currently of the form:

"devicename:colour:function"

	Andrew
