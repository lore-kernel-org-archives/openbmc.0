Return-Path: <gregkh@linuxfoundation.org>
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3whgQ51ZydzDqFR
 for <openbmc@lists.ozlabs.org>; Tue,  6 Jun 2017 15:35:40 +1000 (AEST)
Received: from localhost (LFbn-1-12060-104.w90-92.abo.wanadoo.fr
 [90.92.122.104])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id AF161957;
 Tue,  6 Jun 2017 05:35:37 +0000 (UTC)
Date: Tue, 6 Jun 2017 07:35:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Rob Lippert <rlippert@google.com>, Robert Lippert <roblip@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] drivers/misc: add Aspeed LPC snoop driver
Message-ID: <20170606053531.GA21809@kroah.com>
References: <20170602215322.24376-1-rlippert@google.com>
 <CACPK8XfWySi5kDEASVpmDKAmBSByB6w0ocQxinazqTHbv+omcQ@mail.gmail.com>
 <CAFRv3wxh-+KiaLfD7zc4+FeiUOn4AyvJtcRLshiPQfpNb8uk4g@mail.gmail.com>
 <CACPK8XfKmm9ZUesgNJsL=MeruOfLzi-j6Dfjb2Be1zfdYn7XcQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8XfKmm9ZUesgNJsL=MeruOfLzi-j6Dfjb2Be1zfdYn7XcQ@mail.gmail.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
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
X-List-Received-Date: Tue, 06 Jun 2017 05:35:41 -0000

On Tue, Jun 06, 2017 at 11:46:56AM +0930, Joel Stanley wrote:
> On Tue, Jun 6, 2017 at 5:16 AM, Rob Lippert <rlippert@google.com> wrote:
> > On Sun, Jun 4, 2017 at 8:25 PM, Joel Stanley <joel@jms.id.au> wrote:
> >> Hello Rob,
> >>
> >> On Sat, Jun 3, 2017 at 7:23 AM, Robert Lippert <roblip@gmail.com> wrote:
> >>> This driver enables the LPC snoop hardware on the ASPEED BMC
> >>> which generates an interrupt upon every write to an I/O port
> >>> by the host.
> >>>
> >>> This is typically used to monitor BIOS boot progress by listening
> >>> to well-known debug port 80h.
> >>>
> >>> The functionality in this commit just saves all snooped values
> >>> to a circular 2K buffer in the kernel, subsequent commits can
> >>> act on the values to do things with them.
> >>
> >> Reviewed-by: Joel Stanley <joel@jms.id.au>
> >>
> >> The driver looks okay to me. I can stage it in the OpenBMC kernel tree
> >> while we get it reviewed upstream.
> >>
> >> Can you re-send to the upstream mailing lists so it gets reviewed
> >> there. You will need to include a device tree binding document too
> >> (something to put in Documentation/devicetree/bindings/).
> >
> > What is the proper upstream mailing list for this?  patman didn't list
> > any mailing lists...
> 
> Yeah, get_maintainers.pl only suggested lkml. cc lkml I think.
> 
> I'm not sure if we want to put these drivers in misc, or if we want to
> use something like drivers/soc/aspeed.
> 
> Arnd, Greg, do you have any suggestions here?

It's up to you :)
