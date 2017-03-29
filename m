Return-Path: <marc.zyngier@arm.com>
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by lists.ozlabs.org (Postfix) with ESMTP id 3vtPmr4jKSzDqH3
 for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2017 21:55:24 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32D3A344;
 Wed, 29 Mar 2017 03:55:21 -0700 (PDT)
Received: from [10.1.207.16] (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 9F5493F23B; Wed, 29 Mar 2017 03:55:18 -0700 (PDT)
Subject: Re: [PATCH v6 2/5] irqchip/aspeed-i2c-ic: Add I2C IRQ controller for
 Aspeed
To: Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
References: <20170328051226.21677-1-brendanhiggins@google.com>
 <20170328051226.21677-3-brendanhiggins@google.com>
 <49a13bbc-aec3-a349-4323-3c8d2728c62f@arm.com>
 <1490692375.3177.119.camel@kernel.crashing.org>
 <91936f1a-0a0d-4091-b981-976503a6f7cd@arm.com>
 <1490734216.3177.140.camel@kernel.crashing.org>
 <CAFd5g46TAGHWtH7p1o=AJqy8_SygpJZ4RJkJpUwDD3nKxpB5YQ@mail.gmail.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, robh+dt@kernel.org,
 mark.rutland@arm.com, tglx@linutronix.de, jason@lakedaemon.net,
 Joel Stanley <joel@jms.id.au>, Vladimir Zapolskiy <vz@mleia.com>,
 Kachalov Anton <mouse@mayc.ru>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Marc Zyngier <marc.zyngier@arm.com>
Organization: ARM Ltd
Message-ID: <75ef2cc1-44d7-0137-96e5-77ba68ee071f@arm.com>
Date: Wed, 29 Mar 2017 11:55:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAFd5g46TAGHWtH7p1o=AJqy8_SygpJZ4RJkJpUwDD3nKxpB5YQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
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
X-List-Received-Date: Wed, 29 Mar 2017 10:55:24 -0000

On 29/03/17 10:59, Brendan Higgins wrote:
> The main reason I took this approach is just because I thought it was
> cleaner from the perspective of the busses which are totally
> independent (except for the fact that they share a single hardware
> interrupt).
> 
> I did not make any measurements, so I doubt that I have anything to
> add that you don't already know. I saw other usages of chained
> interrupts that do the same thing (scan a "status" register and use
> them to make software interrupts) and I thought that is basically what
> the dummy irq chip code is for. The only thing I thought I was doing
> that was novel was actually breaking out the dummy irqchip into its
> own driver; it is not my idea, but I do think makes it a lot cleaner.
> Nevertheless, it should be cheap in terms of number of instructions;
> the most expensive part looks like looking up the mapping. In any
> case, I think the low hanging fruit here is supporting buffering or
> DMA, like Ben suggested.
> 
> To address the comment on being over engineered: outside of the init
> function (which would exist regardless of how we do this, if not here
> then in the I2C driver); the code is actually pretty small and
> generic.
> 
> All that being said, it would not be very hard to do this without
> using the dummy irqchip code and it would definitely be smaller in
> terms of indirection and space used, but I think the code would
> actually be more complicated to read. We would be going back to having
> an I2C controller along with the I2C busses; where all the I2C
> controller does is read the IRQ register and then call the appropriate
> bus irq handler, which looks a lot like a dummy irqchip.

As long as you're happy with the performance and the restrictions that
come attached to the HW, I'm happy to take the irqchip patches.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
