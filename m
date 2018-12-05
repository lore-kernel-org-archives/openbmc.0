Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4391sC0xFSzDqfq
 for <openbmc@lists.ozlabs.org>; Thu,  6 Dec 2018 01:51:42 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Dec 2018 06:51:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,317,1539673200"; d="scan'208";a="125308342"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.122.128.138])
 ([10.122.128.138])
 by fmsmga004.fm.intel.com with ESMTP; 05 Dec 2018 06:51:39 -0800
Subject: Re: [HELP] ipmi-kcs didn't work
To: Vijay Khemka <vijaykhemka@fb.com>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Samuel Jiang <chyishian.jiang@gmail.com>,
 qianlihu <wangzhiqiang8906@gmail.com>, Gary Hsu <gary_hsu@aspeedtech.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Jenmin Yuan <jenmin_yuan@aspeedtech.com>
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
 <d002c20bfe964463b1d7c305b12fdd70@TWMBX01.aspeed.com>
 <904db864-71c4-d4e6-e7fd-14df7820fb7b@linux.intel.com>
 <D6923B46-D807-48AC-B007-2AFD3E72F8A9@fb.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <7ebd688a-fff5-4e88-822f-f1a686921933@linux.intel.com>
Date: Wed, 5 Dec 2018 08:51:40 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <D6923B46-D807-48AC-B007-2AFD3E72F8A9@fb.com>
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
X-List-Received-Date: Wed, 05 Dec 2018 14:51:43 -0000

On 12/4/2018 5:59 PM, Vijay Khemka wrote:
> 
> 
> ﻿On 12/4/18, 7:44 AM, "Jae Hyun Yoo" <jae.hyun.yoo@linux.intel.com> wrote:
> 
>      On 12/4/2018 12:18 AM, Ryan Chen wrote:
>      > Hello Jae,
>      > 	ASPEED LPC IP HW block have serval clk input.
>      > 	Most important is LCLK is come from LPC Host.
>      > 	The others is not controllable by register.
>      > Ryan
>      >
>      
>      Hi Ryan,
>      
>      Thanks for the information. So clock source of LCLK is from external
>      usually from PCH, means that it doesn't have any parent dependency
>      within BMC. In this case, we need to mark CLK_IS_CRITICAL flag to enable
>      it. Also, we should mark the flag for ESPICLK too because eSPI is
>      sharing the same interface with LPC.
>      
>      I'll make and upstream a patch.
>      
>      Thanks,
>      Jae
> Jae,
> But I am able to enable clock through lpc-ctrl in dts. Which does same thing enabling clock for lpc. I don't think we need this patch.
> 

Okay, you confirmed it. I believe that we don't need to use the critical
flag setting on LCLK then. Will drop the upstreaming patch.

Thanks,
Jae

> Regards
> -Vijay
> 
