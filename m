Return-Path: <linus.walleij@linaro.org>
Received: from mail-qt0-x229.google.com (mail-qt0-x229.google.com
 [IPv6:2607:f8b0:400d:c0d::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t06f90NLMzDvWr
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 22:53:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b=Ivq5cfm0; 
 dkim-atps=neutral
Received: by mail-qt0-x229.google.com with SMTP id s49so49798232qta.0
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 04:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=WNFJXAMrHgzwT6SBRAlmoXLL51gbajY6Sj4Yu6o7ydw=;
 b=Ivq5cfm0rz286+80sN/X7wjzonT5IvOOVqj6EPmsvKO5qdXwj7MPwDb+13SHtHZ2aR
 RbI46DfotIv16Sn/xhr0njQ0Ifz/tPUMUE1blozkZItryV1KdgVG+sFel9VomuVWAJoR
 IBGAzAv76IERrNHhAq34A43x/6vcMbApWLP1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=WNFJXAMrHgzwT6SBRAlmoXLL51gbajY6Sj4Yu6o7ydw=;
 b=Reu4RLbVZxpLvGVq1j6/PIELaNCtpvVq4RPcV0yLB3ACvrc7GvOl69HoTIvTKncDoK
 2ipNKsD5IZUY9oJN1rpC0/KlxffoeGxiBZLuIiktwFFNnKm6l6qA5gFn4lFc0r3PWXmJ
 87lXM2FDXYzsUBSrrlH1eZOTmOWMgF4j00CJ6X+JonasUbdjq7ZIWTpuYiuBP5HC3qw6
 G5QjcKRihOZH+OhQ7+J5UfLsJxqZmEEtdm0ADAesrsgsjJbmvq9VPhhM4+5eOBz+eOcz
 PoTQ9UZcHfbyVogKaOx+GwzwEphnQd1ZKc1zNZzOlGKuUPTALapKJqbRHxk1KsL/RVXt
 CgmA==
X-Gm-Message-State: ABUngvfq+KuPxdjDzzk37yAYJt13yUbIbH/tDOYTojeHrAd6qeiYb79CEIjgxTNwbCpmEfDsQNVe/qRacxMhUXz9
X-Received: by 10.200.50.22 with SMTP id x22mr286102qta.129.1476964429856;
 Thu, 20 Oct 2016 04:53:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.140.13 with HTTP; Thu, 20 Oct 2016 04:53:49 -0700 (PDT)
In-Reply-To: <b5f67ba76018314d08e240f95951751896687d37.1474986045.git-series.andrew@aj.id.au>
References: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
 <b5f67ba76018314d08e240f95951751896687d37.1474986045.git-series.andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 20 Oct 2016 13:53:49 +0200
Message-ID: <CACRpkdYLDesENtq2cQBrWQeL6NH+mO_N5Z=e9=gsoZSCE85Jag@mail.gmail.com>
Subject: Re: [PATCH 6/8] pinctrl: aspeed-g4: Capture SuperIO pinmux dependency
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 openbmc@lists.ozlabs.org
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Thu, 20 Oct 2016 11:53:53 -0000

On Tue, Sep 27, 2016 at 4:50 PM, Andrew Jeffery <andrew@aj.id.au> wrote:

> Two LPC-related signals in the AST2400 depend on state in the SuperIO IP
> block. Use the recently added infrastructure to capture this
> relationship.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied for v4.10.
(Tell me if I'm applying patches in wrong order or something, and
I hope this doesn't clash with the fixes.)

Yours,
Linus Walleij
