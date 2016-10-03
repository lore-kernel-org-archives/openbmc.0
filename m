Return-Path: <robherring2@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
 [209.85.218.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sns5c3PmbzDrL1
 for <openbmc@lists.ozlabs.org>; Tue,  4 Oct 2016 06:08:36 +1100 (AEDT)
Received: by mail-oi0-f65.google.com with SMTP id h186so8004608oia.3
 for <openbmc@lists.ozlabs.org>; Mon, 03 Oct 2016 12:08:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=D5C/VlgH2GbgFe5G0VFZXZ8QkQXOH1h9FIYG5fValAk=;
 b=WiYuul49r7/fDkeSp142lHEDz/KsR3OalUd7l2Er7JDVYverh7/1Cw+fvTcnhe2Alw
 /Cf9dEg7EIyJEREjkqhVwdfQHAQLa2tWxMAZSZf6enicf3dGW4x9vGy3KnJuUDHFGugl
 4y70NWjvSAhx8bpCPOIhKaYywTiB3V0txSgaPrycRi7iGbL4GewnHPp/BYQyNB1MUr0h
 A/7eVRZ+rLaCMjydY+hfxUEnuKkzhPEGgR9jnVdaaRm5ciT6RthfXhf1P7xb41OYKZFK
 bodCpfcnB1a75s5eZ7Al5TxtfcRAepNEU3LixwWDi7scP09uGbTAKsuiPW4hnrgH/zFK
 wiQQ==
X-Gm-Message-State: AA6/9RlbCxj7nYbvl8etJmefg/u3aPi3LWj2hYFigk8qstm1DFf6f1X7rjZbspV42KClcA==
X-Received: by 10.202.235.10 with SMTP id j10mr3654766oih.103.1475521714451;
 Mon, 03 Oct 2016 12:08:34 -0700 (PDT)
Received: from localhost (72-48-98-129.dyn.grandenetworks.net. [72.48.98.129])
 by smtp.gmail.com with ESMTPSA id
 r194sm3786325oie.13.2016.10.03.12.08.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Oct 2016 12:08:34 -0700 (PDT)
Date: Mon, 3 Oct 2016 14:08:33 -0500
From: Rob Herring <robh@kernel.org>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 Timothy Pearson <tpearson@raptorengineering.com>
Subject: Re: [PATCH 7/8] pinctrl: aspeed-g4: Add mux configuration for all pins
Message-ID: <20161003190833.GA3065@rob-hp-laptop>
References: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
 <e0d8fa6cd444972e6f048f98da98f0439e6ca39b.1474986045.git-series.andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0d8fa6cd444972e6f048f98da98f0439e6ca39b.1474986045.git-series.andrew@aj.id.au>
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
X-List-Received-Date: Mon, 03 Oct 2016 19:08:37 -0000

On Wed, Sep 28, 2016 at 12:20:19AM +0930, Andrew Jeffery wrote:
> The patch introducing the g4 pinctrl driver implemented a smattering of
> pins to flesh out the implementation of the core and provide bare-bones
> support for some OpenPOWER platforms. Now, update the bindings document
> to reflect the complete functionality and implement the necessary pin
> configuration tables in the driver.

We prefer bindings to be complete if possible where as drivers can be 
expanded over time.

> 
> Cc: Timothy Pearson <tpearson@raptorengineering.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt |   19 +-

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c                   | 1094 ++++++-
>  2 files changed, 1093 insertions(+), 20 deletions(-)
