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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40hJF23HmGzF2Rm
 for <openbmc@lists.ozlabs.org>; Thu, 10 May 2018 13:12:38 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w4A3CIX3006641;
 Wed, 9 May 2018 22:12:20 -0500
Message-ID: <aa3ea85e3a3e4ea9914c378a1fa5d5b79c1f6752.camel@kernel.crashing.org>
Subject: Re: [PATCH linux dev-4.13 6/6] fsi/fsi-master-gpio: Reduce dpoll
 clocks
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Andrew Jeffery <andrew@aj.id.au>, Christopher Bostic
 <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Date: Thu, 10 May 2018 13:12:18 +1000
In-Reply-To: <1525921593.2437705.1366975752.2D373C24@webmail.messagingengine.com>
References: <20180508010640.14113-1-benh@kernel.crashing.org>
 <05e89ea8549634e750d783360590f2802954437d.camel@kernel.crashing.org>
 <f2a71866-7ab5-8017-0865-14f4e9b57b91@linux.vnet.ibm.com>
 <1525921593.2437705.1366975752.2D373C24@webmail.messagingengine.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.1 (3.28.1-2.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 10 May 2018 03:12:39 -0000

On Thu, 2018-05-10 at 12:36 +0930, Andrew Jeffery wrote:
> On Wed, 9 May 2018, at 05:30, Christopher Bostic wrote:
> > Reviewed-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> > 
> > 
> > On 5/7/18 8:46 PM, Benjamin Herrenschmidt wrote:
> > > FSI_GPIO_DPOLL_CLOCKS is the number of clocks before sending
> > > a DPOLL command after receiving a BUSY status. It should be
> > > at least tSendDelay (16 clocks).
> > > 
> > > According to comments in the code, it needs to also be at least
> > > 21 clocks due to HW issues.
> > > 
> > > It's currently 100 clocks which impacts performances negatively
> > > in some cases. Reduces it in half to 50 clocks which seems to
> > > still be solid.
> 
> Out of curiosity, was there any science to 50 beyond the (16/21
> cycle) reasoning above? Was there instability at lower values?

No. The "science" aka spec would need it to be tSendDelay, which is 16
cycles. However there's a comment that says that there are issues below
21. I decided to keep *some* paranoia and cut in half to 50 instead of
100.


> > > 
> > > Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > > ---
> > >   drivers/fsi/fsi-master-gpio.c | 5 +++--
> > >   1 file changed, 3 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
> > > index 029b0a5b6d89..bd2b2cbd5eb5 100644
> > > --- a/drivers/fsi/fsi-master-gpio.c
> > > +++ b/drivers/fsi/fsi-master-gpio.c
> > > @@ -29,7 +29,8 @@
> > >   #define	FSI_GPIO_CMD_TERM	0x3f
> > >   #define FSI_GPIO_CMD_ABS_AR	0x4
> > > 
> > > -#define	FSI_GPIO_DPOLL_CLOCKS	100      /* < 21 will cause slave to hang */
> > > +
> > > +#define	FSI_GPIO_DPOLL_CLOCKS	50      /* < 21 will cause slave to hang */
> > > 
> > >   /* Bus errors */
> > >   #define	FSI_GPIO_ERR_BUSY	1	/* Slave stuck in busy state */
> > > @@ -43,7 +44,7 @@
> > >   #define	FSI_GPIO_RESP_ACK	0
> > >   #define	FSI_GPIO_RESP_ACKD	4
> > > 
> > > -#define	FSI_GPIO_MAX_BUSY	100
> > > +#define	FSI_GPIO_MAX_BUSY	200
> > >   #define	FSI_GPIO_MTOE_COUNT	1000
> > >   #define	FSI_GPIO_DRAIN_BITS	20
> > >   #define	FSI_GPIO_CRC_SIZE	4
> > > 
