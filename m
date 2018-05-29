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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40wSgs11KQzDr4N
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 08:14:32 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w4TMEO26031748;
 Tue, 29 May 2018 17:14:26 -0500
Message-ID: <b20182d235786a26e69e9d4c5767441af8f3d828.camel@kernel.crashing.org>
Subject: Re: [PATCH linux dev-4.13] i2c: fsi: Don't take a lock around FSI
 accesses
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Date: Wed, 30 May 2018 08:14:24 +1000
In-Reply-To: <332bd020-2168-1cc2-ad58-1efcfdf38b33@linux.vnet.ibm.com>
References: <20180529042849.11282-1-benh@kernel.crashing.org>
 <332bd020-2168-1cc2-ad58-1efcfdf38b33@linux.vnet.ibm.com>
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
X-List-Received-Date: Tue, 29 May 2018 22:14:33 -0000

On Tue, 2018-05-29 at 10:11 -0500, Eddie James wrote:
> 
> On 05/28/2018 11:28 PM, Benjamin Herrenschmidt wrote:
> > That lock is incorrect as FSI can sleep and thus will
> > trigger lockdep warnings. It is also unnecessary as
> > it was meant to "speed up" the reset process for
> > unspecified reasons, not to protect against anything.
> > 
> > The the master semaphore should prevent any concurrent user from
> > seeing the intermediate state already and the recent improvements
> > to the FSI layer should take care of potential speed issues.
> > 
> > Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > ---
> >   drivers/i2c/busses/i2c-fsi.c | 8 ++------
> >   1 file changed, 2 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
> > index 10f693fc855b..41cbffea4325 100644
> > --- a/drivers/i2c/busses/i2c-fsi.c
> > +++ b/drivers/i2c/busses/i2c-fsi.c
> > @@ -23,6 +23,7 @@
> >   #include <linux/semaphore.h>
> >   #include <linux/spinlock.h>
> >   #include <linux/wait.h>
> > +#include <linux/delay.h>
> 
> delay.h was already included :)
> 
> And probably need to remove the spinlock from the master structure, as 
> it's unused.

Ah right.

Cheers,
Ben.

> Thanks,
> Eddie
> 
> > 
> >   #define FSI_ENGID_I2C		0x7
> > 
> > @@ -427,10 +428,6 @@ static int fsi_i2c_reset(struct fsi_i2c_master *i2c, u16 port)
> >   {
> >   	int rc;
> >   	u32 mode, stat, dummy = 0;
> > -	unsigned long flags;
> > -
> > -	/* disable pre-emption; bus won't get left in a bad state for long */
> > -	spin_lock_irqsave(&i2c->reset_lock, flags);
> > 
> >   	/* reset engine */
> >   	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_I2C, &dummy);
> > @@ -472,7 +469,7 @@ static int fsi_i2c_reset(struct fsi_i2c_master *i2c, u16 port)
> >   		goto done;
> > 
> >   	/* wait for command complete; time from legacy driver */
> > -	udelay(1000);
> > +	msleep(1);
> > 
> >   	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &stat);
> >   	if (rc)
> > @@ -490,7 +487,6 @@ static int fsi_i2c_reset(struct fsi_i2c_master *i2c, u16 port)
> >   	rc = fsi_i2c_dev_init(i2c);
> > 
> >   done:
> > -	spin_unlock_irqrestore(&i2c->reset_lock, flags);
> >   	return rc;
> >   }
> > 
