Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 434wVP2VPxzDqvZ;
 Thu, 29 Nov 2018 09:36:12 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Nov 2018 14:36:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,292,1539673200"; d="scan'208";a="93727556"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.122.32.196])
 ([10.122.32.196])
 by orsmga007.jf.intel.com with ESMTP; 28 Nov 2018 14:36:09 -0800
Subject: Re: [PATCH i2c-next v9 1/5] dt-bindings: i2c: Add 'bus-timeout-ms'
 and '#retries' properties as common optional
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Mark Rutland <mark.rutland@arm.com>, Andrew Jeffery <andrew@aj.id.au>,
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
References: <20181030210917.32711-1-jae.hyun.yoo@linux.intel.com>
 <20181030210917.32711-2-jae.hyun.yoo@linux.intel.com>
 <20181128215458.GB1666@kunai>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <5dde6770-ce7a-720a-f1db-56d9ef044a99@linux.intel.com>
Date: Wed, 28 Nov 2018 16:36:09 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181128215458.GB1666@kunai>
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
X-List-Received-Date: Wed, 28 Nov 2018 22:36:14 -0000

On 11/28/2018 3:54 PM, Wolfram Sang wrote:
> On Tue, Oct 30, 2018 at 02:09:12PM -0700, Jae Hyun Yoo wrote:
>> This commit adds 'bus-timeout-ms' and '#retries' properties as
>> common optional properties that can be used for setting 'timeout'
>> and 'retries' values of 'struct i2c_adapter'. With this patch, the
>> bus timeout value and the master transfer retries count can be set
>> through these properties at the registration time of an adapter.
>> Still the values can be set by I2C_TIMEOUT and I2C_RETRIES ioctls
>> on cdev at runtime too.
>>
>> These properties may not be supported by all drivers. However, if
>> a driver wants to support one of them, it should adapt the
>> bindings in this document.
>>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> Definately NACK on the #retries part. This is purely a configuration
> thing. Besides that it is kind of ancient cruft, too. I don't recommend
> it, at all.
> 
> On the timeout thing, I am still not fully convinced that this is a HW
> description. I said that before. But maybe I need to understand your
> problem case better.
> 

Okay, I got it. I'll leave those as configuration things. Will remove
this part in the next version.

Thanks for your comment.

Jae
