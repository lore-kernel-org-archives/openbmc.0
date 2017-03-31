Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vvvm93j7NzDqH7
 for <openbmc@lists.ozlabs.org>; Sat,  1 Apr 2017 08:30:01 +1100 (AEDT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v2VLTeNK009789;
 Fri, 31 Mar 2017 16:29:42 -0500
Message-ID: <1490995780.3177.245.camel@kernel.crashing.org>
Subject: Re: [PATCH 2/2] drivers/serial: Add driver for Aspeed virtual UART
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joel Stanley
 <joel@jms.id.au>
Cc: Jiri Slaby <jslaby@suse.com>, Mark Rutland <mark.rutland@arm.com>, Rob
 Herring <robh+dt@kernel.org>, Jeremy Kerr <jk@ozlabs.org>,
 linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org
Date: Sat, 01 Apr 2017 08:29:40 +1100
In-Reply-To: <20170331133120.GA26078@kroah.com>
References: <20170328054458.29341-1-joel@jms.id.au>
 <20170328054458.29341-3-joel@jms.id.au> <20170331133120.GA26078@kroah.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-1.fc25) 
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
X-List-Received-Date: Fri, 31 Mar 2017 21:30:02 -0000

On Fri, 2017-03-31 at 15:31 +0200, Greg Kroah-Hartman wrote:
> DEVICE_ATTR_RW()?
> 
> And why random sysfs files for a uart?  Where have you documented
> these?

We should stick a file somewhere in Documentation I suppose or
at least put that in a comment blob at the head of the file.

FYI:

The VUART is basically two UART 'front ends' connected by their FIFO
(no actual serial line in between). One is on the BMC side (management
controller) and one is on the host CPU side.

It allows the BMC to provide to the host a "UART" that pipes into
the BMC itself and can then be turned by the BMC into a network console
of some sort for example.

This driver is for the BMC side. The sysfs files allow the BMC
userspace which owns the system configuration policy, to specify
at what IO port and interrupt number the host side will appear
to the host on the Host <-> BMC LPC bus. It could be different on a
different system (though most of them use 3f8/4).

Cheers,
Ben.
