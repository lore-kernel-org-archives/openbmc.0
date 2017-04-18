Return-Path: <maxims@google.com>
Received: from mail-io0-x22f.google.com (mail-io0-x22f.google.com
 [IPv6:2607:f8b0:4001:c06::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w6ryj6HDlzDq5b
 for <openbmc@lists.ozlabs.org>; Wed, 19 Apr 2017 03:02:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="lOg9VoM5"; 
 dkim-atps=neutral
Received: by mail-io0-x22f.google.com with SMTP id r16so3794836ioi.2
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 10:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=8y96BhIJw5JgvupAYK/GkdP/0WevnGBt76fe7TsFdD8=;
 b=lOg9VoM5XeDXTmnb8YPVi7Ag+DRWNc+Iq+xwhrW7j2ym9yf87DWvvxGEL1OWJv1E5a
 AddgERSaVoymvcAATHhDmsOg5ijIMcMtAfy7qJDNz8PbBbnMeHSQluFf2cTAWy+TxfHR
 42HGu7D2r3ro04BIRKzE6NxgIN5GCJ3d7fNTniKRIVEJ/pKU7WPC6+pmnvUsDqbI4GYh
 lXcwxEC9FzDSPgMSGC5EyGjfMt7VjJwqm8TjNAjjZ68MLIXIX9gGXnULhhGx5RGiNsE2
 xVresWrNZ6vC4M+meqHtH2Zql1fs9+SmACbh3Karb6O/mzK+ecF8tzibiu6jzQrc83nB
 drYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=8y96BhIJw5JgvupAYK/GkdP/0WevnGBt76fe7TsFdD8=;
 b=CxDxaGAr8cySVOYqXad/EQzxnUYLtc4hbMg/dxlqUvJxs04lsELIX8YmWWn7wPw8bE
 uxn0AEQ7gSdwV4xrqDLoo7i5slavavZgvMzsDlxWUxTJOsJz8WEdu1dtkNmACJMO+GNl
 55TBJtGUxQ0Sqdo/8MmCz1Z1FCp4lojEsapi0iDSSoT/yVXJvlQv1yPSlzizBdjPd7ii
 0GdcZ2N2CFoJf6kqkkK+OB9vumljyG/KxxLW2ds/Oi6c7ODjR9UwJNdrWhKyR2RkKWrC
 /Pe1RlDW/hcvIJBggoY1mytiP34uXKRx3lMHzRhgC60P8REg/voGhsaBifR9RsE0wv/r
 wlxQ==
X-Gm-Message-State: AN3rC/4cmRLL0jZlzH4lht0e1utjciX6xrSiBdyYVruOv2q6glfjdVlp
 uak1JrAERg/Q3B30Cx8KVpXGXUKBQH7e
X-Received: by 10.107.46.229 with SMTP id u98mr15881320iou.147.1492534918903; 
 Tue, 18 Apr 2017 10:01:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.185.7 with HTTP; Tue, 18 Apr 2017 10:01:58 -0700 (PDT)
In-Reply-To: <CANF=oU6TBUTjq6gyDUZ=TWWQ-h-M3Hzdii4iBbUPVvMx5qRpAA@mail.gmail.com>
References: <CAFR_W8rbMN1uSC8o+cF94D40KwSdJT1oOGYLMS90PWHHuAVsaQ@mail.gmail.com>
 <CANF=oU6TBUTjq6gyDUZ=TWWQ-h-M3Hzdii4iBbUPVvMx5qRpAA@mail.gmail.com>
From: Maxim Sloyko <maxims@google.com>
Date: Tue, 18 Apr 2017 10:01:58 -0700
Message-ID: <CAFR_W8rHQNgzV9Lu5scZYF2-zV5y0kjCJDQ5BY0RYirEhi=pwQ@mail.gmail.com>
Subject: Re: Running OpenBMC in qemu
To: Robi Buranyi <rburanyi@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 18 Apr 2017 17:02:07 -0000

On Mon, Apr 17, 2017 at 5:56 PM, Robi Buranyi <rburanyi@google.com> wrote:
> why does it have to be qemuarm exactly? You can equally run qemux86(-64),
> and shall see no difference in test results.

Well, I guess it does not *have* to be qemuarm, but last time I tried
it, it worked, that's why I was running qemuarm. I was also under the
impression that we are trying to support it.

If it's broken beyond repair though, it's fine by me.

>
> so what has been working for me all the time [and still works with a
> relatively recent gbmc checkout]
> - build for machine qeumux86-64
> - and run a console-only mode: runqemu qemux86-64 ext4
> qemuparams="-nographic"
>
>
>
> On Mon, Apr 17, 2017 at 5:25 PM, Maxim Sloyko <maxims@google.com> wrote:
>>
>> Hi all!
>>
>> I've ran into troubles when I was trying to run OpenBMC image in qemu.
>> It has been a while since I've done this, so I'm wondering if I'm
>> missing something.
>>
>> I build it with:
>>
>> export TEMPLATECONF=meta-phosphor/conf
>> source openbmc-env
>> MACHINE=qemuarm bitbase obmc-phosphor-image
>>
>> With v1.0-stable openbmc/openbmc branch I get this output:
>> http://pastebin.ca/3798183
>>
>> With the most recent version (master), I get very similar output,
>> except that the error is now:
>>
>> VNC server running on ::1:5900
>> vpb_sic_write: Bad register offset 0x2c
>>
>>
>> In both cases the terminal I run this from basically just hangs.
>>
>> Am I missing something here?
>>
>> Thanks!
>>
>> --
>> Maxim Sloyko
>
>



-- 
Maxim Sloyko
