Return-Path: <james.feist@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42wBXg2jmczF3Zv
 for <openbmc@lists.ozlabs.org>; Thu, 15 Nov 2018 04:37:51 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Nov 2018 09:37:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,233,1539673200"; d="scan'208";a="106244778"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by fmsmga004.fm.intel.com with ESMTP; 14 Nov 2018 09:37:49 -0800
Subject: Re: Adding sensors for facebook
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Vijay Khemka <vijaykhemka@fb.com>, "Li, Yong B" <yong.b.li@linux.intel.com>,
 Joel Stanley <joel@jms.id.au>
Cc: Amithash Prasad <amithash@fb.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <D7F4B5CE-3638-4877-B3BD-B2BB726E493E@fb.com>
 <a010895e-042f-30cc-6030-42ccc021d7c5@linux.intel.com>
 <E70E182F-441C-4CFA-BB14-9A3FB55DE6C5@fb.com>
 <6bc2b289-ed9a-854c-ae92-ffcd74ea5cf3@linux.intel.com>
 <0cfecae9-5ae7-2bf5-16de-20bcbd9ad50e@linux.intel.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <3e929e2f-5e08-3f13-2ee9-8af10f88c1f3@linux.intel.com>
Date: Wed, 14 Nov 2018 09:37:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <0cfecae9-5ae7-2bf5-16de-20bcbd9ad50e@linux.intel.com>
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
X-List-Received-Date: Wed, 14 Nov 2018 17:37:56 -0000

On 11/14/2018 09:23 AM, Jae Hyun Yoo wrote:
> On 11/14/2018 9:00 AM, James Feist wrote:
>> On 11/13/2018 04:08 PM, Vijay Khemka wrote:
>>> Hi James,
>>> Thanks for this detailed information. I have quick questions though 
>>> about dbus-sensors, is this intel's features only not a common one. 
>>> So I need to copy whole recipes to our repo. Also I see following 
>>> compile issue.
>> We can submit a patch to move in into common, although I think you 
>> should still be able to access it, we pull in code from meta-phosphor, 
>> meta-openembedded, etc. meta-intel is just another meta layer. Let me 
>> know if you can't and we can start the process.
>>
>>>
>>> /home/vijaykhemka/proj/openbmc/lf/new-gh/openbmc/build/workspace/sources/dbus-sensors/sensors/src/CPUSensorMain.cpp:18:10: 
>>> fatal error: linux/peci-ioctl.h: No such file or directory
>>>
>>> And I can't find peci-ioctl.h in my kernel tree as well.
>>
>> Jae,
>>
>> Can you point them to the latest peci kernel patch?
>>
> 
> Hi Vijay,
> 
> I'm still trying to upstream the PECI implementation into linux kernel
> tree. Meanwhile, you could back port this patch series for test.
> 
> https://lkml.org/lkml/2018/10/15/670

Joel,

Is it possible to add this into the openbmc/linux tree?

Thanks,

James

> 
> Thanks,
> 
> Jae
> 
>> It hasn't fully been through the kernel review process but it is 
>> probably good enough to be merged into openbmc/linux. Until this 
>> happens you probably need to apply it as a patch downstream.
>>
>> Thanks,
>>
>> James
>>
