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
 by lists.ozlabs.org (Postfix) with ESMTPS id 414ncJ3vvZzF21Q
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jun 2018 21:25:20 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w5CBPBDA031693;
 Tue, 12 Jun 2018 06:25:12 -0500
Message-ID: <01ffcf6a777323eb3bde1bbb5cb72dc849f404e3.camel@kernel.crashing.org>
Subject: Re: [GIT PULL v2]  FSI updates for 4.17
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 openbmc@lists.ozlabs.org
Date: Tue, 12 Jun 2018 21:25:11 +1000
In-Reply-To: <20180612111839.GA3536@kroah.com>
References: <7c268f5bb58cb45a2868020b3c5b8f48ac6844ea.camel@kernel.crashing.org>
 <5c7f9044fefed8bc0e4ca5688801ffa379f38f62.camel@kernel.crashing.org>
 <20180612111839.GA3536@kroah.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.1 (3.28.1-2.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Jun 2018 11:25:21 -0000

On Tue, 2018-06-12 at 13:18 +0200, Greg Kroah-Hartman wrote:
> On Tue, Jun 12, 2018 at 08:54:39PM +1000, Benjamin Herrenschmidt wrote:
> > Hi Greg !
> > 
> > There are a first round of updates of the FSI stack, aiming at reducing/removing
> > he gap with the OpenBMC tree and a first step in getting dependent drivers
> > upstream.
> > 
> > These changes significantly improve the FSI bitbanging driver performance
> > and reliability, and add the new "sbefifo" driver for communicating with
> > the POWER9 Self Boot Engine (which will be needed for some upcoming
> > additional drivers).
> > 
> > These were posted to the list as patches a couple of weeks ago and were
> > prior to that tested in the OpenBMC tree and CI. Some subsequent driver
> > work depends on some of these, so merging early is probably the best.
> 
> Yeah, but as they are not "regression fixes", I'll put them into my
> -next branch for merging with 4.19-rc1.  I'll do that once 4.18-rc1 is
> released, can't touch my trees until that happens.

We are in regression only mode even before -rc1 these days ? including
for code that is basically completely unused upstream (which is what
this is trying to fix) ? :-) That's rather full-on ...

Anyway no biggie, it will just slow down some getting some of the other
drivers I suppose, though we can always explicitly list the dependency
on this tag to work around it.

Cheers,
Ben.
