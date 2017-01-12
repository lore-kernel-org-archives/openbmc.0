Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tzt7l13YlzDqR0
 for <openbmc@lists.ozlabs.org>; Fri, 13 Jan 2017 04:30:26 +1100 (AEDT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v0CFaBdr017285;
 Thu, 12 Jan 2017 09:36:12 -0600
Message-ID: <1484235376.2492.42.camel@kernel.crashing.org>
Subject: Re: [PATCH 3/4] drivers/misc: Add ASpeed LPC control driver
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Greg KH <gregkh@linuxfoundation.org>, Cyril Bur <cyrilbur@gmail.com>
Cc: devicetree@vger.kernel.org, jassisinghbrar@gmail.com, arnd@arndb.de,
 joel@jms.id.au, mark.rutland@arm.com, robh+dt@kernel.org,
 openbmc@lists.ozlabs.org, andrew@aj.id.au, xow@google.com, jk@ozlabs.org
Date: Thu, 12 Jan 2017 09:36:16 -0600
In-Reply-To: <20170112074312.GA23943@kroah.com>
References: <20170112002910.3650-1-cyrilbur@gmail.com>
 <20170112002910.3650-4-cyrilbur@gmail.com>
 <20170112074312.GA23943@kroah.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.3 (3.22.3-1.fc25) 
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
X-List-Received-Date: Thu, 12 Jan 2017 17:30:30 -0000

On Thu, 2017-01-12 at 08:43 +0100, Greg KH wrote:
> On Thu, Jan 12, 2017 at 11:29:09AM +1100, Cyril Bur wrote:
> > This driver exposes a reserved chunk of BMC ram to userspace as
> > well as
> > an ioctl interface to control the BMC<->HOST mapping of the LPC
> > bus.
> > This allows for a communication channel between the BMC and the
> > host
> 
> Why not make this a UIO driver?  Why does it have to be a character
> device?

See my other email (looks like I'm getting things in reverse order
today ;-), basically it should just be some ioctl's, but what they do
should really be done by the kernel as it controls external access to
part of the chip physical address space.

Cheers,
Ben.
