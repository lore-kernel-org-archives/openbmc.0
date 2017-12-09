Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::229; helo=mail-lf0-x229.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BDNuD98P"; 
 dkim-atps=neutral
Received: from mail-lf0-x229.google.com (mail-lf0-x229.google.com
 [IPv6:2a00:1450:4010:c07::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ytrTW3mWXzDrV1
 for <openbmc@lists.ozlabs.org>; Sat,  9 Dec 2017 11:59:27 +1100 (AEDT)
Received: by mail-lf0-x229.google.com with SMTP id f20so13584327lfe.3
 for <openbmc@lists.ozlabs.org>; Fri, 08 Dec 2017 16:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=I+kp59oYfh8ELYktu5EKFPDBuvidKhL/X164VwG62nE=;
 b=BDNuD98PhhrqgmFV3fLJ83FvFcCKV7DsW9SDGh8dC/8XK/QtBHovEaInXanrVemLX2
 Zf4cYAr50Ik013eEB9ShES94+7R6f9Fgf7V3QZB550BvJmwzZGZFoEKhJ5dczuDIP8sl
 ikRzOMtcu6fy0mHL8Zb94rJedAcTGU03Jk/0bxbGEWxhTMTSxgnv3gnxEtYOGB77fEAl
 0LIMasekFRpk83kX7egHi+bYkSyQQv2pu6IkTVbQOWMHA4+r+H+/3RjRsTgmXUAya6jx
 iMvqbPx9iHB5Fo7FSkhTnE66hYVpo/YjyENfRtGwye0ddRknI9Ni9NZANhnFS0MJ7kVE
 ig7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=I+kp59oYfh8ELYktu5EKFPDBuvidKhL/X164VwG62nE=;
 b=oEvSDGGVfxU0cYq1CX7y4TGUrIOe5eTzKkX1sYqgskKVhIu66sN7PpbPVu4W3XNZYR
 txw/e8aUivLoJB02KvHse1xgWH5v6HiUpoLvtGwBobKkIVC3N3FamblkloO4RDjHrT3R
 GylncE6JE/O/3+uZbmqRoVMs1cMQ37CKqaWLQZHKlw6U6/Rxx+5fqaSBUQCWCRwvPmCJ
 yrh4GJNKgR14+YuPqX66cjU6rRn1Lw1CkIO6U8pS7ZEdHtRuWQByBJuvLoA4RtTAlShF
 7b2jsDwhGygMA3H5aHyR38UToVOzl4tiryR9exVJojq0tqUWSsY2jNcr+1Dm2hCJyYBY
 Zscg==
X-Gm-Message-State: AJaThX5UbBmAp5IrJmvIkHveLNHMFEkjjigyZS4vYxC2DGlnushuVGCz
 TWgUgwdwS7waVigPksmeZ3rrZ95Y19Oxj7N8Uls=
X-Google-Smtp-Source: AGs4zMbEHApq+qAw0QNDhKvUeC+lg0l2PZS4zT+2dXQKGtrOEgH4AjqTgvubbpoSyzJRjAtUG0sRzEOmC9vel+6Cm14=
X-Received: by 10.25.168.140 with SMTP id r134mr14248466lfe.65.1512781163138; 
 Fri, 08 Dec 2017 16:59:23 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.21.72 with HTTP; Fri, 8 Dec 2017 16:59:01 -0800 (PST)
In-Reply-To: <CAO=notw0w2TBPmsFfnh6UvEV6=HC87UZ9msaDQb4GKF8FT_P3A@mail.gmail.com>
References: <20171120185445.146061-1-venture@google.com>
 <CAO=notwF3acqwMHeuQyp4rUQwN6K0oj_py46-feMf3hoRydLyA@mail.gmail.com>
 <CACPK8Xet_aaCf3StQKwzXGTd1Oi0A=P-i1QU7faCuxOFb3ktxw@mail.gmail.com>
 <CAO=notwPBvHSvHgnQCycajUyJ-13sa+TrXYxmzKc5SL-V+8_-Q@mail.gmail.com>
 <CACPK8XeRxVvn1ZUM+WDWF5td6edBwWrdsxm7Ozn78FcJf8E1vQ@mail.gmail.com>
 <CAO=notw0w2TBPmsFfnh6UvEV6=HC87UZ9msaDQb4GKF8FT_P3A@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Sat, 9 Dec 2017 11:29:01 +1030
X-Google-Sender-Auth: Az8YphvYI4BjOp-g7BOcZyI76jE
Message-ID: <CACPK8XccwSp5QMOY_OORFc2j7c1EGV5DnH4=Fb1MHgc9cqtrGQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: gpio controller register
 range
To: Patrick Venture <venture@google.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, Jeremy Kerr <jk@ozlabs.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Sat, 09 Dec 2017 00:59:28 -0000

On Sat, Dec 9, 2017 at 3:40 AM, Patrick Venture <venture@google.com> wrote:

>
> Thanks,
> Patrick
>
> On Thu, Dec 7, 2017 at 10:30 PM, Joel Stanley <joel@jms.id.au> wrote:
>> On Fri, Dec 1, 2017 at 2:05 AM, Patrick Venture <venture@google.com> wrote:
>>> On Wed, Nov 29, 2017 at 7:53 PM, Joel Stanley <joel@jms.id.au> wrote:
>>> I'd actually appreciate hearing some thoughts at this point on which
>>> way to go, since merging the serial handling into the main driver will
>>> require re-working a few things -- I'd rather take the extra time to
>>> handle that merge if it's going to head in that direction anyway.
>>>
>>> I have read through the gpio-aspeed driver before, as it was a bit
>>> useful as a guide, and I could see it getting a bit cluttered with
>>> also handling the serial gpios.
>>
>> It sounds like a call that could go either way. If you think it would
>> be easier to maintain two separate drivers then we can go that
>> direction.
>>
>> I'd suggest discussing it upstream.
>>
>> The best way to discuss it would be in the form of a patch. Even if
>> it's not complete, post it as a RFC.
>
> Thanks for the feedback.  I'm still working on getting a few kinks
> worked out in the driver, for instance, verifying that waiting on the
> rising edge for the J1 gpio (on the ast2400) is required for stable
> writing -- which has been true.  We were actually seeing the serial
> gpios wedge to a specific value on the quanta-q71l board, but having
> it wait on that prevents this case... so more work is going into
> verifying behaviors and caveats.  I'm without a motherboard that has
> serial gpios and the ast2500 for testing...

This is a good example of where sending a RFC is the right thing to do
- it doesn't matter that the code isn't functioning, but it will allow
review of the structure.

I encourage you to send it out as you have it now.

Cheers,

Joel
