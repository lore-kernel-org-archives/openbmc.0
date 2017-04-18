Return-Path: <maxims@google.com>
Received: from mail-it0-x229.google.com (mail-it0-x229.google.com
 [IPv6:2607:f8b0:4001:c0b::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w6wd25Yg3zDq5b
 for <openbmc@lists.ozlabs.org>; Wed, 19 Apr 2017 05:47:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="AWixrvFK"; 
 dkim-atps=neutral
Received: by mail-it0-x229.google.com with SMTP id e132so1292774ite.1
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 12:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=S1RVRcFT6h34KgNs8Thzh+kK7C95CGQVLzqnFY00Gbw=;
 b=AWixrvFKfHxik3mb4ljuYInlfo3J8kALmO4eEF0bQhM2S/ZQv8+0frimNDqpnOwOU+
 6psGVpNy7kY/dEAW2ftN27nzSkxDXVi+u0KdPPrNNPkmyF33YPc9wHgIt5U8BUzuagAN
 6AqL92vaSw33Qv8PkDems9UD9rmuqut6HZ+zVVYVB0GEEKRwFqcutaXtaxw9Be3Qvh9x
 VDa/z00nm8mRB1sICa8Lxp5BTp5bfwLBo3ENYUxbLxpbiZddb4HBwSh2MOeyUbaOB6OY
 3RGCBhyyqrY6GroWqQSOnqwkBaVvzJmAlUE45XAm8tHCQnHZ5iAuyghIU7O3fIkmL0t+
 xOxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=S1RVRcFT6h34KgNs8Thzh+kK7C95CGQVLzqnFY00Gbw=;
 b=Ljup5iti8zB1HkJKvqJWR8eCVMT80ePE4lrin0o7oqFlkGXHWOiqV/DjDhnWmMjhHQ
 f8FXT8hK0zUze05oKfHKh+u/i7kkwmD1r8zkd+aGCIDHceQpG8YyqxNJPESmcfY9/CYV
 pBfWGbC2M619mdDqRbCuwfBgAPIJW2jeCD2jwVuuaGbDhGh1nEWJMWbaIzmVCmjM43ue
 9aEuCX5H/xjtVCkvuUUcxoVoMF35EFV80f5Ptzk/z9DY0INPBEsOJtlmBUQLbBQoQPMv
 PYLd7wXWGeUBlCi0YHDirrp2Wiaeh8foyeoUYp3uX03ZVlAj+u0wig3WqZg7kmgKyZ5B
 YRdw==
X-Gm-Message-State: AN3rC/6Re7Ei28CqoAUd1WY9w7qdpte9wHjDibM7GSxHWTDsDSd9j0tB
 XJdyDkiyuew734qKaDVJTV/lwaJivOsc
X-Received: by 10.36.82.144 with SMTP id d138mr16850219itb.24.1492544819142;
 Tue, 18 Apr 2017 12:46:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.185.7 with HTTP; Tue, 18 Apr 2017 12:46:58 -0700 (PDT)
In-Reply-To: <CAFR_W8rHQNgzV9Lu5scZYF2-zV5y0kjCJDQ5BY0RYirEhi=pwQ@mail.gmail.com>
References: <CAFR_W8rbMN1uSC8o+cF94D40KwSdJT1oOGYLMS90PWHHuAVsaQ@mail.gmail.com>
 <CANF=oU6TBUTjq6gyDUZ=TWWQ-h-M3Hzdii4iBbUPVvMx5qRpAA@mail.gmail.com>
 <CAFR_W8rHQNgzV9Lu5scZYF2-zV5y0kjCJDQ5BY0RYirEhi=pwQ@mail.gmail.com>
From: Maxim Sloyko <maxims@google.com>
Date: Tue, 18 Apr 2017 12:46:58 -0700
Message-ID: <CAFR_W8q2LeLYZQZd17sFYo=KztC_JOrnLbnD0H2-1VaoQkjYUA@mail.gmail.com>
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
X-List-Received-Date: Tue, 18 Apr 2017 19:47:03 -0000

On Tue, Apr 18, 2017 at 10:01 AM, Maxim Sloyko <maxims@google.com> wrote:
> On Mon, Apr 17, 2017 at 5:56 PM, Robi Buranyi <rburanyi@google.com> wrote:
>> why does it have to be qemuarm exactly? You can equally run qemux86(-64),
>> and shall see no difference in test results.
>
> Well, I guess it does not *have* to be qemuarm, but last time I tried
> it, it worked, that's why I was running qemuarm. I was also under the
> impression that we are trying to support it.
>
> If it's broken beyond repair though, it's fine by me.
>
>>
>> so what has been working for me all the time [and still works with a
>> relatively recent gbmc checkout]
>> - build for machine qeumux86-64
>> - and run a console-only mode: runqemu qemux86-64 ext4
>> qemuparams="-nographic"

OK, so it turns out the problem was not arm vs x86, the problem was
the lack of -nographic parameter.
qemuarm image booted OK with -nographic parameter.

>>
>>
>>
>> On Mon, Apr 17, 2017 at 5:25 PM, Maxim Sloyko <maxims@google.com> wrote:
>>>
>>> Hi all!
>>>
>>> I've ran into troubles when I was trying to run OpenBMC image in qemu.
>>> It has been a while since I've done this, so I'm wondering if I'm
>>> missing something.
>>>
>>> I build it with:
>>>
>>> export TEMPLATECONF=meta-phosphor/conf
>>> source openbmc-env
>>> MACHINE=qemuarm bitbase obmc-phosphor-image
>>>
>>> With v1.0-stable openbmc/openbmc branch I get this output:
>>> http://pastebin.ca/3798183
>>>
>>> With the most recent version (master), I get very similar output,
>>> except that the error is now:
>>>
>>> VNC server running on ::1:5900
>>> vpb_sic_write: Bad register offset 0x2c
>>>
>>>
>>> In both cases the terminal I run this from basically just hangs.
>>>
>>> Am I missing something here?
>>>
>>> Thanks!
>>>
>>> --
>>> Maxim Sloyko
>>
>>
>
>
>
> --
> Maxim Sloyko



-- 
Maxim Sloyko
