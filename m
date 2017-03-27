Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vs9Z64htVzDq7d
 for <openbmc@lists.ozlabs.org>; Mon, 27 Mar 2017 21:41:50 +1100 (AEDT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v2RAfQx6028294;
 Mon, 27 Mar 2017 05:41:27 -0500
Message-ID: <1490611285.3177.78.camel@kernel.crashing.org>
Subject: Re: [PATCH 11/17] aspeed: Add I2C Driver
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Simon Glass <sjg@chromium.org>, Maxim Sloyko <maxims@google.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, Heiko Schocher <hs@denx.de>
Date: Mon, 27 Mar 2017 21:41:25 +1100
In-Reply-To: <1490611208.3177.77.camel@au1.ibm.com>
References: <20170316213624.140344-1-maxims@google.com>
 <20170316213624.140344-12-maxims@google.com>
 <CAPnjgZ1SJQ82hxbcKg3PLvJ2RdbvsON9W_tvyVhRM7+-BnbDTw@mail.gmail.com>
 <1490611208.3177.77.camel@au1.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-1.fc25) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Mon, 27 Mar 2017 10:41:51 -0000

On Mon, 2017-03-27 at 21:40 +1100, Benjamin Herrenschmidt wrote:
> On Wed, 2017-03-22 at 07:05 -0600, Simon Glass wrote:
> > On 16 March 2017 at 15:36, Maxim Sloyko <maxims@google.com> wrote:
> > > Add Device Model based I2C driver for ast2500/ast2400 SoCs.
> > > The driver is very limited, it only supports master mode and
> > > synchronous byte-by-byte reads/writes, no DMA or Pool Buffers.
> > > 
> > > Signed-off-by: Maxim Sloyko <maxims@google.com>
> > > ---
> 
> Ah interesting, I was just rewriting that driver last week ... I'll
> review yours ASAP.

Ignore me, I was talking about the Linux one.

> 
> > >  drivers/i2c/Kconfig   |   9 ++
> > >  drivers/i2c/Makefile  |   1 +
> > >  drivers/i2c/ast_i2c.c | 355
> > > ++++++++++++++++++++++++++++++++++++++++++++++++++
> > >  drivers/i2c/ast_i2c.h | 132 +++++++++++++++++++
> > >  4 files changed, 497 insertions(+)
> > >  create mode 100644 drivers/i2c/ast_i2c.c
> > >  create mode 100644 drivers/i2c/ast_i2c.h
> > 
> > Reviewed-by: Simon Glass <sjg@chromium.org>
