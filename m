Return-Path: <robherring2@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
 [209.85.218.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3snrrZ0thLzDrL1
 for <openbmc@lists.ozlabs.org>; Tue,  4 Oct 2016 05:57:18 +1100 (AEDT)
Received: by mail-oi0-f66.google.com with SMTP id r132so8723801oig.1
 for <openbmc@lists.ozlabs.org>; Mon, 03 Oct 2016 11:57:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=O31RTNW46ly3cAaCz4Uf+tpropSaJzAV7pxc/Z0yKAc=;
 b=i0usc/vCXcx8J8Zix/X8rIAOVMvHlYj7o1uobsx/SDrzDrGYW3xcSli+/Sfe32R+Dh
 PRfKud/1LBXtXnPX8nsfda3KGEn+x4W+MPzGHhhFvIocmcTxG6NmYwX7Z8mnGjp0grR2
 3Gq7UWOAdEf6/joi5ZLn8/fpm6FS3quWXZrck0xhe2/v1iLQ0CeKtMohn1hiHgMJQy/3
 590IDLDpW4rNhV4hCQ2zyL3HulMvy0JrJxs+22eofDxF+lEOV1rAIjPgM9beOEFDKNqe
 2Sr7UU15CwkZp8bcQBUTrRd3NWMq+dwL+Y4WV4NPg+PUXC+ieJW5EsXokUnhnbazYh3F
 kRvw==
X-Gm-Message-State: AA6/9RkDym3mh4VXmLGMqExve5UbYB0fsx3vupfTLIEYP64KFH1aWOoid4IR7KkAlW4Eew==
X-Received: by 10.157.60.67 with SMTP id j3mr14135148ote.183.1475521035202;
 Mon, 03 Oct 2016 11:57:15 -0700 (PDT)
Received: from localhost (72-48-98-129.dyn.grandenetworks.net. [72.48.98.129])
 by smtp.gmail.com with ESMTPSA id
 p46sm11883843otp.8.2016.10.03.11.57.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Oct 2016 11:57:14 -0700 (PDT)
Date: Mon, 3 Oct 2016 13:57:13 -0500
From: Rob Herring <robh@kernel.org>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH 4/8] pinctrl: aspeed-g5: Fix pin association of SPI1
 function
Message-ID: <20161003185713.GA30227@rob-hp-laptop>
References: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
 <bdd34f8c4bfabbc1d3cd05a66ac8734da514b1e5.1474986045.git-series.andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdd34f8c4bfabbc1d3cd05a66ac8734da514b1e5.1474986045.git-series.andrew@aj.id.au>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Tue, 04 Oct 2016 09:24:05 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Oct 2016 18:57:18 -0000

On Wed, Sep 28, 2016 at 12:20:16AM +0930, Andrew Jeffery wrote:
> The SPI1 function was associated with the wrong pins: The functions that
> those pins provide is either an SPI debug or passthrough function
> coupled to SPI1. Make the SPI1 mux function configure the relevant pins
> and associate new SPI1DEBUG and SPI1PASSTHRU functions with the pins
> that were already defined.
> 
> The notation used in the datasheet's multi-function pin table for the SoC is
> often creative: in this case the SYS* signals are enabled by a single bit,
> which is nothing unusual on its own, but in this case the bit was also
> participating in a multi-bit bitfield and therefore represented multiple
> functions. This fact was overlooked in the original patch.
> 
> Fixes: 56e57cb6c07f (pinctrl: Add pinctrl-aspeed-g5 driver)
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt |  4 +-

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c                   | 86 ++++++-
>  2 files changed, 81 insertions(+), 9 deletions(-)
