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
 by lists.ozlabs.org (Postfix) with ESMTPS id 414qGm3GHRzF4T4
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jun 2018 22:40:16 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w5CCe6Z2002872;
 Tue, 12 Jun 2018 07:40:07 -0500
Message-ID: <37ef3ba288b02c1e291a0da8f3ee666e0d7e75c7.camel@kernel.crashing.org>
Subject: Re: [GIT PULL v2]  FSI updates for 4.17
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 openbmc@lists.ozlabs.org
Date: Tue, 12 Jun 2018 22:40:06 +1000
In-Reply-To: <20180612114442.GB5777@kroah.com>
References: <7c268f5bb58cb45a2868020b3c5b8f48ac6844ea.camel@kernel.crashing.org>
 <5c7f9044fefed8bc0e4ca5688801ffa379f38f62.camel@kernel.crashing.org>
 <20180612111839.GA3536@kroah.com>
 <01ffcf6a777323eb3bde1bbb5cb72dc849f404e3.camel@kernel.crashing.org>
 <20180612114442.GB5777@kroah.com>
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
X-List-Received-Date: Tue, 12 Jun 2018 12:40:17 -0000

On Tue, 2018-06-12 at 13:44 +0200, Greg Kroah-Hartman wrote:
> 
> > We are in regression only mode even before -rc1 these days ? including
> > for code that is basically completely unused upstream (which is what
> > this is trying to fix) ? :-) That's rather full-on ...
> 
> For code that goes into -rc1, it has to be in linux-next _BEFORE_ -final
> comes out.  That's been the rule for years, you should know that...

Oh I know and I also know that the rule was always somewhat flexible
for "new" drivers ;-) But heh, it's not biggie.

> > Anyway no biggie, it will just slow down some getting some of the other
> > drivers I suppose, though we can always explicitly list the dependency
> > on this tag to work around it.
> 
> There should not be a rush here, remember, kernel development does not
> have deadlines :)

Sort-of, it does make things difficult to have so much crap piling up
out of tree or in vendor trees as you well know, so the faster that
pile is sorted, the better everybody is. But I can deal with the
dependencies for 4.19 (assuming we get the 2 or 3 other drivers I want
to see upstream lined up as well in the next few weeks).

Cheers,
Ben.
