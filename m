Return-Path: <avifishman70@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c0f::22e; helo=mail-ot0-x22e.google.com;
 envelope-from=avifishman70@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kzqZ14CM"; 
 dkim-atps=neutral
Received: from mail-ot0-x22e.google.com (mail-ot0-x22e.google.com
 [IPv6:2607:f8b0:4003:c0f::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zM6Vq4JMJzDqxC
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jan 2018 23:54:43 +1100 (AEDT)
Received: by mail-ot0-x22e.google.com with SMTP id x4so1062896otg.7
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jan 2018 04:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=lbLdeTw29i/KeRWCnqJVrlDydkMdXTOo73o0oE7bqNw=;
 b=kzqZ14CMETmAAFjtMo/Is/xrJhHB8iiixRuoH6VJOISYOaRb019j1oyRpcNa0bJISp
 wtEJu+f99b9Sax9Kr0DxB8tp/VF+TTYr3I96qhVLa/0PfKmgMBwBvxgeFgCwC5PJI0HL
 GiHbwEwUVmYk0uXQpQkVKtiUzCxLaClYb9G+DjXGotgiERMnBjn1MmCjEVTzjL6iGHkJ
 aH3OF3b1lXcI0JhA+FDt6clrpS2aQL82MtChIjf50u2EBSQnwa9WlQFNXscAZ0KTtNgH
 587E+fijidc0DmuLBSTmc7T+qSiwtPglVOUm5Pd/Qkcycdo7/ldumxI55GbxY5gYK/WG
 RJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=lbLdeTw29i/KeRWCnqJVrlDydkMdXTOo73o0oE7bqNw=;
 b=QYDdoXHDfso9uVtvtCkP/8SWK7MMtM9W+w+xOSkp5RXYRcssDsEZkNmv74Oaq5hKeV
 6j+45EYgPXsTZHLQVlGsM0QTcxVm1wobYeAvbyralTjOAoL6Bi1jzO1ooKGcNABRlb3f
 JrwgJucvWSKEgoz0NspU0URgmXAdYgDcO3/hpQefCyf3ytxyoldAvj/x75JPX8OyNoZY
 +eSEQ/YwpP2muuy/MP4jbehwRh2Tm4Y08Wu0/gAiLWMB7jygbdPm0m3lYXxEu90GuzjN
 uhtciD4JgwbUD/+ZpYJsiVUM7I7XS2p/tPw0NDztEG+dVMV3jEZ2Qk+tB4ikZP6Ea+t6
 rkOg==
X-Gm-Message-State: AKwxytcv8hTnbcf6ALzbpZ8xJ6gkMNpRsEvj8rnKSR/FsXf6fG8kcpoM
 xN4zad2doI5xRGEsH0rrDX5Tn6FthO/A+dBmAQ==
X-Google-Smtp-Source: ACJfBotzgOUsKC3/qgBmSKw3k88XKG7u+WfUgrgSwef5Pa+6PtFvNZIL1CeEUZrFFE4UcnwAe/Xy+JCs64/e1pDXgIY=
X-Received: by 10.157.32.104 with SMTP id n95mr987879ota.261.1516193681017;
 Wed, 17 Jan 2018 04:54:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.72.199 with HTTP; Wed, 17 Jan 2018 04:54:40 -0800 (PST)
In-Reply-To: <f802a1fd-7553-d8cd-937c-6066b1db150e@linux.intel.com>
References: <1516103023-19244-1-git-send-email-haiyue.wang@linux.intel.com>
 <a716bfaf-d41e-7865-8b9d-61e6abed2035@acm.org>
 <CACPK8XfmrtJkUcFXNRDh7t3EDaETU1R=RawkErgduPG--CEVEg@mail.gmail.com>
 <f802a1fd-7553-d8cd-937c-6066b1db150e@linux.intel.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Wed, 17 Jan 2018 14:54:40 +0200
Message-ID: <CAKKbWA7bHX61pvM+Q9Fr1NMgOZrRviZ8024tpMjHY+OQjxsuDA@mail.gmail.com>
Subject: Re: [PATCH arm/aspeed/ast2500 v1] ipmi: add an Aspeed KCS IPMI BMC
 driver
To: "Wang, Haiyue" <haiyue.wang@linux.intel.com>
Cc: Joel Stanley <joel@jms.id.au>, Corey Minyard <minyard@acm.org>,
 Ed Tanous <ed.tanous@intel.com>, 
 james.mihm@intel.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 tomer.maimon@nuvoton.com, openipmi-developer@lists.sourceforge.net, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 andriy.shevchenko@intel.com
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 17 Jan 2018 12:54:44 -0000

Sounds great for us (Nuvoton).

Avi.

On Wed, Jan 17, 2018 at 8:32 AM, Wang, Haiyue
<haiyue.wang@linux.intel.com> wrote:
>
>
> On 2018-01-17 07:06, Joel Stanley wrote:
>>
>> On Tue, Jan 16, 2018 at 2:59 PM, Corey Minyard <minyard@acm.org> wrote:
>>>
>>> On 01/16/2018 05:43 AM, Haiyue Wang wrote:
>>>>
>>>> The KCS (Keyboard Controller Style) interface is used to perform in-band
>>>> IPMI communication between a server host and its BMC (BaseBoard
>>>> Management
>>>> Controllers).
>>>>
>>>> This driver exposes the KCS interface on ASpeed SOCs (AST2400 and
>>>> AST2500)
>>>> as a character device. Such SOCs are commonly used as BMCs and this
>>>> driver
>>>> implements the BMC side of the KCS interface.
>>>
>>>
>>> I thought we were going to unify the BMC ioctl interface?  My preference
>>> would be to
>>> create a file named include/uapi/linux/ipmi-bmc.h and add the following:
>>>
>>> #define __IPMI_BMC_IOCTL_MAGIC    0xb1
>>> #define IPMI_BMC_IOCTL_SMS_SET_ATN    _IO(__IPMI_BMC_IOCTL_MAGIC, 0x00)
>>>
>>> to make it the same as BT.  Then in bt-bmc.h, set BT_BMC_IOCTL_SMS_ATN to
>>> IPMI_BMC_IOCTL_SMS_SET_ATN.  Then add the KCS ioctls in ipmi-bmc.h and
>>> use that.  That way we stay backward compatible but we are unified.
>>>
>>> Since more KCS interfaces may come around, can you make the name more
>>> specific?  (I made this same error on bt-bmc,c, it should probably be
>>> renamed.)
>>
>> Yes, we had a group of openbmc people get together recently and spoke
>> about this. Unfortunately Haiyue wasn't there (but other Intel BMC
>> people were).
>>
>> We've got code coming from another BMC vendor who will use the same
>> userspace API. The intention is to unify ASPEED's KCS and BT, along
>> with Nuvoton's KCS and BT, as you outlined above.
>
> Great design for common BMC code, thanks Joel & Corey.
>
> Then we need to divide the kcs-bmc.c into two files, one (still kcs-bmc.c)
> is for handling IPMI KCS state
> according to IPMI 2.0 specification, and also handing device misc
> operations; another file is called such
> as aspeed-kcs-bmc.c which handles ast2500 kcs controller. So that Nuvoton
> can define nvvoton-kcs-bmc.c
> low level API, and call the IPMI KCS function in kcs-bmc.c ?
>
> How about this idea ? If it makes sense, I will change the code for review
> in patch v2.
>
>> Cheers,
>>
>> Joel
>
>
