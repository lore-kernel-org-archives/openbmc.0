Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ob5q/6dm"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="BdKkHlNb"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44gP464VctzDqSM
 for <openbmc@lists.ozlabs.org>; Fri, 12 Apr 2019 13:47:50 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C739F21C1C;
 Thu, 11 Apr 2019 23:47:47 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 11 Apr 2019 23:47:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=GUVutWyIQz0MH04xQSiaIosZQTF26aP
 QSETkLHAzDnY=; b=ob5q/6dmTDTEJ0DqTqCOIEzUDxyqR+/d4VTPXZCecN7HyoT
 K/kiWVUY9Jp3yr0cNVvg5bZKOeGkuUZRpFSni2b6V6rpN7lrAWtoXanv5P8ottiv
 bczt8g056SQC+gDO4x1DfUWSWHdtEc7lHgJNMOqKPacprmqBxMqm8vchlyc5Vgme
 6WiaAIJT/fihjES2cK+P6ttwjuwjLdK9zgVVuTAZcD5v/M3UlouQEIoVqodfRNL1
 ll/URmNcB/oQyVUHZb1UjddzNB0aZIdFgN2MkT4RO81p5bmVdEqNAgenSPDUyS2Y
 9jXLzGMTAywMrmpbWoecLT2q/4FAOEt6PfOWKRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=GUVutW
 yIQz0MH04xQSiaIosZQTF26aPQSETkLHAzDnY=; b=BdKkHlNbq68dYqZ2s6o61k
 9brU0SmpghjYSfe7KdyvoDBrrp3QGlhltsAbo23ZLrbP5CWgFW7b3xiznBk0XcgG
 B6K3q9U+fSVVtrAFq10upVX2Sk6zy9crMP11DElvlyRGqgEbnKQPK0zb8GaKgGZU
 i+kY29nCKE3ShHftnJYRiLUaYemdQrCQoWuQrIWo62/FCkugPQswXGYeTTLFd8C1
 NCoD2YzjoS61KPgP7ePCXrl0NRnjrLpLu1FnwNnLGeMFmp6jsU2Mat6y74ZcVwAE
 hss+7pB76sg6ja/tYHHqELy86c6SasTVIRZVi6jbHjzyRlejKAAQ4r3lM3AFvzaA
 ==
X-ME-Sender: <xms:YwqwXCVgjm3LfgvI6vqEbGy2qSa9JMUbXUal_VfQ4ApCaEcMqAtw9g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrvddtgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddvfedmnecujfgurhepofgfggfkjghffffhvffutgesthdtredtreer
 jeenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjh
 drihgurdgruheqnecuffhomhgrihhnpehophgvnhgsmhgtqdhprhhojhgvtghtrdighiii
 necurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuve
 hluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:YwqwXFaTPOw1QTPFX6Qc6GUrCCCJ3AmjaOzZjoblLq5uWTonxKoEuQ>
 <xmx:YwqwXPWV_0ZN71_63eTvAvBEVCZCaCRv0teoaDhtvb6aMST1glQTVQ>
 <xmx:YwqwXMLCaqd-sQRLq6mYkXpn03pgZ2OWq1KIJouk9cxeCLw9QGyjPw>
 <xmx:YwqwXBVdCrzEXeb5jGstxk6M3T6xj6L6elpF9Gd4lul8ZcKSB9ulQQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 438547C132; Thu, 11 Apr 2019 23:47:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-332-g22ddc6a-fmstable-20190412v1
Mime-Version: 1.0
X-Me-Personality: 52947553
Message-Id: <5ac645f2-1e7c-4c2a-b6f2-e794da2fd875@www.fastmail.com>
In-Reply-To: <CALLMt=oxk3Bevbop-VLG6X2rpWf-fpbf2=KV9SWMWERWFfY_Eg@mail.gmail.com>
References: <cd75d086-fdc0-4c83-8094-c3b802f6ad37@www.fastmail.com>
 <CALLMt=oxk3Bevbop-VLG6X2rpWf-fpbf2=KV9SWMWERWFfY_Eg@mail.gmail.com>
Date: Thu, 11 Apr 2019 23:47:46 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Andrew Geissler" <geissonator@gmail.com>
Cc: "OpenBMC Maillist" <openbmc@lists.ozlabs.org>,
 "Brad Bishop" <bradleyb@fuzziesquirrel.com>,
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
X-List-Received-Date: Fri, 12 Apr 2019 03:47:51 -0000



