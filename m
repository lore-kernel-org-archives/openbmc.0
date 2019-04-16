Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="La0m9K66"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="RiSxEj9x"; dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44jpHx516xzDqGJ
 for <openbmc@lists.ozlabs.org>; Tue, 16 Apr 2019 11:51:25 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 84571634;
 Mon, 15 Apr 2019 21:51:21 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 15 Apr 2019 21:51:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=9+uYLOr7nMv37w1pnUZklO+dZLWqRvC
 8aA7QERjN0Lg=; b=La0m9K66cAX5sSsynH+BIhUTA9QeeiR+jbRcoKwQggTBx6k
 E8zT3GbVHmhrLCIUURXml2LcG9Lwy2f4WyA3iwJo1bQwAO9jSAGV6BDtP3Ku4R36
 WG4wUApd7USNYfVfLKXeRyr0J9I8d9UzMSLHhYIa44rpJ+D7xuGd4Szw4xFdi18d
 VJqU1vFWydEgXeQ3sCq2T4G2K6XoO1M3TCo758Wfx1NEi5e7ooJVIPD5lmU99QIM
 hkGIdMf2xE28MWrRuHW/0bVM/I5skLwxkFDoyt8ziMnSsQI+zZdpN0r0ehc1UUR8
 cwKUXgjL6KoK5b2JVKlvYK26rQ2uhII5IHaV4WQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=9+uYLO
 r7nMv37w1pnUZklO+dZLWqRvC8aA7QERjN0Lg=; b=RiSxEj9xMY0dqZcWBRko4i
 4kFxp81KiflSTr8g5uVyYzBCtPWxGzQMhwkjw5enNGvc1/ENx//gdaYM9gsiEXj6
 hiffBy9sBqkrejtHf8gBYsvYcDEM88RoGnwQM7XkXzgtjQe1c88kJCEnxeAcN5gb
 REozPz2AVcwPMC5K1vK9PwlE1rsyWDieFU9PNt+sx5ZW56Wii9hFxPhppdaArqkC
 1QcyGE9MehO5hD4QoKNjS7ULUt1mUint9+VKpIFhkfs67SBs/oLnZUP5A6aNyX7v
 G4f1INPLvfZsgl1QsfGeLxleAue5h9Ed+eCNeDtYbqtZVHvg/jKRTa1xScDRX/Lg
 ==
X-ME-Sender: <xms:GDW1XLuDxJX28xKYqrC6mjk550W2xOeL9xT_Cs3a7l-zUh8SNcKuow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrfedtgdehtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:GDW1XBxO3bcoxw3rz2uhNakuVCzUJ6_fCuAMzMjW1RNz7PVwUxW_2g>
 <xmx:GDW1XK1hBcRZ5RkBigLm6Q6Cp88rxf3bsZH0X125n2fgn0e0N77JCA>
 <xmx:GDW1XGznFDu_PphMRpu63bjJgpa35yoUiUgWHyk7EavPJSzyNnwlKA>
 <xmx:GTW1XLXzg5bxab18yUjNNi5Oyy35RhM_OpaIEgK_6dc8Wz6zCQUFQg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 3FC667C199; Mon, 15 Apr 2019 21:51:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-332-g22ddc6a-fmstable-20190412v1
Mime-Version: 1.0
X-Me-Personality: 52947553
Message-Id: <737313fb-6836-405f-a53b-01f7dbce5091@www.fastmail.com>
In-Reply-To: <89b3cb8651223f7093e0e89372018cffc02e3760.camel@fuzziesquirrel.com>
References: <cd75d086-fdc0-4c83-8094-c3b802f6ad37@www.fastmail.com>
 <CALLMt=oxk3Bevbop-VLG6X2rpWf-fpbf2=KV9SWMWERWFfY_Eg@mail.gmail.com>
 <5ac645f2-1e7c-4c2a-b6f2-e794da2fd875@www.fastmail.com>
 <89b3cb8651223f7093e0e89372018cffc02e3760.camel@fuzziesquirrel.com>
Date: Mon, 15 Apr 2019 21:51:19 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Brad Bishop" <bradleyb@fuzziesquirrel.com>,
 "Andrew Geissler" <geissonator@gmail.com>
Cc: "OpenBMC Maillist" <openbmc@lists.ozlabs.org>,
 "William Kennington" <wak@google.com>
