Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wfNMV2d3mzDqLF
 for <openbmc@lists.ozlabs.org>; Fri,  2 Jun 2017 22:10:30 +1000 (AEST)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v52C9lN4024003;
 Fri, 2 Jun 2017 07:09:49 -0500
Message-ID: <1496405386.2842.8.camel@kernel.crashing.org>
Subject: Re: [PATCH v8 4/5] i2c: aspeed: added driver for Aspeed I2C
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason
 Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Joel
 Stanley <joel@jms.id.au>, Vladimir Zapolskiy <vz@mleia.com>, Kachalov Anton
 <mouse@mayc.ru>, =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Fri, 02 Jun 2017 22:09:46 +1000
In-Reply-To: <CAFd5g45en_S0NYgufoET_Lwgu3Rs=7RafsFJZeCUiYCWyxogag@mail.gmail.com>
References: <20170525064925.16867-1-brendanhiggins@google.com>
 <20170525064925.16867-5-brendanhiggins@google.com>
 <1496197001.3354.19.camel@kernel.crashing.org>
 <CAFd5g45en_S0NYgufoET_Lwgu3Rs=7RafsFJZeCUiYCWyxogag@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-2.fc25) 
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
X-List-Received-Date: Fri, 02 Jun 2017 12:10:31 -0000

On Fri, 2017-06-02 at 02:29 -0700, Brendan Higgins wrote:
> > That way you avoid the above lock which is racy, slave activity could
> > get in there and trigger an error interrupt clobbering cmd_err for
> > example no ? Or am I missing something...
> 
> The slave handler does not touch these fields, so that should be fine.
> The only way I can think
> that we could get in this state is if we had some sort of error
> interrupt fire after we handled a
> STOP or previous error; this should not happen, but I think it is
> better to be safe than sorry.
> Nevertheless, I do not think it is necessary to do more than what I
> have already done because
> it would mean the bus is in a pretty bad state anyway. Maybe I should
> just drop the locks here.
> 
> If you disagree, could you elaborate on what you meant by putting
> cmd_err in a separate field?
> Did you just mean having one for xfer and one for everything else (like resets)?

None of that is a big deal and definitely not a blocker for merging,
you can always "improve" things with a latter patch.

I was thinking that the act of "completing" a request could cleaner if
entirely done from the interrupt code, thus clearing bus->msgs and
setting a "final" status code to be returned to the caller.

Now that could be "cmd_err", it's just that today, that is written to
under various circumstances that may or may not related to a command
being in progress and this I worry that with the lock dropping, we
might "lose" the value that actually pertain to the command itself (and
possibly caused it to fail).

This is all quite academic however, as you said, if that happens we are
already probably in a pretty bad shape.

I suspect the only errors that would happen in "normal" circumstances
would be loss of arbitration and nacks, which are I think, already
properly handled, at least from my reading of the code.

Cheers,
Ben.

> > > +     /* If nothing went wrong, return number of messages transferred. */
> > > +     if (ret >= 0)
> > > +             return bus->msgs_index + 1;
> > > +     else
> > > +             return ret;
> > > +}
> > > +
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
