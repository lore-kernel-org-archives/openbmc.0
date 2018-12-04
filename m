Return-Path: <sboyd@kernel.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=sboyd@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="GqQqRW0T"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 438YyP2JfyzDqDy;
 Wed,  5 Dec 2018 07:54:37 +1100 (AEDT)
Received: from localhost (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2BA0E2081B;
 Tue,  4 Dec 2018 20:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1543956875;
 bh=SrFbdyxYsYVyjA57irTwtVbQ8ELhrcpR5swTOS87yXQ=;
 h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
 b=GqQqRW0TR/RZUMEKXPH8zmW5M46WjiCKCLAO/3fn66SG9MyNMhXV/QlFlKH0YCTkn
 VDzL0X4u4165uqj5ZHjxShYJUtU1ssdpeOc6c0ppg6OgVYLYHKOMo318OkYqF7MrL9
 qCK19HYYZEdHUaHJsKRBGtPKMurzJ70PTGbYUpqw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Joel Stanley <joel@jms.id.au>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <CACPK8XcwMMoxG6vhDhUU8RYGABx7rtBoxJvp2yDhHeD-PemdqA@mail.gmail.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 Michael Turquette <mturquette@baylibre.com>, 
 vijaykhemka@fb.com, chyishian.jiang@gmail.com, linux-clk@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed@lists.ozlabs.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "# 3.4.x" <stable@vger.kernel.org>
References: <20181204185054.24053-1-jae.hyun.yoo@linux.intel.com>
 <CACPK8XcwMMoxG6vhDhUU8RYGABx7rtBoxJvp2yDhHeD-PemdqA@mail.gmail.com>
Message-ID: <154395687459.88331.13570416457347078441@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH v2] clk: aspeed: Mark lclk (LPC) and espiclk (eSPI) as
 critical
Date: Tue, 04 Dec 2018 12:54:34 -0800
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
X-List-Received-Date: Tue, 04 Dec 2018 20:54:37 -0000

Quoting Joel Stanley (2018-12-04 12:51:43)
> Hi Jae,
> =

> On Wed, 5 Dec 2018 at 05:20, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> =
wrote:
> >
> > These interfaces are used by host to talk to BMC, and the clock
> > source is from the host, usually from PCH. So this commit marks
> > the lclk as critical to make it able to be enabled. Also, it marks
> > espiclk too because eSPI is sharing the same interface with LPC.
> =

> While this is true on the platform you have in mind, on other
> platforms this is not the case. They do not use eSPI, and LCLK is
> enabled by the driver that is used to configure LPC
> (drivers/misc/aspeed-lpc-ctrl.c):
> =

>  lpc_ctrl: lpc-ctrl@0 {
>      compatible =3D "aspeed,ast2400-lpc-ctrl";
>      reg =3D <0x0 0x80>;
>      clocks =3D <&syscon ASPEED_CLK_GATE_LCLK>;
>  }
> =

> I wonder if we need a device tree binding to describe which clocks are cr=
itical.

A binding to describe critical clks has been rejected in the past. I
don't think we need to have it here either? More information on why
things are being marked critical will be helpful to see if we need to
re-open that discussion again.

> =

> Stephen, please don't merge this patch yet.
> =


Sure.
