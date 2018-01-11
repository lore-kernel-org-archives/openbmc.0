Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zHdKK00bhzF0V2
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jan 2018 07:49:24 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Jan 2018 12:49:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,346,1511856000"; d="scan'208";a="10550223"
Received: from yoojae-mobl.amr.corp.intel.com (HELO [10.7.153.149])
 ([10.7.153.149])
 by orsmga006.jf.intel.com with ESMTP; 11 Jan 2018 12:49:18 -0800
Subject: Re: [PATCH linux dev-4.10 6/6] drivers/hwmon: Add a driver for a
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
 <20180109223126.13093-7-jae.hyun.yoo@linux.intel.com>
 <CAK8P3a31+9HGQ=fQby5Zi1RZ671hKraZP_2ggLTMX3qvOiTx0w@mail.gmail.com>
 <bdc0375d-c379-6c2e-b350-76741afe151d@linux.intel.com>
 <CAK8P3a0xyQQeyDdj8UEMgdGK13jisvo5rOkGbi-wWYZA5QFSMQ@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <58fbf0b8-4e70-e7f3-a929-87fb7e9ac5ba@linux.intel.com>
Date: Thu, 11 Jan 2018 12:49:18 -0800
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0xyQQeyDdj8UEMgdGK13jisvo5rOkGbi-wWYZA5QFSMQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 11 Jan 2018 20:49:25 -0000

On 1/11/2018 5:22 AM, Arnd Bergmann wrote:
> On Thu, Jan 11, 2018 at 12:45 AM, Jae Hyun Yoo
> <jae.hyun.yoo@linux.intel.com> wrote:
>> On 1/10/2018 4:29 AM, Arnd Bergmann wrote:
>>>
>>> On Tue, Jan 9, 2018 at 11:31 PM, Jae Hyun Yoo
>>> <jae.hyun.yoo@linux.intel.com> wrote:
>>>>
>>>> This commit adds driver implementation for a generic PECI hwmon.
>>>>
>>>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>>>
>>>
>>>> +static int xfer_peci_msg(int cmd, void *pmsg)
>>>> +{
>>>> +       int rc;
>>>> +
>>>> +       mutex_lock(&peci_hwmon_lock);
>>>> +       rc = peci_ioctl(NULL, cmd, (unsigned long)pmsg);
>>>> +       mutex_unlock(&peci_hwmon_lock);
>>>> +
>>>> +       return rc;
>>>> +}
>>>
>>>
>>> I said earlier that peci_ioctl() looked unused, that was obviously
>>> wrong, but what you have here
>>> is not a proper way to abstract a bus.
>>>
>>> Maybe this can be done more like an i2c bus: make the peci controller
>>> a bus device
>>> and register all known target/index pairs as devices with the peci bus
>>> type, and have
>>> them probed from DT. The driver can then bind to each of those
>>> individually.
>>> Not sure if that is getting to granular at that point, I'd have to
>>> understand better
>>> how it is expected to get used, and what the variances are between
>>> implementations.
>>>
>>
>> Thanks for sharing your opinion. In fact, this was also suggested by openbmc
>> community so I should consider of redesigning it. I'm currently thinking
>> about adding a new PECI device class as an abstract layer and any BMC
>> chipset specific driver could be attached to the PECI class driver. Then,
>> each CPU client could be registered as an individual device as you
>> suggested. Will consider your suggestion.
> 
> Another idea might be to pretend that PECI was I2C. We already have a few
> drivers for hardware that is not I2C but whose software interface looks
> similar enough that it just works. No idea if that is the case for PECI, but
> xfer_peci_msg might be close enough to i2c_xfer to make it work. If you
> are able to do that, then the PECI controller would just register itself
> as an i2c controller and it can be accessed using /dev/i2c from user space
> or a high-level i2c_driver.
> 
>        Arnd
> 

Thanks for the good idea. It looks like one of possible options. I'll 
check this idea as well. :)

Thanks,
Jae
