Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Lp5n0zfBzF37b;
 Fri, 28 Sep 2018 07:36:12 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Sep 2018 14:36:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,312,1534834800"; d="scan'208";a="78009680"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.151])
 ([10.7.153.151])
 by orsmga006.jf.intel.com with ESMTP; 27 Sep 2018 14:35:53 -0700
Subject: Re: [PATCH i2c-next v3 1/3] dt-bindings: i2c: aspeed: Add 'timeout'
 property as an optional property
To: Rob Herring <robh@kernel.org>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 Wolfram Sang <wsa@the-dreams.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Mark Rutland <mark.rutland@arm.com>,
 Andrew Jeffery <andrew@aj.id.au>, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
References: <20180926215842.23125-1-jae.hyun.yoo@linux.intel.com>
 <20180926215842.23125-2-jae.hyun.yoo@linux.intel.com>
 <20180927205610.GA29022@bogus>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <c045aceb-80e4-4f9f-7ff2-c30172f04b3e@linux.intel.com>
Date: Thu, 27 Sep 2018 14:35:52 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180927205610.GA29022@bogus>
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
X-List-Received-Date: Thu, 27 Sep 2018 21:36:14 -0000

Hi Rob,

On 9/27/2018 1:56 PM, Rob Herring wrote:
> On Wed, Sep 26, 2018 at 02:58:40PM -0700, Jae Hyun Yoo wrote:
>> This commit adds 'aspeed,timeout' property as an optional property
>> which can be used for setting 'timeout' value of
>> 'struct i2c_adapter'. With this patch, the timeout value can be
>> set through an I2C_TIMEOUT ioctl on cdev, or through this optional
>> DT property.
> 
> Isn't controlling this from userspace or relying on a default
> sufficient?  I can't see this needing to be highly tuned for each
> platform.
> 

It can be controlled using an ioctl command on an I2C cdev from
userspace if CONFIG_I2C_CHARDEV is enabled. A couple of I2C drivers use
their own specific default value for it but in general the common
default value (1 second) which is set by i2c core is sufficient.
But it still needs to be tuned for specific cases based on attached
devices' characteristic, on packet length, on bus speed and on etc.
Specifically in Aspeed I2C driver for BMC, it should be tuned
to support multi-master use cases properly, and it needs a device tree
property to apply this timeout value from the probing time of the
module.

> However, if we do have a property, it should be common.
> 

Okay, I'll change it to 'timeout'.

Thanks a lot,
Jae
