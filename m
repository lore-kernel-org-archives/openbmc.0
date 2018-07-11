Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::243; helo=mail-qk0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jO4JlyIh"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="TOXsNAgU"; 
 dkim-atps=neutral
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41QSHc4kPhzF35b
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jul 2018 15:27:08 +1000 (AEST)
Received: by mail-qk0-x243.google.com with SMTP id z74-v6so12836825qkb.10
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jul 2018 22:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=/fd434Ka0gFUoeUoHy2Wty9d4bMSVxJ4qPKzdZiWG8c=;
 b=jO4JlyIhkEvJtan63yf6cxmZxKNrx7r1vQjGoaYGHTAnwEOoNeB5OFW2mvuBNAS95s
 uJDV4QT6f/MR9pGZdERCrsLymoYPIuyprlzlDdaZPnmfkdSs/vStoPuS3CpWVS9lxD8E
 VeLQEeDhglOYVl7aKqkKG8NkO/1ZRDoyUaoG2SzNooBQRjVLyIL0BygE3VtH94M83yw4
 kM+e43dkGYKhDRj7WmQcx2m8VPLR8e68j21t0Mfo4oAIfQMnQVPfKJRrK3KcbfQ3CRfh
 tcxX6whG0KRpuLLqqllVa3cs2l5hRJwncyDQbE6zRDNxd7ofy/a9rQYVLOPKx7HpIGdd
 9d+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=/fd434Ka0gFUoeUoHy2Wty9d4bMSVxJ4qPKzdZiWG8c=;
 b=TOXsNAgUIYpXN/NN7ZmlWrmTFXI5xpbKo4ohORaF38zmqQJqO6h3UBXh57rOFPM1wG
 A18rvCG6URclA0MAVxzTkcxs7j+BwZtaJv3CpKuTXsu9gooilH6oGuTgstcoIMbIoX7e
 rujCk16Mp1ikNToJA96UMO7jOsSOMNIYRtnW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=/fd434Ka0gFUoeUoHy2Wty9d4bMSVxJ4qPKzdZiWG8c=;
 b=e6xhuygOiFJIe8bZxRWABoXgTxGGvy0VvO0FPfROKYYZx6jARYtLVIKvuxaBAaHZas
 tG0evf0XdBjzuZAZ0e6yN7Tj2KEOzq9eSwgZAX+z+kxBj4E/7dn7mLyCcwG2zku87m+y
 ysARBqbChtktqE4v/Im/ZY2DFYNSWapyFlYyCVlqYGhVLY8lQ+WvvEt+8wsZY37GPPkD
 eW/eZSOYnqdfkiIZqOHlp1Ivs/eQj1p+tce1aPsIOHWgtB67ckFtbS1Sse/Fpg96hcAX
 Lxp/pKDkD9kjk3VOSYpEKMDR26N94zO1Sour4YZlgl4dFBebQgAQmbu8INAKIlPj0TOa
 bLNA==
X-Gm-Message-State: APt69E1I2GxKs13HD8LpWOQfQI8OiOv5bHNU/TgxqPNZCeKfzOltW5St
 HVtaTCtr+UiVnhz3YovlENCCFvOlDVsI6L4uce0=
X-Google-Smtp-Source: AAOMgpcgP/g+oJeyO7jquuyb1/Nn6OKdYltgJvz5vPMZfV1uzhB/K2U/QxlKwgTBDYKRit05DOhLkGAUBQ8glejY6Z4=
X-Received: by 2002:a37:c44d:: with SMTP id
 h13-v6mr24184439qkm.422.1531286825765; 
 Tue, 10 Jul 2018 22:27:05 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 2002:ac8:169d:0:0:0:0:0 with HTTP; Tue, 10 Jul 2018 22:26:45
 -0700 (PDT)
In-Reply-To: <1531286230-28453-3-git-send-email-ryanchen.aspeed@gmail.com>
References: <1531286230-28453-1-git-send-email-ryanchen.aspeed@gmail.com>
 <1531286230-28453-3-git-send-email-ryanchen.aspeed@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 Jul 2018 15:26:45 +1000
