Return-Path: <sboyd@kernel.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=sboyd@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="pUckvOOR"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 438VHS4GykzDqMT;
 Wed,  5 Dec 2018 05:09:08 +1100 (AEDT)
Received: from localhost (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8A3972081C;
 Tue,  4 Dec 2018 18:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1543946946;
 bh=P4eXm/PXBfRIU2x7u2O188XXFONqF2ec5UpaXxGS6As=;
 h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
 b=pUckvOORWwDidKythEbvwv43ukHDrULRKlQPeAr0BXAi+fQ/Nz4HSQE8fmeG9APft
 kHd16555MHVjtO7kJn6rTHkv9uVMMD7dnGzCus6v48G2mg11yE621lii55nFyObiEi
 bHM3SHiy9HbisEDCHiE5pSt9bPoje1fPnenC5hec=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: Andrew Jeffery <andrew@aj.id.au>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, 
 Joel Stanley <joel@jms.id.au>, Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20181204172357.23665-1-jae.hyun.yoo@linux.intel.com>
Cc: Vijay Khemka <vijaykhemka@fb.com>, Samuel Jiang <chyishian.jiang@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, stable@vger.kernel.org
References: <20181204172357.23665-1-jae.hyun.yoo@linux.intel.com>
Message-ID: <154394694584.88331.12700815292714558990@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH] clk: aspeed: Mark lclk (LPC) and espiclk (eSPI) as
 critical
Date: Tue, 04 Dec 2018 10:09:05 -0800
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
X-List-Received-Date: Tue, 04 Dec 2018 18:09:09 -0000

Quoting Jae Hyun Yoo (2018-12-04 09:23:57)
> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> index 596136793fc4..01633ad85683 100644
> --- a/drivers/clk/clk-aspeed.c
> +++ b/drivers/clk/clk-aspeed.c
> @@ -95,7 +95,7 @@ static const struct aspeed_gate_data aspeed_gates[] =3D=
 {
>         [ASPEED_CLK_GATE_DCLK] =3D        {  5, -1, "dclk-gate",         =
 NULL,   CLK_IS_CRITICAL }, /* DAC */
>         [ASPEED_CLK_GATE_REFCLK] =3D      {  6, -1, "refclk-gate",       =
 "clkin", CLK_IS_CRITICAL },
>         [ASPEED_CLK_GATE_USBPORT2CLK] =3D {  7,  3, "usb-port2-gate",    =
 NULL,   0 }, /* USB2.0 Host port 2 */
> -       [ASPEED_CLK_GATE_LCLK] =3D        {  8,  5, "lclk-gate",         =
 NULL,   0 }, /* LPC */
> +       [ASPEED_CLK_GATE_LCLK] =3D        {  8,  5, "lclk-gate",         =
 NULL,   CLK_IS_CRITICAL }, /* LPC */
>         [ASPEED_CLK_GATE_USBUHCICLK] =3D  {  9, 15, "usb-uhci-gate",     =
 NULL,   0 }, /* USB1.1 (requires port 2 enabled) */
>         [ASPEED_CLK_GATE_D1CLK] =3D       { 10, 13, "d1clk-gate",        =
 NULL,   0 }, /* GFX CRT */
>         [ASPEED_CLK_GATE_YCLK] =3D        { 13,  4, "yclk-gate",         =
 NULL,   0 }, /* HAC */
> @@ -103,7 +103,7 @@ static const struct aspeed_gate_data aspeed_gates[] =
=3D {
>         [ASPEED_CLK_GATE_UART1CLK] =3D    { 15, -1, "uart1clk-gate",     =
 "uart", 0 }, /* UART1 */
>         [ASPEED_CLK_GATE_UART2CLK] =3D    { 16, -1, "uart2clk-gate",     =
 "uart", 0 }, /* UART2 */
>         [ASPEED_CLK_GATE_UART5CLK] =3D    { 17, -1, "uart5clk-gate",     =
 "uart", 0 }, /* UART5 */
> -       [ASPEED_CLK_GATE_ESPICLK] =3D     { 19, -1, "espiclk-gate",      =
 NULL,   0 }, /* eSPI */
> +       [ASPEED_CLK_GATE_ESPICLK] =3D     { 19, -1, "espiclk-gate",      =
 NULL,   CLK_IS_CRITICAL }, /* eSPI */

Can you please add a comment in the code as well so that we can easily
recall why such clks are marked critical a year from now without having
to do git archaeology.
