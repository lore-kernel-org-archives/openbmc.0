Return-Path: <bjwyman@gmail.com>
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com
 [IPv6:2607:f8b0:400d:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xh4NT5JyszDqF0
 for <openbmc@lists.ozlabs.org>; Tue, 29 Aug 2017 07:17:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ojQkIGjo"; 
 dkim-atps=neutral
Received: by mail-qk0-x242.google.com with SMTP id m4so1498771qke.4
 for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2017 14:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=OfcSc4oXJyS4PbN5x2V1y5w0VYIxfqkAj9p7IdM31Uk=;
 b=ojQkIGjoa8plOJPYWIQ80EI16s0WrT98uBCoJdUERDWANAioVzyZBe+cWZm+HTxymw
 Xb1QrogONhNT1iOim6ZOw1LXdar6+lBOXCCvA81YQo4mcsmGmC/ckzovo6QsDwB7FWav
 KHpGJ0ntmcaIhFzgISzqR90x1vILJt4UtXs0/clGwDGX95rSitEVL/GvS7IE7t23YQ06
 9TArnqPVllZ4lM59wQH+nP7/qgmKGFpUwK7lqZlclIe+UaV4OKxVmEeuhTdyDtcUD5bJ
 Tnf/bpiUOxkEEI/1HE40LnpY1HTKs/uGqO4q5ML6EAiBQ1okDVhL3fJ3EtNAaDQukyXu
 y4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=OfcSc4oXJyS4PbN5x2V1y5w0VYIxfqkAj9p7IdM31Uk=;
 b=esApd5qQLQZZfkn9IuRqodL3cT2UUIiv2iA7Y/VyoiXV3QlaUm8R1HOOxRa+ZoiSN/
 JBH0sA+80ORzLda7t4cSUbqi5y9gUhseuoq4ytUmjKf9mxfFThluFKQSqxExXtG7KgiT
 hW0w3mnn7kaa/dzxpu55MjQIkH+ECl67WeaeYLY9Rx7Ba39PALh0Tc0gvQIqE9PzO0Od
 MIDKAZYI3+kL02k6KYx+mUFeghhVJenCavUJXmt/2XLcjkbPo9HfzslG6Hswx/K3rnF1
 oYzJP3rQtctlZMWWI+KCfQMWr4KQJv+5C4WwA93v+JBVxtw/EHZBgKnMLhLf3aOxSvdN
 fJ0w==
X-Gm-Message-State: AHYfb5iBI75CTbLu5A6+pTs6aqNPgyvTjixNHuBjX9yjkPiMylQfjfsq
 cjF9sh4I55AVl4+q7iWN5lvn3ULBSg==
X-Received: by 10.55.98.77 with SMTP id w74mr2759524qkb.153.1503955041648;
 Mon, 28 Aug 2017 14:17:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.82.232 with HTTP; Mon, 28 Aug 2017 14:17:21 -0700 (PDT)
In-Reply-To: <20170825065244.488-5-andrew@aj.id.au>
References: <20170825065244.488-1-andrew@aj.id.au>
 <20170825065244.488-5-andrew@aj.id.au>
From: Brandon Wyman <bjwyman@gmail.com>
Date: Mon, 28 Aug 2017 16:17:21 -0500
Message-ID: <CAK_vbW0=5JCyfYpk=G16PTH8zAY2+=RgbG4u2aNME6tnfFFk_g@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 4/5] aspeed: witherspoon: Tidy and unify
 LED nodes
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 vishwa@linux.vnet.ibm.com, geissonator@gmail.com, 
 Eddie James <eajames@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 28 Aug 2017 21:17:50 -0000
X-List-Received-Date: Mon, 28 Aug 2017 21:17:50 -0000
X-List-Received-Date: Mon, 28 Aug 2017 21:17:50 -0000

On Fri, Aug 25, 2017 at 1:52 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> There's no reason for these to be separate, the gpios property defines
> the controller needed for each LED. Also fix the node names so we can
> drop the label property.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 25 ++++++++++--------------
>  1 file changed, 10 insertions(+), 15 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index dd30c20c9fb2..81996f070818 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -87,48 +87,43 @@
>                 };
>         };
>
> -       pca_leds {
> +       leds {
>                 compatible = "gpio-leds";
>
>                 fan0 {
> -                       label = "fan0";
>                         default-state = "keep";
>                         gpios = <&pca0 0 GPIO_ACTIVE_LOW>;
>                 };
> +
>                 fan1 {
> -                       label = "fan1";
>                         default-state = "keep";
>                         gpios = <&pca0 1 GPIO_ACTIVE_LOW>;
>                 };
> +
>                 fan2 {
> -                       label = "fan2";
>                         default-state = "keep";
>                         gpios = <&pca0 2 GPIO_ACTIVE_LOW>;
>                 };
> +
>                 fan3 {
> -                       label = "fan3";
>                         default-state = "keep";
>                         gpios = <&pca0 3 GPIO_ACTIVE_LOW>;
>                 };
> -               front_fault {
> -                       label = "front-fault";
> +
> +               front-fault {
>                         default-state = "keep";
>                         gpios = <&pca0 13 GPIO_ACTIVE_LOW>;
>                 };
> -               front_power {
> -                       label = "front-power";
> +
> +               front-power {
>                         default-state = "keep";
>                         gpios = <&pca0 14 GPIO_ACTIVE_LOW>;
>                 };
> -               front_id {
> -                       label = "front-id";
> +
> +               front-id {
>                         default-state = "keep";
>                         gpios = <&pca0 15 GPIO_ACTIVE_LOW>;
>                 };
> -       };
> -
> -       leds {
> -               compatible = "gpio-leds";
>
>                 rear-fault {
>                         gpios = <&gpio ASPEED_GPIO(N, 2) GPIO_ACTIVE_LOW>;
> --
> 2.11.0
>

Tested-by: Brandon Wyman <bjwyman@gmail.com>
