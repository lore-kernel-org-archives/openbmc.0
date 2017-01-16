Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v22d16pyMzDqSM
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jan 2017 16:59:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MhrvUzip"; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id w144so7386949oiw.1
 for <openbmc@lists.ozlabs.org>; Sun, 15 Jan 2017 21:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=2dadxp8cAqcelk/fqHDCbkgt7CpH6WOAwuK+E5gK0U8=;
 b=MhrvUzip369UtJlvDv+q/yt07l6ZbCe8rzAjMnPZEEAswAkr1/w179Fu4M0+72DrOE
 QJbo7kMDYZbHw5eb35tGv887setWsBNIdBpFms2G1OyCivnv9cT+CVHOAWrwbNVgAyly
 x49LJxdydP7npgoKfA70xTb/lo9YJa/slRzV/3n8vKssIKhU+lMQ4qFNFwBW5CRVAXm7
 1p1QmpXpMOtpkjDy/snru3wlGy8ruQmiaX4+Ee9ff5V7TRrxqw9ZHZnxIZBl2gb1Jc9k
 aE3konQbLiABNIw1QJMFIMK57hn7bpsnAlpzUkVSjLUZmJHx7R/DM0tk8aZqOcUNL43/
 0kcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=2dadxp8cAqcelk/fqHDCbkgt7CpH6WOAwuK+E5gK0U8=;
 b=U0LDv+UBvAcjKXpVf6LM/mUt/EzHlV18uCO8PefLe1oKY2Scpe0dEQfbG8q3vLsk9R
 tjlmR3VVjnEyY+4pta5DI3c7jbBKCORyrT9BlVEEIsAeCkTsFjdkZSjiFSFHDaLZt/Q3
 s1izR3ra2xjf3O3KEAnLqbkRqgZTgFvPZyw/fargQarJwx22zO3vxz2zninGCBb1RQKL
 R0z22oiOjb0qXYLYJ43LBQIKIWYNMVE7+JQOQWM1puhbsJ4/5JSOx1AqRju0FROiLPss
 D9H90eclbXaqdUQpwrh0T4A9UI4NyIDziYGgFXVHxXYpMcoN0qA6YLYuUjMf/ugQ9pSb
 aEgQ==
X-Gm-Message-State: AIkVDXKgdo7F94Okdg9KN8JnfaNH1tHTeutJz2eZE71jIfg4+FiXDQr9haB7ANLuP9mZs5lvbXjeSSNHKLlYgw==
X-Received: by 10.202.180.85 with SMTP id d82mr15992591oif.210.1484546388074; 
 Sun, 15 Jan 2017 21:59:48 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.245.201 with HTTP; Sun, 15 Jan 2017 21:59:27 -0800 (PST)
In-Reply-To: <20170116053740.15299-3-cyrilbur@gmail.com>
References: <20170116053740.15299-1-cyrilbur@gmail.com>
 <20170116053740.15299-3-cyrilbur@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 16 Jan 2017 16:59:27 +1100
X-Google-Sender-Auth: J_rmDOC6-OeLB_5PSpbovCuTZ-A
Message-ID: <CACPK8XeKTCk3uk9xVKp6ZNu1cBsE=HJEKMiRttOR_2qKy77Udg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: aspeed-bmc-opp-witherspoon: Enable
 mailbox and LPC control nodes
To: Cyril Bur <cyrilbur@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
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
X-List-Received-Date: Mon, 16 Jan 2017 05:59:50 -0000

On Mon, Jan 16, 2017 at 4:37 PM, Cyril Bur <cyrilbur@gmail.com> wrote:
> Also add the reserved-memory node needed by the LPC control driver.
>
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>

Applied to dev-4.7.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 9badf3e94599..c7c1917f2d89 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -19,6 +19,17 @@
>         memory {
>                 reg = <0x80000000 0x40000000>;
>         };
> +
> +       reserved-memory {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +
> +               flash_memory: region@94000000 {
> +                       no-map;
> +                       reg = <0x94000000 0x04000000>; /* 64M */
> +               };
> +       };
>  };
>
>  &fmc {
> @@ -44,6 +55,16 @@
>         };
>  };
>
> +&lpc_ctrl {
> +       status = "okay";
> +       memory-region = <&flash_memory>;
> +       flash = <&spi1>;
> +};
> +
> +&mbox {
> +       status = "okay";
> +};
> +
>  &uart1 {
>         /* Rear RS-232 connector */
>         status = "okay";
> --
> 2.11.0
>
