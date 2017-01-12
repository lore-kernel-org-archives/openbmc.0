Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tzrhS3V8ZzDqCm
 for <openbmc@lists.ozlabs.org>; Fri, 13 Jan 2017 03:25:12 +1100 (AEDT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v0CFZAND017056;
 Thu, 12 Jan 2017 09:35:11 -0600
Message-ID: <1484235315.2492.41.camel@kernel.crashing.org>
Subject: Re: [PATCH 3/4] drivers/misc: Add ASpeed LPC control driver
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Cyril Bur <cyrilbur@gmail.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, jassisinghbrar@gmail.com, arnd@arndb.de,
 joel@jms.id.au, mark.rutland@arm.com, robh+dt@kernel.org,
 openbmc@lists.ozlabs.org, andrew@aj.id.au, xow@google.com, jk@ozlabs.org
Date: Thu, 12 Jan 2017 09:35:15 -0600
In-Reply-To: <1484216163.11416.8.camel@gmail.com>
References: <20170112002910.3650-1-cyrilbur@gmail.com>
 <20170112002910.3650-4-cyrilbur@gmail.com>
 <20170112074750.GB23943@kroah.com> <1484216163.11416.8.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.3 (3.22.3-1.fc25) 
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
X-List-Received-Date: Thu, 12 Jan 2017 16:25:14 -0000

On Thu, 2017-01-12 at 21:16 +1100, Cyril Bur wrote:
> My aim here was to only have one process playing with the LPC mapping
> registers at a time.
> 
> > Again, use UIO, it will save you from yourself...
> > 
> 
> Thank-you! This is the first I've heard of UIO and I'll investigate
> furthur!

Greg, I don't think UIO is the answer here either. Note, this isn't an
exploit so much as root shooting itself in the foot as this driver
should never be accessed by anybody but root, but see below.

This is a BMC, ie, the system controller of a x86 or POWER based
system.

The LPC controller controls the LPC bus which is mastered by the "host"
(ie. the x86 or PPC) and acts as a slave on the BMC side.

It has a bunch of registers that need to be configured in more/less
system specific ways by the BMC, but more so, it has a pair of
registers that allow "mapping" of a region of the BMC physical address 
space into the host address space.

This is by definition dangerous to configure since it gives you a
window to any part of the BMC, kernel space, any IOs, etc... however it
needs to be configured by a userspace daemon which communicates with
the host via a mailbox in order to map either different portions of the
system flash controller address space or reserved memory.

So in fact it should be done by the kernel, not userspace.

What Cyril needs to do to make it more secure is:

  - For random register accesses, white list what registers
specifically are allowed (and if necessary filter values). These
registers aren't dangerous from the BMC perspective and need to be set
appropriately for the host to operate correctly.

  - For the mapping of the LPC FW space <-> BMC space, use ioctl's to
explicit establish the mapping  to a portion of the flash (and nowhere
else) or one of the known reserved memory areas. IE, dont have
userspace just pass raw physical addresses through, but tell the kernel
driver what portion (offset/size) of what area (flash space or reserved
memory region) to configure the HW window for.

Cheers,
Ben.
