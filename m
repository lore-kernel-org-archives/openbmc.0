Return-Path: <robherring2@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
 [209.85.218.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sshT35vBVzDrPL
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 11:53:43 +1100 (AEDT)
Received: by mail-oi0-f65.google.com with SMTP id i127so5534778oia.0
 for <openbmc@lists.ozlabs.org>; Sun, 09 Oct 2016 17:53:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uM7Ejasm7Ro0kCEWtWfdE0X5gZucJQjTVriRU1JrMhw=;
 b=lbJehCLt0X6oFrJ+lVDrhfaQ3R9lagc2b22ntRgdrcVIgAgTLsaiZQ2FDW5US99Fxr
 +a2k2a5s9htcDKerPJX2gl0xubrrv9GvR2DcNaMyu0ysIboiHKLF7O8b38PZMqoTn6Tt
 29+vjuX4CObDcg01Sv+Bs5+RGujdsbOZwEyjBJDBKaXgSPDtYJtZ2B0jGAfwUHKeKXvM
 73BeEisS5Do19TIabbNpB3QZhkrwYH2eVVcx2ZBFEOKgMTg5zpZjc19KzgeiLXzlxZGP
 ccsadruEMlVaZ79wQayourdpnxlgebfftKAJEfUobNBz09Z2vJ5MR4rXctKOwONvCjwr
 Tg3w==
X-Gm-Message-State: AA6/9Rn99bc0cYqDCKgvpkUoa/ThwnzFtxymJ1VyQMkh+7MgJx7VpxNNVxx8n3aZRdNpDQ==
X-Received: by 10.157.15.246 with SMTP id m51mr15570458otd.105.1476060821668; 
 Sun, 09 Oct 2016 17:53:41 -0700 (PDT)
Received: from localhost (72-48-98-129.dyn.grandenetworks.net. [72.48.98.129])
 by smtp.gmail.com with ESMTPSA id
 v3sm1035060oie.9.2016.10.09.17.53.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 09 Oct 2016 17:53:40 -0700 (PDT)
Date: Sun, 9 Oct 2016 19:53:39 -0500
From: Rob Herring <robh@kernel.org>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH 8/8] pinctrl: aspeed-g5: Add mux configuration for all pins
Message-ID: <20161010005339.GA29854@rob-hp-laptop>
References: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
 <a17175fdeaf1656afa307a180a4ab4953d4ad19c.1474986045.git-series.andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a17175fdeaf1656afa307a180a4ab4953d4ad19c.1474986045.git-series.andrew@aj.id.au>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Mon, 10 Oct 2016 00:53:44 -0000

On Wed, Sep 28, 2016 at 12:20:20AM +0930, Andrew Jeffery wrote:
> The patch introducing the g5 pinctrl driver implemented a smattering of
> pins to flesh out the implementation of the core and provide bare-bones
> support for some OpenPOWER platforms and the AST2500 evaluation board.
> Now, update the bindings document to reflect the complete functionality
> and implement the necessary pin configuration tables in the driver.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt |   17 +-

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c                   | 1476 ++++++-
>  drivers/pinctrl/aspeed/pinctrl-aspeed.h                      |    1 +-
>  3 files changed, 1487 insertions(+), 7 deletions(-)
