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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44pzlJ19DnzDqTX
 for <openbmc@lists.ozlabs.org>; Wed, 24 Apr 2019 22:14:35 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Wed, 24 Apr 2019 08:15:13 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Andrew Geissler <geissonator@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 William Kennington <wak@google.com>
Subject: Re: Using D-Bus well-known service names and deprecating mapper
 service lookups
Message-ID: <20190424121513.uiw5hjmezdfli3yw@thinkpad.dyn.fuzziesquirrel.com>
References: <cd75d086-fdc0-4c83-8094-c3b802f6ad37@www.fastmail.com>
 <CALLMt=oxk3Bevbop-VLG6X2rpWf-fpbf2=KV9SWMWERWFfY_Eg@mail.gmail.com>
 <5ac645f2-1e7c-4c2a-b6f2-e794da2fd875@www.fastmail.com>
 <89b3cb8651223f7093e0e89372018cffc02e3760.camel@fuzziesquirrel.com>
 <737313fb-6836-405f-a53b-01f7dbce5091@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <737313fb-6836-405f-a53b-01f7dbce5091@www.fastmail.com>
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
X-List-Received-Date: Wed, 24 Apr 2019 12:14:36 -0000

On Mon, Apr 15, 2019 at 09:51:19PM -0400, Andrew Jeffery wrote:
>
>
>On Mon, 15 Apr 2019, at 12:23, Brad Bishop wrote:
>> OpenBMC still needs a way to address these issues today - that hasn't
>> changed I don't think.  Is the mapper the best possible solution?
>> Probably not.
>
>So I think you've painted a reasonable picture of the problem here,
>however I also think that the solution to this specific problem has
>been over-generalised to the point of pervasive use in OpenBMC,
>and my argument is I don't think that's necessary.

Agreed.  FWIW in the past there was a heavy tendency to solve problems
that didn't necessarily exist yet.

>
>Backing up, the motivation for this thread was that I wanted to know
>whether phosphor-ipmi-host had got to the point of being considered
>"on the bus". I knew we had the mapper-wait@ systemd service that
>several units already used, so I gave that a go, and found that it didn't
>behave as I expected (as outlined in the original message). From there
>I moved on to poking at systemd and dbus-activation. The point is that
>we're using the mapper in a lot of places where it should be
>unnecessary. Having a well-defined schema and hence a well-known
>bus name for ipmid doesn't seem too far fetched. The practical reality
>of the implementation is it's done as a single process.
>
>I'm not arguing that we eliminate the mapper entirely, your scenario
>above does a good job of motivating its existence. I'm just arguing that
>we should rely on it less, and do a better job of defining what services
>should have the benefit of a well-known bus names, as this enables
>reliable dependency management without hacks like mapper-wait@.

Agreed.

>
>Maybe we could put together a list of what could benefit from well
>known bus names and what requires the mapper? Might help us
>understand the scope and whether any of this is a useful idea.

It certainly can't hurt to have something like this.

>
>Cheers,
>
>Andrew
