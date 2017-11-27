Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::242; helo=mail-vk0-x242.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="LWrG53qz"; 
 dkim-atps=neutral
Received: from mail-vk0-x242.google.com (mail-vk0-x242.google.com
 [IPv6:2607:f8b0:400c:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ylybq32hBzDqpj
 for <openbmc@lists.ozlabs.org>; Tue, 28 Nov 2017 07:11:01 +1100 (AEDT)
Received: by mail-vk0-x242.google.com with SMTP id p80so18206569vkd.10
 for <openbmc@lists.ozlabs.org>; Mon, 27 Nov 2017 12:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=VExgoh0D9b8XuNbAKMLrxYI6+/aa3oxFxKjDFoSSzxU=;
 b=LWrG53qzuYmhn/GtBU8DwPFJ/WQ84okfOS+TRqX9aM1I7hiX9ahTwHMYuk1QLsnxgE
 qBXYmiFwOHCJNjO5YBB2YC1LhtFFFmtZqQH2AKP7PMNqamJ0z4cS9FBcvVLOYP2ok/zO
 WcdIFKypHQ1rKCe9+H0wiTBKFVUuqrS643cPUR9m5X4D5Pv7BguO6Zzv0o0bbSxXLBq7
 Po9r50jmGjIQiEu8ia2CNbIh6xgqLfqbV7iGSHMg05oEjGBg4O+BWI8UznAcPmqznzBC
 LmFGqM9uSlngXFNWAmgh3LWEBJaTjfnxkwrhLUc5Rv77O7EOjRLtVjA+qLpzwt9RZsn6
 CTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=VExgoh0D9b8XuNbAKMLrxYI6+/aa3oxFxKjDFoSSzxU=;
 b=f0VQZrHcnqtEDpe66T6fsMQnfccSsR8wicdv9paclMUTr32ducgYiuO2aA7KwQCmSI
 DxXc6JLOUQHnigrV70SprSRFhykTULgXNLsDy9a97DpDohkD2POMklqFXuwmQiYs6luQ
 p8KNSr+rO8E2bBDWVY/D2PJ6ZasaYWaBN8jkDnr5jCc1oEucIk2rf6F8RmuvChSuqXYO
 x4aRH2fcnGUkxAeEOWP/arp9NGDBV4ffWPCP0Rc5GLdL9jQYiSJofjPZavXqQG3YEhd9
 C1urRnRK0ymVANLRFlP35hPt/xwBjnBWOE7PJduIqlNyZjtB/g7oorhhJny9H1+r+imS
 Rx0A==
X-Gm-Message-State: AJaThX5p98UPo0LWTVH9FwDKGyKJGUqfVVZ9A4ZCADz8assSirdoUX8k
 AsUNkH6aYO6/ewZ9iOxR+36zPpB/EoEfZEyvSvki1A==
X-Google-Smtp-Source: AGs4zMaN79on8DNABuElnnlA/+Z+QynO8pyLGPIg55RC4gAMn2Uqr7zbw07Rc0DcP4WRo8Q49T3p5ZiKlmBW6q8Dwpc=
X-Received: by 10.31.55.67 with SMTP id e64mr27888026vka.143.1511813457479;
 Mon, 27 Nov 2017 12:10:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.94.150 with HTTP; Mon, 27 Nov 2017 12:10:36 -0800 (PST)
In-Reply-To: <20171127200738.188390-1-venture@google.com>
References: <20171127200738.188390-1-venture@google.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 27 Nov 2017 12:10:36 -0800
Message-ID: <CAO=notyiwG+HeGNXqdk1TPnYu40CEWdeL_ukujkHwYSkGwvmqQ@mail.gmail.com>
Subject: Re: [PATCH linux] ARM: dts: aspeed-g4: add serial gpio driver entry
To: Patrick Venture <venture@google.com>, Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Nov 2017 20:11:04 -0000

There isn't yet a binding for this, but if it's acceptable. I'm going
to submit a gpio driver strictly for the serial gpio once I can test
on an ast2500.  I'm presently finalizing the ast2400 version of the
driver.

- Patrick

On Mon, Nov 27, 2017 at 12:07 PM, Patrick Venture <venture@google.com> wrote:
> Adds the serial gpio driver entry for the aspeed
> ast2400.
>
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
>  arch/arm/boot/dts/aspeed-g4.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
> index 424d843ec1da..b82ebefcb025 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -238,6 +238,15 @@
>                                 clocks = <&clk_hpll>;
>                         };
>
> +                       sgpio: gpio@0x1e780200 {
> +                               #gpio-cells = <2>;
> +                               gpio-controller;
> +                               compatible = "aspeed,ast2400-sgpio";
> +                               reg = <0x1e780200 0x100>;
> +                               interrupts = <40>;
> +                               interrupt-controller;
> +                       };
> +
>                         timer: timer@1e782000 {
>                                 compatible = "aspeed,ast2400-timer";
>                                 reg = <0x1e782000 0x90>;
> --
> 2.15.0.417.g466bffb3ac-goog
>
