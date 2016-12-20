Return-Path: <alistair@popple.id.au>
Received: from ipmail06.adl6.internode.on.net (ipmail06.adl6.internode.on.net
 [150.101.137.145])
 by lists.ozlabs.org (Postfix) with ESMTP id 3tjvYc46dpzDwW7
 for <openbmc@lists.ozlabs.org>; Wed, 21 Dec 2016 10:45:56 +1100 (AEDT)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2BLAgDRwVlYfQpSY3pcGQEBAQEBAQEBAQEBBwEBAQEBgywLAQEBAQF5gQaFKokZlWeXGB8LhXgCgj0BAgEBAQEBAhMBARYvMIRoAQEBAwEBOTQLBQsLEgYJFRAPARghDgYTiGMHD6oaixIBAQEBAQEEAQEBAQEjiw+KIQWPAYtvhlKFcIVZgQ2ITYYMjhqED4FNDA0IDiyFbio0AYkGAQEB
Received: from static-82-10.transact.net.au (HELO new-mexico.localnet)
 ([122.99.82.10])
 by ipmail06.adl6.internode.on.net with ESMTP; 21 Dec 2016 10:15:55 +1030
From: Alistair Popple <alistair@popple.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: Ivan Mikhaylov1 <ivan@de.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Karlo Petri <XXPETRI@de.ibm.com>,
 Bradley W Bishop <bradleyb@us.ibm.com>
Subject: Re: about fsp2 board
Date: Wed, 21 Dec 2016 10:45:53 +1100
Message-ID: <7568643.JSUy96KJvh@new-mexico>
User-Agent: KMail/4.14.1 (Linux/4.2.0-0.bpo.1-amd64; KDE/4.14.2; x86_64; ; )
In-Reply-To: <CACPK8XcryOVx-ch3ffVRUvwU6cXLSBGDu8_CS6wmoixjt=700w@mail.gmail.com>
References: <OFAB060B32.380FD18C-ON0025808E.003FDC40-0025808E.00405F91@notes.na.collabserv.com>
 <CACPK8XcryOVx-ch3ffVRUvwU6cXLSBGDu8_CS6wmoixjt=700w@mail.gmail.com>
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
X-List-Received-Date: Tue, 20 Dec 2016 23:45:56 -0000

Hi Ivan,

On Tue, 20 Dec 2016 09:48:34 AM Joel Stanley wrote:
> Hello Ivan,
> 
> On Mon, Dec 19, 2016 at 10:13 PM, Ivan Mikhaylov1 <ivan@de.ibm.com> wrote:
> > Hello everyone, so probably everyone knows about fsp2 board existence that
> > is still using in P and Z systems, what we wanna do in case of Z series, 
we
> > want to do same way as P doing right now with ast2400/2500. So we want to
> > port fsp2 board into upstream kernel and be a part of openbmc project.
> > Until now I'm just started to work with it. So if you see any 
things/thougts
> > which we have to talk, pls tell us...
> 
> Getting your kernel and u-boot patches upstream is something I support.
> 
> I suggest you rebase your tree on the latest upstream (v4.9), and get
> it to boot with a simple userspace.
> 
> Once you have that working then I suggest we get the essential drivers
> and architecture support upstream. This list might include serial,
> irq, ethernet, and device tree. The code will require rework to meet
> upstream kernel standards. You will also need to be come familiar with
> the tools used by the upstream kernel; git, patches and mailing lists.
> Read this documentation:
> 
> https://www.kernel.org/doc/html/latest/development-process/index.html
> 
> From there you can develop the rest of the drivers as you need them.
> 
> Alistair (on cc) is the upstream maintainer for the PPC SoC the FSP2
> is based on, so your patches must go through his process before being
> merged by the PowerPC maintainer, and finally hitting Linus' tree.

Maintaining PPC476 architecture has been pretty low volume so I don't have a 
separate git tree for the PowerPC maintainer to pull from. Instead patches 
should be sent to linuxppc-dev@lists.ozlabs.org following the development 
process above once you think they are ready for review/inclusion.

Note that much of the architecture support for 476 is already upstream. I'm 
not sure the scope of what you're up-streaming here but if it involves patches 
for other subsystems such as device drivers those patches will most likely 
need to go upstream via the appropriate maintainers tree. The MAINTAINERS file 
has a list of trees based on file name and get_maintainer.pl will provide 
suggestions for a given patch.

Regards,

Alistair

> The u-boot work will be a similar process.
> 
> Cheers,
> 
> Joel
