Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zpNDf2xWyzF1gt
 for <openbmc@lists.ozlabs.org>; Sat, 24 Feb 2018 20:33:04 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Feb 2018 01:32:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,386,1515484800"; d="scan'208";a="22764187"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.252.132.62])
 ([10.252.132.62])
 by fmsmga002.fm.intel.com with ESMTP; 24 Feb 2018 01:32:53 -0800
Subject: Re: [PATCH v2 7/8] [PATCH 7/8] drivers/hwmon: Add a generic PECI
 hwmon client driver
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Guenter Roeck <linux@roeck-us.net>,
 joel@jms.id.au, andrew@aj.id.au, Arnd Bergmann <arnd@arndb.de>,
 Greg KH <gregkh@linuxfoundation.org>, jdelvare@suse.com,
 benh@kernel.crashing.org, linux-kernel <linux-kernel@vger.kernel.org>,
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 openbmc@lists.ozlabs.org
References: <20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
 <20180221161606.32247-8-jae.hyun.yoo@linux.intel.com>
 <20180221182608.GA11635@roeck-us.net>
 <618f34cd-ee43-d8e4-4fb0-3c23bf03835f@linux.intel.com>
 <20180221214859.GA30263@roeck-us.net>
 <576a50c6-c302-654c-ceb3-aaf820b7738a@linux.intel.com>
 <20180222003720.GA25250@lunn.ch>
 <b506b4b1-7e7d-abd6-bac2-c45e7c1e0aae@linux.intel.com>
 <CANiq72mjsfJRzfFmhbL7dnih_0=2pFoJDTrmi35x0yLmKrSBFA@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <85f66284-2e18-2a74-1e7b-9378353ab43e@linux.intel.com>
Date: Sat, 24 Feb 2018 01:32:53 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CANiq72mjsfJRzfFmhbL7dnih_0=2pFoJDTrmi35x0yLmKrSBFA@mail.gmail.com>
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
X-List-Received-Date: Sat, 24 Feb 2018 09:33:07 -0000

On 2/23/2018 4:00 PM, Miguel Ojeda wrote:
> On Thu, Feb 22, 2018 at 2:29 AM, Jae Hyun Yoo
> <jae.hyun.yoo@linux.intel.com> wrote:
>> On 2/21/2018 4:37 PM, Andrew Lunn wrote:
>>>>
>>>> But even with this change, it still needs to use delayed creation
>>>> because BMC side kernel doesn't know how many DIMMs are populated on
>>>> a remote server before the remote server completes its memory
>>>> training and testing in BIOS, but it needs to check the remote
>>>> server's CPU temperature as immediate as possible to make
>>>> appropriate thermal control based on the remote CPU's temperature to
>>>> avoid any critical thermal issue. What would be a better solution in
>>>> this case?
>>>
>>>
>>> You could change this driver so that it supports one DIMM.  Move the
>>> 'hotplug' part into another driver which creates and destroys
>>> instances of the hwmon DIMM device as the DIMMS come and go.
>>>
>>> Also, do you need to handle CPU hotplug? You could split the CPU
>>> temperature part into a separate hwmon driver? And again create and
>>> destroy devices as CPUs come and go?
>>>
>>>          Andrew
>>>
>>
>> That seems like a possible option. I'll rewrite the hwmon driver again like
>> that.
>>
>> Thanks for the good idea. :)
> 
> By the way, in the rewrite, please try to avoid the create*workqueue()
> functions (they are deprecated :).
> 
> Cheers,
> Miguel
> 

Hi Miguel,

Thanks for letting me know that. I'll replace that with 
alloc_workqueue(). :)

Regards,
Jae

>>
>> Jae
