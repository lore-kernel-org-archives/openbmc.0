Return-Path: <alistair@popple.id.au>
Received: from ipmail06.adl6.internode.on.net (ipmail06.adl6.internode.on.net
 [150.101.137.145])
 by lists.ozlabs.org (Postfix) with ESMTP id 3td0Gz2GMNzDvHh
 for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2016 11:01:15 +1100 (AEDT)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2DLEwAbOU9YEF3VLXldGQEBAQEBAQEBAQEBBwEBAQEBgywLAQEBAQEfWoEGhSqfNZcMHguFcgQCAoF4VAECAQEBAQECBgEBAQEBAQEBN0WEaAEBAQMBAQE4HBgLBQsLGAkVEA8BFwERChQZiGMHD61cixMBAQEBAQEEAQEBAR8FixmFFIUVBZprhk+FcIVOgQyISIYLjguED4FJCwsIDiSFTCo0iBABAQE
Received: from ppp121-45-213-93.lns20.cbr1.internode.on.net (HELO
 new-mexico.localnet) ([121.45.213.93])
 by ipmail06.adl6.internode.on.net with ESMTP; 13 Dec 2016 10:30:45 +1030
From: Alistair Popple <alistair@popple.id.au>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Edward James <eajames@us.ibm.com>,
 Christopher Bostic <christopher.lee.bostic@gmail.com>
Subject: Re: [RFC linux 1/2] drivers: fsi: Add SBE client device driver
Date: Tue, 13 Dec 2016 11:00:43 +1100
Message-ID: <3785562.YHHZkbnSHo@new-mexico>
User-Agent: KMail/4.14.1 (Linux/4.2.0-0.bpo.1-amd64; KDE/4.14.2; x86_64; ; )
In-Reply-To: <CACPK8XcYT51saXXKuZzVZG960Y0Yfq_JwguAd93Aofd4PJYG9w@mail.gmail.com>
References: <1481064330-20757-1-git-send-email-eajames.ibm@gmail.com>
 <OF3D3B8518.26AA2AD8-ON00258087.007EAF40-00258087.007ED179@notes.na.collabserv.com>
 <CACPK8XcYT51saXXKuZzVZG960Y0Yfq_JwguAd93Aofd4PJYG9w@mail.gmail.com>
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
X-List-Received-Date: Tue, 13 Dec 2016 00:01:15 -0000

On Tue, 13 Dec 2016 10:37:53 AM Joel Stanley wrote:
> Hi Eddie,
> 
> On Tue, Dec 13, 2016 at 10:05 AM, Edward James <eajames@us.ibm.com> wrote:
> > Yes, the OCC driver will depend on the SBE driver for P9. I suppose the 
OCC
> > driver could handle all the SBE register access over FSI itself... but not
> > sure if that's a good approach.
> 
> Can you expand on why you think this not a good approach?
> 
> What abstraction does the SBE driver provide that the OCC driver
> benefits from? In other words, how does the code change in the OCC
> driver if we don't have a SBE driver in between?

I think it may have been mentioned earlier but it's probably not necessary to 
have drivers that simply provide read/write methods to the FSI address spaces 
at different offsets as these just add code to the kernel for no real benefit 
as it's easy to add those offsets to a /dev/cfam device access for example.

The thing the kernel can provide that userspace can't easily is atomic/shared 
access to multiple registers. So for example I seem to recall there was a 
discussion somewhere on using a FIFO to communicate with the SBE. It may make 
sense in this case for a kernel SBE client driver to provide read/write calls 
that would access that FIFO, but any userspace client that just needs to 
read/write an FSI/CFAM address should just do that via a single 
chardev/driver.

- Alistair

> Cheers,
> 
> Joel
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
> 
