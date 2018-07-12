Return-Path: <benh@kernel.crashing.org>
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41RDdf558lzDr0d;
 Thu, 12 Jul 2018 21:45:26 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w6CBj8oX017464;
 Thu, 12 Jul 2018 06:45:10 -0500
Message-ID: <a51a3b8168a30379bf7528aeb387ca03e682eea2.camel@kernel.crashing.org>
Subject: Re: [PATCH v3 3/5] fsi: master-ast-cf: Add new FSI master using
 Aspeed ColdFire
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Joel Stanley <joel@jms.id.au>
Cc: linux-aspeed@lists.ozlabs.org, devicetree <devicetree@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Andrew Jeffery
 <andrew@aj.id.au>, Rob Herring <robh@kernel.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>
Date: Thu, 12 Jul 2018 21:45:08 +1000
In-Reply-To: <CACPK8XdZKbh2NLQaiZOx66FAo+3csS_D9-BXjJKeppKm8aEM6w@mail.gmail.com>
References: <20180712034847.12878-1-benh@kernel.crashing.org>
 <20180712034847.12878-4-benh@kernel.crashing.org>
 <CACPK8XdZKbh2NLQaiZOx66FAo+3csS_D9-BXjJKeppKm8aEM6w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.3 (3.28.3-1.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Thu, 12 Jul 2018 11:45:28 -0000

On Thu, 2018-07-12 at 17:53 +1000, Joel Stanley wrote:
> On 12 July 2018 at 13:48, Benjamin Herrenschmidt
> <benh@kernel.crashing.org> wrote:
> > The Aspeed AST2x00 can contain a ColdFire v1 coprocessor which
> > is currently unused on OpenPower systems.
> > 
> > This adds an alternative to the fsi-master-gpio driver that
> > uses that coprocessor instead of bit banging from the ARM
> > core itself. The end result is about 4 times faster.
> > 
> > The firmware for the coprocessor and its source code can be
> > found at https://github.com/ozbenh/cf-fsi and is system specific.
> > 
> > Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > ---
> >  drivers/fsi/Kconfig                      |    9 +
> >  drivers/fsi/Makefile                     |    1 +
> >  drivers/fsi/cf-fsi-fw.h                  |  157 +++
> >  drivers/fsi/fsi-master-ast-cf.c          | 1438 ++++++++++++++++++++++
> >  include/trace/events/fsi_master_ast_cf.h |  150 +++
> >  5 files changed, 1755 insertions(+)
> >  create mode 100644 drivers/fsi/cf-fsi-fw.h
> >  create mode 100644 drivers/fsi/fsi-master-ast-cf.c
> >  create mode 100644 include/trace/events/fsi_master_ast_cf.h
> > 
> > diff --git a/drivers/fsi/Kconfig b/drivers/fsi/Kconfig
> > index 322cec393cf2..e0220d1e1357 100644
> > --- a/drivers/fsi/Kconfig
> > +++ b/drivers/fsi/Kconfig
> > @@ -27,6 +27,15 @@ config FSI_MASTER_HUB
> >         allow chaining of FSI links to an arbitrary depth.  This allows for
> >         a high target device fanout.
> > 
> > +config FSI_MASTER_AST_CF
> > +       tristate "FSI master based on Aspeed ColdFire coprocessor"
> > +       depends on GPIOLIB
> > +       depends on GPIO_ASPEED
> > +       ---help---
> > +       This option enables a FSI master using the AST2400 and AST2500 GPIO
> > +       lines driven by the internal ColdFire coprocessor. This requires
> > +       the corresponding machine specific ColdFire firmware to be available.
> 
> The "machine specific" part isn't true anymore, is it?

Right, I'll fixup the changelog before pushing if that's the last spin.

> I gave this a spin on a palmetto and it appeared to work fine for me.
> 
> Tested-by: Joel Stanley <joel@jms.id.au>

Thanks !

Cheers,
Ben
.
