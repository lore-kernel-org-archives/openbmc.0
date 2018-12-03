Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 437x9G3RlpzDqWf
 for <openbmc@lists.ozlabs.org>; Tue,  4 Dec 2018 07:16:49 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2018 12:16:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,311,1539673200"; d="scan'208";a="115612517"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.122.128.138])
 ([10.122.128.138])
 by orsmga001.jf.intel.com with ESMTP; 03 Dec 2018 12:16:45 -0800
Subject: Re: [HELP] ipmi-kcs didn't work
To: Vijay Khemka <vijaykhemka@fb.com>,
 Samuel Jiang <chyishian.jiang@gmail.com>,
 qianlihu <wangzhiqiang8906@gmail.com>, Gary Hsu <gary_hsu@aspeedtech.com>,
 "Ryan Chen <Ryan Chen" <ryan_chen@aspeedtech.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <CAHkHK08zcycaqmg_Pkq=Oe+8xC8TBYsCoBGLA0CCwH0qvwicWg@mail.gmail.com>
 <3022407b-fa4e-9e80-2044-69dbf4f03586@linux.intel.com>
 <CAHkHK09Km5BVLdq7OMSwTLi05-KgDc8K8j9_+e1ewtGanyr4Tg@mail.gmail.com>
 <47558ef0-d8e9-de42-e1dd-be7293048a91@linux.intel.com>
 <A5419381-84F9-490A-8BF0-70C513741ECF@fb.com>
 <e63c758f-2eec-9e28-9381-4e28d2d8bb64@linux.intel.com>
 <4780f022-1c80-4b53-9eb1-0e3fe313c6a2@Spark>
 <db5cfcea-972d-2f50-05f4-266ab2c8f310@linux.intel.com>
 <87C3DCC8-F773-46A0-B8EC-5E3DC5E3983F@fb.com>
 <660c304f-60eb-f54a-f3b7-4d6d4481a96a@linux.intel.com>
 <A9318AC7-EE0E-4B84-84D1-A16695EE3FC0@fb.com>
 <b20d590b-be35-046e-26c2-2c1b2456309a@linux.intel.com>
 <253b7d32-1230-4111-a6dc-a84afddcc679@Spark>
 <25e866d4-749c-902b-86b2-3d38975dcc65@linux.intel.com>
 <033266A0-B6C1-4BE7-BA3B-A6E319BDD8D5@fb.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <afee953a-97b6-e1c6-8025-9a32e850969e@linux.intel.com>
Date: Mon, 3 Dec 2018 14:16:44 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <033266A0-B6C1-4BE7-BA3B-A6E319BDD8D5@fb.com>
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
X-List-Received-Date: Mon, 03 Dec 2018 20:16:52 -0000

On 12/3/2018 1:37 PM, Vijay Khemka wrote:
> 
> 
> ﻿On 12/3/18, 7:54 AM, "Jae Hyun Yoo" <jae.hyun.yoo@linux.intel.com> wrote:
> 
>      On 12/1/2018 8:29 AM, Samuel Jiang wrote:
>      > Apologize for sending out no content mail first.
>      >
>      > Jae,
>      > The aspeed_gates in clk-aspeed.c perhaps as todo suggest asking Aspeed
>      > the actual parent data for check initializing?
>      >
>      
>      Yes, that makes sense.
>      
>      Hi Gary and Ryan,
>      
>      Can you please tell us what is the actual parent clock source of LPC IP?
>      I mean the operational clock of LPC IP hardware block, not the interface
>      clock.
>      
>      Thanks,
>      Jae
>      
>      > Vijay,
>      > I traced lpc-ctrl module, it seems direct update the same
>      > ASPEED_CLK_GATE_LCLK register map bit to enable. If parent data is
>      > disabled, it could enable in dts.
>      > The device tree detail, I reference it from aspeed-g5.dtsi. Hope it
>      > could help you for work.
>      >
>      > Thanks,
>      >
>      > Samuel Jiang
> 
> Samual/Jay,
> In my case if I don't initialize LPC clock in driver, Bios on host side wait and doesn't boot.
> I don't understand here what is holding Bios here but by initializing this LPC clock let bios boot.
> 

Hi Vijay,
I also need to test Samuel's patch on real hardware. Probably, I could
share my test result next week because I'm in a business trip. Will
share my test result as soon as I back to office. Also, I'm currently
asking Aspeed engineers to check the parent clock of the LCLK to fill
out the parent clock info in clk-aspeed.c. If it is available, we would
not need to use CLK_IS_CRITICAL flag, I'm guessing. Will update this
thread as soon as possible.

Thanks,
Jae

> Regards
> -Vijay
> 
