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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42L3980LvkzF3Lb;
 Thu, 27 Sep 2018 02:21:30 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Sep 2018 09:21:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,306,1534834800"; d="scan'208";a="76395624"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.151])
 ([10.7.153.151])
 by orsmga008.jf.intel.com with ESMTP; 26 Sep 2018 09:20:47 -0700
Subject: Re: [RFC PATCH i2c-next 1/2] dt-bindings: i2c: aspeed: Add
 'idle-wait-timeout-ms' setting
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-aspeed@lists.ozlabs.org, James Feist <james.feist@linux.intel.com>, 
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
References: <20180910214519.14126-1-jae.hyun.yoo@linux.intel.com>
 <20180910214519.14126-2-jae.hyun.yoo@linux.intel.com>
 <a81a6092-a9d0-78d5-3596-cddc5d6a0713@linux.intel.com>
 <20180924215850.GD18592@kunai>
 <2c8563fd-0641-5237-0026-f559c480ad91@linux.intel.com>
 <20180925082717.GB2270@kunai>
 <7b4e5715-3a87-8f77-8d0d-4647f02c87a8@linux.intel.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <f20a2e1d-e1db-1e63-3df8-ad650b931f7d@linux.intel.com>
Date: Wed, 26 Sep 2018 09:20:47 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <7b4e5715-3a87-8f77-8d0d-4647f02c87a8@linux.intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
X-List-Received-Date: Wed, 26 Sep 2018 16:21:33 -0000

On 9/25/2018 9:20 AM, Jae Hyun Yoo wrote:
> On 9/25/2018 1:27 AM, Wolfram Sang wrote:
>> On Mon, Sep 24, 2018 at 03:15:46PM -0700, Jae Hyun Yoo wrote:
>>> Hi Wolfram,
>>>
>>> On 9/24/2018 2:58 PM, Wolfram Sang wrote:
>>>> On Tue, Sep 18, 2018 at 11:02:54AM -0700, Jae Hyun Yoo wrote:
>>>>> On 9/10/2018 2:45 PM, Jae Hyun Yoo wrote:
>>>>>> +- idle-wait-timeout-ms    : bus idle waiting timeout in 
>>>>>> milliseconds when
>>>>>> +              multi-master is set, defaults to 100 ms when not
>>>>>> +              specified.
>>>>>
>>>>> Will change it to 'aspeed,idle-wait-timeout-ms' as it's a non standard
>>>>> property.
>>>>
>>>> No need. This binding is not a HW description, so not a DT property in
>>>> my book. I still don't understand: Your IP core in master mode does not
>>>> have a BUSY bit or similar which detects when a START was detected and
>>>> clears after a STOP?
>>>>
>>>
>>> Okay, I'll keep this property as it is then.
>>
>> Sorry for the misunderstanding. I don't think this a property, at all.
>> It doesn't describe the hardware, it is more of a configuration thing,
>> or?
>>
> 
> You are right. It doesn't describe the hardware but it needs to be
> configurable because it very depends on the peer master's behavior.
> If peer master sends a long packet usually, it should have a long
> timeout value since a slave receiving operation takes long time,
> and it should be adjusted with an optimal value with taking some
> experiments to make it not too long. Any suggestion?
> 

Should I use timeout in struct i2c_adapter instead just like i2c-mpc
does?
