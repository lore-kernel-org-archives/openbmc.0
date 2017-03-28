Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vsp350WxdzDq93
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 22:05:36 +1100 (AEDT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v2S9Ctdr017194;
 Tue, 28 Mar 2017 04:12:57 -0500
Message-ID: <1490692375.3177.119.camel@kernel.crashing.org>
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
Date: Tue, 28 Mar 2017 20:12:55 +1100
In-Reply-To: <49a13bbc-aec3-a349-4323-3c8d2728c62f@arm.com>
References: <20170328051226.21677-1-brendanhiggins@google.com>
 <20170328051226.21677-3-brendanhiggins@google.com>
 <49a13bbc-aec3-a349-4323-3c8d2728c62f@arm.com>
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
X-List-Received-Date: Tue, 28 Mar 2017 11:05:37 -0000

On Tue, 2017-03-28 at 09:32 +0100, Marc Zyngier wrote:
> I'm a bit concerned by this. It means that you can't even mask an
> interrupt. Is that really what you intend to do? Or all that the HW can
> do? If you cannot mask an interrupt, you're at the mercy of a screaming
> device...

This is not really an interrupt controller. It's a "summary" register
that reflects the state of the 14 i2c controller interrupts.

This approach does have the advantage of providing separate counters in
/proc/interrupts which is rather nice, but it does have overhead. On
those shittly little ARMv9 400Mhz cores it can be significant.

I would personally have some kind of trick to register a single
interrupt handler that calls directly the handlers of the respective
i2c busses via a simple indirection for speed, maybe adding my custom
sysfs or debugfs statistics. But that's just me trying to suck the last
cycle out of the bloody thing ;-)

Cheers,
Ben.
