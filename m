Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44pTPn4zkYzDq9H
 for <openbmc@lists.ozlabs.org>; Wed, 24 Apr 2019 02:27:39 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Apr 2019 09:27:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,386,1549958400"; d="scan'208";a="167179838"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by fmsmga001.fm.intel.com with ESMTP; 23 Apr 2019 09:27:37 -0700
Subject: Re: Redfish OEM commands in OpenBMC
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Andrew Geissler <geissonator@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CALLMt=qEtkfBwBcV1WzsGuCozyT1Fs8+1d+nUPPScxq1ZpihJQ@mail.gmail.com>
 <5978896f-712d-a2b7-3f94-3a23e7a86003@intel.com>
 <20190423135100.aelbc4w2np4lepjc@thinkpad.dyn.fuzziesquirrel.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <060e7ffe-6953-c66b-483a-4600b64c7556@intel.com>
Date: Tue, 23 Apr 2019 09:27:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190423135100.aelbc4w2np4lepjc@thinkpad.dyn.fuzziesquirrel.com>
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
X-List-Received-Date: Tue, 23 Apr 2019 16:27:42 -0000

On 4/23/19 6:51 AM, Brad Bishop wrote:
> On Mon, Apr 22, 2019 at 09:19:37AM -0700, Ed Tanous wrote:
>> I'll answer one of the questions I saw raised on the call: Should we
>> implement pluggable OEM handlers.
>>
>> No. (full stop)
> 
> If this is the case, how am I supposed to implement our custom logging
> format, PEL?

Lots of options are available, while staying within the bounds I gave
above.  Which you choose is likely constrained by what you're trying to
solve by shoehorning in an older logging format ontop of a specification
that already defines a logging format.

1. Attend the DMTF spec meetings (I believe they still have a logging
working group), and bespell how fantastic PEL logs are, and why they
should be the industry standard.  Get industry adoption for a "PelEntry"
and "PelCollection" schema definitions, then implement them in OpenBMC.
If this is done, and it becomes a matter of "they haven't published the
spec yet, but it's final" while waiting for an official DMTF drop, I'm
happy to discuss OpenBMC rollout strategies for bringing the
implementation in ahead of the spec.

2. Use LogEntry and LogService to log your PEL entries like the other
3-4 examples of logging do today.  Given that schema is very broad it
allows you to log essentially whatever you want into the message field.
This would also give the easiest time for people to port, and give you a
"standard Redfish" way to download your PEL logs.

3. (Really not preferred) Use one of the other open source Redfish
servers that supports runtime pluggable endpoints.  The point here is
mostly that all the servers that defined endpoints that were "pluggable"
the way it was described ended up becoming overly complicated, and IMHO
lost a lot of battles because of said complexity.  This is not to say
bmcweb is "simple" by any means.

4. Implement it as an odata endpoint, not necessarily in the Redfish
tree.  If your goal isn't industry compliance and acceptance, you might
consider moving a level up, and simply define your endpoints as odata
endpoints under a different URL tree.  This would depend on your end
goals, that I don't fully understand at this point.

5. Get a percentage OpenBMC community to agree that PEL logging is the
future, and that's the direction we should start going, then define an
OEM endpoint for it under the OpenBMC namespace that we can all find
ways to implement against the backend.

6. Write a maintained, versioned, multi-system implementation spec for
"PEL over Redfish", that defines a PEL logging definition that could be
implemented by any BMC (not just OpenBMC) and requires OEM endpoints.  A
decent example of this is the RSD specification:
https://www.intel.com/content/dam/www/public/us/en/documents/guides/podm-api-spec-v2-4-guide.pdf



Have you asked the same question on Redfish forum?  There are
significantly more experts there, and they might have even better ideas
than I do to improve your standards compliance on what you're trying to
implement.
