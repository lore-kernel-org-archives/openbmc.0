Return-Path: <mine260309@gmail.com>
Received: from mail-qt0-x234.google.com (mail-qt0-x234.google.com
 [IPv6:2607:f8b0:400d:c0d::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tCJcJ3HSszDvSv
 for <openbmc@lists.ozlabs.org>; Tue,  8 Nov 2016 04:01:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SkWnAKv7"; 
 dkim-atps=neutral
Received: by mail-qt0-x234.google.com with SMTP id p16so90915185qta.0
 for <openbmc@lists.ozlabs.org>; Mon, 07 Nov 2016 09:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=afuqHWCoWjA6yp0RZ2FJgRGSCPgkhi5g8Sh3j/XjDzQ=;
 b=SkWnAKv72tFxRKguW/uVMkd5sPU6L3SlVUcTf5PqzfnoaLAmhSnsEtdTSXclqTPKSB
 ZShGnqafBSEMHKZEbGBxXJrdgsaqL+y//7XmtmpcliMPpXSfsn+RQutGmBQVwW1D15Sj
 Ob1VzxbY6sO/p3/evXD3wh6YYfhs/wM8bZWpCuYyWcrrgrjbQVPqPT4xcUTNcIdQgML4
 U5pY86Nl/KMFSZz2rc2qDi4bpAW5/mCbgqqCoL3VmKrsP09QXJPAp0I39ubAHDmBjLOE
 xdVZtZYpagyVncL6o6ylk5oP4zYHdZ2IsylBXK0d7MP/1ek0bk37a9x/+M3NzXW5wMZ8
 BWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=afuqHWCoWjA6yp0RZ2FJgRGSCPgkhi5g8Sh3j/XjDzQ=;
 b=MNqFD1q6Sbxx3+hP6GWwU5z9BkwACPxT423F4XAeyOJclSKmiO9xxirfDQtzlSSj2h
 S2IZ341Yr6Q9VZLxaTNcIRS0BI5CkF7hPG0TfxDjG2X8NdhNZhQ4FpjWbWBo1ql8TJwF
 FeDIujwPk+tR6zMPRQ7xejwcSyOEZEyM0T+Zvp82NABEk27EXye/f2jdCMVgiVaJZAwD
 O+PKXCWLazjXP8Vue3MmtLWwdT1bOTYjSoKOi49W3bX4+MljI6WxYJqL+EoJ/j+ANHfS
 wKTarWKEjC5nUrVVYrw/R7vGBcgqyS1qd/CUS+pgDjp5dBLnNk61rW9BH7bhKJG/nrnc
 QF3A==
X-Gm-Message-State: ABUngvdozbj9ZWi0VAAmLz4l8Qr/EtqLvWAEUjtFqJtBpVJWUucS9Y5h/QKZDx9gxtPpI+FvWGQkuY9jZT9y6g==
X-Received: by 10.237.38.226 with SMTP id q89mr8005188qtd.153.1478538060668;
 Mon, 07 Nov 2016 09:01:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.146.15 with HTTP; Mon, 7 Nov 2016 09:01:00 -0800 (PST)
In-Reply-To: <20161107161903.7gbgafvj6vb6w4k4@asimov>
References: <CAARXrtmemiSFPH7RGxFLcddt1Ld4pGTwsDX-rPtAmf2coS8VDg@mail.gmail.com>
 <20161107040643.GE15757@heinlein.lan>
 <OF7F37D1BE.BCC7E74A-ON48258064.00313B2C-48258064.003271BA@notes.na.collabserv.com>
 <20161107161903.7gbgafvj6vb6w4k4@asimov>
From: Mine <mine260309@gmail.com>
Date: Mon, 7 Nov 2016 11:01:00 -0600
Message-ID: <CAARXrtmur716MDJJPhHKNwOcGVVnczey0n2ZxXdXV2YB67+Png@mail.gmail.com>
Subject: Re: How to handle GPIO differences between P8 and P9
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Yi TZ Li <shliyi@cn.ibm.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 07 Nov 2016 17:01:05 -0000

On Mon, Nov 7, 2016 at 10:19 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
> On Mon, Nov 07, 2016 at 05:10:59PM +0800, Yi TZ Li wrote:
>> I committed a patch: https://gerrit.openbmc-project.xyz/#/c/1019/
>> to add a getSystemName() dbus method in org.obmc.managers.System interface.
>> There are several places in skeleton requires fix for a specific system.
>>
>> Other way be add a compile flag in yocto when building Skeleton.
>
> We are really trying to avoid "if (machine_type == ...)" type code.  This
> becomes a gigantic problem when we are talking about supporting 3 dozen
> machines.
>
> --
> Patrick Williams

Yup, I prefer not to write `if (machine_type == ...)` type code, nor
to have a compile flag (it just becomes `#if xxx` or `#ifdef xxx`).

The temp fix by not defining `IDBTN` will not only cause error log,
but also prevent the code in `op-hostctl/control_host_obj.c` to work,
because it will get error during opening the GPIO, and jump out,
resulting in error: "GPIO sequence failed".

If we are targeting for booting P9 up, I would suggest a temp fix by
defining `IDBTN` for both Witherspoon and Romulus.
It will not block power on, but may break a function related to LED.

--
BRs,
Lei YU
