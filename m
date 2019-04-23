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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44pWGk3Tl5zDqGq
 for <openbmc@lists.ozlabs.org>; Wed, 24 Apr 2019 03:51:40 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Tue, 23 Apr 2019 13:52:18 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Ed Tanous <ed.tanous@intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Redfish OEM commands in OpenBMC
Message-ID: <20190423175218.fe6rmtxrqrq35pu2@thinkpad.dyn.fuzziesquirrel.com>
References: <CALLMt=qEtkfBwBcV1WzsGuCozyT1Fs8+1d+nUPPScxq1ZpihJQ@mail.gmail.com>
 <5978896f-712d-a2b7-3f94-3a23e7a86003@intel.com>
 <20190423135100.aelbc4w2np4lepjc@thinkpad.dyn.fuzziesquirrel.com>
 <060e7ffe-6953-c66b-483a-4600b64c7556@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <060e7ffe-6953-c66b-483a-4600b64c7556@intel.com>
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
X-List-Received-Date: Tue, 23 Apr 2019 17:51:43 -0000

On Tue, Apr 23, 2019 at 09:27:36AM -0700, Ed Tanous wrote:
>On 4/23/19 6:51 AM, Brad Bishop wrote:
>> On Mon, Apr 22, 2019 at 09:19:37AM -0700, Ed Tanous wrote:
>>> I'll answer one of the questions I saw raised on the call: Should we
>>> implement pluggable OEM handlers.
>>>
>>> No. (full stop)
>>
>> If this is the case, how am I supposed to implement our custom logging
>> format, PEL?
>
>Lots of options are available, while staying within the bounds I gave
>above.  Which you choose is likely constrained by what you're trying to
>solve by shoehorning in an older logging format ontop of a specification
>that already defines a logging format.

In a nutshell, the problem we are trying to solve is enablement of our
support structure.  IBM provides its customers with a deep level of
support.

To do this, IBM service personel require detailed failure information.
A lot of it.  For that we have PEL.

This isn't a new problem - we already solved it long ago.  PEL has long
been the "glue" between our systems and our support infrastructure.  We
are just trying to enable that for ourselves, off to the side,  within
the OpenBMC framework.

>
>1. Attend the DMTF spec meetings (I believe they still have a logging
>working group), and bespell how fantastic PEL logs are, and why they
>should be the industry standard.  Get industry adoption for a "PelEntry"
>and "PelCollection" schema definitions, then implement them in OpenBMC.
>If this is done, and it becomes a matter of "they haven't published the
>spec yet, but it's final" while waiting for an official DMTF drop, I'm
>happy to discuss OpenBMC rollout strategies for bringing the
>implementation in ahead of the spec.

But PEL is highly specific to IBM processes.  It doesn't make any sense
to try to push for standardization of something like that.  I'm not here
to try and standardize the mechanisms that enable server vendors provide
support and service to their customers.

>
>2. Use LogEntry and LogService to log your PEL entries like the other
>3-4 examples of logging do today.  Given that schema is very broad it
>allows you to log essentially whatever you want into the message field.
>This would also give the easiest time for people to port, and give you a
>"standard Redfish" way to download your PEL logs.

This might be feasible.  I just don't know enough about the logging
schema.  I'll have to do some reading.

>
>3. (Really not preferred) Use one of the other open source Redfish
>servers that supports runtime pluggable endpoints.  

I guess option 3 prime is we fork bmcweb, and implement pluggable OEM
callbacks there :wink:

>The point here is mostly that all the servers that defined endpoints
>that were "pluggable" the way it was described ended up becoming overly
>complicated, and IMHO lost a lot of battles because of said complexity.
>This is not to say bmcweb is "simple" by any means.
>
>4. Implement it as an odata endpoint, not necessarily in the Redfish
>tree.  If your goal isn't industry compliance and acceptance, you might
>consider moving a level up, and simply define your endpoints as odata
>endpoints under a different URL tree.  This would depend on your end
>goals, that I don't fully understand at this point.

This is the closest thing to what I had in mind.  But how is this not a
a pluggable OEM handler?  Are you saying pluggable OEM handlers in
bmcweb are OK as long as the route being handled is outside the /redfish
namespace?

>
>5. Get a percentage OpenBMC community to agree that PEL logging is the
>future, and that's the direction we should start going, then define an
>OEM endpoint for it under the OpenBMC namespace that we can all find
>ways to implement against the backend.

I'm not here to try to convince anyone to use PEL.  I have to have it on
my systems and I just want to understand what the path for getting it
there is.

>
>6. Write a maintained, versioned, multi-system implementation spec for
>"PEL over Redfish", that defines a PEL logging definition that could be
>implemented by any BMC (not just OpenBMC) and requires OEM endpoints.  A
>decent example of this is the RSD specification:
>https://www.intel.com/content/dam/www/public/us/en/documents/guides/podm-api-spec-v2-4-guide.pdf

Confused by this one.  Are you saying if we write a spec, we can
implement whatever we want in a pluggable handler for that spec?

>
>
>
>Have you asked the same question on Redfish forum?  There are
>significantly more experts there, and they might have even better ideas
>than I do to improve your standards compliance on what you're trying to
>implement.

No.  I hope it is clear now that I really am not motivated to try and
standardize PEL, or on the flip side, to change all of our internal
business processes around to make use of something else.
