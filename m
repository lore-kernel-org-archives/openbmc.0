Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43bPbw0jZ5zDqvs
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 11:57:46 +1100 (AEDT)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jan 2019 16:57:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,463,1539673200"; d="scan'208";a="126742712"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by orsmga001.jf.intel.com with ESMTP; 10 Jan 2019 16:57:44 -0800
Date: Thu, 10 Jan 2019 16:57:44 -0800
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Patrick Venture <venture@google.com>
Cc: Emily Shaffer <emilyshaffer@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, tomjoseph@in.ibm.com,
 Benjamin Fair <benjaminfair@google.com>,
 Natarajan Gurumoorthy <natg@google.com>
Subject: Re: Packet Size Mismatches
Message-ID: <20190111005744.GB7259@mauery.jf.intel.com>
References: <CAO=noty60eC2hS9xGTPArs2OCZyuRWAjWWbsWBdv1A82o1QCwg@mail.gmail.com>
 <20190110220623.GA7259@mauery.jf.intel.com>
 <CAO=noty9tVX_G-TK+XYbESQAwFwwB7or-zxH5ZkuC8wwBtXK4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAO=noty9tVX_G-TK+XYbESQAwFwwB7or-zxH5ZkuC8wwBtXK4w@mail.gmail.com>
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
X-List-Received-Date: Fri, 11 Jan 2019 00:57:49 -0000

On 10-Jan-2019 03:46 PM, Patrick Venture wrote:
>On Thu, Jan 10, 2019 at 2:06 PM Vernon Mauery
><vernon.mauery@linux.intel.com> wrote:
>>
>> On 09-Jan-2019 09:10 AM, Patrick Venture wrote:
>> >Per the maximum response size patch
>> >(https://gerrit.openbmc-project.xyz/15743), the goal is to know how
>> >many bytes can be returned by the channel.  This can vary by channel,
>> >per the comments, and other related changes.  However, presently,
>> >we're seeing a memory corruption over kcs which has a limit of 256.
>> >So, we're copying way too much data onto the response.  The code
>> >itself has no idea how many bytes it can send.
>>
>> This is a tricky problem.... Ideally, if an IPMI command wants to return
>> a large number of bytes, it would consult its context and return an
>> error if the response would not fit in the channel. This relies on each
>> command to be written correctly. In a slightly less ideal world, the
>
>Obviously the 64 byte response buffer in impid will be fixed at some
>point shortly, probably in your currently staged patches.

I am not sure that this particular issue is addressed yet, but the 
patches I have lay a framework that allows it to be more easily fixed.

>Is the context something new being passed to handlers?  (I haven't had
>a chance to really dig through your full stack of patches).

The context is something that can be requested as part of the handler 
signature. The handler can have the request object, the context object, 
or the yield context object. The request object contains all the info, 
the context contains some of the info, and the yield context is only for 
async operations. 

handler.hpp contains the details of what sorts of goodies that can be 
requested on top of ipmi data types.
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-ipmid/+/11273/17/ipmi/handler.hpp

--Vernon