On Fri, 12 Apr 2019, at 01:21, Andrew Geissler wrote:
> On Thu, Apr 11, 2019 at 12:03 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> > Hello,
> >
> > Recently Andrew Geissler, William and myself have been running into limitations of the mapper's service lookups. In my opinion we should move to use well known service names and avoiding reliance on the mapper to determine who to talk to.
> 
> One thing to ask ourselves is what are the advantages to mapper and
> the GetObject concept (I think we all agree(?) that features like
> getting the subtree and associations are still useful).
> For GetObject the main thing I see as an advantage is actually
> relevant in my patch you linked. My code wants to talk to the host.
> The interface to talk to the host is currently provided by ipmid but
> at some point in the future that may move to the pldm daemon. Using
> mapper to get the object that provides my interface abstract that from
> me. Will the pldm daemon use the same well-know name as ipmid does
> now? 

Only if it at least implements the same set of object paths and interfaces
on those objects. I'm not convinced it will (yet).

> I'm not so sure about that. I know ipmid does currently implement
> two well known names, so we could potentially move it.
> 
> Another feature we've thought about would be if we some day support
> multi-BMC distributed systems. Having something like mapper
> abstracting cross BMC communication could be useful (i.e. process A
> just knows it needs to talk to interface B, mapper could route process
> A through a dbus proxy in another BMC without process A having any
> knowledge of that). Not really a fully a formed thought but just
> something we kicked around a bit when talking about distributed BMC's.

I looked into this briefly and doing federated D-Bus seemed pretty ugly.
I feel that inter-BMC communication needs a lot more thought than
anyone has given it (to my knowledge).

My gut feeling is we might be better served by another approach.

> 
> >
> > My issues with using the mapper for service dependencies are:
> >
> > 1. Ambiguities in the way `mapper wait` functions
> > 2. Race conditions between bus name announcement, mapper introspection and inbound service lookups
> > 3. Increased IPC traffic (decreasing performance).
> >
> > Expanding on 1, `mapper wait` takes a path name argument and waits until the path is available on a bus connection. The problem here is that multiple connections can (and do) implement objects under a given path, so the successful exit of `mapper wait` with the expectation that a given service is available can be an undefined result, as it's possible the *wrong* service was used to resolve the wait.
> >
> > Where this hits home is that we currently have a systemd service, mapper-wait@.service, that allows units to depend on the presence of a service providing a required path. With the ambiguity outlined above it's possible that dependent services are started earlier than they should be due to `mapper wait` falsely exiting success with respect to the dependent's actual requirement.
> >
> > A quick grep of the openbmc tree gives an idea of the potential problem size:
> >
> > $ git ls-files -- recipes-phosphor/ | grep '\.service$' | wc -l
> > 98
> > $ git ls-files -- recipes-phosphor/ | grep '\.service$' | xargs grep -li mapper-wait | wc -l
> > 32
> >
> > So about a 1/3 generic services are potentially exposed.
> 
> Yes, this has been hounding me for a while now. We had a discussion in
> IRC a few months ago about having mapper stop doing introspection and
> move to using the InterfacesAdded signal. This would improve
> performance (introspection is resource intensive) and it would
> severely limit (if not fix) the race condition issues. I took a stab
> at a patch 
> (https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-objmgr/+/17837)
> but have been running into some weird issues I haven't gotten to the
> bottom of yet.

Have you documented the weird issues anywhere? This seems like
a nice optimisation, would be good to resolve whatever the problems
are.

> 
> >
> > Point 2 leads to patches like [1] where we wind up implementing a fallback to a well-known service name if we get issues with a mapper lookup. If this is a valid approach then we should just avoid looking up the service altogether; implementing this fallback approach everywhere seems tedious and error-prone, and the lookup is a waste of resources if the fallback works regardless.
> >
> > By moving to well known service names we can exploit more of systemd's D-Bus integration with units of Type=dbus, and depending either on unit names aliased to D-Bus service names, or on D-Bus service activation, and receive reliable behaviour for D-Bus-based dependencies.
> >
> > Point 3 is something William has complained about, and I think it's a good point - avoiding IPC where we can is a good thing no matter what we're doing.
> >
> > I'm kicking this thread off because it's something that's bothered me for a while. I've complained about it to various people in private but have never taken it any further. My impression is that there's support for the idea that we move away from the mapper for service lookups (though we can't eliminate it entirely, we still need the interface reverse mapping feature), and I want to gauge how much support it has and whether there are solid counter-arguments.
> 
> Thanks for getting this started. Definitely something that's been
> bothering me more and more lately as some of the issues you've noted
> above have become more prevalent. I agree that I'd like to transition
> away form GetObject usage in our process's. I'd be interested in the
> history from Brad on the reasons this was initially created and
> whether they are still relevant though.

Great! Yeah, I think getting Brad's input is important here.

Thanks for the response. I was intending to Cc you but apparently
didn't, sorry about that.

Andrew
