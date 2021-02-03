Return-Path: <SRS0=ukuu=HF=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9D23C433E0
	for <openbmc@archiver.kernel.org>; Wed,  3 Feb 2021 23:05:14 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E04F864E38
	for <openbmc@archiver.kernel.org>; Wed,  3 Feb 2021 23:05:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E04F864E38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWHMW6wsDzDwjJ
	for <openbmc@archiver.kernel.org>; Thu,  4 Feb 2021 10:05:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWHKX3lWkzDqCK;
 Thu,  4 Feb 2021 10:03:27 +1100 (AEDT)
IronPort-SDR: 7WAX48PBIliajk81nbz1QJjGRYi+TuMZkG26kYDWiJOxdQqiSoajeya1ZqpPWXGUd2ojKKFI8t
 RCrD2f1HZZow==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="265965633"
X-IronPort-AV: E=Sophos;i="5.79,399,1602572400"; d="scan'208";a="265965633"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 15:03:21 -0800
IronPort-SDR: f+dZu8T3JVttwGtFAnqqieBAOdzCi319FHLnmdI/Hfu+W5eL80CBFtWCbOAeJTkN7dgB050pJl
 yYmyHWkXXiAQ==
X-IronPort-AV: E=Sophos;i="5.79,399,1602572400"; d="scan'208";a="579663169"
Received: from yoojae-mobl.amr.corp.intel.com (HELO [10.255.231.105])
 ([10.255.231.105])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 15:03:20 -0800
Subject: Re: [PATCH v2 1/4] dt-bindings: i2c: aspeed: add buffer and DMA mode
 transfer support
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Joel Stanley <joel@jms.id.au>
References: <20210112003749.10565-1-jae.hyun.yoo@linux.intel.com>
 <20210112003749.10565-2-jae.hyun.yoo@linux.intel.com>
 <20210114193416.GA3432711@robh.at.kernel.org>
 <4f67358e-58e5-65a5-3680-1cd8e9851faa@linux.intel.com>
 <CACPK8XcZTE=bnCP1-E9PTA09WnXG9Eduwx0dm-QqmQJUDa_OrQ@mail.gmail.com>
 <1814b8d1-954c-0988-0745-e95129079708@linux.intel.com>
Message-ID: <87ed4085-26e4-98f8-21e3-b1e3c16b0891@linux.intel.com>
Date: Wed, 3 Feb 2021 15:03:15 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1814b8d1-954c-0988-0745-e95129079708@linux.intel.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Wolfram Sang <wsa@the-dreams.de>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 devicetree <devicetree@vger.kernel.org>, Cedric Le Goater <clg@kaod.org>,
 Tao Ren <taoren@fb.com>, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi Joel

On 1/28/2021 11:36 AM, Jae Hyun Yoo wrote:
> Hi Joel
> 
> On 1/27/2021 4:06 PM, Joel Stanley wrote:
>> On Thu, 14 Jan 2021 at 20:05, Jae Hyun Yoo 
>> <jae.hyun.yoo@linux.intel.com> wrote:
>>>
>>> Hi Rob,
>>>
>>> On 1/14/2021 11:34 AM, Rob Herring wrote:
>>>>> -- reg                       : address offset and range of bus
>>>>> +- reg                       : Address offset and range of bus 
>>>>> registers.
>>>>> +
>>>>> +                      An additional SRAM buffer address offset and 
>>>>> range is
>>>>> +                      optional in case of enabling I2C dedicated 
>>>>> SRAM for
>>>>> +                      buffer mode transfer support. If the 
>>>>> optional range
>>>>> +                      is defined, buffer mode will be enabled.
>>>>> +                      - AST2400
>>>>> +                        &i2c0 { reg = <0x40 0x40>, <0x800 0x80>; };
>>>>> +                        &i2c1 { reg = <0x80 0x40>, <0x880 0x80>; };
>>>>> +                        &i2c2 { reg = <0xc0 0x40>, <0x900 0x80>; };
>>>>> +                        &i2c3 { reg = <0x100 0x40>, <0x980 0x80>; };
>>>>> +                        &i2c4 { reg = <0x140 0x40>, <0xa00 0x80>; };
>>>>> +                        &i2c5 { reg = <0x180 0x40>, <0xa80 0x80>; };
>>>>> +                        &i2c6 { reg = <0x1c0 0x40>, <0xb00 0x80>; };
>>>>> +                        &i2c7 { reg = <0x300 0x40>, <0xb80 0x80>; };
>>>>> +                        &i2c8 { reg = <0x340 0x40>, <0xc00 0x80>; };
>>>>> +                        &i2c9 { reg = <0x380 0x40>, <0xc80 0x80>; };
>>>>> +                        &i2c10 { reg = <0x3c0 0x40>, <0xd00 0x80>; };
>>>>> +                        &i2c11 { reg = <0x400 0x40>, <0xd80 0x80>; };
>>>>> +                        &i2c12 { reg = <0x440 0x40>, <0xe00 0x80>; };
>>>>> +                        &i2c13 { reg = <0x480 0x40>, <0xe80 0x80>; };
>>>>
>>>> All this information doesn't need to be in the binding.
>>>>
>>>> It's also an oddly structured dts file if this is what you are doing...
>>>
>>> I removed the default buffer mode settings that I added into
>>> 'aspeed-g4.dtsi' and 'aspeed-g5.dtsi' in v1 to avoid touching of the
>>> default transfer mode setting, but each bus should use its dedicated
>>> SRAM buffer range for enabling buffer mode so I added this information
>>> at here as overriding examples instead. I thought that binding document
>>> is a right place for providing this information but looks like it's not.
>>> Any recommended place for it? Is it good enough if I add it just into
>>> the commit message?
>>
>> I agree with Rob, we don't need this described in the device tree
>> (binding or dts). We know what the layout is for a given aspeed
>> family, so the driver can have this information hard coded.
>>
>> (Correct me if I've misinterpted here Rob)
>>
> 
> Makes sense. Will add these settings into the driver module as hard
> coded per each bus.
> 

Realized that the SRAM buffer range setting should be added into device
tree because each bus module should get the dedicated IO resource range.
So I'm going to add it to dtsi default reg setting for each I2C bus
and will remove this description in binding. Also, I'll add a mode
setting property instead to keep the current setting as byte mode.

Please let me know if you have any different thought.

Thanks,
Jae

