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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Jz6w19RkzF3JS;
 Tue, 25 Sep 2018 08:15:50 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Sep 2018 15:15:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,299,1534834800"; d="scan'208";a="86205099"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.151])
 ([10.7.153.151])
 by orsmga003.jf.intel.com with ESMTP; 24 Sep 2018 15:15:46 -0700
Subject: Re: [RFC PATCH i2c-next 1/2] dt-bindings: i2c: aspeed: Add
 'idle-wait-timeout-ms' setting
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
References: <20180910214519.14126-1-jae.hyun.yoo@linux.intel.com>
 <20180910214519.14126-2-jae.hyun.yoo@linux.intel.com>
 <a81a6092-a9d0-78d5-3596-cddc5d6a0713@linux.intel.com>
 <20180924215850.GD18592@kunai>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <2c8563fd-0641-5237-0026-f559c480ad91@linux.intel.com>
Date: Mon, 24 Sep 2018 15:15:46 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180924215850.GD18592@kunai>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
X-List-Received-Date: Mon, 24 Sep 2018 22:15:54 -0000

Hi Wolfram,

On 9/24/2018 2:58 PM, Wolfram Sang wrote:
> On Tue, Sep 18, 2018 at 11:02:54AM -0700, Jae Hyun Yoo wrote:
>> On 9/10/2018 2:45 PM, Jae Hyun Yoo wrote:
>>> +- idle-wait-timeout-ms	: bus idle waiting timeout in milliseconds when
>>> +			  multi-master is set, defaults to 100 ms when not
>>> +			  specified.
>>
>> Will change it to 'aspeed,idle-wait-timeout-ms' as it's a non standard
>> property.
> 
> No need. This binding is not a HW description, so not a DT property in
> my book. I still don't understand: Your IP core in master mode does not
> have a BUSY bit or similar which detects when a START was detected and
> clears after a STOP?
> 

Okay, I'll keep this property as it is then.

Aspeed IP has the BUSY bit on the I2CD14 register and we are already
using the bit in the current code for single-master use cases.
Due to the bit doesn't cover well multi-master use cases so we need to
improve the current busy checking logic using the 'Transfer Mode State
Machine' bit fields on the same register through this patch set.

Thanks for the review!

Jae
