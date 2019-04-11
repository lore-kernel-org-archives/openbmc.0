Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44gBSF4xzlzDqSQ
 for <openbmc@lists.ozlabs.org>; Fri, 12 Apr 2019 05:49:32 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Apr 2019 12:49:30 -0700
X-IronPort-AV: E=Sophos;i="5.60,338,1549958400"; d="scan'208";a="222707122"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Apr 2019 12:49:30 -0700
Date: Thu, 11 Apr 2019 12:49:29 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Alexander Amelkin <a.amelkin@yadro.com>
Cc: Andrew Geissler <geissonator@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 William Kennington <wak@google.com>
Subject: Re: ipmitool recipe update needed?
Message-ID: <20190411194929.GD15959@mauery.jf.intel.com>
References: <CALLMt=pNyYZTmkR=w1+jDDwQHxWRUjEWKxCx=Oe_bhPyoMaeHA@mail.gmail.com>
 <b5501dfe-4b78-adb6-73e5-1b07b3d35d1c@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <b5501dfe-4b78-adb6-73e5-1b07b3d35d1c@yadro.com>
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
X-List-Received-Date: Thu, 11 Apr 2019 19:49:34 -0000

On 11-Apr-2019 02:08 PM, Alexander Amelkin wrote:
>Hi, Andrew!
>
>Yes, I've seen that recipe and planned to update it, just didn't have time to. You may do so yourself if you want.
>
>Releases are automatically packaged by GitHub according to tags and the tags in the project are like IPMITOOL_1_8_18, so the packaged release is https://github.com/ipmitool/ipmitool/archive/IPMITOOL_1_8_18.tar.gz
>
>For future releases I planned to continue using the same tagging scheme.

Would it be better to just point at the upstream release tag instead of 
the release tarball?

Along these lines, if we can get my pending dbus interface pull-request 
merged, openbmc can use the upstream ipmitool with only one patch to 
change the default interface (which is on my list to make a --configure 
option at some point).

--Vernon

>Alexander.
>
>09.04.2019 19:02, Andrew Geissler wrote:
>> Hi Alexander,
>>
>> A while back we had some intermittent CI failures when
>> trying to retrieve the ipmitool package from sourceforge.
>>
>> The link for ipmitool on sourceforge shows it's been moved
>> to github. Are there plans to update the recipe upstream to
>> use github? William noted in the infrastructure workgroup that
>> you'll probably have to provide the package in the expected
>> format on github for it to work.
>>
>> The recipe is:
>> meta-openembedded/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb
>>
>> Andrew
>
