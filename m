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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Lhtl4XzjzF37b;
 Fri, 28 Sep 2018 03:41:18 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Sep 2018 10:41:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,311,1534834800"; d="scan'208";a="95465871"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.151])
 ([10.7.153.151])
 by orsmga002.jf.intel.com with ESMTP; 27 Sep 2018 10:41:16 -0700
Subject: Re: [PATCH i2c-next v3 2/3] i2c: aspeed: Add 'aspeed,timeout' DT
 property reading code
To: Joel Stanley <joel@jms.id.au>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 Wolfram Sang <wsa@the-dreams.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Andrew Jeffery <andrew@aj.id.au>, linux-i2c@vger.kernel.org,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 devicetree <devicetree@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed@lists.ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 jarkko.nikula@linux.intel.com, James Feist <james.feist@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
References: <20180926215842.23125-1-jae.hyun.yoo@linux.intel.com>
 <20180926215842.23125-3-jae.hyun.yoo@linux.intel.com>
 <CACPK8XcKms88EcpT3soE6wLyAmvyiLfVkNeOQT0FgmY4eZoDrw@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <37ae7a11-44b6-88e5-0f4d-c97c70334ad4@linux.intel.com>
Date: Thu, 27 Sep 2018 10:41:16 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CACPK8XcKms88EcpT3soE6wLyAmvyiLfVkNeOQT0FgmY4eZoDrw@mail.gmail.com>
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
X-List-Received-Date: Thu, 27 Sep 2018 17:41:20 -0000

Hi Joel,

On 9/26/2018 8:11 PM, Joel Stanley wrote:
> On Thu, 27 Sep 2018 at 01:58, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>>
>> +/* Timeout */
>> +#define ASPEED_I2C_BUS_TIMEOUT_US_DEFAULT              (5 * 1000 * 1000)
> 
> The 5 seconds time out is way too long. On a system that doesn't have
> functional i2c, this holds up boot for a long time as most i2c client
> drivers try to initialise their device and fail. I realise you're not
> changing the value, but we should pick a better default. 1 second?
> Half a second?
> 

I agree with you. We could probably use 1 second as default which can
cover the most of general cases. If so, we don't need to make the
default setting in this driver because i2c-core-base will default
adap->timeout to 1 second if the value is 0 when a driver registers an
adapter. Will fix this code.

>>
>> +       ret = of_property_read_u32(pdev->dev.of_node, "aspeed,timeout",
>> +                                  &timeout_us);
> 
> Can we make this binding generic? It's not specific to aspeed's
> hardware. Getting the value could even part of the i2c core.
> 
> I read the previous thread with Wolfram. I think this would still fit
> with what Wolfram suggested, but please forgive my jetlagged brain if
> I've missed something.
> 

It followed the way of the existing i2c-mpc driver uses 'fsl,timeout'
for the same purpose. Though, I also want to make it as a generic as you
suggested like 'timeout' in milliseconds unit, not in microseconds unit.
If making it a generic property is acceptable, I'll fix it too.

Wolfram, can you please share your thought on it?

Thanks,
Jae
