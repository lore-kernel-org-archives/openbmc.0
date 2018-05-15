Return-Path: <andresoportus@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c0b::236; helo=mail-it0-x236.google.com;
 envelope-from=andresoportus@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="blFCPUwF"; 
 dkim-atps=neutral
Received: from mail-it0-x236.google.com (mail-it0-x236.google.com
 [IPv6:2607:f8b0:4001:c0b::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40lQWT18ZmzF2xC
 for <openbmc@lists.ozlabs.org>; Tue, 15 May 2018 15:05:56 +1000 (AEST)
Received: by mail-it0-x236.google.com with SMTP id 144-v6so16071689iti.5
 for <openbmc@lists.ozlabs.org>; Mon, 14 May 2018 22:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0nGDnTT6C680Q5mBmFdouXj1mKRVAvRgOHs3lcB0T0A=;
 b=blFCPUwFImPOWAdM3CoQrAr50exDGcAfBWtroafz4ZHqD5VDacfAOYeQd3uO5tp8al
 jv9Gn9UYSV31rafj/lj6FPee4yqidwxyCKinF/6TlT6002jGqGa4Y1lIQdL8Hbho5HI0
 tyQJT4POsAmRutznvqcNX7wpJJcrhDWuId43A/DHvH0+oj7T+4bx5pYeVuJYZDD64pjI
 ZMmFb1KrDrPjLm32q3Rlg6jph5faVzQcJgGsq9UPurtBL2SCxL1NrboOAgf1JbIndkZJ
 nkmbBLDxUYIo/QaubJDlwGVKFZvKub17BEwh+0svYPkqvlkjGgcLFjmB+mXeKbF7Z4zL
 0uKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0nGDnTT6C680Q5mBmFdouXj1mKRVAvRgOHs3lcB0T0A=;
 b=h+U/iFVigYcdQBtZJbgHir8PVscFC70VtC7wRvdCGwsDJp5OHlotvG76nSIBH39YeJ
 q93YbZeJSphpGSEEOSKPlqz/HaiR86jd1bfpoDLZ4OEGvu7dhUDH6Gg9GeM0OO8bwWXu
 ckc+01VHy/sojgF9UQ02NI/QkkaYe0ffpsarZR5LOmNFVO5DKAtjzKX2VSEDQeRz0kfA
 rkQ0yTBRM64Aqb5Rs562iOl+ysTmjMYXQs8DKXpDZFJ05LvXud1oCSHksb8LMB68Eq5f
 voEIdhGQ1223P1c0iYwaprOg518/T/CeaEU34D+JtbzC94cUJdjwzHJm4NUG/zmyutnZ
 S2kQ==
X-Gm-Message-State: ALKqPwfxkrZp08F4dujjMA6Bc37ftQaS/OgdDoGv4Q9fABw2F+xV1OmW
 oCyQp6D1KKwS/4q/99nFyPqidejh3XS4rGQqnGt5MA==
X-Google-Smtp-Source: AB8JxZomz/wWQaIbddFWWE/AEYSWO1vcjIJNzAOZ4wenlbtzDGvtaDRUDUd7FMUpd01B6RvFUM7Sls5RS8PvvbbbctA=
X-Received: by 2002:a6b:9bcc:: with SMTP id
 d195-v6mr13681158ioe.15.1526360754153; 
 Mon, 14 May 2018 22:05:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAD5O4R24451=iRYh5M_Bokhj8wMAzPdGfj5XSzhU6CJ6cOqotA@mail.gmail.com>
 <1526339800.3484892.1372056960.17AECCFA@webmail.messagingengine.com>
 <CAD5O4R3f1u9Ptk0_rz12teQgmqNkucGpOWmU9EKNBmxdSYAMrg@mail.gmail.com>
 <CAARXrt=Pkddt03EVfwjZN9Qpp8No5LA5X6dqJ+MfU6_K+k-00Q@mail.gmail.com>
 <1526349203.3522551.1372178312.7B38A3F9@webmail.messagingengine.com>
 <CAARXrtkc86rh2WDbK9nAnfY0PPJS2BpSeQSJTLFf3Ccxzc3edQ@mail.gmail.com>
In-Reply-To: <CAARXrtkc86rh2WDbK9nAnfY0PPJS2BpSeQSJTLFf3Ccxzc3edQ@mail.gmail.com>
From: Andres Oportus <andresoportus@google.com>
Date: Mon, 14 May 2018 22:05:17 -0700
Message-ID: <CAD5O4R2j0E-5ROWW=4Zf4TzB428YOwraDvwcCvXJoLoaZ3SsBA@mail.gmail.com>
Subject: Re: Question on States monitoring
To: mine260309@gmail.com
Cc: andrew@aj.id.au, openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 15 May 2018 05:05:58 -0000

On Mon, May 14, 2018 at 6:57 PM Lei YU <mine260309@gmail.com> wrote:

> On Tue, May 15, 2018 at 9:53 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> > Hi Lei,
> >
> > On Tue, 15 May 2018, at 11:19, Lei YU wrote:
> >> Hi Andres,
> >>
> >> The existing [phosphor-gpio-monitor][1] contains two services, one is
for
> >> monitor gpio interrupts, the other is "phosphor-gpio-presence" that
checks a
> >> gpio output and let it be some state on DBus.
> >>
> >> I guess the "presence" service is what you are looking for, that maps a
> >> gpio output to a Dbus object.
> >>
> >> The existing use case is:
> >> 1. Witherspoon checks if power supply is connected and create dbus
object
> >>    /inventory/system/chassis/motherboard/powersupplyX, it also is able
to
> >>    bind the kernel driver when it is attached.
> >> 2. Zaius checks if a PCIE card is connected on E2B and create dbus
object
> >>    /inventory/system/chassis/pcie_card_e2b
> >>
> >> You can see a little detailed explanation at
> >>
https://github.com/mine260309/openbmc-intro/blob/master/Porting_Guide.md#gpio-presence
> >
Thanks for info.  It seems that since both monitor and presence are
subclasses from Evdev they, at least in their current form, need GPIOs to
be setup as input (in the examples use /dev/input devices) with a driver
like gpio-keys, is this the case?
