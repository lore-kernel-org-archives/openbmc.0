Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v22ch3sXkzDqSM
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jan 2017 16:59:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="N/b/HI0S"; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id j15so11829034oih.0
 for <openbmc@lists.ozlabs.org>; Sun, 15 Jan 2017 21:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=EQgRUSOkHLVddtna7RYwtK1lyRweRhVKr5Y/YHMS40A=;
 b=N/b/HI0SYUVeBnoGH4Og7TmJ7FtNh4JL9ktjcY9HtK0BfqwnDNneLOwtL06508R6kG
 YGR4bL46PDTQ2UpEBKpmzMssA9bbwsnjmT0je6cNZQxT9zUM9nyeuYHk7JQjuSklo/FW
 B594Z1U1dbET7tXav/j1BlceEW8dca72bIQJpREmAAucPFPHsGzJzbyTJkpwMmHOy8PI
 dKfneyjZ2jXjF4zdx6R6bc9naJ4jeu0vK7kBl6t8BvyCZg0Qa/PPIo8fJzFFNRFn0+4l
 FnjORt3PlZjE8Jn0D5C3mHDzYcRPvR7qGU7ThD93VEZAUXalBSxEuYu/Zdaf2Xx55OI1
 Abow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=EQgRUSOkHLVddtna7RYwtK1lyRweRhVKr5Y/YHMS40A=;
 b=CUfXymoeKOTecSOtwbqIWICoU9k+7higXjCGAevE8hoJSjTUCztMI7sdq+QWWau3bG
 YqAvSHoDsYyEm9eOOIvlA7QT4n3HNTbkypcaxJtKfYEvGOAtFdEm0iTsfDi4x8dE0fRp
 nj+tlglz9bvWl/UgZJnB3Pm/eEQQ60X4b13yjensbQHVQeY32b6yFwPxDfQbdkbfcPY4
 yWZq4LCaZ27/XQvJLNMXQhK71bZzg539btqNcdLcVyTRpmu9QsMu6WKpVYK+1hK5IztL
 JkQC0eE1cKTp6syGjtdixuy1XxtvFN7O8sa0cDto2t1O3MxDTn9z1VsmB4VC8UUrXwYf
 h7FA==
X-Gm-Message-State: AIkVDXJHwKvWP3GxKWlXVTJAZfuBYuPrnW+2JEsBF4gyF1H9x8HotoQdnMDO970L9i40Z71jnJiYkaEp2ylvsw==
X-Received: by 10.202.195.144 with SMTP id t138mr15782244oif.142.1484546370347; 
 Sun, 15 Jan 2017 21:59:30 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.245.201 with HTTP; Sun, 15 Jan 2017 21:59:09 -0800 (PST)
In-Reply-To: <20170116053740.15299-2-cyrilbur@gmail.com>
References: <20170116053740.15299-1-cyrilbur@gmail.com>
 <20170116053740.15299-2-cyrilbur@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 16 Jan 2017 16:59:09 +1100
X-Google-Sender-Auth: ftog0AWS4eVaHsn1xnxwllPMRGE
Message-ID: <CACPK8XepJsiG+Y3h8eA8DQzMh-SXnZFyDwJCvMB5zQNE3ceMoA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] ARM: dts: aspeed-bmc-opp-zaius: Enable mailbox and
 LPC control nodes
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
X-List-Received-Date: Mon, 16 Jan 2017 05:59:33 -0000

On Mon, Jan 16, 2017 at 4:37 PM, Cyril Bur <cyrilbur@gmail.com> wrote:
> Also add the reserved-memory node needed by the LPC control driver.
>
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>

This did not apply as you have sent it based on an old tree. I fixed
that for you.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index 0adf6e7e284c..cb43a597de5a 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -20,6 +20,17 @@
>                 reg = <0x80000000 0x40000000>;
>         };
>
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
> +
>         onewire0 {
>                 compatible = "w1-gpio";
>                 gpios = <&gpio ASPEED_GPIO(H, 0) GPIO_ACTIVE_HIGH>;
> @@ -98,6 +109,16 @@
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
>  &uart5 {
>         status = "okay";
>  };
> --
> 2.11.0
>
