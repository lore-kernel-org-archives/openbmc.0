Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vt2hh4R4VzDqY4
 for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2017 07:35:32 +1100 (AEDT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v2SKZ7wi032410;
 Tue, 28 Mar 2017 15:35:11 -0500
Message-ID: <1490733303.3177.131.camel@kernel.crashing.org>
Subject: Re: [PATCH] net/ftgmac100: Rewrite the driver
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Wed, 29 Mar 2017 07:35:03 +1100
In-Reply-To: <5b1b8621-c20d-f100-0875-8f2264d70e8e@kaod.org>
References: <1490610516.3177.72.camel@kernel.crashing.org>
 <8034ac73-e5ee-fd0f-cfd9-9b552e4d5ec8@kaod.org>
 <1490649293.3177.84.camel@kernel.crashing.org>
 <f5146202-a82d-17b3-2e23-7b8954aa4092@kaod.org>
 <5b1b8621-c20d-f100-0875-8f2264d70e8e@kaod.org>
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
X-List-Received-Date: Tue, 28 Mar 2017 20:35:33 -0000

On Tue, 2017-03-28 at 18:41 +0200, Cédric Le Goater wrote:
> > > > > 
> The fragmented tx was not taking into account the full size of 
> the frame ... That is fixed now and I also added cksum offload 
> support for the AST2500. So the new and old n/w drivers are now
> supported in QEMU, in a very basic way. no nifty tuning.
> 
> I reworked a bit the way the rx queue is flushed but this is not 
> enough to support iperf yet. it needs more work to sustain high 
> throughput. U-Boot support would be nice also but I think we will 
> need a more complete NCSI model. 

Great !

I'll post a 4.10 rebase today and I'll also submit it upstream.

Cheers,
Ben.
