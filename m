Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41rvR93GyPzDqp5
 for <openbmc@lists.ozlabs.org>; Fri, 17 Aug 2018 04:06:25 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Aug 2018 11:06:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,247,1531810800"; d="scan'208";a="63690271"
Received: from hades.jf.intel.com (HELO [10.54.51.77]) ([10.54.51.77])
 by fmsmga008.fm.intel.com with ESMTP; 16 Aug 2018 11:06:19 -0700
Subject: Re: Streaming logs via rsyslog
To: openbmc@lists.ozlabs.org
References: <1c87c6bc-0f3b-73f2-e2a5-4b6ad7180f99@linux.vnet.ibm.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <046e8fe9-1465-49ee-2170-0d06cd013218@intel.com>
Date: Thu, 16 Aug 2018 11:07:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1c87c6bc-0f3b-73f2-e2a5-4b6ad7180f99@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Aug 2018 18:06:30 -0000

On 08/16/2018 03:21 AM, Deepak Kodihalli wrote:
> Hi,
> 
> We have a requirement to forward BMC logs (the systemd journal) to an 
> external logging server.
> 
> We're proposing doing this by making use of rsyslog. Here are notes 
> based on some initial investigation.
> 

 From the rsyslog github page

"""
Rsyslog's main sponsor Adiscon tries to fund rsyslog by selling custom 
development and support contracts. Adiscon does NOT license rsyslog 
under a commercial license (this is simply impossible for anyone due to 
rsyslog's license structure).
"""

I think this license makes rsyslog a non-starter for most of the people 
in this project, but I'm not a license expert.  We've looked at it in 
the past, and while nice to use in practice, we couldn't overcome the 
license conflicts and legal implications.

Oddly enough, my team did some prototype work in this area a couple 
weeks ago that I've pushed to gerrit for comment.

As part of an experiment we implemented a prototype Redfish endpoint 
that exposed the journald log entries.  It seems to have worked 
relatively well, and it's considerably faster than we thought it would 
be.  1000 entries can be grabbed in about a second including all the TLS 
overhead.

An example from my system is here:
https://imgur.com/a/vtlFvHB

The thought was that at some point we would implement server-sent 
events, which is part of the Redfish 1.5.0 specification, and would 
allow the logs to be streamed off the system using a pretty well defined 
protocol that's not specific to OpenBMC, as well as implement pretty 
decent security.  It's not directly syslog, and I can still see the use 
case for having a syslog compatible mechanism for streaming.

https://gerrit.openbmc-project.xyz/#/c/openbmc/bmcweb/+/12008/
