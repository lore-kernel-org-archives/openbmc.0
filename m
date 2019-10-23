Return-Path: <james.feist@linux.intel.com>
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yyL14yyKzDqS0
 for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2019 04:39:20 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Oct 2019 10:39:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,221,1569308400"; d="scan'208";a="372949093"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga005.jf.intel.com with ESMTP; 23 Oct 2019 10:39:16 -0700
Subject: Re: multiple telemetry designs
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, piotr.matuszczak@intel.com,
 kunyi@google.com
Cc: yuenn@google.com, thalerj@linux.vnet.ibm.com, james.mihm@intel.com,
 neladk@microsoft.com, openbmc@lists.ozlabs.org
References: <D1177195-CDC9-4BB0-B9DE-6FC99B7ADE31@fuzziesquirrel.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <dd81fb28-4d01-8726-9b16-81a677eb3e16@linux.intel.com>
Date: Wed, 23 Oct 2019 10:39:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <D1177195-CDC9-4BB0-B9DE-6FC99B7ADE31@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Wed, 23 Oct 2019 17:39:22 -0000

On 10/23/19 9:38 AM, Brad Bishop wrote:
> There are two telemetry / metric designs under review right now:
> 
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/22257
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24357
> 
> I would like to see one or both of them merged.  Neither seem to have any support….there is a single +1 on the latter review from Shawn McCarney.  If you support one of these designs, please go review it and indicate your support.

It looks like Kun has +1ed Piotr's design as well, not sure if that 
means we can go with one design?

> 
> I also can’t figure out what the path forward for OpenBMC is.  Maybe to start with, we could all level set on where we are at with our thinking:
> 
> Kun: How far along are you in the implementation of your proposal?
> Piotr: How far along are you in the implementation of your proposal?
> James: OpenBMC can support one or both proposals.  If we support both, this means multiple implementations for the same thing in bmcweb.  One that gets data from dbus objects, and another that gets it from librrd.  As the maintainer of bmcweb are you open to accepting one or both of these options?

With 0 previous knowledge, I would suggest using a way that works with 
previous OBMC practices, and that is using dbus. If there has to be 2 
separate designs, then if both produce the same d-bus interfaces, it 
shouldn't matter to bmcweb which one is being used. That being said, if 
this doesn't work for some reason, we've used compile switches in the 
past, although this would be the least preferable option. Truthfully I 
haven't looked at these designs yet as I've only recently taken a larger 
role in bmcweb reviews, so I'll try to look at them soon.


> 
> Without any discussion and resolution, I’m afraid both of these proposals are just going to sit here, unmerged, indefinitely.
> 
> thx - brad
> 
