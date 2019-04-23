Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44pd4J1R1NzDq9C
 for <openbmc@lists.ozlabs.org>; Wed, 24 Apr 2019 08:12:59 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Apr 2019 15:12:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,387,1549958400"; d="scan'208";a="145121260"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by orsmga003.jf.intel.com with ESMTP; 23 Apr 2019 15:12:55 -0700
Subject: Re: Redfish OEM commands in OpenBMC
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CALLMt=qEtkfBwBcV1WzsGuCozyT1Fs8+1d+nUPPScxq1ZpihJQ@mail.gmail.com>
 <5978896f-712d-a2b7-3f94-3a23e7a86003@intel.com>
 <20190423135100.aelbc4w2np4lepjc@thinkpad.dyn.fuzziesquirrel.com>
 <060e7ffe-6953-c66b-483a-4600b64c7556@intel.com>
 <20190423175218.fe6rmtxrqrq35pu2@thinkpad.dyn.fuzziesquirrel.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <488e0e73-76d0-977e-6f20-ff91e35f6cfa@intel.com>
Date: Tue, 23 Apr 2019 15:12:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190423175218.fe6rmtxrqrq35pu2@thinkpad.dyn.fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Tue, 23 Apr 2019 22:13:05 -0000

On 4/23/19 10:52 AM, Brad Bishop wrote:
> On Tue, Apr 23, 2019 at 09:27:36AM -0700, Ed Tanous wrote:
>> On 4/23/19 6:51 AM, Brad Bishop wrote:
>>> On Mon, Apr 22, 2019 at 09:19:37AM -0700, Ed Tanous wrote:
>>>> I'll answer one of the questions I saw raised on the call: Should we
>>>> implement pluggable OEM handlers.
>>>>
>>>> No. (full stop)
>>>
>>> If this is the case, how am I supposed to implement our custom logging
>>> format, PEL?
>>
>> Lots of options are available, while staying within the bounds I gave
>> above.  Which you choose is likely constrained by what you're trying to
>> solve by shoehorning in an older logging format ontop of a specification
>> that already defines a logging format.
> 
> In a nutshell, the problem we are trying to solve is enablement of our
> support structure.  IBM provides its customers with a deep level of
> support.
> 
> To do this, IBM service personel require detailed failure information.
> A lot of it.  For that we have PEL.
> 
> This isn't a new problem - we already solved it long ago.  PEL has long
> been the "glue" between our systems and our support infrastructure.  We
> are just trying to enable that for ourselves, off to the side,  within
> the OpenBMC framework.

Some of what I'm trying to understand here is what you touched on.  If
this has already been solved long ago, why are you trying to add it to
Redfish?  That seems like opening a whole other can of problems,
including standardizing PEL over Redfish across all of IBMs systems.

> 
>>
>> 1. Attend the DMTF spec meetings (I believe they still have a logging
>> working group), and bespell how fantastic PEL logs are, and why they
>> should be the industry standard.  Get industry adoption for a "PelEntry"
>> and "PelCollection" schema definitions, then implement them in OpenBMC.
>> If this is done, and it becomes a matter of "they haven't published the
>> spec yet, but it's final" while waiting for an official DMTF drop, I'm
>> happy to discuss OpenBMC rollout strategies for bringing the
>> implementation in ahead of the spec.
> 
> But PEL is highly specific to IBM processes.  It doesn't make any sense
> to try to push for standardization of something like that.  I'm not here
> to try and standardize the mechanisms that enable server vendors provide
> support and service to their customers.
> 

So I think this is the part I don't quite follow.  If it's highly
specific, and important that it be standardized inside IBM, and unlikely
to be changed or standardized, why is a Redfish version important?
Wouldn't you rather just have unification with your other systems?

>>
>> 2. Use LogEntry and LogService to log your PEL entries like the other
>> 3-4 examples of logging do today.  Given that schema is very broad it
>> allows you to log essentially whatever you want into the message field.
>> This would also give the easiest time for people to port, and give you a
>> "standard Redfish" way to download your PEL logs.
> 
> This might be feasible.  I just don't know enough about the logging
> schema.  I'll have to do some reading.
> 
>>
>> 3. (Really not preferred) Use one of the other open source Redfish
>> servers that supports runtime pluggable endpoints.  
> 
> I guess option 3 prime is we fork bmcweb, and implement pluggable OEM
> callbacks there :wink:

