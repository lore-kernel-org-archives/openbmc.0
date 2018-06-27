Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41G9j04GZBzDrbK;
 Thu, 28 Jun 2018 04:01:56 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jun 2018 11:01:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,280,1526367600"; d="scan'208";a="61936094"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.149])
 ([10.7.153.149])
 by fmsmga002.fm.intel.com with ESMTP; 27 Jun 2018 11:01:53 -0700
Subject: Re: [PATCH] i2c: aspeed: Improve driver to support multi-master use
 cases stably
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Cc: James Feist <james.feist@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
References: <20180626165812.4141-1-jae.hyun.yoo@linux.intel.com>
 <60d0dad1-b735-0650-47b4-40c57b1a5209@linux.intel.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <c1c361de-32a7-83b6-4d48-ad0750c6218b@linux.intel.com>
Date: Wed, 27 Jun 2018 11:01:53 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <60d0dad1-b735-0650-47b4-40c57b1a5209@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jun 2018 18:01:57 -0000

Hi Jarkko,

Thanks for the review. Please see my answer below.

On 6/27/2018 12:48 AM, Jarkko Nikula wrote:
> Hi
> 
> On 06/26/2018 07:58 PM, Jae Hyun Yoo wrote:
>> BMC firmware should support some multi-master use cases such as 
>> multi-node,
>> IPMB, BMC-ME link and so on but the current ASPEED I2C driver is a bit
>> unstable for the multi-master use case. So this patch improves ASPEED I2C
>> driver to support the multi-master use case stably.
>>
>> Changes:
>> * Added XFER_MODE status register checking logic into
>>    aspeed_i2c_master_xfer to improve the current bus busy checking logic.
>> * Changed the order of enum aspeed_i2c_master_state and
>>    enum aspeed_i2c_slave_state defines to make their initial values 
>> set to
>>    ASPEED_I2C_MASTER_INACTIVE and ASPEED_I2C_SLAVE_STOP respectively.
>>    In case of multi-master use with previous code, if a slave data comes
>>    ahead of the first master xfer, master_state starts from an invalid
>>    state. This change fixed the issue.
>> * Adjusted spin_lock scope to make it wrap the whole irq handler using
>>    a single lock and unlock pair covers both master and slave handlers.
>> * Added irq_status variable as a member of the struct aspeed_i2c_bus to
>>    collect handled interrupt bits throughout the master and the slave irq
>>    handlers.
>> * Added control logic to put an order on calling the master and the slave
>>    irq handlers based on their current states.
>>
> This does many unrelated looking changes in one patch making it more 
> vulnerable for potential multiple regressions. For instance busy 
> checking goes from single read to loop with 250 ms timeout in this patch 
> while changing also spin lock logic and interrupt handling.
> 
> Now if there is some regression it might be difficult to find what 
> change in this patch is causing it and more over things goes more 
> complicated if some other kind of regressions are found pointing into 
> the same commit.
> 
> I suggest splitting this into multiple smaller patches. For instance 
> having first simple conversions patches that are unlikely to cause a 
> regression like one patch adding '\n' to error print, another moving 
> irq_status variable into struct aspeed_i2c_bus and so on followed by 
> patches that change logic like busy checking, spin lock change and then 
> patch or more for multi-master support.
> 

Yes, that makes sense and I agree with you. I'll split out this patch
into multiple smaller patches as you suggested.

Thanks,

Jae
