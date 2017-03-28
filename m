Return-Path: <marc.zyngier@arm.com>
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by lists.ozlabs.org (Postfix) with ESMTP id 3vsm9C648XzDqYB
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 20:40:46 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2AFBC2B;
 Tue, 28 Mar 2017 02:40:42 -0700 (PDT)
Received: from [10.1.207.16] (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 DBD313F220; Tue, 28 Mar 2017 02:40:39 -0700 (PDT)
Subject: Re: [PATCH v6 2/5] irqchip/aspeed-i2c-ic: Add I2C IRQ controller for
 Aspeed
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Brendan Higgins <brendanhiggins@google.com>, wsa@the-dreams.de,
 robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
 jason@lakedaemon.net, joel@jms.id.au, vz@mleia.com, mouse@mayc.ru,
 clg@kaod.org
References: <20170328051226.21677-1-brendanhiggins@google.com>
 <20170328051226.21677-3-brendanhiggins@google.com>
 <49a13bbc-aec3-a349-4323-3c8d2728c62f@arm.com>
 <1490692375.3177.119.camel@kernel.crashing.org>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
From: Marc Zyngier <marc.zyngier@arm.com>
Organization: ARM Ltd
Message-ID: <91936f1a-0a0d-4091-b981-976503a6f7cd@arm.com>
Date: Tue, 28 Mar 2017 10:40:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <1490692375.3177.119.camel@kernel.crashing.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 28 Mar 2017 22:33:42 +1100
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
X-List-Received-Date: Tue, 28 Mar 2017 09:40:48 -0000

On 28/03/17 10:12, Benjamin Herrenschmidt wrote:
> On Tue, 2017-03-28 at 09:32 +0100, Marc Zyngier wrote:
>> I'm a bit concerned by this. It means that you can't even mask an
>> interrupt. Is that really what you intend to do? Or all that the HW can
>> do? If you cannot mask an interrupt, you're at the mercy of a screaming
>> device...
> 
> This is not really an interrupt controller. It's a "summary" register
> that reflects the state of the 14 i2c controller interrupts.
> 
> This approach does have the advantage of providing separate counters in
> /proc/interrupts which is rather nice, but it does have overhead. On
> those shittly little ARMv9 400Mhz cores it can be significant.

<pedantic>
s/ARMv9/ARM9/, as we're still on variations of the ARMv8 architecture ;-)
</pedantic>

A 400MHz ARM9 (which is either ARMv4 or ARMv5) is not too bad (hey, we
still have a couple of Versatile-ABs here...). Caches are pretty small
though.

> I would personally have some kind of trick to register a single
> interrupt handler that calls directly the handlers of the respective
> i2c busses via a simple indirection for speed, maybe adding my custom
> sysfs or debugfs statistics. But that's just me trying to suck the last
> cycle out of the bloody thing ;-)

I'd hope the irqdomain itself to be pretty light (the revmap should help
here), but of course you're going to do more work. Counters also come at
a cost. It'd be interesting to see if Brendan has any overhead data
about this.

Cheers,

	M.
-- 
Jazz is not dead. It just smells funny...
