Return-Path: <haiyue.wang@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=haiyue.wang@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zMPdt407GzF0YS
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jan 2018 11:16:49 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jan 2018 16:16:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,374,1511856000"; d="scan'208";a="22560946"
Received: from haiyuewa-mobl1.ccr.corp.intel.com (HELO [10.239.196.40])
 ([10.239.196.40])
 by fmsmga004.fm.intel.com with ESMTP; 17 Jan 2018 16:16:46 -0800
Subject: Re: [PATCH arm/aspeed/ast2500 v1] ipmi: add an Aspeed KCS IPMI BMC
 driver
To: minyard@acm.org, joel@jms.id.au, openbmc@lists.ozlabs.org,
 openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org
Cc: andriy.shevchenko@intel.com
References: <1516103023-19244-1-git-send-email-haiyue.wang@linux.intel.com>
 <a716bfaf-d41e-7865-8b9d-61e6abed2035@acm.org>
 <54c6562b-f35a-c616-b6c2-a2eadf6937da@acm.org>
 <e462c75e-8d93-cddf-06f9-f40643e5b703@linux.intel.com>
 <cc88c8bf-65ec-c38c-0fdc-32e0436ebc7e@acm.org>
From: "Wang, Haiyue" <haiyue.wang@linux.intel.com>
Message-ID: <2fd6d4d7-39a1-f1b5-752e-e43ae2dd4cdd@linux.intel.com>
Date: Thu, 18 Jan 2018 08:16:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <cc88c8bf-65ec-c38c-0fdc-32e0436ebc7e@acm.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Thu, 18 Jan 2018 00:16:51 -0000



On 2018-01-17 23:59, Corey Minyard wrote:
> On 01/17/2018 08:31 AM, Wang, Haiyue wrote:
>>
>>
>> On 2018-01-17 06:12, Corey Minyard wrote:
>>> On 01/16/2018 02:59 PM, Corey Minyard wrote:
>>>> On 01/16/2018 05:43 AM, Haiyue Wang wrote:
>>>>> The KCS (Keyboard Controller Style) interface is used to perform 
>>>>> in-band
>>>>> IPMI communication between a server host and its BMC (BaseBoard 
>>>>> Management
>>>>> Controllers).
>>>>>
>>>>> This driver exposes the KCS interface on ASpeed SOCs (AST2400 and 
>>>>> AST2500)
>>>>> as a character device. Such SOCs are commonly used as BMCs and 
>>>>> this driver
>>>>> implements the BMC side of the KCS interface.
>>>>
>>>> I thought we were going to unify the BMC ioctl interface? My 
>>>> preference would be to
>>>> create a file named include/uapi/linux/ipmi-bmc.h and add the 
>>>> following:
>>>>
>>>> #define __IPMI_BMC_IOCTL_MAGIC    0xb1
>>>> #define IPMI_BMC_IOCTL_SMS_SET_ATN _IO(__IPMI_BMC_IOCTL_MAGIC, 0x00)
>>>>
>>>> to make it the same as BT.  Then in bt-bmc.h, set 
>>>> BT_BMC_IOCTL_SMS_ATN to
>>>> IPMI_BMC_IOCTL_SMS_SET_ATN.  Then add the KCS ioctls in ipmi-bmc.h and
>>>> use that.  That way we stay backward compatible but we are unified.
>>>>
>>>> Since more KCS interfaces may come around, can you make the name more
>>>> specific?  (I made this same error on bt-bmc,c, it should probably 
>>>> be renamed.)
>>>>
>> How about these IOCTL definitions ? Is it more specific ?
>>
>> #define IPMI_BMC_IOCTL_SET_SMS_ATN _IO(__IPMI_BMC_IOCTL_MAGIC, 0x00)
>> #define IPMI_BMC_IOCTL_CLEAR_SMS_ATN _IO(__IPMI_BMC_IOCTL_MAGIC, 0x01)
>> #define IPMI_BMC_IOCTL_FORCE_ABORT _IO(__IPMI_BMC_IOCTL_MAGIC, 0x02)
>>
>
> Those look good to me.  If you could do the switchover to ipmi-bmc.h 
> in a separate
> patch, that would be cleaner.  Then add the clear atn and force abort 
> ioctls in the
> patch to add the new driver.
>
> Sound good?
>
> -corey
>
If I understood correctly, still use KCS_BMC_IOCTL_xxx in kcs_bmc.h 
currently, then add a
patch for ipmi-bmc.h, and modify the bt_bmc.h together. Right ?

Haiyue
