Return-Path: <xow@google.com>
Received: from mail-qk0-x233.google.com (mail-qk0-x233.google.com
 [IPv6:2607:f8b0:400d:c09::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tCR6H2P6qzDvNW
 for <openbmc@lists.ozlabs.org>; Tue,  8 Nov 2016 08:53:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="QnH5+mGH"; 
 dkim-atps=neutral
Received: by mail-qk0-x233.google.com with SMTP id n21so83800960qka.3
 for <openbmc@lists.ozlabs.org>; Mon, 07 Nov 2016 13:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=cPJzdICiOmSKpPuZwo/N1SjoGr6S4lnsnO6XEy3F5ZQ=;
 b=QnH5+mGHbtvg+dlOu1G34sXtjaAwuxp36+D+gbcki7N8TsLN6/+tjqslkvF0NiYQRx
 7NKtLrXfhRJk5LNk0bln5dCR5XzpZ1g6BCUQX/zwW2cF9AT1sVHpi5KtfJCUIHeXJMy2
 k56y7z6a+Y9buch29hqfbt4g14UPik+GgMlk3xWd4EW73dOymABJ+pkUmRU6DQqQzuG8
 qnuZaIRjqtFqYxYII5W06uTzyNOwYxSs4o5qrtIPm1StWnZ74AZaB9tR1J6DEmJMgG3H
 qNuxDD4fEjVxKV4q0/efIJ2Djxms7DgIws0N89n8HDpraa+wRV6xTgk1fv7vurNd45N0
 L3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=cPJzdICiOmSKpPuZwo/N1SjoGr6S4lnsnO6XEy3F5ZQ=;
 b=maGHAo7YeBj8Kq+uj5Df8gnVLfiiQWLXpI68Sm+W0BdfAksD7LGM5DiXkxgbFDMiuL
 Xh2ihd2dPWtdwGqB24YZH1bP0L1usMJBWM5nKbHo6B7SDhIvO5eRgbKufWtIwvUZV4Ow
 IiqCZBatIkGe21wP4r+s7Cqnt8eCyPE7QhTE68bxy7D4SLr05my83a6cIvCbw4p7oisE
 xXIFBuSLDibKEZseyjm9d4dLZRwFdnIQDTMB4EM/xA5+5F8pFigBiWW3nl4wf14YACFc
 7joUzs0Dk20ZIbOKRiyDrf2g7Zv7wAP7U3IK01lap6vlE1PqdlJFR4/ETknd4k/TUGFU
 Yvaw==
X-Gm-Message-State: ABUngvdMSB7VPzyqMuUc47nGLl4npaNDh1sWgvtdsHuvGl/Zf6EuU0ASiazvizEbaIxI8w12CBTF1Co/7aqBXJsy
X-Received: by 10.55.16.134 with SMTP id 6mr10532066qkq.76.1478555633953; Mon,
 07 Nov 2016 13:53:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.237.57.199 with HTTP; Mon, 7 Nov 2016 13:53:53 -0800 (PST)
In-Reply-To: <CAARXrtmur716MDJJPhHKNwOcGVVnczey0n2ZxXdXV2YB67+Png@mail.gmail.com>
References: <CAARXrtmemiSFPH7RGxFLcddt1Ld4pGTwsDX-rPtAmf2coS8VDg@mail.gmail.com>
 <20161107040643.GE15757@heinlein.lan>
 <OF7F37D1BE.BCC7E74A-ON48258064.00313B2C-48258064.003271BA@notes.na.collabserv.com>
 <20161107161903.7gbgafvj6vb6w4k4@asimov>
 <CAARXrtmur716MDJJPhHKNwOcGVVnczey0n2ZxXdXV2YB67+Png@mail.gmail.com>
From: Xo Wang <xow@google.com>
Date: Mon, 7 Nov 2016 13:53:53 -0800
Message-ID: <CAPH-5w6jxPPBYPSh1NQF-vg2w2HJ7ZU_r50ttSsUsXDMPS3_5A@mail.gmail.com>
Subject: Re: How to handle GPIO differences between P8 and P9
To: Mine <mine260309@gmail.com>
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
X-List-Received-Date: Mon, 07 Nov 2016 21:54:00 -0000

On Mon, Nov 7, 2016 at 9:01 AM, Mine <mine260309@gmail.com> wrote:
> On Mon, Nov 7, 2016 at 10:19 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
>> On Mon, Nov 07, 2016 at 05:10:59PM +0800, Yi TZ Li wrote:
>>> I committed a patch: https://gerrit.openbmc-project.xyz/#/c/1019/
>>> to add a getSystemName() dbus method in org.obmc.managers.System interface.
>>> There are several places in skeleton requires fix for a specific system.
>>>
>>> Other way be add a compile flag in yocto when building Skeleton.
>>
>> We are really trying to avoid "if (machine_type == ...)" type code.  This
>> becomes a gigantic problem when we are talking about supporting 3 dozen
>> machines.
>>
>> --
>> Patrick Williams
>
> Yup, I prefer not to write `if (machine_type == ...)` type code, nor
> to have a compile flag (it just becomes `#if xxx` or `#ifdef xxx`).
>
> The temp fix by not defining `IDBTN` will not only cause error log,
> but also prevent the code in `op-hostctl/control_host_obj.c` to work,
> because it will get error during opening the GPIO, and jump out,
> resulting in error: "GPIO sequence failed".
>
> If we are targeting for booting P9 up, I would suggest a temp fix by
> defining `IDBTN` for both Witherspoon and Romulus.
> It will not block power on, but may break a function related to LED.
>
> --
> BRs,
> Lei YU
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

We had a similar issue in the op-pwrctl where the source hard-coded
the system net names. There I put in a short-term solution of adding a
function-specific abstraction over the net names into the System.py
config, removing the per-machine patches for name and polarity:
https://gerrit.openbmc-project.xyz/#/c/606/
https://gerrit.openbmc-project.xyz/#/c/689/

It's not difficult to extend POWER_CONFIG for GPIO functions that only
exist on one machine, like so:
https://gerrit.openbmc-project.xyz/#/c/608/3

With the abstraction taking place in the Python machine config, we
don't need per-machine dispatch in the user interface (op-pwrctl,
op-hostctl, op-pwr-button, etc).

Does that work for you in the short term?

cheers
xo
