Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zykZ11bL9zF1WW
 for <openbmc@lists.ozlabs.org>; Sat, 10 Mar 2018 10:47:04 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Mar 2018 15:47:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,448,1515484800"; d="scan'208";a="32702695"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143])
 ([10.7.153.143])
 by FMSMGA003.fm.intel.com with ESMTP; 09 Mar 2018 15:47:01 -0800
Subject: Re: [PATCH v2 2/8] [PATCH 2/8] Documentations: dt-bindings: Add a
 document of PECI adapter driver for Aspeed AST24xx/25xx SoCs
To: Milton Miller II <miltonm@us.ibm.com>, Pavel Machek <pavel@ucw.cz>
Cc: linux-hwmon@vger.kernel.org, andrew@lunn.ch, jdelvare@suse.com,
 arnd@arndb.de, linux-doc@vger.kernel.org, andrew@aj.id.au,
 gregkh@linuxfoundation.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux@roeck-us.net, linux-arm-kernel@lists.infradead.org
References: <20180307221124.GD10438@amd>
 <20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
 <20180221161606.32247-3-jae.hyun.yoo@linux.intel.com>
 <20180306124002.GA13950@amd>
 <33bf6563-b220-7ff9-8b04-84e9bd781b3f@linux.intel.com>
 <OF08D8261E.8F72E5DC-ON0025824B.008218BB-0025824B.008218C6@notes.na.collabserv.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <ed44999b-c877-463e-3a20-415faaab31b2@linux.intel.com>
Date: Fri, 9 Mar 2018 15:47:01 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <OF08D8261E.8F72E5DC-ON0025824B.008218BB-0025824B.008218C6@notes.na.collabserv.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Fri, 09 Mar 2018 23:47:06 -0000

Hi Milton,

Thanks for sharing your time to review this patch. Please see my answer 
inline.

Jae

On 3/9/2018 3:41 PM, Milton Miller II wrote:
> About  03/07/2018 04:12PM in some time zone, Pavel Machek wrote:
>> Subject: Re: [PATCH v2 2/8] [PATCH 2/8] Documentations: dt-bindings:
>> Add a document of PECI adapter driver for Aspeed AST24xx/25xx SoCs
>>
>> Hi!
>>
>>>> Are these SoCs x86-based?
>>>
>>> Yes, these are ARM SoCs. Please see Andrew's answer as well.
>>
>> Understood, thanks.
>>
>>>>> +	Read sampling point selection. The whole period of a bit time
>> will be
>>>>> +	divided into 16 time frames. This value will determine which
>> time frame
>>>>> +	this controller will sample PECI signal for data read back.
>> Usually in
>>>>> +	the middle of a bit time is the best.
>>>>
>>>> English? "This value will determine when this controller"?
>>>>
>>>
>>> Could I change it like below?:
>>>
>>> "This value will determine in which time frame this controller
>> samples PECI
>>> signal for data read back"
>>
>> I guess... I'm not native speaker, I guess this could be improved
>> some
>> more.
>>
> 
> I agree this wording is still confusing.
> 
> The problem is that the key subject, the time of the sampling, is in the descriptive clause "in which time frame".
> 
> "This value will determine the time frame in which the controller will sample"
> 
> or perhaps phrase it as saving a specific sample from the over-clock, or a phase of the clock.
> 

Yes, that looks more better. I'll change the wording as you suggested. 
Thanks a lot!

Jae

>> Best regards,
>> 									Pavel
>>
>> -- 
>> (english) http://www.livejournal.com/~pavelmachek
>> (cesky, pictures)
>> http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
>>
> 
> milton
> --
> Speaking for myself not IBM.
> 
