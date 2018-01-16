Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::244; helo=mail-qk0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Yr9h4t75"; 
 dkim-atps=neutral
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com
 [IPv6:2607:f8b0:400d:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zLm883jK6zF0fY
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jan 2018 10:07:20 +1100 (AEDT)
Received: by mail-qk0-x244.google.com with SMTP id l64so22947113qke.13
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jan 2018 15:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=OJjzc3x2rjceYMCMyuoXK3nejPifRsSP/XJ7z6vnlTE=;
 b=Yr9h4t75hSipTfAnmbb1tvCCoKdFM0UiIKVEBOXDoq6ChXgHYDVHxtBsBwtGf9dOb9
 1FjGSix3K5k20MnMDOtGop/2Pxvc4xIgl5prMO3BniSIp7NbEGQhfBibxmQ11BFroLcN
 svttV05JD8Y2LyF4Pofj9nTZ8c/gGXpJce+4AlPa/biQAkcyOKvySfd2N7gDiViJmWox
 NzI7RvkpPQgR8l5MHH0G2sXgzf/m+wQIxETb7ShMFou+UUrB0mRgzcbb0S1EFKbmcAct
 J/aYevYoaF8zhxW1BbM99Mb8ozO7JiLhj9CR7lD258Foz4TTNDQLJhx086z0BvTGRSVj
 JoZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=OJjzc3x2rjceYMCMyuoXK3nejPifRsSP/XJ7z6vnlTE=;
 b=AFHgfp05C/RKk645nVG3yeeCe7qyyI+mkPvMY+cxkxct5ut2hXyYAhg/C95xvjOCDS
 89fNwaklnFKvatRjB6sRpcPs/wORixS3RejipsoS0uPtSnkLrqH1b2tTW/EVEhoVZpyx
 v5xI3HUtBPCVC0445v72YGt11RV6tQ8zZG3CALN2paT9xzKPmETZ6jxAIO7J3wnWsDFq
 tkYH314Ee8t8mXTrV8CC7qmaukLDPcuGMyc9X05TAbGJunl4V/ShdQjidB9N3VHo4/YM
 eFVuspALyKunGpFU4XWY9sYFcwTaFw9W1hq7+aK5xXxlaWRYN9OQwJyAxYvuTrb62n2i
 rDKQ==
X-Gm-Message-State: AKwxytcrtoXE7X4LZRtrshgJPK5LDu4I6tLOOx54Uyi/kLnmLx7QrX/M
 IdUmcTe+5sykeJ+pob5uuFnN2uwo/uUMnx6hjfo=
X-Google-Smtp-Source: ACJfBovcoWDek0w9Ddx2RQadHW+8OL74bsA2NpDQTDSyoRLdDEsghnvJ4HnSLE1ZHi3CCIUWs08w6+VnVx6h2pDFcwM=
X-Received: by 10.55.115.7 with SMTP id o7mr52992910qkc.135.1516144037563;
 Tue, 16 Jan 2018 15:07:17 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.29.9 with HTTP; Tue, 16 Jan 2018 15:06:57 -0800 (PST)
In-Reply-To: <a716bfaf-d41e-7865-8b9d-61e6abed2035@acm.org>
References: <1516103023-19244-1-git-send-email-haiyue.wang@linux.intel.com>
 <a716bfaf-d41e-7865-8b9d-61e6abed2035@acm.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 16 Jan 2018 17:06:57 -0600
X-Google-Sender-Auth: mc7EFt4B99d4ZHLSgyQrsMQyf88
Message-ID: <CACPK8XfmrtJkUcFXNRDh7t3EDaETU1R=RawkErgduPG--CEVEg@mail.gmail.com>
Subject: Re: [PATCH arm/aspeed/ast2500 v1] ipmi: add an Aspeed KCS IPMI BMC
 driver
To: Corey Minyard <minyard@acm.org>, Ed Tanous <ed.tanous@intel.com>,
 james.mihm@intel.com, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, tomer.maimon@nuvoton.com
Cc: Haiyue Wang <haiyue.wang@linux.intel.com>,
 openipmi-developer@lists.sourceforge.net, 
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
X-List-Received-Date: Tue, 16 Jan 2018 23:07:21 -0000

On Tue, Jan 16, 2018 at 2:59 PM, Corey Minyard <minyard@acm.org> wrote:
> On 01/16/2018 05:43 AM, Haiyue Wang wrote:
>>
>> The KCS (Keyboard Controller Style) interface is used to perform in-band
>> IPMI communication between a server host and its BMC (BaseBoard Management
>> Controllers).
>>
>> This driver exposes the KCS interface on ASpeed SOCs (AST2400 and AST2500)
>> as a character device. Such SOCs are commonly used as BMCs and this driver
>> implements the BMC side of the KCS interface.
>
>
> I thought we were going to unify the BMC ioctl interface?  My preference
> would be to
> create a file named include/uapi/linux/ipmi-bmc.h and add the following:
>
> #define __IPMI_BMC_IOCTL_MAGIC    0xb1
> #define IPMI_BMC_IOCTL_SMS_SET_ATN    _IO(__IPMI_BMC_IOCTL_MAGIC, 0x00)
>
> to make it the same as BT.  Then in bt-bmc.h, set BT_BMC_IOCTL_SMS_ATN to
> IPMI_BMC_IOCTL_SMS_SET_ATN.  Then add the KCS ioctls in ipmi-bmc.h and
> use that.  That way we stay backward compatible but we are unified.
>
> Since more KCS interfaces may come around, can you make the name more
> specific?  (I made this same error on bt-bmc,c, it should probably be
> renamed.)

Yes, we had a group of openbmc people get together recently and spoke
about this. Unfortunately Haiyue wasn't there (but other Intel BMC
people were).

We've got code coming from another BMC vendor who will use the same
userspace API. The intention is to unify ASPEED's KCS and BT, along
with Nuvoton's KCS and BT, as you outlined above.

Cheers,

Joel
