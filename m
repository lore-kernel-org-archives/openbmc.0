Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yG3g66WsjzDrFv
 for <openbmc@lists.ozlabs.org>; Tue, 17 Oct 2017 03:29:05 +1100 (AEDT)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Oct 2017 09:29:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,387,1503385200"; d="scan'208";a="161067226"
Received: from mauery.jf.intel.com (HELO mauery) ([10.7.150.164])
 by orsmga005.jf.intel.com with ESMTP; 16 Oct 2017 09:29:02 -0700
Date: Mon, 16 Oct 2017 09:29:02 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: tomjose <tomjose@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: phosphor-host-ipmid and phosphor-net-ipmid architecture
Message-ID: <20171016162902.GA113334@mauery>
References: <20171011220548.GA61269@mauery>
 <59E063DF.7030805@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <59E063DF.7030805@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Oct 2017 16:29:07 -0000

On 13-Oct-2017 12:27 PM, tomjose wrote:
>
>Hey Vernon,
>
>1)  There are few reasons for a different approach for net-ipmid
>
>    The primary design direction when developing net-ipmid was to 
>reuse the provider libraries
>    for the commands that are common across the interfaces. It was a 
>conscious decision
>    to have two processes for network & BT, keeping in mind to have 
>small applications
>    rather than having monolithic ones.

Okay. If this was a conscious design decision, I don't see a reason to 
expend effort to undo it just to have my patch rejected. :)

>   The network handler would not be minimal like btbridge or 
>KCSbridge, since there are net-ipmid
>   specific functionalities like session setup, serial over LAN..etc. 
>The only difference i see in your
>   idea is we would relay the common commands on the dbus so that 
>ipmid would handle.
>
>2) The phosphor-host-ipmid was developed as part of the prototyping 
>done for Barreleye. So i agree that
>    we have quite a number of shortcomings, that it is not in 
>alignment with the modern C++ practices.
>    We have added more code and haven't got to refactor that. We have 
>a story to refactor phosphor-host-ipmid.
>    The plan was to handle so some of these suggestions as part of that.

I admit I have not looked that much at the net-ipmid (only enough to see 
that it was a different queue implementation from host-ipmid). Making 
some of the queueing common and updating to current c++ standards would 
be great.

>   The support is in place to register each command's privilege. The 
>support would be completed once the
>   IPMI user account management changes are in place. The command's 
>privilege would matter only on
>   the LAN interface which is session based. In net-ipmid every 
>command would be checked against the
>   session's privilege, so that a session with USER privilege would be 
>restricted from running a command
>   that needs ADMIN privilege. Since KCS and BT are sessionless and 
>unauthenticated, this would not matter.
>
>   Similarly System interface commands are compiled into a separate 
>library which is not loaded in the
>   net-ipmid.

If this support is already in the net-ipmid, great.

>3) This is something we wanted to do, we can discuss what is the best 
>possible approach. This would help with
>    command like Get/Set System Boot Configuration where each 
>implementer would get the flexibility
>    to implement the OEM parameters.
>
> Are you working on a OEM provider library?

I am working on some firmware update commands (which I guess by the spec 
are technically OEM commands) and we have some other people working on 
other commands (sensor/sdr related).

>Regards,
>Tom
>
>
>
>
>On Thursday 12 October 2017 03:35 AM, Vernon Mauery wrote:
>>I am working on an ipmi provider library and had a few questions and
>>observations.
>>
>>1) Why are there separate ipmi message queues for the host and network?
>>    It seems awkward that for the host, the ipmi request comes from a
>>    different process (btbridge, or in our case kcsbridge), while for the
>>    network (RMCP+), the messages are handled directly in the same
>>    process.
>>
>>    It seems that the network handler could just as easily package the
>>    command up and send it to ipmid the same way that btbridge does.
>>
>>2) Can we modify the signature of the handlers so that they can behave
>>    in a more intelligent manner? It would be nice if they were handed a
>>    gsl::span<uint8_t> instead of a void* and a length. This allows for
>>    a no-copy, bounds-checked way of passing buffers.
>>
>>    It would be nice to know what channel something came in on. We might
>>    want to be able to change behavior based on the incoming channel (as
>>    some channels are more secure than others).
>>
>>    It would be nice to know what IPMI privilege the command came in
>>    with (ADMIN for session-less commands) so that the command handler
>>    can behave appropriately based on the user.
>>3) When registering commands, it would be nice of the list also
>>    maintained a priority so that commands could be easily overridden.
>>    Currently the only way to override a command is to make sure that
>>    your library gets loaded first (and this is done via the library
>>    name). If we had default ipmi commands loaded at DEFAULT_PRIO and
>>    then had some higher priorities such as MFR_PRIO, and OEM_PRIO, or
>>    something like that, we could have integrators further on down the
>>    line able to easily add a new provider library and piecemeal override
>>    individual command. An alternate (or addition) might be the addition
>>    of a unregister command method to remove an existing command so it
>>    could be replaced with a new one (or just straight up removed).
>>
>>
>>I am happy to work on changes that I would like to see and submit
>>patches for review, but I wanted to know if there was some sort of
>>historical or other reason that would prevent my work from getting
>>rejected before I actually do the work.
>>
>>--Vernon
>>
>
