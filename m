Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Vw0H2l8zzDqGt
 for <openbmc@lists.ozlabs.org>; Fri,  4 Jan 2019 04:29:50 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jan 2019 09:29:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,435,1539673200"; d="scan'208";a="105276300"
Received: from unknown (HELO [10.7.153.143]) ([10.7.153.143])
 by orsmga006.jf.intel.com with ESMTP; 03 Jan 2019 09:29:47 -0800
Subject: Re: [PATCH linux dev-4.19 00/12] PECI device driver introduction
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jae Hyun Yoo <jae.hyun.yoo@intel.com>
References: <20181219000236.30812-1-jae.hyun.yoo@linux.intel.com>
 <de74fcec-78dd-f7fa-24b5-a3c861539daa@linux.intel.com>
 <CACPK8XcskPxX_Vb1-Tyg1yuTDmgpSCTNGwFtfba5yVv=8YE7SQ@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <0900cfc4-b138-2bd6-5cc7-5751bc3db60f@linux.intel.com>
Date: Thu, 3 Jan 2019 09:29:47 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.3
MIME-Version: 1.0
In-Reply-To: <CACPK8XcskPxX_Vb1-Tyg1yuTDmgpSCTNGwFtfba5yVv=8YE7SQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 03 Jan 2019 17:29:52 -0000

Hi Joel,

On 1/2/2019 8:39 PM, Joel Stanley wrote:
> On Wed, 19 Dec 2018 at 10:38, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>>
>> Hi Joel and Andrew,
>>
>> I'm sending this patch series to try pushing it to OpenBMC linux
>> dev-4.19 branch. It is still getting review from upstream through
>> http://lkml.iu.edu/hypermail/linux/kernel/1812.2/02368.html but
>> some OpenBMC platforms need it at this moment to include dbus-sensors
>> repository which uses this PECI kernel driver implementation. Actually,
>> I cannot expect when it could be accepted by upstream but we need it
>> now for OpenBMC development.
> 
> I have been following the upstream discussion. I hope the MFD
> maintainer decides to merge it soon; it looks good from my
> perspective.
> 

I hope so too. I'll keep trying to upstream it. Thanks!

>> Can you please consider cherry-picking this patch series into OpenBMC
>> linux dev-4.19 meanwhile it gets upstream review? I rebased and tested
>> it on dev-4.19.
> 
> Sure. I have merged the series into dev-4.19. I will push it out to
> github once it's gone thorough my build and boot tests.
> 

Thanks a lot for merging it into dev-4.19. Will let you know if any
update happens while upstreaming it.

Regards,
Jae

> Cheers,
> 
> Joel
> 
