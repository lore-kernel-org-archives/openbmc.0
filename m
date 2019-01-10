Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43bKpG35SwzDqv8
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 09:06:26 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jan 2019 14:06:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,462,1539673200"; d="scan'208";a="290618676"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by orsmga005.jf.intel.com with ESMTP; 10 Jan 2019 14:06:23 -0800
Date: Thu, 10 Jan 2019 14:06:23 -0800
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Emily Shaffer <emilyshaffer@google.com>, tomjoseph@in.ibm.com,
 Natarajan Gurumoorthy <natg@google.com>,
 Benjamin Fair <benjaminfair@google.com>
Subject: Re: Packet Size Mismatches
Message-ID: <20190110220623.GA7259@mauery.jf.intel.com>
References: <CAO=noty60eC2hS9xGTPArs2OCZyuRWAjWWbsWBdv1A82o1QCwg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAO=noty60eC2hS9xGTPArs2OCZyuRWAjWWbsWBdv1A82o1QCwg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
X-List-Received-Date: Thu, 10 Jan 2019 22:06:31 -0000

On 09-Jan-2019 09:10 AM, Patrick Venture wrote:
>Per the maximum response size patch
>(https://gerrit.openbmc-project.xyz/15743), the goal is to know how
>many bytes can be returned by the channel.  This can vary by channel,
>per the comments, and other related changes.  However, presently,
>we're seeing a memory corruption over kcs which has a limit of 256.
>So, we're copying way too much data onto the response.  The code
>itself has no idea how many bytes it can send.

This is a tricky problem.... Ideally, if an IPMI command wants to return 
a large number of bytes, it would consult its context and return an 
error if the response would not fit in the channel. This relies on each 
command to be written correctly. In a slightly less ideal world, the 
ipmid daemon would just return the bytes that the handler returned and 
the bridge (kcs, bt, rmcp+, etc.) would then refuse to package up a 
response that is larger than the max payload size and return an error 
instead. The problem with this is that information is lost.

>https://github.com/openbmc/phosphor-host-ipmid/blob/master/ipmid.cpp#L409
>is a 64-byte buffer, but the ipmi message could ask for data beyond
>that, and leads to a blind memcpy situation.
>
>If I'm reading that patchset (not yet merged) correctly
>(https://gerrit.openbmc-project.xyz/16285) it lets the IPMI client
>request channel information to know the maximum it can request.
>However, what lets the code running ask that question?  How does my
>library know it's responding to a legal request?  Or is the idea that
>with the reworking that's underway it'll only be able to provide legal
>responses automatically for the channel on which the request came?

I have a patch in review (it actually has a +2, but it is waiting on a 
parent), that exposes the channel size to the IPMI stack as it is 
running. This allows an IPMI command to query the channel size.

https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-ipmid/+/16285

>(Also, unrelated, but at some point is the goal still to have one
>daemon handle all ipmi traffic, including network ipmi traffic, via a
>bridge similar to kcsbridge and btbridge?)

Yes. That is exactly what the sum of all my patches against host-ipmi 
and net-ipmi do.

--Vernon
