Return-Path: <haiyue.wang@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=haiyue.wang@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zSTSN42cXzDqvM
 for <openbmc@lists.ozlabs.org>; Fri, 26 Jan 2018 17:26:11 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jan 2018 22:26:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,415,1511856000"; d="scan'208";a="22681746"
Received: from fengzhou-mobl.ccr.corp.intel.com (HELO [10.255.27.109])
 ([10.255.27.109])
 by FMSMGA003.fm.intel.com with ESMTP; 25 Jan 2018 22:26:05 -0800
Subject: Re: [PATCH arm/aspeed/ast2500 v2] ipmi: add an Aspeed KCS IPMI BMC
 driver
To: minyard@acm.org, joel@jms.id.au, avifishman70@gmail.com,
 openbmc@lists.ozlabs.org, openipmi-developer@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Cc: andriy.shevchenko@intel.com
References: <1516810009-16353-1-git-send-email-haiyue.wang@linux.intel.com>
 <f20da565-6644-3ea4-823b-a808cf613958@gmail.com>
From: "Wang, Haiyue" <haiyue.wang@linux.intel.com>
Message-ID: <9b194ad6-d277-44e5-54b0-c7e453a6fb0c@linux.intel.com>
Date: Fri, 26 Jan 2018 14:26:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <f20da565-6644-3ea4-823b-a808cf613958@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Jan 2018 06:26:13 -0000



On 2018-01-25 01:48, Corey Minyard wrote:
> On 01/24/2018 10:06 AM, Haiyue Wang wrote:
>> The KCS (Keyboard Controller Style) interface is used to perform in-band
>> IPMI communication between a server host and its BMC (BaseBoard 
>> Management
>> Controllers).
>>
>> This driver exposes the KCS interface on ASpeed SOCs (AST2400 and 
>> AST2500)
>> as a character device. Such SOCs are commonly used as BMCs and this 
>> driver
>> implements the BMC side of the KCS interface.
>>
>> Signed-off-by: Haiyue Wang <haiyue.wang@linux.intel.com>
>>
>> ---
>
>> +
>> +static ssize_t kcs_bmc_read(struct file *filp, char *buf,
>> +                size_t count, loff_t *offset)
>> +{
>> +    struct kcs_bmc *kcs_bmc = file_kcs_bmc(filp);
>> +    ssize_t ret = -EAGAIN;
>> +
>
> This function still has some issues.
>
> You can't call copy_to_user() with a spinlock held or interrupts 
> disabled.
> To handle readers, you probably need a separate mutex.
>
> Also, this function can return -EAGAIN even if O_NONBLOCK is not set if
> kcs_bmc->data_in_avail changes between when you wait on the event
> and when you check it under the lock.
>
> You also clear data_in_avail even if the copy_to_user() fails, which is
> wrong.
>
> I believe the best way to handle this would be to have the spinlock
> protect the inner workings of the state machine and a mutex handle
> copying data out, setting/clearing the running flag (thus a mutex
> instead of spinlock in open and release) and the ioctl settings (except
> for abort where you will need to grab the spinlock).
>
> After the wait event below, grab the mutex.  If data is not available
> and O_NONBLOCK is not set, drop the mutex and retry.  Otherwise
> this is the only place (besides release) that sets data_in_avail to 
> false.
> Do the copy_to_user(), grab the spinlock, clear data_in_avail and
> data_in_idx, then release the lock and mutex.  If you are really
> adventurous you can do this without grabbing the lock using
> barriers, but it's probably not necessary here.
>
The main race is data_in and data_out memory copy from & to between one 
user-land (ipmid) and
the irq handler. If separates the copy_to_user into two parts: check the 
'access_ok(VERIFY_WRITE, to, n)',
if no errors, then grap the spinlock and irq disabled, then 
'memcpy((void __force *)to, from, n);' It it right
calling ?

I will add a mutex to avoid spinlcok using as possible.
>> +    if (!(filp->f_flags & O_NONBLOCK))
>> +        wait_event_interruptible(kcs_bmc->queue,
>> +                     kcs_bmc->data_in_avail);
>> +
>> +    spin_lock_irq(&kcs_bmc->lock);
>> +
>> +    if (kcs_bmc->data_in_avail) {
>> +        kcs_bmc->data_in_avail = false;
>> +
>> +        if (count > kcs_bmc->data_in_idx)
>> +            count = kcs_bmc->data_in_idx;
>> +
>> +        if (!copy_to_user(buf, kcs_bmc->data_in, count))
>> +            ret = count;
>> +        else
>> +            ret = -EFAULT;
>> +    }
>> +
>> +    spin_unlock_irq(&kcs_bmc->lock);
>> +
>> +    return ret;
>> +}
>> +
>
>> +    }
>> +
>> +    spin_unlock_irq(&kcs_bmc->lock);
>> +
>> +    return ret;
>> +}
>
