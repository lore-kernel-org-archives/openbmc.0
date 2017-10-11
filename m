Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yC7R83S8xzDqv8
 for <openbmc@lists.ozlabs.org>; Thu, 12 Oct 2017 09:08:33 +1100 (AEDT)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP; 11 Oct 2017 15:08:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,362,1503385200"; d="scan'208";a="162120228"
Received: from mauery.jf.intel.com (HELO mauery) ([10.7.150.164])
 by fmsmga006.fm.intel.com with ESMTP; 11 Oct 2017 15:08:27 -0700
Resent-From: Vernon Mauery <vernon.mauery@linux.intel.com>
Resent-Date: Wed, 11 Oct 2017 15:08:27 -0700
Resent-Message-ID: <20171011220827.GB61269@mauery>
Resent-To: openbmc@lists.ozlabs.org
Date: Wed, 11 Oct 2017 15:05:48 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: OpenBMC Development <openbmc@lists.ozlabs.org>
Cc: Tom Joseph <tomjoseph@in.ibm.com>
Subject: phosphor-host-ipmid and phosphor-net-ipmid architecture
Message-ID: <20171011220548.GA61269@mauery>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
X-List-Received-Date: Wed, 11 Oct 2017 22:08:37 -0000

I am working on an ipmi provider library and had a few questions and 
observations.

1) Why are there separate ipmi message queues for the host and network? 
   It seems awkward that for the host, the ipmi request comes from a 
   different process (btbridge, or in our case kcsbridge), while for the 
   network (RMCP+), the messages are handled directly in the same 
   process.

   It seems that the network handler could just as easily package the 
   command up and send it to ipmid the same way that btbridge does.

2) Can we modify the signature of the handlers so that they can behave 
   in a more intelligent manner? It would be nice if they were handed a 
   gsl::span<uint8_t> instead of a void* and a length. This allows for  
   a no-copy, bounds-checked way of passing buffers.

   It would be nice to know what channel something came in on. We might 
   want to be able to change behavior based on the incoming channel (as 
   some channels are more secure than others).

   It would be nice to know what IPMI privilege the command came in 
   with (ADMIN for session-less commands) so that the command handler 
   can behave appropriately based on the user.
   
3) When registering commands, it would be nice of the list also 
   maintained a priority so that commands could be easily overridden. 
   Currently the only way to override a command is to make sure that 
   your library gets loaded first (and this is done via the library 
   name). If we had default ipmi commands loaded at DEFAULT_PRIO and 
   then had some higher priorities such as MFR_PRIO, and OEM_PRIO, or 
   something like that, we could have integrators further on down the 
   line able to easily add a new provider library and piecemeal override 
   individual command. An alternate (or addition) might be the addition 
   of a unregister command method to remove an existing command so it 
   could be replaced with a new one (or just straight up removed).


I am happy to work on changes that I would like to see and submit 
patches for review, but I wanted to know if there was some sort of 
historical or other reason that would prevent my work from getting 
rejected before I actually do the work.

--Vernon
