Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (helo) smtp.helo=mga12.intel.com
 (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44fTqf2tPzzDq8F
 for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2019 02:18:52 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Apr 2019 09:18:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,334,1549958400"; d="scan'208";a="290384640"
Received: from unknown (HELO [10.7.153.148]) ([10.7.153.148])
 by orsmga004.jf.intel.com with ESMTP; 10 Apr 2019 09:18:46 -0700
Subject: Re: [PATCH dev-5.0 0/3] Improve stability of Aspeed video engine
 driver
To: Joel Stanley <joel@jms.id.au>
Cc: Eddie James <eajames@linux.ibm.com>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <20190409192059.1160-1-jae.hyun.yoo@linux.intel.com>
 <CACPK8XeuVj8tZu48Ci59GGMJE9TtEP0kRZEDFhp789qQbw7Dwg@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <ca1bc20c-a302-5df6-a315-8ab5275a9740@linux.intel.com>
Date: Wed, 10 Apr 2019 09:18:46 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XeuVj8tZu48Ci59GGMJE9TtEP0kRZEDFhp789qQbw7Dwg@mail.gmail.com>
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
X-List-Received-Date: Wed, 10 Apr 2019 16:18:55 -0000

Hi Joel,

On 4/10/2019 6:26 AM, Joel Stanley wrote:
> Hi Jae,
> 
> On Tue, 9 Apr 2019 at 19:21, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>>
>> This patch series improves stability of Aspeed video engine driver by fixing
>> clock control and irq handling logic in the driver.
>>
>> Jae Hyun Yoo (3):
>>    media: platform: aspeed: fix a kernel warning on clk control
>>    media: platform: aspeed: refine clock control logic
>>    media: platform: aspeed: change irq to threaded irq
> 
> I had a glance at these patches and they look okay to me. Thanks for
> the testing and sending fixes. Can you please send them upstream?

Yes, sure I will upstream it. Eddie is still trying to upstream his eclk
reset handling fix so I will submit this series when Eddie's patch goes
into upstream.

> I can apply them to the openbmc tree once we have Eddie's ack.

Thanks!

-Jae

>>   drivers/media/platform/aspeed-video.c | 75 ++++++++++++++++++++++-----
>>   1 file changed, 61 insertions(+), 14 deletions(-)
>>
>> --
>> 2.21.0
>>
