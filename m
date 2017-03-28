Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vt4bV3LdbzDq7c
 for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2017 09:01:10 +1100 (AEDT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v2SKoH08001491;
 Tue, 28 Mar 2017 15:50:21 -0500
Message-ID: <1490734216.3177.140.camel@kernel.crashing.org>
Subject: Re: [PATCH v6 2/5] irqchip/aspeed-i2c-ic: Add I2C IRQ controller
 for Aspeed
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Marc Zyngier <marc.zyngier@arm.com>, Brendan Higgins
 <brendanhiggins@google.com>, wsa@the-dreams.de,
 robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
 jason@lakedaemon.net, joel@jms.id.au, vz@mleia.com, mouse@mayc.ru,
 clg@kaod.org
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Date: Wed, 29 Mar 2017 07:50:16 +1100
In-Reply-To: <91936f1a-0a0d-4091-b981-976503a6f7cd@arm.com>
References: <20170328051226.21677-1-brendanhiggins@google.com>
 <20170328051226.21677-3-brendanhiggins@google.com>
 <49a13bbc-aec3-a349-4323-3c8d2728c62f@arm.com>
 <1490692375.3177.119.camel@kernel.crashing.org>
 <91936f1a-0a0d-4091-b981-976503a6f7cd@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-1.fc25) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Tue, 28 Mar 2017 22:01:11 -0000

On Tue, 2017-03-28 at 10:40 +0100, Marc Zyngier wrote:
> On 28/03/17 10:12, Benjamin Herrenschmidt wrote:
> > On Tue, 2017-03-28 at 09:32 +0100, Marc Zyngier wrote:
> > > I'm a bit concerned by this. It means that you can't even mask an
> > > interrupt. Is that really what you intend to do? Or all that the HW can
> > > do? If you cannot mask an interrupt, you're at the mercy of a screaming
> > > device...
> > 
> > This is not really an interrupt controller. It's a "summary" register
> > that reflects the state of the 14 i2c controller interrupts.
> > 
> > This approach does have the advantage of providing separate counters in
> > /proc/interrupts which is rather nice, but it does have overhead. On
> > those shittly little ARMv9 400Mhz cores it can be significant.
> 
> <pedantic>
> s/ARMv9/ARM9/, as we're still on variations of the ARMv8 architecture ;-)
> </pedantic>

It was a typo, I meant ARM9/ARMv5 :-)

The 2 SOC families we are talking about (Aspeed 24xx and 25xx) are
based on a ARM926EJ at 400Mhz and an ARM1176JZFS at 800Mhz
respectively, so cycles do count :-)
 
> A 400MHz ARM9 (which is either ARMv4 or ARMv5) is not too bad (hey, we
> still have a couple of Versatile-ABs here...). Caches are pretty small
> though.

16K/16K, no L2 :) 

> > I would personally have some kind of trick to register a single
> > interrupt handler that calls directly the handlers of the respective
> > i2c busses via a simple indirection for speed, maybe adding my custom
> > sysfs or debugfs statistics. But that's just me trying to suck the last
> > cycle out of the bloody thing ;-)
> 
> I'd hope the irqdomain itself to be pretty light (the revmap should help
> here), but of course you're going to do more work. Counters also come at
> a cost. It'd be interesting to see if Brendan has any overhead data
> about this.

Thankfully, the HW supports buffered sends/receive or even DMA. The
current patch doesn't yet support these but they would be a good way to
alleviate the cost of the interrupts if it becomes a problem.

Cheers,
Ben.

> Cheers,
> 
> 	M.
