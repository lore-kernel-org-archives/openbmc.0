Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3stV7B5bDFzDskg
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 19:11:02 +1100 (AEDT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id u9B8AmtB018517;
 Tue, 11 Oct 2016 03:10:50 -0500
Message-ID: <1476173448.2654.7.camel@kernel.crashing.org>
Subject: Re: libflash questions mostly relating to P9 bringup
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Cyril Bur <cyrilbur@gmail.com>, Joel Stanley <joel@jms.id.au>, Xo Wang
 <xow@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Tue, 11 Oct 2016 19:10:48 +1100
In-Reply-To: <1476171942.720.16.camel@gmail.com>
References: <CAPH-5w5H-qYmjq+94U+jP=Wf57jdahO-jMZ1m=2gB9b8m8kAtA@mail.gmail.com>
 <CACPK8Xcyv2XLfZ1uawt=jcGDvX9cHOOMB9N9pGv5vV9gQ9objw@mail.gmail.com>
 <1476171942.720.16.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
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
X-List-Received-Date: Tue, 11 Oct 2016 08:11:03 -0000

On Tue, 2016-10-11 at 18:45 +1100, Cyril Bur wrote:
> > Hacky. Not really supported.
> 
> I should apologise, if we're talking about https://github.com/open-powe
> r/skiboot/blob/master/external/pflash/powerpc_io.c, we shouldn't. That
> code isn't used anymore and I doubt it will work. I'll send patches to
> remove it!
> 
> Currently updating PNOR from the host, Joel is correct, it isn't really
> supported by openbmc. Of course it can be done through /dev/mtd exposed
> by host linux (https://github.com/open-power/linux/blob/master/drivers/
> mtd/devices/powernv_flash.c) and backed by a driver in skiboot. I
> really hope that all pflash binaries around today know how to do this.

I dont know if that was mentioned earlier in the thread but we are
working on a mailbox based protocol for flash access to avoid accessing
the flash controller registers from any other entity than the BMC, in
order to be able to cut off the iLPC->AHB backdoor completely.

This should support having the flash either access directly for reads
or via an in-memory image in the BMC (aka memboot) and writes will be
done to an in-memory window on the LPC and "committed" to flash via
mbox commands.

We can get you details when we have a bit more sorted out on our side,
hopefully in a few days.

Cheers,
Ben.
