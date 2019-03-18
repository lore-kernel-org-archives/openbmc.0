Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44NW8K6hjJzDqJ8
 for <openbmc@lists.ozlabs.org>; Tue, 19 Mar 2019 09:29:52 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Mar 2019 15:29:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,495,1544515200"; d="scan'208";a="135149726"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.147])
 ([10.7.153.147])
 by orsmga003.jf.intel.com with ESMTP; 18 Mar 2019 15:29:48 -0700
Subject: Re: Moving to Linux Kernel 5.0
To: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CACPK8XdnESPUxPqX005x64sCehJTPyBw9vnCyHk7UP8vMrz1vg@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <819d0ff4-7ed5-8527-bd92-1ff468f699ed@linux.intel.com>
Date: Mon, 18 Mar 2019 15:29:48 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XdnESPUxPqX005x64sCehJTPyBw9vnCyHk7UP8vMrz1vg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
X-List-Received-Date: Mon, 18 Mar 2019 22:29:55 -0000

On 3/17/2019 11:16 PM, Joel Stanley wrote:
> Hello,
> 
> It's been a few releases since we bumped, so I'm going to publish a
> 5.0 based tree this week. I've done some testing on the machine I have
> (OpenPower Romulus ast2500) and it looks good.
> 
> I'll be rebasing without discarding patches for this release. That
> means if you have non-mainline patches it will still be there for
> dev-5.0. Next release we will do a cleanout, so please ensure your out
> of tree patches are on the upstream lists for 5.2 now.
> 
> Cheers,
> 
> Joel
> 

Hi Joel,

I see the out of tree PECI patches are still in dev-5.0. Thanks much
for rebasing it while you make the kernel update. I checked that
dev-5.0 kernel works well in my machine.

Again, thanks for your effort!

Cheers,
Jae