Subject: =?UTF-8?Q?Re:_Using_D-Bus_well-known_service_names_and_deprecating_mappe?=
 =?UTF-8?Q?r_service_lookups?=
Content-Type: text/plain
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
X-List-Received-Date: Tue, 16 Apr 2019 01:51:26 -0000



On Mon, 15 Apr 2019, at 12:23, Brad Bishop wrote:
> On Thu, 2019-04-11 at 23:47 -0400, Andrew Jeffery wrote:
> > 
> > On Fri, 12 Apr 2019, at 01:21, Andrew Geissler wrote:
> > > On Thu, Apr 11, 2019 at 12:03 AM Andrew Jeffery <andrew@aj.id.au>
> > > wrote:
> > > > 
> > > > I'm kicking this thread off because it's something that's
> > > > bothered me for a while. I've complained about it to various
> > > > people in private but have never taken it any further. My
> > > > impression is that there's support for the idea that we move away
> > > > from the mapper for service lookups (though we can't eliminate it
> > > > entirely, we still need the interface reverse mapping feature), 
> 
> I'd like to eliminate the mapper entirely someday, if we can.  Can you
> elaborate on why you think we can't?  I'm not sure I understand what
> you mean by the interface reverse mapping feature.

Your discussion below is what I was talking about, probably just poor
terminology on my part.

> 
> > > > and I want to gauge how much support it has and whether there are
> > > > solid counter-arguments.
> > > 
> > > Thanks for getting this started. Definitely something that's been
> > > bothering me more and more lately as some of the issues you've
> > > noted
> > > above have become more prevalent. I agree that I'd like to
> > > transition
> > > away form GetObject usage in our process's. I'd be interested in
> > > the
> > > history from Brad on the reasons this was initially created and
> > > whether they are still relevant though.
> > 
> > Great! Yeah, I think getting Brad's input is important here.
> 
> Doing lookups based on well-known bus names would make DBus programming
> in OpenBMC more like DBus programming on the desktop, and that is a win
> IMO.
> 
> FWIW the mapper was conceived (back in 2015) as a means to provide
> flexibility in where (which process) objects are implemented, yet still
> enable client reuse across those different implementations.  Want to
> implement all your sensors in a single application?  No problem.  Want
> to implement one application for each type of sensor?  No problem. 
> Want to implement an application for every sensor instance?  No
> problem.
> 
> Here is another way to look at it.  If we start applying a schema to
> the well-known bus name as is normal in desktop-land, what would the
> scope be?  Consider sensors.  You could have either specific or general
> scope e.g. bus names like:
> 
> xyz.openbmc_project.sensors (general)
> 
> -or-
> 
> xyz.openbmc_project.nvme (specific)
> 
> In the case of the former, every sensor in a system has to be
> implemented by a single process.  That isn't workable is it?
> 
> In the case of the latter, every client application looking for sensors
> in the general sense (it doesn't care that it is a sensor on an nvme
> drive that talks nvme-mi over i2c) has to introspect this bus, along
> with every other bus to find any objects that implement a sensor
> interface.
> 
> OpenBMC still needs a way to address these issues today - that hasn't
> changed I don't think.  Is the mapper the best possible solution? 
> Probably not.

So I think you've painted a reasonable picture of the problem here,
however I also think that the solution to this specific problem has
been over-generalised to the point of pervasive use in OpenBMC,
and my argument is I don't think that's necessary.

Backing up, the motivation for this thread was that I wanted to know
whether phosphor-ipmi-host had got to the point of being considered
"on the bus". I knew we had the mapper-wait@ systemd service that
several units already used, so I gave that a go, and found that it didn't
behave as I expected (as outlined in the original message). From there
I moved on to poking at systemd and dbus-activation. The point is that
we're using the mapper in a lot of places where it should be
unnecessary. Having a well-defined schema and hence a well-known
bus name for ipmid doesn't seem too far fetched. The practical reality
of the implementation is it's done as a single process.

I'm not arguing that we eliminate the mapper entirely, your scenario
above does a good job of motivating its existence. I'm just arguing that
we should rely on it less, and do a better job of defining what services
should have the benefit of a well-known bus names, as this enables
reliable dependency management without hacks like mapper-wait@.

Maybe we could put together a list of what could benefit from well
known bus names and what requires the mapper? Might help us
understand the scope and whether any of this is a useful idea.

Cheers,

Andrew
