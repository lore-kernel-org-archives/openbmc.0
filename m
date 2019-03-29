Return-Path: <jason.m.bills@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44W8z04dVbzDq5h
 for <openbmc@lists.ozlabs.org>; Sat, 30 Mar 2019 05:14:48 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Mar 2019 11:14:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,285,1549958400"; d="scan'208";a="156467445"
Received: from unknown (HELO [10.241.242.36]) ([10.241.242.36])
 by fmsmga002.fm.intel.com with ESMTP; 29 Mar 2019 11:14:43 -0700
Subject: Re: Some questions about "Add option for SEL commands for
 Journal-based SEL entries"
To: =?UTF-8?B?V2lsbCBMaWFuZyAo5qKB5rC46YmJKQ==?= <Will.Liang@quantatw.com>
Cc: =?UTF-8?B?UmljaGFyZCBUdW5nICjokaPlvaXlsY8p?= <Richard.Tung@quantatw.com>, 
 =?UTF-8?B?QnVkZHkgSHVhbmcgKOm7g+Wkqem0uyk=?= <Buddy.Huang@quantatw.com>,
 =?UTF-8?B?R2VvcmdlIEh1bmcgKOa0quW/oOaVrCk=?= <George.Hung@quantatw.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <b96ecddbcf4d4b098ca22c3be8c8e819@quantatw.com>
 <b4c22fe4-96c6-bf8a-7bf7-184af4122653@linux.intel.com>
 <47dbff997b734d14ada16705068c475e@quantatw.com>
 <8139d4fc-3ce8-e753-c000-db713f3e6a2d@linux.intel.com>
 <0d4048d2cf1b4dda89179a89b2a624e2@quantatw.com>
 <dc07bda4-f926-1b8f-a157-1b0ecfc59e33@linux.intel.com>
 <2bcbf6920bc14c0fa1826ac5b0bde62f@quantatw.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <6ba86d1a-ecfa-20a8-9b84-8e855fabf320@linux.intel.com>
Date: Fri, 29 Mar 2019 11:14:43 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <2bcbf6920bc14c0fa1826ac5b0bde62f@quantatw.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
X-List-Received-Date: Fri, 29 Mar 2019 18:14:53 -0000

On 3/29/2019 4:00 AM, Will Liang (梁永鉉) wrote:
> Hi Jason,
> 
> 
> Sorry to bother you again.
It's not a bother. :)
> 
> After solving sensor type and event type problem for discrete 
> sensor(memory) , I encountered another issue.
>  From the code, it seems only support getting the sensor number of 
> threshold-based sensors.
> How do I get the sensor  number of discrete sensors?
> Would you have any suggestion or plan to get sensor number of discrete 
> sensors?

Unfortunately, you have hit the crux of the issue that is preventing the 
journal-based SEL from being fully adopted, which is that we don't have 
a flexible, generic way to assign sensor numbers.

If you only need discrete sensors to be assigned numbers dynamically, 
you might be able to extend the sensor mapping that is used to get the 
number here: 
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-ipmid/+/12951/24/sdrutils.hpp#117. 
  If you can set a path for your discrete sensors so they are included 
in the list, it may solve your issue.

We've discussed some options for a flexible, generic solution that would 
work for everyone, but I don't believe any work has been done, yet.  You 
can view the discussion here: 
https://lists.ozlabs.org/pipermail/openbmc/2019-January/014873.html and 
in the comments on the review here: 
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-ipmid/+/12951.

Thanks,
-Jason
