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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44P1Jw1TQ0zDqHq
 for <openbmc@lists.ozlabs.org>; Wed, 20 Mar 2019 05:09:03 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Mar 2019 11:09:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,245,1549958400"; d="scan'208";a="124013186"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.147])
 ([10.7.153.147])
 by orsmga007.jf.intel.com with ESMTP; 19 Mar 2019 11:09:00 -0700
Subject: Re: Does obmc-ikvm work with bmcweb?
To: Lei YU <mine260309@gmail.com>
Cc: xiuzhi <1450335857@qq.com>, openbmc <openbmc@lists.ozlabs.org>,
 ed <ed@tanous.net>, Eddie James <eajames@linux.vnet.ibm.com>
References: <tencent_2EF1C4452C43ADF74A37DF04@qq.com>
 <fa618273-b2e8-3d53-9c28-91f01fd83c05@linux.intel.com>
 <tencent_77BC148C0E378EFD5F488CE6@qq.com>
 <fa79e3d3-cc85-ba90-42b7-2e6ef69f6653@linux.intel.com>
 <CAARXrtn+ghtcdPLBDVMrMtX31==ZufsuPDCKm11dd92zQwm22A@mail.gmail.com>
 <fb4ea162-ae50-5c02-eea6-3adb200e6ed8@linux.intel.com>
 <e592f504-b7b4-ff40-543c-84e99502e1d1@linux.intel.com>
 <CAARXrt=wgz7zqDWpx3inzBnMJJdxQ=b5ebLrna1H8A5kXc4r5w@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <2d44c252-94b6-6441-d3e8-a8200d89aaa5@linux.intel.com>
Date: Tue, 19 Mar 2019 11:09:00 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <CAARXrt=wgz7zqDWpx3inzBnMJJdxQ=b5ebLrna1H8A5kXc4r5w@mail.gmail.com>
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
X-List-Received-Date: Tue, 19 Mar 2019 18:09:05 -0000

Hi Lei,

On 3/19/2019 2:22 AM, Lei YU wrote:
> Hi Jae,
> 
> Thanks for sharing the detailed information.
> I managed to do a build on Romulus and see the KVM partially working:
> * I can see the video output in the KVM page;
> * I am unable to do any operation, e.g. pressing a key does not seem to be
>    sent to host

Check if there are /dev/hidg0 and /dev/hidg1. If not, check kernel
configs again.
Also, check 'start-ipkvm.service' file whether that launches obmc-ikvm
using this options:
ExecStart=/usr/bin/env obmc-ikvm -v /dev/video0 -f 10 -k /dev/hidg0 -p 
/dev/hidg1

> * When I browse to another page and browse back to KVM page, it displays a
>    small black block, instead of showing correct KVM view.

Try this patch:
https://gerrit.openbmc-project.xyz/c/openbmc/obmc-ikvm/+/19392

Cheers,
Jae

> Did you meet such issue before and do you happen to know how to fix this?
> 
> Thanks a lot!
> 
> On Tue, Mar 19, 2019 at 1:33 AM Jae Hyun Yoo
> <jae.hyun.yoo@linux.intel.com> wrote:
>>
>> Attaching a patch file for back porting of Eddie's aspeed-video driver.
>> Diff in below doesn't include the newly created file so I'm attaching it
>> as a patch.
>>
>> -Jae
