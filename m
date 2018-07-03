Return-Path: <benh@kernel.crashing.org>
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41KpHL2mdzzF1MY
 for <openbmc@lists.ozlabs.org>; Wed,  4 Jul 2018 01:40:46 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w63Fdrkp007605;
 Tue, 3 Jul 2018 10:39:56 -0500
Message-ID: <6f0c3d6d81202e385fee55a2c8aaec18d1d2acda.camel@kernel.crashing.org>
Subject: Re: [RFC PATCH 1/4] dts: misc: Add bindings documentation for
 bmc-misc-ctrl
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au,
 Eugene.Cho@dell.com, a.amelkin@yadro.com, stewart@linux.ibm.com,
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Wed, 04 Jul 2018 01:39:53 +1000
In-Reply-To: <20180703143109.GB2043@kroah.com>
References: <20180703070413.28756-1-andrew@aj.id.au>
 <20180703070413.28756-2-andrew@aj.id.au> <20180703075009.GA27649@kroah.com>
 <a1c3ecd4fed28e2b33c95a476452318dba58cd7e.camel@kernel.crashing.org>
 <20180703143109.GB2043@kroah.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.3 (3.28.3-1.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Jul 2018 15:40:47 -0000

On Tue, 2018-07-03 at 16:31 +0200, Greg KH wrote:
> On Wed, Jul 04, 2018 at 12:16:49AM +1000, Benjamin Herrenschmidt wrote:
> > On Tue, 2018-07-03 at 09:50 +0200, Greg KH wrote:
> > > On Tue, Jul 03, 2018 at 05:04:10PM +1000, Andrew Jeffery wrote:
> > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > > > ---
> > > 
> > > I can't take patches without any changelog text at all :(
> > 
> > Greg (and replying to your other comments as well)...
> > 
> > This is an RFC series, it's not meant for you to take at this point,
> > it's about discussing the overall approach to exposing BMC random
> > "tunables" as explained in patch 0 of the series.
> > 
> > Yes the individual patches aren't yet at the level of polish for a
> > formal submission, we (naively ?) thought that's what the whole RFC tag
> > is about :-)
> 
> Oh come on, putting a basic "here is what this patch does" comment
> should be part of every patch, otherwise what is there to comment on if
> we don't know what is going on in the patch itself?

Well, it adds documentation :-) You can just read the patch which is
... the documentation :)
> 
> Anyway, I provided a bunch of feedback to the "real" patch in this
> series...

Yes, you did that's fine. Thanks.

Cheers,
Ben.