X-Google-Sender-Auth: LmHYX0faTYZlrXXUMPW54jIPMyE
Message-ID: <CACPK8Xdx+tkFWv+0AwDpV0KW9V1-jEvtaZG5qBc7CrtygWvLmw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.17 2/7] clk: Aspeed: Add sdhci reset and clock
To: Ryan Chen <ryanchen.aspeed@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Lei YU <mine260309@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Jul 2018 05:27:09 -0000

On 11 July 2018 at 15:17, Ryan Chen <ryanchen.aspeed@gmail.com> wrote:
> 1.Add Aspeed sdhci reset for SCU04 bit 16
> 2.Aspeed sdhci have two clock one is for controller clock,
> another is for SD card clock. so when enable sdhci need enable
> both.
>
> Signed-off-by: Ryan Chen <ryanchen.aspeed@gmail.com>
> ---
>  drivers/clk/clk-aspeed.c                 | 8 +++++++-
>  include/dt-bindings/clock/aspeed-clock.h | 2 +-
>  2 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> index 9e55743..cd1f3b2 100644
> --- a/drivers/clk/clk-aspeed.c
> +++ b/drivers/clk/clk-aspeed.c
> @@ -20,6 +20,7 @@
>
>  #define ASPEED_RESET_CTRL      0x04
>  #define ASPEED_CLK_SELECTION   0x08
> +#define  ASPEED_SDIO_CLK_EN BIT(15)
>  #define ASPEED_CLK_STOP_CTRL   0x0c
>  #define ASPEED_MPLL_PARAM      0x20
>  #define ASPEED_HPLL_PARAM      0x24
> @@ -260,6 +261,11 @@ static int aspeed_clk_enable(struct clk_hw *hw)
>         enval = (gate->flags & CLK_GATE_SET_TO_DISABLE) ? 0 : clk;
>         regmap_update_bits(gate->map, ASPEED_CLK_STOP_CTRL, clk, enval);
>
> +       /* sd ext clk */
> +       if (gate->reset_idx == 16) {
> +               regmap_update_bits(gate->map, ASPEED_CLK_SELECTION, ASPEED_SDIO_CLK_EN, ASPEED_SDIO_CLK_EN);

We do not special case individual clocks. The reset should instead be
added to the aspeed_gates structure above.

In fact, it already is:

        [ASPEED_CLK_GATE_SDCLKCLK] =    { 27, 16, "sdclk-gate",
 NULL,   0 }, /* SDIO/SD */

Although in that table it is 16, and you specify bit 15. The data
sheet I have says SD/SDIO is bit 16.


> +       }
> +
>         if (gate->reset_idx >= 0) {
>                 /* A delay of 10ms is specified by the ASPEED docs */
>                 mdelay(10);
> @@ -317,7 +323,7 @@ static const u8 aspeed_resets[] = {
>         [ASPEED_RESET_PECI]     = 10,
>         [ASPEED_RESET_I2C]      =  2,
>         [ASPEED_RESET_AHB]      =  1,
> -
> +       [ASPEED_RESET_SDHCI]    = 16,
>         /*
>          * SCUD4 resets start at an offset to separate them from
>          * the SCU04 resets.
> diff --git a/include/dt-bindings/clock/aspeed-clock.h b/include/dt-bindings/clock/aspeed-clock.h
> index 4476184..088553f 100644
> --- a/include/dt-bindings/clock/aspeed-clock.h
> +++ b/include/dt-bindings/clock/aspeed-clock.h
> @@ -50,5 +50,5 @@
>  #define ASPEED_RESET_I2C               7
>  #define ASPEED_RESET_AHB               8
>  #define ASPEED_RESET_CRT1              9
> -
> +#define ASPEED_RESET_SDHCI             10
>  #endif
> --
> 2.7.4
>
