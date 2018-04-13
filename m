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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Mmqh3wFzzF1Rd;
 Fri, 13 Apr 2018 15:41:52 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w3D5fcPu022932;
 Fri, 13 Apr 2018 00:41:40 -0500
Message-ID: <1523598098.11062.202.camel@kernel.crashing.org>
Subject: Re: openbmc Digest, Vol 32, Issue 32
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: "Wang, Haiyue" <haiyue.wang@linux.intel.com>, openbmc@lists.ozlabs.org,
 openbmc-request@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, Joel
 Stanley <joel@jms.id.au>
Date: Fri, 13 Apr 2018 15:41:38 +1000
In-Reply-To: <94260b45-7adc-a9ff-6300-e5bd3bd359bb@linux.intel.com>
References: <mailman.355.1523511154.2391.openbmc@lists.ozlabs.org>
 <45b6959c-5743-744f-d4d6-4f40984f1323@linux.intel.com>
 <1523521249.11062.168.camel@kernel.crashing.org>
 <5b09c4c7-e730-df2a-9b48-9787f5dcb620@linux.intel.com>
 <1523594598.11062.191.camel@kernel.crashing.org>
 <94260b45-7adc-a9ff-6300-e5bd3bd359bb@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 (3.26.6-1.fc27) 
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
X-List-Received-Date: Fri, 13 Apr 2018 05:41:53 -0000

On Fri, 2018-04-13 at 13:11 +0800, Wang, Haiyue wrote:
> 
> On 2018-04-13 12:43, Benjamin Herrenschmidt wrote:
> > On Thu, 2018-04-12 at 16:42 +0800, Wang, Haiyue wrote:
> > > I means the device tree merge time, putting things in kernel need long time
> > > to be passed code review. And people may want to export different range of
> > > registers, then they need to change the device tree, the development cycle
> > > may be long.
> > 
> > But that's not a big issue in practice though, you don't*need*  all
> > your device-trees to be upstream and up to date especially if it's
> > stored separately from the kernel.
> > 
> > Keep in mind this should be strictly limited to a few registers that
> > need that sort of manipulation, maybe a handful or two, that's it.
> > 
> > Most things need proper kernel drivers.
> > 
> 
> Understood, NOT exposing like /dev/mem makes sense for security

Not just security. It's also plain gross ;-)

It also means it's hard to locate which pieces of your userspace may
contain chip revision specific stuff.

If something changes, you get a nice error bcs the named file is absent
rather than whacking the wrong register with underterminate results.

The naming also makes the code more comprehensible & grep'able

You also have an atomicity problem is the same register contains
multiple things that several fields (kernel, userspace) try to modify
at the same time, etc etc etc...

It's never great to have userspace bang at the registers so directly.

etc etc etc..

A minimum of abastraction is much more preferable in these cases.

Cheers,
Ben.
