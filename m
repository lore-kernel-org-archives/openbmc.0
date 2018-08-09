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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41mYgh0PRpzDqBy
 for <openbmc@lists.ozlabs.org>; Fri, 10 Aug 2018 02:32:15 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Aug 2018 09:32:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,215,1531810800"; d="scan'208";a="63890663"
Received: from mauery.jf.intel.com ([10.7.150.157])
 by orsmga008.jf.intel.com with ESMTP; 09 Aug 2018 09:32:12 -0700
Date: Thu, 9 Aug 2018 09:32:11 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Alexander Amelkin <a.amelkin@yadro.com>
Subject: Re: Licensing Question
Message-ID: <20180809163211.GA37965@mauery.jf.intel.com>
References: <CAO=notzP1FWobbpUhqdf8ZrGRqsNZvZHBp=8cmXZjWOL0dcCrA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAO=notzP1FWobbpUhqdf8ZrGRqsNZvZHBp=8cmXZjWOL0dcCrA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
X-List-Received-Date: Thu, 09 Aug 2018 16:32:17 -0000

On 08-Aug-2018 03:45 PM, Patrick Venture wrote:
>So, I've spent the last hour trying to submodule my way to using
>ipmitool.  I've managed to get it compiling for just the one file I

Okay, I'll bite. What are you trying to use ipmitool for?

>need (or want).  However, then I try to link it and then more failures
>for things that are missing, such as helper methods.  So, then I add
>the file that has those, and then it doesn't compile because that file
>doesn't compile.  This is of course, not compiling with the -Werror
>flag among other things with gcc.

I think Alexander is working on getting ipmitool to compile without 
warnings upstream. That is quite the task though; he inherited a lot of 
warnings. :)

>So, I can keep battling this, or I can ask -- the license for the
>ipmitool just says I need to keep a copy of the license with the
>source if I reuse it.  So, I can do that, and I can hack it up to work
>-- but where I'm curious is -- how does that impact the license of
>phosphor-ipmi-flash?

This is where the lawyers start to smile....

>(Some of the things where gcc is complaining, I can go ahead and
>submit patches to fix.)
>
>Patrick
