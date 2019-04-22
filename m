Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44nsH23gmKzDqL9
 for <openbmc@lists.ozlabs.org>; Tue, 23 Apr 2019 02:19:40 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Apr 2019 09:19:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,382,1549958400"; d="scan'208";a="142648706"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by fmsmga008.fm.intel.com with ESMTP; 22 Apr 2019 09:19:37 -0700
Subject: Re: Redfish OEM commands in OpenBMC
To: Andrew Geissler <geissonator@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CALLMt=qEtkfBwBcV1WzsGuCozyT1Fs8+1d+nUPPScxq1ZpihJQ@mail.gmail.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <5978896f-712d-a2b7-3f94-3a23e7a86003@intel.com>
Date: Mon, 22 Apr 2019 09:19:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CALLMt=qEtkfBwBcV1WzsGuCozyT1Fs8+1d+nUPPScxq1ZpihJQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
X-List-Received-Date: Mon, 22 Apr 2019 16:19:43 -0000

First of all, thank you for asking this question.  It's been a long time
coming.  I'm for one surprised we've avoided it for so long.  With that
said, lets dig in.

On 4/16/19 12:02 PM, Andrew Geissler wrote:
> Greetings,
> 
> As more and more of us are implementing Redfish within OpenBMC we are starting
> to run into situations where the function we need to implement is not available
> in the current Redfish schemas.
> 
> We've been joining DMTF workgroups and starting to get familiar with the process
> but, if OpenBMC upstreaming is considered slow, it's looking like upstreaming
> to the DMTF could be even slower.

It's slow because most of the interfaces being added are required to:
1. Prove utility to multiple members of the Redfish community that have
implementations.
2. Provide adequate, and unambiguous documentation on what the property
is for, and how it's intended to be used.
3. Get the associated metadata files in order, to enable the validators
to work.
4. Prototype, and make sure it meets the need.
5. Wait for a merge/release window.

If I look at some of the recent initiatives, certificates, composable
systems, and update, I would argue they're no slower than OpenBMC, they
just require a level of documentation and discussion that's a bit of a
higher bar than a "normal" OpenBMC feature.  As OpenBMC progresses, we
seem to be ratcheting up the rules around required documentation and
discussion, so I wonder if we'll get to that same level at some point as
well.

> 
> So my question is, are we taking a no OEM policy within OpenBMC? Or are we going
> to take a more flexible approach. Similar to openbmc/linux, as long as you're
> working upstream with the DMTF on your changes, OEM would be acceptable?

My overall goal when we first discussed this in the Redfish working
group was that the OpenBMC OEM schemas are common among all OpenBMC
implementations.  Said another way, if we're implementing an Oem schema,
it should be under the "OpenBMC" namespace, and we as a community should
have enough agreement to implement it in a way that works for the people
that need it.  The one exception to this is if we're implementing to
someone elses specification, which might call out specific namespaces
for the specification.

We have 1 OEM schema today for phosphor-pid-control, and it already
causes heartache for people implementing against it.  I'm tempted to
remove it before it actually makes it into an official release, so we
don't have to support it long term.  This is a discussion for another
thread.

> 
> From what I've seen so far, it looks like a lot of companies have gone the OEM
> route initially. They then use that experience to guide the discussion with the
> DMTF workgroups.

Some of the issue with this is that user-facing applications get written
against the OEM implementation, and now that OEM implementation has to
live forever, and support the same API.  This is great for companies
hoping to get lock-in on their products, but I really suspect it's not
what we want for OpenBMC.

The other thing to remember:  This is the public facing API that OpenBMC
exposes to users.  It is forever.  Think of it like the kernel userspace
API, and the guarantees that provides.  With that constraint, the
approach of "going the OEM route initially" doesn't really feel in line
with what OpenBMCs goals are.  I would much rather a standardized
solution that's 12 months after the spec releases, than an OEM solution
12 months early that we have to break often.

> 
> There could be some gray areas. For example, I want to add a Priority
> property to the UpdateService [1]. Maybe this would be ok to carry as an OEM
> for a bit?
Before I give +1 or -1 to the proposal, I've been meaning to really
understand what we think we're solving with priority, and why the
existing redfish mechanisms don't meet the need.  If I understand the
use correctly (which it's very likely I don't) posting to the target URI
property could cause the system to flip image priority.  This is
slightly less granular than an integer priority, but the use case you
gave only had 2 images, so it's very possible I'm missing something.
See above, there's no such thing as "carry as an OEM".

> Adriana wants to propose a whole new backup and restore design [2].
I believe there are redfish mechanisms for arbitrary "settings" type
interfaces that would probably be the recommended way.  To my
understanding, this is how systems currently implement BIOS settings,
which I think has roughly the same use case as BMC settings.  With that
said, this is better discussed in the Redfish forum, as there are more
experts present.


> Maybe that needs a bit more traction upstream to ensure it's going in the right
> direction for something DMTF would approve first? If we start limiting ourselves
> as a community on what DMTF has approved, I think we're going to struggle to
> deliver certain new functions.

From my perspective, there are a lot of development options that would
let us build code that doesn't necessarily get turned on.  Configure
options for implementing examples of new DMTF schemas could certainly be
done which would let people develop out ideas, but not affect OpenBMC
mainline until it's been included in part of the specification.

One thing to remember here: APIs are forever.  I would rather merge a
long-lived API "late" than fight with changing API behavior every release.

> 
> Andrew
> 
> [1] https://github.com/DMTF/Redfish/issues/3357 (can only see with DMTF access)
> [2] https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/18163
> 

I'll answer one of the questions I saw raised on the call: Should we
implement pluggable OEM handlers.

No. (full stop)

In my mind, this defeats most of the of the purpose of having an OpenBMC
community in the first place.  When I ask most of the "consumers" of
OpenBMC why they want to use it, usually the first or second answer is
around "standardization".  They want to be able to jump between hardware
vendors without all their public facing APIs breaking.  If I ask them
why Redfish doesn't meet the need, they talk specifically about OEM
parameters and schemas, and how implementations aren't standard enough
for their needs.
