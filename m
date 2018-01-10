Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zH5Hc5hL2zF0RZ
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 10:46:04 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jan 2018 15:45:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,342,1511856000"; d="scan'208";a="23051397"
Received: from yoojae-mobl.amr.corp.intel.com (HELO [10.7.153.149])
 ([10.7.153.149])
 by orsmga001.jf.intel.com with ESMTP; 10 Jan 2018 15:45:58 -0800
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
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <bdc0375d-c379-6c2e-b350-76741afe151d@linux.intel.com>
Date: Wed, 10 Jan 2018 15:45:58 -0800
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAK8P3a31+9HGQ=fQby5Zi1RZ671hKraZP_2ggLTMX3qvOiTx0w@mail.gmail.com>
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
X-List-Received-Date: Wed, 10 Jan 2018 23:46:08 -0000

On 1/10/2018 4:29 AM, Arnd Bergmann wrote:
> On Tue, Jan 9, 2018 at 11:31 PM, Jae Hyun Yoo
> <jae.hyun.yoo@linux.intel.com> wrote:
>> This commit adds driver implementation for a generic PECI hwmon.
>>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> 
>> +static int xfer_peci_msg(int cmd, void *pmsg)
>> +{
>> +       int rc;
>> +
>> +       mutex_lock(&peci_hwmon_lock);
>> +       rc = peci_ioctl(NULL, cmd, (unsigned long)pmsg);
>> +       mutex_unlock(&peci_hwmon_lock);
>> +
>> +       return rc;
>> +}
> 
> I said earlier that peci_ioctl() looked unused, that was obviously
> wrong, but what you have here
> is not a proper way to abstract a bus.
> 
> Maybe this can be done more like an i2c bus: make the peci controller
> a bus device
> and register all known target/index pairs as devices with the peci bus
> type, and have
> them probed from DT. The driver can then bind to each of those individually.
> Not sure if that is getting to granular at that point, I'd have to
> understand better
> how it is expected to get used, and what the variances are between
> implementations.
> 
>         Arnd
> 

Thanks for sharing your opinion. In fact, this was also suggested by 
openbmc community so I should consider of redesigning it. I'm currently 
thinking about adding a new PECI device class as an abstract layer and 
any BMC chipset specific driver could be attached to the PECI class 
driver. Then, each CPU client could be registered as an individual 
device as you suggested. Will consider your suggestion.

Thanks a lot!
Jae
