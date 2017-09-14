Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::235; helo=mail-ua0-x235.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="rTb1J9Fe"; 
 dkim-atps=neutral
Received: from mail-ua0-x235.google.com (mail-ua0-x235.google.com
 [IPv6:2607:f8b0:400c:c08::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xtYlh4sgXzDrZh
 for <openbmc@lists.ozlabs.org>; Fri, 15 Sep 2017 08:55:28 +1000 (AEST)
Received: by mail-ua0-x235.google.com with SMTP id g47so432605uad.0
 for <openbmc@lists.ozlabs.org>; Thu, 14 Sep 2017 15:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=oNoLrPq1JQkO4OfKqHA4A8ZwaqZAkswkNEehmtjVW9E=;
 b=rTb1J9Fe/RTdvSIMZCaAV1IZotP5kKC65fkGCU26zxnKmnCRAixXsaeCzzdtLWzRhA
 t3g9Y1e0lnbKnrol1BtfX/Yb0VCJrpi1FNe9tgKSyB2Isn6Vmrwl4JIusEziDIChsVSX
 T0utDIeJXOTBVjGONj4z+9pnvW43nt56eqRjB8LlQ05UK01XCc8Sba8k28LZuJP9zpxN
 0NNXbuutNnMzCuNpEwp6vWTPHKN/xWwmY4gqOVRm+S/eN02thXHEJjFAByNf+axavkci
 GcpIqskb4l57mlEB84hpqe/WXSsA9ujNVWtimehxR6WIqHlWliqEVeFqNV/ebhWPk6T6
 yPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=oNoLrPq1JQkO4OfKqHA4A8ZwaqZAkswkNEehmtjVW9E=;
 b=XU3PlBzQBJogof7xOy204eet7Ips+tTEgQpzUDJn2ATzsAq+8LiL/wqU7cdX2tBzVi
 pnOoRD/n+sq7A11OjhNvF/GnHDjotI/nKCm21z+NAf18+9NUkpBrEtKQGePDYEflDVzF
 vKr0/jDM66b5ixHWC9wLwvFDe1xoXNqC94eN4/Xg6qvXVlKA/0QH21S+3AWOUI+OdF7V
 2WRkf6nYNPeSjIoSO2PXMccaXB5wOa2HuivkF3VfLQyGPEaDbob1dwIA6O8g29v9Xp4+
 As9kbs3L/jtwbHqifODwzGzE5fhNQl1ESJa1vbbNTNMU+XyoJSyscJwTXXtEfgalO+OS
 uxgQ==
X-Gm-Message-State: AHPjjUj7DuEPdcNeCgyKrTStwsZgbPy4xAaMuowbd0KJePgQRRirULH2
 HkmCW8llFsjunkYKYo/bHrfIB4R6x0UIN83GZ+nHnw==
X-Google-Smtp-Source: AOwi7QAjTzaxX3amP0U0NWt/pEc7dHeAFbGUkqE6195KvW1ZYzyTAqOK/QaehdOj4HOsBgM81vsbAbm3OqB+tteB3rY=
X-Received: by 10.159.61.111 with SMTP id m47mr20235799uai.33.1505429725808;
 Thu, 14 Sep 2017 15:55:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.178.18 with HTTP; Thu, 14 Sep 2017 15:55:05 -0700 (PDT)
In-Reply-To: <CAPLgG=kdYtNsT00uOvTxxN_sNYyvDKSofGgMJg7Mg3+U23cFLQ@mail.gmail.com>
References: <CAO=notyfYfT51+q_-8a7S5VrhJtuVbXaSav78mbCmGe6OnvjLA@mail.gmail.com>
 <CAPLgG=kdYtNsT00uOvTxxN_sNYyvDKSofGgMJg7Mg3+U23cFLQ@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 14 Sep 2017 15:55:05 -0700
Message-ID: <CAO=notwscz3VJ9Cb0j_--1hPg-6vp5i62Y7izxvzA0XSORRtOA@mail.gmail.com>
Subject: Re: GPIO Centralized Control Daemon
To: Rick Altherr <raltherr@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="f40304363e440acc6105592e2c38"
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
X-List-Received-Date: Thu, 14 Sep 2017 22:55:29 -0000

--f40304363e440acc6105592e2c38
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 14, 2017 at 3:29 PM, Rick Altherr <raltherr@google.com> wrote:

> When you do this, please use the gpio chardev interface instead of sysfs.
> Ask me for details if you aren't familiar.
>

I'm familiar with it.  I've heard they're phasing out sysfs gpio.


>
> On Thu, Sep 14, 2017 at 3:02 PM, Patrick Venture <venture@google.com>
> wrote:
>
>> I apologize if this already exists or is in the works.
>>
>> I propose we create a daemon that centralizes userspace GPIO access.
>>
>> From a high level, the daemon will implement interfaces to export or
>> unexport GPIOs.  Each GPIO exported will exist on the dbus:
>>
>> /xyz/openbmc_project/gpio/53 and implement an interface with the
>> following properties:
>> value, direction, active_low, etc.
>>
>> Some doubts, should the gpio name on the dbus be the relative name (53),
>> should it be the system specific name (G5) or the absolute name?  I'm
>> thinking the relative name and let the daemon handle internalizing the
>> adjustment from relative to absolute.
>>
>> I'm working on adding GPIO support within phosphor-hwmon so that I can
>> access a voltage sensor that's gated by a GPIO, and I know there have been
>> conversations and implementations of this for IPMI OEM -- and I think it
>> could easily be centralized.
>>
>> Thoughts?
>>
>> Patrick
>>
>
>

--f40304363e440acc6105592e2c38
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
hu, Sep 14, 2017 at 3:29 PM, Rick Altherr <span dir=3D"ltr">&lt;<a href=3D"=
mailto:raltherr@google.com" target=3D"_blank">raltherr@google.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">When you do=
 this, please use the gpio chardev interface instead of sysfs.=C2=A0 Ask me=
 for details if you aren&#39;t familiar.</div></blockquote><div><br></div><=
div>I&#39;m familiar with it.=C2=A0 I&#39;ve heard they&#39;re phasing out =
sysfs gpio.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div cla=
ss=3D"HOEnZb"><div class=3D"h5"><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Thu, Sep 14, 2017 at 3:02 PM, Patrick Venture <span dir=
=3D"ltr">&lt;<a href=3D"mailto:venture@google.com" target=3D"_blank">ventur=
e@google.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div d=
ir=3D"ltr">I apologize if this already exists or is in the works.<div><br><=
/div><div>I propose we create a daemon that centralizes userspace GPIO acce=
ss.</div><div><br></div><div>From a high level, the daemon will implement i=
nterfaces to export or unexport GPIOs.=C2=A0 Each GPIO exported will exist =
on the dbus:</div><div><br></div><div>/xyz/openbmc_project/gpio/53 and impl=
ement an interface with the following properties:</div><div>value, directio=
n, active_low, etc.</div><div><br></div><div>Some doubts, should the gpio n=
ame on the dbus be the relative name (53), should it be the system specific=
 name (G5) or the absolute name?=C2=A0 I&#39;m thinking the relative name a=
nd let the daemon handle internalizing the adjustment from relative to abso=
lute.</div><div><br></div><div>I&#39;m working on adding GPIO support withi=
n phosphor-hwmon so that I can access a voltage sensor that&#39;s gated by =
a GPIO, and I know there have been conversations and implementations of thi=
s for IPMI OEM -- and I think it could easily be centralized.</div><div><br=
></div><div>Thoughts?</div><span class=3D"m_-842711766489511149HOEnZb"><fon=
t color=3D"#888888"><div><br></div><div>Patrick</div></font></span></div>
</blockquote></div><br></div>
</div></div></blockquote></div><br></div></div>

--f40304363e440acc6105592e2c38--
