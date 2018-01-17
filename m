Return-Path: <haiyue.wang@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=haiyue.wang@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zM8jt6gSDzDqgQ
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jan 2018 01:34:24 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jan 2018 06:34:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,372,1511856000"; d="scan'208";a="196414825"
Received: from haiyuewa-mobl1.ccr.corp.intel.com (HELO [10.255.27.152])
 ([10.255.27.152])
 by fmsmga006.fm.intel.com with ESMTP; 17 Jan 2018 06:34:19 -0800
Subject: Re: [PATCH arm/aspeed/ast2500 v1] ipmi: add an Aspeed KCS IPMI BMC
 driver
To: Avi Fishman <avifishman70@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, Corey Minyard <minyard@acm.org>,
 Ed Tanous <ed.tanous@intel.com>, james.mihm@intel.com,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, tomer.maimon@nuvoton.com,
 openipmi-developer@lists.sourceforge.net,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 andriy.shevchenko@intel.com
References: <1516103023-19244-1-git-send-email-haiyue.wang@linux.intel.com>
 <a716bfaf-d41e-7865-8b9d-61e6abed2035@acm.org>
 <CACPK8XfmrtJkUcFXNRDh7t3EDaETU1R=RawkErgduPG--CEVEg@mail.gmail.com>
 <f802a1fd-7553-d8cd-937c-6066b1db150e@linux.intel.com>
 <CAKKbWA7bHX61pvM+Q9Fr1NMgOZrRviZ8024tpMjHY+OQjxsuDA@mail.gmail.com>
From: "Wang, Haiyue" <haiyue.wang@linux.intel.com>
Message-ID: <1f53dc54-b50b-7feb-0855-c05d60a008f5@linux.intel.com>
Date: Wed, 17 Jan 2018 22:34:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAKKbWA7bHX61pvM+Q9Fr1NMgOZrRviZ8024tpMjHY+OQjxsuDA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
X-List-Received-Date: Wed, 17 Jan 2018 14:34:28 -0000

Thanks Avi, wait for your response when new patch is ready. :-)

BR,
Haiyue


On 2018-01-17 20:54, Avi Fishman wrote:
> Sounds great for us (Nuvoton).
>
> Avi.
> On Wed, Jan 17, 2018 at 8:32 AM, Wang, Haiyue
> <haiyue.wang@linux.intel.com> wrote:
>>
>> On 2018-01-17 07:06, Joel Stanley wrote:
>>> On Tue, Jan 16, 2018 at 2:59 PM, Corey Minyard <minyard@acm.org> wrote:
>>>> On 01/16/2018 05:43 AM, Haiyue Wang wrote:
>>>>> The KCS (Keyboard Controller Style) interface is used to perform in-band
>>>>> IPMI communication between a server host and its BMC (BaseBoard
>>>>> Management
>>>>> Controllers).
>>>>>
>>>>> This driver exposes the KCS interface on ASpeed SOCs (AST2400 and
>>>>> AST2500)
>>>>> as a character device. Such SOCs are commonly used as BMCs and this
>>>>> driver
>>>>> implements the BMC side of the KCS interface.
>>>>
>>>> I thought we were going to unify the BMC ioctl interface?  My preference
>>>> would be to
>>>> create a file named include/uapi/linux/ipmi-bmc.h and add the following:
>>>>
>>>> #define __IPMI_BMC_IOCTL_MAGIC    0xb1
>>>> #define IPMI_BMC_IOCTL_SMS_SET_ATN    _IO(__IPMI_BMC_IOCTL_MAGIC, 0x00)
>>>>
>>>> to make it the same as BT.  Then in bt-bmc.h, set BT_BMC_IOCTL_SMS_ATN to
>>>> IPMI_BMC_IOCTL_SMS_SET_ATN.  Then add the KCS ioctls in ipmi-bmc.h and
>>>> use that.  That way we stay backward compatible but we are unified.
>>>>
>>>> Since more KCS interfaces may come around, can you make the name more
>>>> specific?  (I made this same error on bt-bmc,c, it should probably be
>>>> renamed.)
>>> Yes, we had a group of openbmc people get together recently and spoke
>>> about this. Unfortunately Haiyue wasn't there (but other Intel BMC
>>> people were).
>>>
>>> We've got code coming from another BMC vendor who will use the same
>>> userspace API. The intention is to unify ASPEED's KCS and BT, along
>>> with Nuvoton's KCS and BT, as you outlined above.
>> Great design for common BMC code, thanks Joel & Corey.
>>
>> Then we need to divide the kcs-bmc.c into two files, one (still kcs-bmc.c)
>> is for handling IPMI KCS state
>> according to IPMI 2.0 specification, and also handing device misc
>> operations; another file is called such
>> as aspeed-kcs-bmc.c which handles ast2500 kcs controller. So that Nuvoton
>> can define nvvoton-kcs-bmc.c
>> low level API, and call the IPMI KCS function in kcs-bmc.c ?
>>
>> How about this idea ? If it makes sense, I will change the code for review
>> in patch v2.
>>
>>> Cheers,
>>>
>>> Joel
>>
