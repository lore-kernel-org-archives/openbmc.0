Return-Path: <tcminyard@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::22b; helo=mail-pg0-x22b.google.com;
 envelope-from=tcminyard@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pvena5Jq"; 
 dkim-atps=neutral
Received: from mail-pg0-x22b.google.com (mail-pg0-x22b.google.com
 [IPv6:2607:f8b0:400e:c05::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zMTD55rLMzF0Yj
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jan 2018 13:58:13 +1100 (AEDT)
Received: by mail-pg0-x22b.google.com with SMTP id z17so12788619pgc.4
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jan 2018 18:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:reply-to:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=89dZ1hTrzONahB8VhmAsIKYq69Ui3iOqoEDdSO82LNU=;
 b=pvena5JqmFssCgex8yElvl+O7r3WncJs0QOCkRZ9LFVHP6mH9Q4nAHMmZxA4bj6ENr
 oVrert+Q2A+qOiQpPg6Aer9GDxpTsL4xHJPwtd2C9EdCY0sQfJ9EcSD7DkRrRLhIh+sT
 SaW48GkdrmAFssuqOVDh4I133TZHSX6F4qgy2F3viuNJGtEdvvyyBUR23dNg88gTpqpb
 AkoF66h9wguqnHrcGgly4/HM41YTRiRDrUwrL9ZENvpVH3JRABepN4b/kYoCOxybrnt5
 U0sqvigEKs8TwiSDB3mKoUJoN8Qh66aLFg4AKYkKElGpbejI5y8jHSGDrtBhmBPrD+B9
 IKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=89dZ1hTrzONahB8VhmAsIKYq69Ui3iOqoEDdSO82LNU=;
 b=T+UvAlxVlg6zpX4a86xjHLfVJ60OqIXTPxdR6gyZrNjf4kD3qg25eBKauUxZuJwKmf
 LcEooFZCgFuvwIKxfGnjUw1mqzZtB8S4+oc3UaPx8M9M6ICWW5k/Puew4XsO2C8LSCoa
 6a+Zj3GBtjo/Er7pEYQkMa4rawVaA6M+ojTgEpWsZ737GfQtMqH4MmRxRjvKIuSQwlSo
 ONkhVoW6YJvcdJP2fzG6kzJm1nForB9X4sosbeGuhKTi+AWYDdTsnodVDOlMlMT/FNZL
 L77INDocOSDaA2ZoLN8GkfNe6HYl8ffGYzkJ6Qv4PiINK1Ajy9vqWpx/KxvSHWbk/AQh
 u+LQ==
X-Gm-Message-State: AKGB3mKJNMX6HiuZTVR3DmGdRUD3EQ5MsV97AhwoTVIYTEdgrYRY7KQZ
 niV/ruLDy1VAHwBeRA8X9Q==
X-Google-Smtp-Source: ACJfBos+s+Y6oXtRu5sjZeV42eS3IqWM2AAoqKK99DdufN9DNnZJeCQK8QgXOPSwxtPclfqmNUkPAQ==
X-Received: by 10.159.240.138 with SMTP id p10mr43604478plr.133.1516244291014; 
 Wed, 17 Jan 2018 18:58:11 -0800 (PST)
Received: from serve.minyard.net ([47.184.168.85])
 by smtp.gmail.com with ESMTPSA id o25sm9740315pgc.75.2018.01.17.18.58.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Jan 2018 18:58:10 -0800 (PST)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from [192.168.27.3] (t430m.minyard.net [192.168.27.3])
 by serve.minyard.net (Postfix) with ESMTPSA id 8FAFB2B9;
 Wed, 17 Jan 2018 20:58:08 -0600 (CST)
Reply-To: minyard@acm.org
Subject: Re: [PATCH arm/aspeed/ast2500 v1] ipmi: add an Aspeed KCS IPMI BMC
 driver
To: "Wang, Haiyue" <haiyue.wang@linux.intel.com>, joel@jms.id.au,
 openbmc@lists.ozlabs.org, openipmi-developer@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Cc: andriy.shevchenko@intel.com
References: <1516103023-19244-1-git-send-email-haiyue.wang@linux.intel.com>
 <a716bfaf-d41e-7865-8b9d-61e6abed2035@acm.org>
 <54c6562b-f35a-c616-b6c2-a2eadf6937da@acm.org>
 <e462c75e-8d93-cddf-06f9-f40643e5b703@linux.intel.com>
 <cc88c8bf-65ec-c38c-0fdc-32e0436ebc7e@acm.org>
 <2fd6d4d7-39a1-f1b5-752e-e43ae2dd4cdd@linux.intel.com>
From: Corey Minyard <minyard@acm.org>
Message-ID: <a6391cfa-0ea2-f8a6-5ac2-961de59ad3cc@acm.org>
Date: Wed, 17 Jan 2018 20:58:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <2fd6d4d7-39a1-f1b5-752e-e43ae2dd4cdd@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
X-List-Received-Date: Thu, 18 Jan 2018 02:58:14 -0000

On 01/17/2018 06:16 PM, Wang, Haiyue wrote:
>
>
> On 2018-01-17 23:59, Corey Minyard wrote:
>> On 01/17/2018 08:31 AM, Wang, Haiyue wrote:
>>>
>>>
>>> On 2018-01-17 06:12, Corey Minyard wrote:
>>>> On 01/16/2018 02:59 PM, Corey Minyard wrote:
>>>>> On 01/16/2018 05:43 AM, Haiyue Wang wrote:
>>>>>> The KCS (Keyboard Controller Style) interface is used to perform 
>>>>>> in-band
>>>>>> IPMI communication between a server host and its BMC (BaseBoard 
>>>>>> Management
>>>>>> Controllers).
>>>>>>
>>>>>> This driver exposes the KCS interface on ASpeed SOCs (AST2400 and 
>>>>>> AST2500)
>>>>>> as a character device. Such SOCs are commonly used as BMCs and 
>>>>>> this driver
>>>>>> implements the BMC side of the KCS interface.
>>>>>
>>>>> I thought we were going to unify the BMC ioctl interface? My 
>>>>> preference would be to
>>>>> create a file named include/uapi/linux/ipmi-bmc.h and add the 
>>>>> following:
>>>>>
>>>>> #define __IPMI_BMC_IOCTL_MAGIC    0xb1
>>>>> #define IPMI_BMC_IOCTL_SMS_SET_ATN _IO(__IPMI_BMC_IOCTL_MAGIC, 0x00)
>>>>>
>>>>> to make it the same as BT.  Then in bt-bmc.h, set 
>>>>> BT_BMC_IOCTL_SMS_ATN to
>>>>> IPMI_BMC_IOCTL_SMS_SET_ATN.  Then add the KCS ioctls in ipmi-bmc.h 
>>>>> and
>>>>> use that.  That way we stay backward compatible but we are unified.
>>>>>
>>>>> Since more KCS interfaces may come around, can you make the name more
>>>>> specific?  (I made this same error on bt-bmc,c, it should probably 
>>>>> be renamed.)
>>>>>
>>> How about these IOCTL definitions ? Is it more specific ?
>>>
>>> #define IPMI_BMC_IOCTL_SET_SMS_ATN _IO(__IPMI_BMC_IOCTL_MAGIC, 0x00)
>>> #define IPMI_BMC_IOCTL_CLEAR_SMS_ATN _IO(__IPMI_BMC_IOCTL_MAGIC, 0x01)
>>> #define IPMI_BMC_IOCTL_FORCE_ABORT _IO(__IPMI_BMC_IOCTL_MAGIC, 0x02)
>>>
>>
>> Those look good to me.  If you could do the switchover to ipmi-bmc.h 
>> in a separate
>> patch, that would be cleaner.  Then add the clear atn and force abort 
>> ioctls in the
>> patch to add the new driver.
>>
>> Sound good?
>>
>> -corey
>>
> If I understood correctly, still use KCS_BMC_IOCTL_xxx in kcs_bmc.h 
> currently, then add a
> patch for ipmi-bmc.h, and modify the bt_bmc.h together. Right ?
>

No, not exactly.  Just add ipmi-bmc.h and put the ioctls you define 
above in it.  No need for
kcs_bmc.h at all.  We can then switch bt-bmc.c over to use the new 
ioctls later and remove
bt_bmc.h when all the software gets switched over.

-corey

> Haiyue
