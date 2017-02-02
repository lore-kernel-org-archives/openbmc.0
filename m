Return-Path: <alistair@popple.id.au>
Received: from ipmail05.adl6.internode.on.net (ipmail05.adl6.internode.on.net
 [150.101.137.143])
 by lists.ozlabs.org (Postfix) with ESMTP id 3vDSFb4LDJzDqGH
 for <openbmc@lists.ozlabs.org>; Thu,  2 Feb 2017 15:49:07 +1100 (AEDT)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2AYBQAyuZJY/wpSY3pdhW2FNokbqFiGIgKDAxQDAQEBAQEBAWIohGoBBTo/BQsLGAkMCRAPAUcGE4lwryuLYYs6hDNZhSYFm12ScJAZkwQ2IU4/Dg8ECBEZgg6FAyw2iGgBAQE
Received: from static-82-10.transact.net.au (HELO new-mexico.localnet)
 ([122.99.82.10])
 by ipmail05.adl6.internode.on.net with ESMTP; 02 Feb 2017 15:18:03 +1030
From: Alistair Popple <alistair@popple.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>
Subject: Re: Users of SBE FIFO kernel driver
Date: Thu, 02 Feb 2017 15:48:02 +1100
Message-ID: <4820133.vKp7aKPARx@new-mexico>
User-Agent: KMail/4.14.1 (Linux/4.2.0-0.bpo.1-amd64; KDE/4.14.2; x86_64; ; )
In-Reply-To: <CACPK8XdQ2LezJKXzT1Z9=09=XGv=G2ncVxY-LKj7LZ7BFQWaKA@mail.gmail.com>
References: <edb6e9b2-a7a1-d706-5eb6-5966c06b1113@linux.vnet.ibm.com>
 <CACPK8XdQ2LezJKXzT1Z9=09=XGv=G2ncVxY-LKj7LZ7BFQWaKA@mail.gmail.com>
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
X-List-Received-Date: Thu, 02 Feb 2017 04:49:07 -0000

On Thu, 2 Feb 2017 01:59:08 PM Joel Stanley wrote:
> Hi Chris,
> 
> On Thu, Feb 2, 2017 at 5:58 AM, Christopher Bostic
> <cbostic@linux.vnet.ibm.com> wrote:
> > I've not seen this discussed in the group but if this has already been
> > determined than any pointers to the latest documentation would be
> > appreciated.
> >
> > Who are all the potential users of the OpenBMC SBE FIFO device driver?   I
> > understand it will need to export its general submit interface to other
> > kernel drivers.  Only one I know of for sure would be the OCC driver Eddie
> > James is working on.
> 
> In addition to Eddie's driver, in userspace we will have the code that
> performs the power on sequence.
> 
> > Any others?
> > What about user space access of the SBE FIFO engine?  What apps would
> > require it?  Cronus I assume will need some means to directly access it.
> 
> We want userspace API and an in-kernel API.

Yep. For example as Ben mentioned the chip-ops also use the SBE FIFO. However 
we certainly don't want to put chip-ops directly in the kernel. It makes more 
sense to use a userspace SBE FIFO API to do the chips-ops, power on sequence 
etc. from userspace.
 
> The driver you design will need to take into account that there will
> be multiple users from each of these APIs. For instance, there will be
> Eddie's OCC hwmon driver and the userspace code that kicks off the
> boot sequence.
> 
> Cheers,
> 
> Joel
