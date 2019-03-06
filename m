Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44F4Tl5srlzDqBN
 for <openbmc@lists.ozlabs.org>; Thu,  7 Mar 2019 07:04:03 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Mar 2019 12:04:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,448,1544515200"; d="scan'208";a="139713658"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by orsmga002.jf.intel.com with ESMTP; 06 Mar 2019 12:04:00 -0800
Subject: Re: Initial MCTP design proposal
To: openbmc@lists.ozlabs.org
References: <a75abc9a6c5c2ae50b39576a60a2bb07c65567d4.camel@ozlabs.org>
 <20190207155131.gzntyqoflqfw5vld@thinkpad>
 <2159944d88eadddab4e7dfa5b50c85a4fc0ca234.camel@ozlabs.org>
 <20190211185736.dafbfc74n76r33pu@thinkpad.dyn.fuzziesquirrel.com>
 <9c1410a1255d49735b7a9879750557bc92acaa47.camel@ozlabs.org>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <ad89021d-57a9-980a-6034-8530b81b975c@intel.com>
Date: Wed, 6 Mar 2019 12:04:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <9c1410a1255d49735b7a9879750557bc92acaa47.camel@ozlabs.org>
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
X-List-Received-Date: Wed, 06 Mar 2019 20:04:13 -0000


On 2/12/19 12:43 AM, Jeremy Kerr wrote:
> Hi Brad,
> 
> 
> For example, we don't yet have a solid demonstration that the interfaces
> are fit for what we need. That'll shake out as part of the prototyping
> work that I'm doing now, but there may be changes needed between now and
> then.
While this statement was true at the time you wrote it, I don't think
that's true now.  I've got the basics of the transport working against a
real NVMe drive target over MCTP.  At least for the simplest case seems
to work well and I'm pretty happy with the result.  I'd like to see the
repo get started just so we have a place for gerrit reviews.

While I agree, there's going to be some churn, I think it's probably
good to have a place for said churn over pushing PRs between our
individual personal github repositories.

> 
>> To that end I could create an initial empty repository in the openbmc
>> namespace and you could push your tree there for review, when you are
>> ready.  How does that sound?
I would like to see this happen.  Once it does, I'll likely push reviews
for the commits in this tree to it (which includes both Jeremys commits
as well as my own.
https://github.com/edtanous/libmctp/commits/pr1


> 
> Yep, I'd be happy to do this when we decide on a good time to do the
> reviews.
I vote the time is now.  Any objections?

-Ed
