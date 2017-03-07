Return-Path: <xow@google.com>
Received: from mail-qk0-x22c.google.com (mail-qk0-x22c.google.com
 [IPv6:2607:f8b0:400d:c09::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vd9ct4t85zDqXf
 for <openbmc@lists.ozlabs.org>; Wed,  8 Mar 2017 09:02:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="DT5okuxe"; 
 dkim-atps=neutral
Received: by mail-qk0-x22c.google.com with SMTP id 1so28464030qkl.3
 for <openbmc@lists.ozlabs.org>; Tue, 07 Mar 2017 14:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=yMu37kLiHYZJP5xhCto3HBKyjJWZ8nF6lHfXIO/zwXo=;
 b=DT5okuxevUXgkQh75HcheZWB4z5osNuPiULzznDaqweMNOVSi8nr66jO7BJIwVECsi
 fsBbGnDRPfefVVcZjqX1VhZfRFgVZU9ES95lhOJ/FO4K39c1fNik8hnfhcBCFkH+JWXG
 VMnk4Kg/EWziYkudeLMgQ1YrRxR+kj1XZXhFoE7n0B1T3pwofkwQ++Iymo1B4W9uQY2D
 6nMm/KEbJ3ThcUmIOrj/I88jPgAKbMBEepusy6rqwq9I+y3xDp383f62B2NtPYoDPUib
 1izfQgSdCHwN/TCIeCokH/bK8l2y+hkmXFH3eWy/rUfP/DsT+2BjQdF1QuFipzvyPgR2
 oZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=yMu37kLiHYZJP5xhCto3HBKyjJWZ8nF6lHfXIO/zwXo=;
 b=GppE/g8CoUdizvQfJw6807d8c4Xt66E8OMGcG8HGGaZ6tHUyZfxwpmH3GhqDvx/0Yn
 Mo4J1GKYIxACM4OclXZY9biC0xntJivlolcIQsV7pTyxRzHffNwWNASGWAXL1n5wslFr
 IOEd3QNw+vfkhAPFF+L0b/XtCIKTHun5czmZDBK3in21kGSW3bikVhHpm8KdlJIB2af0
 bWWyGSM6f1CJKjNr5iDYhUYjeq3RPEwwlpFhWp5SItxZ1ZL4ShOiNYj/09DIf+U7z52R
 3buVvR6zyAcHGJ+Gl+VLQ3q6hbzLKUNbmjgZcfMdgnrAq6wConU1ozJ9dJ0fxY/HEBCW
 OEzg==
X-Gm-Message-State: AMke39nT6ZzDr6zLRBH1mv5VFk/OhjQjmThQY5iADnw+wuEqrtAgkNZmQGNsv9dX8WgY2YTtwBNpVq4N4ZsebBLW
X-Received: by 10.55.129.71 with SMTP id c68mr3239789qkd.195.1488924154883;
 Tue, 07 Mar 2017 14:02:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.17.56 with HTTP; Tue, 7 Mar 2017 14:02:34 -0800 (PST)
In-Reply-To: <CAPLgG=nx8TACY7NYKXesVsvgqX7w9dprSy15y6W_Ut4WfuMguA@mail.gmail.com>
References: <20170303205920.146751-1-xow@google.com>
 <CAPLgG==-CnHNe14H9SV2ZCfJu9ZQ_Xc7ayXfkKbQY+_ZmVPubA@mail.gmail.com>
 <CAPH-5w7dkuLF_wfwxtSVsHgxCfe787twEuFa-nh2JkncP3gcLw@mail.gmail.com>
 <CAPLgG=naqWVfr3C2yFBP9HSTR9WC3UT661fEu+ZT3_ETxp+tuw@mail.gmail.com>
 <CAPH-5w7VWSpob8KSpfYKwOT9HcT9Sab8pnpzOPQvrXd8shDLtA@mail.gmail.com>
 <CAPLgG=nx8TACY7NYKXesVsvgqX7w9dprSy15y6W_Ut4WfuMguA@mail.gmail.com>
From: Xo Wang <xow@google.com>
Date: Tue, 7 Mar 2017 14:02:34 -0800
Message-ID: <CAPH-5w7LxUe648qW4hm-ODyTim6dDPoh1qEYYZncyLzvqZ6B-Q@mail.gmail.com>
Subject: Re: [PATCH linux] ARM: dts: aspeed: zaius: Enable NC-SI mux
To: Rick Altherr <raltherr@google.com>
Cc: Maxim Sloyko <maxims@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Mar 2017 22:02:39 -0000

On Tue, Mar 7, 2017 at 1:32 PM, Rick Altherr <raltherr@google.com> wrote:
> +maxim
>
> Sounds like U-Boot needs to do some work here.  I'm unclear if the hog
> is necessary once U-Boot does the right thing.
>
> On Tue, Mar 7, 2017 at 1:31 PM, Xo Wang <xow@google.com> wrote:
>> On Tue, Mar 7, 2017 at 1:21 PM, Rick Altherr <raltherr@google.com> wrote:
>>> I don't believe it currently does.  I'm concerned with whether U-Boot
>>> or Linux is expected to configure the NC-SI muxes.
>>>
>>> On Tue, Mar 7, 2017 at 1:19 PM, Xo Wang <xow@google.com> wrote:
>>>> On Tue, Mar 7, 2017 at 1:13 PM, Rick Altherr <raltherr@google.com> wrote:
>>>>> Why is Linux doing this instead of U-Boot?
>>>>>
>>>>
>>>> Does our U-Boot understand Aspeed GPIO in the device tree? If it does,
>>>> then it makes more sense for U-Boot to consume and set these pin
>>>> assignments.
>>>>
>>>> xo
>>
>> I would think U-Boot is expected to, since that provides the option of
>> netbooting from the NC-SI adapter in U-Boot.
>>
>> In addition, the Linux ftgmac100 driver can't yet handle the NC-SI mux
>> changing dynamically (https://github.com/openbmc/openbmc/issues/979).
>> So for now the mux must be enabled and selected prior to that driver
>> probing. This is the only reason why this assignment exists as a Linux
>> gpio-hog: it is set prior to any other driver being probed.
>>
>> xo

The hog would be no longer necessary once U-Boot sets it. In fact,
eliminating it is desirable because it opens up the possibility of
changing the mux selection at runtime (gpio-hogs are write-once as far
as I understand and preclude sysfs export for the GPIOs they occupy).

xo
