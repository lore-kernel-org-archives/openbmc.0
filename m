Return-Path: <mine260309@gmail.com>
Received: from mail-qk0-x234.google.com (mail-qk0-x234.google.com
 [IPv6:2607:f8b0:400d:c09::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tD29j72MwzDvQg
 for <openbmc@lists.ozlabs.org>; Wed,  9 Nov 2016 08:14:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gZ+v1wis"; 
 dkim-atps=neutral
Received: by mail-qk0-x234.google.com with SMTP id q130so233499022qke.1
 for <openbmc@lists.ozlabs.org>; Tue, 08 Nov 2016 13:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=H3Q0ULjdq2M043Cold2uWPj+nQr6HYGhFnYd0ApGRkY=;
 b=gZ+v1wisreO/B0KXsojpDdq9NIcIgR27vNcESaChEHr2laLD6etYxRSKFrPQdD8rXz
 UCRnEq8OY1mom6FcPhjOYISH90IHSAzv2t3JJhxe9FuhNxSJ+UHjaj/b4VqQzl/k89F0
 9sRYml58u7rsJXztfhAcByabX1GIVVN8gOdenpOVgDHtN2F52t/PnpuADFxgKWGwM/6u
 uEXeVCEfsHBGfVc828Sk6zQiZTR/VssDgoAPZ87KdIhRm+nQGvnh/jnv88cmvzdLuD9N
 +ebW3wBHeROwwnWFaypqriBenAydsyhcXW2/P4kXGcHWckTN+Kbi5FRhPlqwvb2+YB3Z
 4VDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=H3Q0ULjdq2M043Cold2uWPj+nQr6HYGhFnYd0ApGRkY=;
 b=Bx/QyyKethVnugZo0kuUgSSbAUI8DP8JKmK3YlQB4fNvGzJzNz1hWlMTnrOlsmSLlP
 IEdn7VVpIuKgzGbiBldGGeIRWVkukPXmd8IeGr5mlYQ1hlOIvbXTDF+SIfKUwXa/P1rq
 lTQYBM2dXSxbmmQ37CS7m32WNHKRc9IjIff5hJWQ5C+zaf7UtS7Hfh1nqsz1FwJRTVXz
 ZuICh+mf7ANNju/3Qeh9PPv4FZAywkAqVI1W+xT4X6f0waRAlAabcZ4fwwKf39um7h1v
 PsHVtnw/bpXKBiniVd0FRE7Ygydv98fyAxCNKic9hbUklUhVlBQK+jZWjq9kilgkl3cI
 fo8g==
X-Gm-Message-State: ABUngveVtnscy2ArSeU72MddlEq7liXqvN/QL1I/yS5i8lWPVvm0NwnOHdcujZBUHj/+WEHvjSMBi+NosEwyBQ==
X-Received: by 10.55.167.88 with SMTP id q85mr14981678qke.61.1478639638923;
 Tue, 08 Nov 2016 13:13:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.146.15 with HTTP; Tue, 8 Nov 2016 13:13:58 -0800 (PST)
In-Reply-To: <CAPH-5w6jxPPBYPSh1NQF-vg2w2HJ7ZU_r50ttSsUsXDMPS3_5A@mail.gmail.com>
References: <CAARXrtmemiSFPH7RGxFLcddt1Ld4pGTwsDX-rPtAmf2coS8VDg@mail.gmail.com>
 <20161107040643.GE15757@heinlein.lan>
 <OF7F37D1BE.BCC7E74A-ON48258064.00313B2C-48258064.003271BA@notes.na.collabserv.com>
 <20161107161903.7gbgafvj6vb6w4k4@asimov>
 <CAARXrtmur716MDJJPhHKNwOcGVVnczey0n2ZxXdXV2YB67+Png@mail.gmail.com>
 <CAPH-5w6jxPPBYPSh1NQF-vg2w2HJ7ZU_r50ttSsUsXDMPS3_5A@mail.gmail.com>
From: Mine <mine260309@gmail.com>
Date: Tue, 8 Nov 2016 15:13:58 -0600
Message-ID: <CAARXrt=FA=kTrjJ3KAyB03cuiBP=ka6BHf6YuNYh8x-DtyCcHw@mail.gmail.com>
Subject: Re: How to handle GPIO differences between P8 and P9
To: Xo Wang <xow@google.com>
Cc: Patrick Williams <patrick@stwcx.xyz>,
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
X-List-Received-Date: Tue, 08 Nov 2016 21:14:02 -0000

On Mon, Nov 7, 2016 at 3:53 PM, Xo Wang <xow@google.com> wrote:
> On Mon, Nov 7, 2016 at 9:01 AM, Mine <mine260309@gmail.com> wrote:
>> On Mon, Nov 7, 2016 at 10:19 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
>>> On Mon, Nov 07, 2016 at 05:10:59PM +0800, Yi TZ Li wrote:
>>>> I committed a patch: https://gerrit.openbmc-project.xyz/#/c/1019/
>>>> to add a getSystemName() dbus method in org.obmc.managers.System interface.
>>>> There are several places in skeleton requires fix for a specific system.
>>>>
>>>> Other way be add a compile flag in yocto when building Skeleton.
>>>
>>> We are really trying to avoid "if (machine_type == ...)" type code.  This
>>> becomes a gigantic problem when we are talking about supporting 3 dozen
>>> machines.
>>>
>>> --
>>> Patrick Williams
>>
>> Yup, I prefer not to write `if (machine_type == ...)` type code, nor
>> to have a compile flag (it just becomes `#if xxx` or `#ifdef xxx`).
>>
>> The temp fix by not defining `IDBTN` will not only cause error log,
>> but also prevent the code in `op-hostctl/control_host_obj.c` to work,
>> because it will get error during opening the GPIO, and jump out,
>> resulting in error: "GPIO sequence failed".
>>
>> If we are targeting for booting P9 up, I would suggest a temp fix by
>> defining `IDBTN` for both Witherspoon and Romulus.
>> It will not block power on, but may break a function related to LED.
>>
>> --
>> BRs,
>> Lei YU
>> _______________________________________________
>> openbmc mailing list
>> openbmc@lists.ozlabs.org
>> https://lists.ozlabs.org/listinfo/openbmc
>
> We had a similar issue in the op-pwrctl where the source hard-coded
> the system net names. There I put in a short-term solution of adding a
> function-specific abstraction over the net names into the System.py
> config, removing the per-machine patches for name and polarity:
> https://gerrit.openbmc-project.xyz/#/c/606/
> https://gerrit.openbmc-project.xyz/#/c/689/
>
> It's not difficult to extend POWER_CONFIG for GPIO functions that only
> exist on one machine, like so:
> https://gerrit.openbmc-project.xyz/#/c/608/3
>
> With the abstraction taking place in the Python machine config, we
> don't need per-machine dispatch in the user interface (op-pwrctl,
> op-hostctl, op-pwr-button, etc).
>
> Does that work for you in the short term?
>
> cheers
> xo

Yup, that could be a solution. It's just the GPIOs are not for power control,
so following the solution would probably introduce similar code to
hostctl_gpio.h/c.

Maybe I can combine the power_gpio and hostctl_gpio, so they share the same
code?

Something like:

GPIO_CONFIG = {
  'power_gpios': {
    'latch_out' : 'BMC_UCD_LATCH_LE',
    'power_good_in' : 'SYS_PWROK_BUFF',
    'power_up_outs' : [
        ('SOFTWARE_PGOOD', True),
        ('BMC_POWER_UP', True),
    ],
    'reset_outs' : [
    ],
  },
  'hostctl_gpios': {
    'fsi_data' : 'FSI_DATA',
    ...
    'optionals' : [
      ('BMC_THROTTLE', True),
      ('IDBTN', False),
    ],
  }
}

What do you think?

--
BRs,
Lei YU
