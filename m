Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="k3l9GEIy"; 
 dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 438YvL4LjrzDqVW;
 Wed,  5 Dec 2018 07:51:58 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id n12so10530746qkh.11;
 Tue, 04 Dec 2018 12:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hkWzP0yt40PfczAFgSa/UvNICUnu1M2oCe6p4pZO8eo=;
 b=k3l9GEIySt3MGOrquGqgmfT/0+NcY4IDChY1H6qYsuZ4h2maRvJu7pFEeCcTeoSXbW
 SxVR5H3p3ssA4Ek1Dg/Ykdbt8JnO+DYb2uLyVOYUlT5jXJHZMYe+5Us8rTCtHrgpwnfh
 gQ6JA2UPDSYn2WKKOCfeGIRlx/wrweI1K0IHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hkWzP0yt40PfczAFgSa/UvNICUnu1M2oCe6p4pZO8eo=;
 b=ezTr10r9ZvbbUqDaJKL0z80k9EyV3Pjht9dbkxvEdFMb+5+zABTho0jN0iiNAoAoDu
 XKp56Bu91fAA1A+VMUNyIGG6pbx6uLSPa0ynpCY+ccyQHObyoK0bLG1Fusmw+FEJOrty
 K5nx79MQncjkUe2lz0Qq1o8cXzjnieNMYvkVx9J5GwRlhtmcDIHJVwdwtLPkqWCMfSTU
 cFhVDGdU4trR6+5yFPynJ0n7Kgl1hpsYixF9HH6p4qgb7dziNgR0kM9PMd52ELDynH3V
 pBtlZz757Q783bHDiaqgNmk6+r3zQ2ozBa6/RQ7XKC+LXRqQjpNnFNF4+PIT4zqNKZn9
 W3/g==
X-Gm-Message-State: AA+aEWYTpqGS2d3Sesi3GNp9igDm1r0MYXMLgiUCFjRXLU+1E66oyz1d
 zXUtB+v29w0eBMw9jtpBh+RvWmot/04x6dEF11M=
X-Google-Smtp-Source: AFSGD/UbjOiFHyzCLzEexEd2M7TrM3WrLMSZCQRRlUhHHx0Z5UG6DJ0/ahKSORJZ4bLzGd8iTIKiNWku6P8ESdgxISw=
X-Received: by 2002:a37:2b5b:: with SMTP id r88mr20793549qkh.336.1543956715762; 
 Tue, 04 Dec 2018 12:51:55 -0800 (PST)
MIME-Version: 1.0
References: <20181204185054.24053-1-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20181204185054.24053-1-jae.hyun.yoo@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 5 Dec 2018 07:21:43 +1030
Message-ID: <CACPK8XcwMMoxG6vhDhUU8RYGABx7rtBoxJvp2yDhHeD-PemdqA@mail.gmail.com>
Subject: Re: [PATCH v2] clk: aspeed: Mark lclk (LPC) and espiclk (eSPI) as
 critical
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, vijaykhemka@fb.com, chyishian.jiang@gmail.com,
 linux-clk@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-aspeed@lists.ozlabs.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 "# 3.4.x" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Dec 2018 20:51:59 -0000

Hi Jae,

On Wed, 5 Dec 2018 at 05:20, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> These interfaces are used by host to talk to BMC, and the clock
> source is from the host, usually from PCH. So this commit marks
> the lclk as critical to make it able to be enabled. Also, it marks
> espiclk too because eSPI is sharing the same interface with LPC.

While this is true on the platform you have in mind, on other
platforms this is not the case. They do not use eSPI, and LCLK is
enabled by the driver that is used to configure LPC
(drivers/misc/aspeed-lpc-ctrl.c):

 lpc_ctrl: lpc-ctrl@0 {
     compatible = "aspeed,ast2400-lpc-ctrl";
     reg = <0x0 0x80>;
     clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
 }

I wonder if we need a device tree binding to describe which clocks are critical.

Stephen, please don't merge this patch yet.

Cheers,

Joel


>
> Fixes: 15ed8ce5f84e ("clk: aspeed: Register gated clocks")
> Cc: stable@vger.kernel.org
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>  drivers/clk/clk-aspeed.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> index 596136793fc4..df9504427246 100644
> --- a/drivers/clk/clk-aspeed.c
> +++ b/drivers/clk/clk-aspeed.c
> @@ -95,7 +95,7 @@ static const struct aspeed_gate_data aspeed_gates[] = {
>         [ASPEED_CLK_GATE_DCLK] =        {  5, -1, "dclk-gate",          NULL,   CLK_IS_CRITICAL }, /* DAC */
>         [ASPEED_CLK_GATE_REFCLK] =      {  6, -1, "refclk-gate",        "clkin", CLK_IS_CRITICAL },
>         [ASPEED_CLK_GATE_USBPORT2CLK] = {  7,  3, "usb-port2-gate",     NULL,   0 }, /* USB2.0 Host port 2 */
> -       [ASPEED_CLK_GATE_LCLK] =        {  8,  5, "lclk-gate",          NULL,   0 }, /* LPC */
> +       [ASPEED_CLK_GATE_LCLK] =        {  8,  5, "lclk-gate",          NULL,   CLK_IS_CRITICAL }, /* LPC clock from host. No parent dependency */
>         [ASPEED_CLK_GATE_USBUHCICLK] =  {  9, 15, "usb-uhci-gate",      NULL,   0 }, /* USB1.1 (requires port 2 enabled) */
>         [ASPEED_CLK_GATE_D1CLK] =       { 10, 13, "d1clk-gate",         NULL,   0 }, /* GFX CRT */
>         [ASPEED_CLK_GATE_YCLK] =        { 13,  4, "yclk-gate",          NULL,   0 }, /* HAC */
> @@ -103,7 +103,7 @@ static const struct aspeed_gate_data aspeed_gates[] = {
>         [ASPEED_CLK_GATE_UART1CLK] =    { 15, -1, "uart1clk-gate",      "uart", 0 }, /* UART1 */
>         [ASPEED_CLK_GATE_UART2CLK] =    { 16, -1, "uart2clk-gate",      "uart", 0 }, /* UART2 */
>         [ASPEED_CLK_GATE_UART5CLK] =    { 17, -1, "uart5clk-gate",      "uart", 0 }, /* UART5 */
> -       [ASPEED_CLK_GATE_ESPICLK] =     { 19, -1, "espiclk-gate",       NULL,   0 }, /* eSPI */
> +       [ASPEED_CLK_GATE_ESPICLK] =     { 19, -1, "espiclk-gate",       NULL,   CLK_IS_CRITICAL }, /* eSPI clock from host. No parent dependency */
>         [ASPEED_CLK_GATE_MAC1CLK] =     { 20, 11, "mac1clk-gate",       "mac",  0 }, /* MAC1 */
>         [ASPEED_CLK_GATE_MAC2CLK] =     { 21, 12, "mac2clk-gate",       "mac",  0 }, /* MAC2 */
>         [ASPEED_CLK_GATE_RSACLK] =      { 24, -1, "rsaclk-gate",        NULL,   0 }, /* RSA */
> --
> 2.7.4
>
