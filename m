Return-Path: <alistair@popple.id.au>
Received: from ipmail05.adl6.internode.on.net (ipmail05.adl6.internode.on.net
 [150.101.137.143])
 by lists.ozlabs.org (Postfix) with ESMTP id 3wjxln1c0szDqFH
 for <openbmc@lists.ozlabs.org>; Thu,  8 Jun 2017 17:25:25 +1000 (AEST)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2CyAwBO+zhZ/wpSY3peHAEBBAEBCgEBgyuHbokskHeYEoYkAoMzFAECAQEBAQEBAWsohRgBAQEBAgE6PwULCxgJFRAPAUeKPAeyQYwAAQEBAQYCJohBgyCFNoUnBZ45lCeBGo97iRCLWDYhgQobFRgJCBcZhgKBXi6KNwEBAQ
Received: from static-82-10.transact.net.au (HELO new-mexico.localnet)
 ([122.99.82.10])
 by ipmail05.adl6.internode.on.net with ESMTP; 08 Jun 2017 16:55:24 +0930
From: Alistair Popple <alistair@popple.id.au>
To: openbmc@lists.ozlabs.org
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 Jeremy Kerr <jk@ozlabs.org>
Subject: Re: [PATCH linux dev-4.10] drivers/fsi: Break and set pin states on
 GPIO master remove
Date: Thu, 08 Jun 2017 17:25:22 +1000
Message-ID: <2986922.Yi4HN7lb1t@new-mexico>
User-Agent: KMail/4.14.1 (Linux/4.2.0-0.bpo.1-amd64; KDE/4.14.2; x86_64; ; )
In-Reply-To: <bdb441e5-5485-9a67-1749-029f684162f9@linux.vnet.ibm.com>
References: <20170606200230.77482-1-cbostic@linux.vnet.ibm.com>
 <1ac7a650-9524-4c50-f449-b5fc89e8d988@ozlabs.org>
 <bdb441e5-5485-9a67-1749-029f684162f9@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
X-List-Received-Date: Thu, 08 Jun 2017 07:25:25 -0000

On Wed, 7 Jun 2017 08:55:45 AM Christopher Bostic wrote:
> 
> On 6/6/17 10:22 PM, Jeremy Kerr wrote:
> > Hi Chris,
> >
> >> Update GPIO remove behavior to match dev-4.7.
> >>
> >> On gpio remove: Send a break
> >> 		clock, translator, mux = 0
> >> 		data, enable = 1
> > While this change itself seems okay (leaving GPIOs in a defined state),
> > I'm concerned about *why* we need this.
> >
> > If there is other code that need GPIOs in a certain state, then that
> > code should be doing the required init itself.
> Hi Jeremy,
> 
> The pins are set here mainly for the benefit of the Cronus debug 
> tools.   Its common practice in test and bringup labs to switch back and 
> forth between BMC and FSP-2 with Cronus to access the host processor 
> CFAMs over FSI.  Without the remove pin state changes Cronus cannot access.

As far as I know you have to run "systemctl start fsi-disable.service" to switch
over to Cronus mode. I think Jeremy's point is that it should be that service
which explicitly sets up the hardware in a suitable mode rather than relying on
side-effects from removing the kernel driver.

- Alistair

> Cronus is a user space layer and presently doesn't modify gpio directly 
> in this situation.   It could do this work I suppose but all designers 
> involved will need to come to an agreement as to which is the proper 
> approach.
> 
> Thanks,
> Chris
> 
> > Could you add a comment on why this is required?
> >
> > Cheers,
> >
> >
> > Jeremy
> >
> 
