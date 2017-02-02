Return-Path: <alistair@popple.id.au>
Received: from ipmail05.adl6.internode.on.net (ipmail05.adl6.internode.on.net
 [150.101.137.143])
 by lists.ozlabs.org (Postfix) with ESMTP id 3vDVNL70kJzDqGt
 for <openbmc@lists.ozlabs.org>; Thu,  2 Feb 2017 17:25:06 +1100 (AEDT)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2AYBQC8z5JY/wpSY3pdhW2FNokbqFiGIgKDBRQDAQEBAQEBAWIohGoBBTo/BQsLGAkVEA8BRwYTiXCvJ4tfijGBCYQzhX8Fm12HY4sNgRKPB5MENiFOPw4PBAgRGYIOhQMsNohoAQEB
Received: from static-82-10.transact.net.au (HELO new-mexico.localnet)
 ([122.99.82.10])
 by ipmail05.adl6.internode.on.net with ESMTP; 02 Feb 2017 16:48:48 +1030
From: Alistair Popple <alistair@popple.id.au>
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
Subject: Re: Users of SBE FIFO kernel driver
Date: Thu, 02 Feb 2017 17:18:44 +1100
Message-ID: <8359443.8Nxn5yxlFl@new-mexico>
User-Agent: KMail/4.14.1 (Linux/4.2.0-0.bpo.1-amd64; KDE/4.14.2; x86_64; ; )
In-Reply-To: <20170202052642.GD5504@heinlein.lan>
References: <edb6e9b2-a7a1-d706-5eb6-5966c06b1113@linux.vnet.ibm.com>
 <4820133.vKp7aKPARx@new-mexico> <20170202052642.GD5504@heinlein.lan>
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
X-List-Received-Date: Thu, 02 Feb 2017 06:25:07 -0000

Hi,

On Wed, 1 Feb 2017 11:26:42 PM Patrick Williams wrote:
> On Thu, Feb 02, 2017 at 03:48:02PM +1100, Alistair Popple wrote:
> > On Thu, 2 Feb 2017 01:59:08 PM Joel Stanley wrote:
> > > On Thu, Feb 2, 2017 at 5:58 AM, Christopher Bostic
> > > <cbostic@linux.vnet.ibm.com> wrote:
> > > In addition to Eddie's driver, in userspace we will have the code that
> > > performs the power on sequence.
> > 
> > Yep. For example as Ben mentioned the chip-ops also use the SBE FIFO. 
However 
> > we certainly don't want to put chip-ops directly in the kernel. It makes 
more 
> > sense to use a userspace SBE FIFO API to do the chips-ops, power on 
sequence 
> > etc. from userspace.
> 
> What is being referred to here as the "power on sequence" that goes over
> the SBE FIFO?  We do putcfams to start the power on sequence and there
> is no interaction with the FIFO to the best of my knowledge.
> 
> On another topic, when we are under secureboot, get/putscom operations
> need to go through the SBE FIFO.  Should there be a kernel driver for
> SCOM with the same userspace API no matter which path we should go?

I'd be inclined to expose both the SBE-FIFO and direct SCOM access to 
userspace using different instances of the same API (eg. /dev/scomsbe 
/dev/scomdirect - although I'm sure there are better names). That way 
userspace programs can choose which method if required.

> This certainly makes an application like pdbg easier.  One hang-up I can
> think of is I am not sure how we are suppose to know and inform the
> kernel if we can do direct SCOM or SBE-FIFO SCOM.  Maybe we always do
> SBE-FIFO SCOM.

Exactly - everything can just use /dev/scomsbe by default as that should 
always work, secure boot or not. If tools like cronus or pdbg need direct 
access they can just switch to using /dev/scomdirect if needed/configured to.

- Alistair
