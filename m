Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44jCjT5zZJzDqJf
 for <openbmc@lists.ozlabs.org>; Mon, 15 Apr 2019 12:53:00 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Message-ID: <89b3cb8651223f7093e0e89372018cffc02e3760.camel@fuzziesquirrel.com>
Subject: Re: Using D-Bus well-known service names and deprecating mapper
 service lookups
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Andrew Jeffery <andrew@aj.id.au>, Andrew Geissler <geissonator@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, William Kennington
 <wak@google.com>
Date: Sun, 14 Apr 2019 22:52:55 -0400
In-Reply-To: <5ac645f2-1e7c-4c2a-b6f2-e794da2fd875@www.fastmail.com>
References: <cd75d086-fdc0-4c83-8094-c3b802f6ad37@www.fastmail.com>
 <CALLMt=oxk3Bevbop-VLG6X2rpWf-fpbf2=KV9SWMWERWFfY_Eg@mail.gmail.com>
 <5ac645f2-1e7c-4c2a-b6f2-e794da2fd875@www.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Apr 2019 02:53:02 -0000

On Thu, 2019-04-11 at 23:47 -0400, Andrew Jeffery wrote:
> 
> On Fri, 12 Apr 2019, at 01:21, Andrew Geissler wrote:
> > On Thu, Apr 11, 2019 at 12:03 AM Andrew Jeffery <andrew@aj.id.au>
> > wrote:
> > > 
> > > I'm kicking this thread off because it's something that's
> > > bothered me for a while. I've complained about it to various
> > > people in private but have never taken it any further. My
> > > impression is that there's support for the idea that we move away
> > > from the mapper for service lookups (though we can't eliminate it
> > > entirely, we still need the interface reverse mapping feature), 

I'd like to eliminate the mapper entirely someday, if we can.  Can you
elaborate on why you think we can't?  I'm not sure I understand what
you mean by the interface reverse mapping feature.

> > > and I want to gauge how much support it has and whether there are
> > > solid counter-arguments.
> > 
> > Thanks for getting this started. Definitely something that's been
> > bothering me more and more lately as some of the issues you've
> > noted
> > above have become more prevalent. I agree that I'd like to
> > transition
> > away form GetObject usage in our process's. I'd be interested in
> > the
> > history from Brad on the reasons this was initially created and
> > whether they are still relevant though.
> 
> Great! Yeah, I think getting Brad's input is important here.

Doing lookups based on well-known bus names would make DBus programming
in OpenBMC more like DBus programming on the desktop, and that is a win
IMO.

FWIW the mapper was conceived (back in 2015) as a means to provide
flexibility in where (which process) objects are implemented, yet still
enable client reuse across those different implementations.  Want to
implement all your sensors in a single application?  No problem.  Want
to implement one application for each type of sensor?  No problem. 
Want to implement an application for every sensor instance?  No
problem.

Here is another way to look at it.  If we start applying a schema to
the well-known bus name as is normal in desktop-land, what would the
scope be?  Consider sensors.  You could have either specific or general
scope e.g. bus names like:

xyz.openbmc_project.sensors (general)

-or-

xyz.openbmc_project.nvme (specific)

In the case of the former, every sensor in a system has to be
implemented by a single process.  That isn't workable is it?

In the case of the latter, every client application looking for sensors
in the general sense (it doesn't care that it is a sensor on an nvme
drive that talks nvme-mi over i2c) has to introspect this bus, along
with every other bus to find any objects that implement a sensor
interface.

OpenBMC still needs a way to address these issues today - that hasn't
changed I don't think.  Is the mapper the best possible solution? 
Probably not.

-brad