This was originally listed as option seven, but I realized if you wanted
to do this, you would've already, and likely wouldn't be bringing it up
on the mailing list.  I'm happy to be proven wrong here that pluggable
callbacks could be done in a non-complicated easy to follow way, but
every option I've seen makes some really unfortunate tradeoffs in
readability, complexity, or performance.

> 
>> The point here is mostly that all the servers that defined endpoints
>> that were "pluggable" the way it was described ended up becoming overly
>> complicated, and IMHO lost a lot of battles because of said complexity.
>> This is not to say bmcweb is "simple" by any means.
>>
>> 4. Implement it as an odata endpoint, not necessarily in the Redfish
>> tree.  If your goal isn't industry compliance and acceptance, you might
>> consider moving a level up, and simply define your endpoints as odata
>> endpoints under a different URL tree.  This would depend on your end
>> goals, that I don't fully understand at this point.
> 
> This is the closest thing to what I had in mind.  But how is this not a
> a pluggable OEM handler?  Are you saying pluggable OEM handlers in
> bmcweb are OK as long as the route being handled is outside the /redfish
> namespace?

AH, I see the confusion.  When I hear "pluggable" I assume that means
runtime-pluggable dynamic resolution of plugins and interfaces.  If I
understand you correctly, that's not what the "plugin" discussion was.
We can certainly enable/disable features using the existing configure
mechanisms at compile time.  There are already a dozen or so examples of
enabling/disabling features at compile time, including the existing
logging implementations.
https://github.com/openbmc/bmcweb/blob/424c4176bbbc55c0cfd08f273b7e4500c977a138/CMakeLists.txt#L11

We could certainly add another custom URL handler for PEL logs if that's
the route you want to go down, although I'd personally still prefer
option 2, as we can at least keep it somewhat in the standard.

> 
>>
>> 5. Get a percentage OpenBMC community to agree that PEL logging is the
>> future, and that's the direction we should start going, then define an
>> OEM endpoint for it under the OpenBMC namespace that we can all find
>> ways to implement against the backend.
> 
> I'm not here to try to convince anyone to use PEL.  I have to have it on
> my systems and I just want to understand what the path for getting it
> there is.

Your existing systems have PEL over Redfish?  What do the metadata files
look like?  I think that would help the discussion a lot.

> 
>>
>> 6. Write a maintained, versioned, multi-system implementation spec for
>> "PEL over Redfish", that defines a PEL logging definition that could be
>> implemented by any BMC (not just OpenBMC) and requires OEM endpoints.  A
>> decent example of this is the RSD specification:
>> https://www.intel.com/content/dam/www/public/us/en/documents/guides/podm-api-spec-v2-4-guide.pdf
>>
> 
> Confused by this one.  Are you saying if we write a spec, we can
> implement whatever we want in a pluggable handler for that spec?

See note about plugins above.  "Configurable feature" != "plugin" in my
mind.  The "if there's a spec" statement is a bit of a cop out on the
OEM properties, because there would be no way to implement said spec
compliance without defining OEM properties.  With that said, it's an
open spec that any BMC can implement against, so it is easier to claim
widespread usage and standards, which I think is one of the goals of
this project, and Redfish in general.

To be clear, I don't have any intention of implementing the POD manager
spec above on OpenBMC, it's just an example of a standardized OEM-based
interface that multiple implementations implement against.

> 
>>
>>
>>
>> Have you asked the same question on Redfish forum?  There are
>> significantly more experts there, and they might have even better ideas
>> than I do to improve your standards compliance on what you're trying to
>> implement.
> 
> No.  I hope it is clear now that I really am not motivated to try and
> standardize PEL, or on the flip side, to change all of our internal
> business processes around to make use of something else.

I'm sure there's a way to work through it as a community, and I will
fully admit that I have similar things of my own that have the same need.

Any feature is going to be hard going if the position starts with the
premise: "we have this feature on non openbmc systems, with a closed
spec, we don't want to change it, and we want it implemented in openbmc
master because we need backward compatibility".  With that said, I'm
sure there's a way to get it in if it's something you need.

I did just find the "IBM enterprise error logging requirements" review.
I didn't realize that was related to PEL.  I need to read through it and
inform myself a little better.
