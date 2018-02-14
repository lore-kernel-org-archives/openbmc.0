Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zhWpP6v38zF1JG
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 07:53:32 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Feb 2018 12:53:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,514,1511856000"; d="scan'208";a="175167731"
Received: from mauery.jf.intel.com (HELO mauery) ([10.7.150.164])
 by orsmga004.jf.intel.com with ESMTP; 14 Feb 2018 12:53:27 -0800
Date: Wed, 14 Feb 2018 12:53:27 -0800
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Patrick Venture <venture@google.com>
Cc: Dave Cobbley <david.j.cobbley@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: IPMI Set LAN Configuration Parameters
Message-ID: <20180214205327.GG113334@mauery>
References: <6de6bf00-ea77-a061-cd92-df255b2c0a7f@linux.intel.com>
 <CAO=notyuHzYmwxDre9-kTgPeYNSSrut32wJeRo46VWzrW6Q=xQ@mail.gmail.com>
 <7d9366d2-7816-227c-ac36-409faaa13d8b@linux.intel.com>
 <CAO=notzcgZxFthUY90V+2BgW=YnykrVsiVG4OdV0zR7kSTFoUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAO=notzcgZxFthUY90V+2BgW=YnykrVsiVG4OdV0zR7kSTFoUA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Wed, 14 Feb 2018 20:53:34 -0000

On 14-Feb-2018 12:32 PM, Patrick Venture wrote:
>I thought you had to explicitly set in_progress with the ipmitool?  My
>own ipmitool utility is implemented as you described where it doesn't
>assume anything about your intent, just follows the actions.

Currently, ipmitool (incorrectly) sets the "set in progress" bit for 
every lan configuration parameter it sets. Given how the CLI interface 
only allows the user to specify a single parameter at a time, it might 
be smart to have ipmitool also expose controls for the "set in progress" 
bit. Alternately, providing a way to to specify multiple parameters in a 
single call would be good. Something like:

ipmitool lan set 1 ipaddr 1.2.3.4 netmask 255.255.0.0 gateway 1.2.0.1 dns 1.2.1.1 
ipmitool lan set 1 ipsrc dhcp

and it would automatically set and use the set in progress bit 
correctly.

And ipmid could then take two actions, depending on how this bit is 
(ab)used:
1) if only a single command is wrapped up in the 
set-in-progress/set-complete, then employ a timeout so that after some 
amount of time, all the queued commands get applied.
2) if multiple commands get wrapped up in the 
set-in-progress/set-complete, then apply the command set when the 
set-complete is received.

Getting ipmitool changed to have correct behavior will take some doing, 
so we will need to be able to deal with its incorrect behavior for now. 
But also responding to correct behavior can make tools that employ that 
behavior work even better (with no timeout delays).

Just my $0.02.

--Vernon

>There's definitely the possibility of thrashing.
>
>On Wed, Feb 14, 2018 at 11:16 AM, Dave Cobbley
><david.j.cobbley@linux.intel.com> wrote:
>> Do you have any concerns about ipmitool constantly flushing the network as
>> it sets & unsets the complete bit inbetween parameters,
>> i.e. if you are setting 4 different parameters from a script?
>>
>> I'm not sure if this brings a lot of thrashing to the to the ipmi network
>> stack or network manager.
>>
>> Seems like it would be prudent to fix ipmitool upstream to allow you to set
>> multiple parameters, in addition to the ipmi stack.
>>
>>
>>> I personally have found this non-standard implementation a bit
>>> unpleasant, as it requires using a different command to basically
>>> flush it.  I am planning to implement it such that setting in progress
>>> before and complete after is how it all gets flushed instead of a
>>> timeout, since that approach reads more correct given the
>>> specification.  And really it's just about literally calling a
>>> subroutine to flush everything when the in_progress bit is set to
>>> completed, and removing the code from "access on"
>>>
>>> If you're interested to do what I've just described, I don't think
>>> you'll get any push-back.
>>>
>>> Patrick
>>>
>>> On Wed, Feb 14, 2018 at 9:14 AM, Dave Cobbley
>>> <david.j.cobbley@linux.intel.com> wrote:
>>>>
>>>> I noticed that when using ipmitool lan set <channel> <parameter>, the
>>>> openbmc stack does not apply the settings. This seems like a non-standard
>>>> implementation. While using ipmitool as the standard is not quite
>>>> correct,
>>>> customers do expect it to work.
>>>>
>>>> After sending any sort of lan set command with ipmitool, the changes
>>>> don't
>>>> appear to stick and this message shows up in the journal:
>>>>      "Use Set Channel Access command to apply"
>>>>
>>>> I know IPMI 2.0 is a little ambiguous about implementation specifics, but
>>>> I
>>>> believe the intention was to utilize the "Set In Progress" bit (Parameter
>>>> 0)
>>>> while doing work, and use "Set Complete" when you are finished to flush
>>>> the
>>>> changes.
>>>>
>>>> To work around ipmitool constantly setting and unsetting the "Set In
>>>> Progress" bit in between every parameter applied, some BMC stacks
>>>> accumulate
>>>> network changes over a period of time and apply after a timeout - this is
>>>> also compatible with ipmitool's non-standard use of the "Set In Progress"
>>>> bit.
>>>>
>>>>
>>>> Is there a plan to circle back and change this functionality to work with
>>>> ipmitool in the future?
>>>>
>>>> Thanks,
>>>> -Dave Cobbley
>>>>
>>
