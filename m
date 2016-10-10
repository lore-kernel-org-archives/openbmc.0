Return-Path: <linus.walleij@linaro.org>
Received: from mail-oi0-x22f.google.com (mail-oi0-x22f.google.com
 [IPv6:2607:f8b0:4003:c06::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sssvw0GsJzDrbq
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 18:59:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b=Zj395pQ0; 
 dkim-atps=neutral
Received: by mail-oi0-x22f.google.com with SMTP id y2so40395827oie.0
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 00:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=h2x/j9JpXWeGtuhy4d/MiEoFqVw8OkOjb4Elqkk+3vc=;
 b=Zj395pQ0LVzAv1qRt1bcysO7KTqECoffw7gl0hirRQ189iCG3d6n3OgkT4T2xxnHL7
 okf4bpqFZC+aJkEQD6flOvEjBJ0D+0jyQnwkzsI/lbAThOr1kjQXphxGCepM9MnossZk
 pwjm1njsijGHjKX0wBWsNQ9s7iFEX+rRZpnvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=h2x/j9JpXWeGtuhy4d/MiEoFqVw8OkOjb4Elqkk+3vc=;
 b=ifbxECDF3vjQCXgr8jp6bbkpnCSh+tLdq5ZRdKVRCKvNuiejmbscCBxTZP7BsAuDlS
 7syVqWmb08jQEraDGCItvHa6fTY6+WSB51xpvAvYrZUozEyifUKbwY6KNlPbuyE1Gbgy
 /Hl9RUut2yLpSHZumrD9fpz5VilIrXubTmTzCbEuSw9HaEuU0013r9AVWQ3ZRfFXypRG
 3cr9qVDIHfW7NkLCYeVflU57LXIYaiJ/gVqY/uVopLoCGBryCDiwALMvK01i00ETLhfe
 4ZRr5VEwJrHxe9B7X1rSwbHBpiA62SE/83LLC+HifXKesmtNLvOT0QZ5+naNyW9PMBGu
 TfWA==
X-Gm-Message-State: AA6/9Rld5rYm9JDgmu6aVHkDHgv4B9jPCa5ir/njKaz/+DRPz62zo1qmHt9KMpQsD5W5qFgGSwBxKwwUZuv6BRkj
X-Received: by 10.157.35.166 with SMTP id t35mr2525610otb.210.1476086345788;
 Mon, 10 Oct 2016 00:59:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.146.12 with HTTP; Mon, 10 Oct 2016 00:59:05 -0700 (PDT)
In-Reply-To: <bdd34f8c4bfabbc1d3cd05a66ac8734da514b1e5.1474986045.git-series.andrew@aj.id.au>
References: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
 <bdd34f8c4bfabbc1d3cd05a66ac8734da514b1e5.1474986045.git-series.andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 Oct 2016 09:59:05 +0200
Message-ID: <CACRpkdaq63o_LFgoocYfPMKf4fVVSvJZnp3t9Wu2XBkKb0Lrdg@mail.gmail.com>
Subject: Re: [PATCH 4/8] pinctrl: aspeed-g5: Fix pin association of SPI1
 function
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 openbmc@lists.ozlabs.org
Content-Type: text/plain; charset=UTF-8
X-Mailman-Approved-At: Mon, 10 Oct 2016 19:54:26 +1100
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
X-List-Received-Date: Mon, 10 Oct 2016 07:59:08 -0000

On Tue, Sep 27, 2016 at 4:50 PM, Andrew Jeffery <andrew@aj.id.au> wrote:

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

Patch applied for fixes.

Yours,
Linus Walleij
