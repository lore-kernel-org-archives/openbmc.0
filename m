Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zH4kH4W2rzF0kw
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 10:20:39 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jan 2018 15:20:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,342,1511856000"; d="scan'208";a="23045968"
Received: from yoojae-mobl.amr.corp.intel.com (HELO [10.7.153.149])
 ([10.7.153.149])
 by orsmga001.jf.intel.com with ESMTP; 10 Jan 2018 15:20:36 -0800
Subject: Re: [PATCH linux dev-4.10 4/6] Documentation: dt-bindings: Add a
 generic PECI hwmon
To: Arnd Bergmann <arnd@arndb.de>
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 gregkh <gregkh@linuxfoundation.org>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-doc@vger.kernel.org, DTML <devicetree@vger.kernel.org>,
 linux-hwmon@vger.kernel.org, Linux ARM
 <linux-arm-kernel@lists.infradead.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com>
 <20180109223126.13093-5-jae.hyun.yoo@linux.intel.com>
 <CAK8P3a1qiD1sWj0oQ=WbvpEDhtcYbzCxjg7t1iPs45WamfUVgw@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <9e39dd66-7f8a-e788-f711-ae34b97806fc@linux.intel.com>
Date: Wed, 10 Jan 2018 15:20:36 -0800
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1qiD1sWj0oQ=WbvpEDhtcYbzCxjg7t1iPs45WamfUVgw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Jan 2018 23:20:40 -0000

On 1/10/2018 4:20 AM, Arnd Bergmann wrote:
> On Tue, Jan 9, 2018 at 11:31 PM, Jae Hyun Yoo
> <jae.hyun.yoo@linux.intel.com> wrote:
>> This commit add a dt-bindings document for a generic PECI hwmon
>> driver.
>>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> ---
>>   .../devicetree/bindings/hwmon/peci-hwmon.txt       | 33 ++++++++++++++++++++++
>>   1 file changed, 33 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/hwmon/peci-hwmon.txt
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/peci-hwmon.txt b/Documentation/devicetree/bindings/hwmon/peci-hwmon.txt
>> new file mode 100644
>> index 0000000..20b86f5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/peci-hwmon.txt
>> @@ -0,0 +1,33 @@
>> +* Generic PECI (Platform Environment Control Interface) hwmon driver.
>> +
>> +Dependency:
>> +- This driver uses a PECI misc driver as a controller interface so one of PECI
>> +  misc drivers which provides compatible ioctls has to be enabled.
> 
> The binding should only explain how we describe the hardware in an
> operating-system
> independent way, but not talk about how an OS is supposed to implement those
> drivers.
> 
> Having multiple drivers each provide an exported function is not possible
> in Linux: it immediately breaks building an 'allyesconfig' kernel, and prevents
> you from running the same kernel across multiple implementations, so that
> has to be redesigned anyway.
> 

Agreed, I'll consider redesigning of it.

>> +Required properties:
>> +- compatible: "peci-hwmon"
>> +- cpu-id: Should contain CPU socket ID
>> +       - 0 ~ 7
>> +
>> +Optional properties:
>> +- show-core: If this protperty is defined, core tmeperature attrubites will be
> 
> s/protperty/property/
> s/tmeperature/temperature/
> s/attrubites/attributes/
> 

Oops! I made this many typos in this single line. Thanks for your 
pointing it out. Will fix these.

>> +            enumerated.
>> +- dimm-nums: Should contain the number of DIMM slots that attached to each CPU
>> +            which is indicated by cpu-id.
>> +       0 ~ 16 (default: 16)
>> +            In case of 0, DIMM temperature attrubites will not be enumerated.
> 
> Is this only an initial list that you expect to be extended in the
> future, or is this
> a complete list of sensors that can ever be connected to PECI?
> 
> Should this be PECI version specific?
> 
>        Arnd
> 

The maximum supportable number of dimm slots is not PECI version 
specific but depends on CPU architecture. Currently IA supports up to 16 
slot as the maximum but it could vary in the future architecture.

Thanks,
Jae
