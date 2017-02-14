Return-Path: <raltherr@google.com>
Received: from mail-it0-x236.google.com (mail-it0-x236.google.com
 [IPv6:2607:f8b0:4001:c0b::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vMnv765fQzDq5x
 for <openbmc@lists.ozlabs.org>; Tue, 14 Feb 2017 14:28:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="nXqabOql"; 
 dkim-atps=neutral
Received: by mail-it0-x236.google.com with SMTP id c7so16450058itd.1
 for <openbmc@lists.ozlabs.org>; Mon, 13 Feb 2017 19:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=MQRhs4P+PsmEXSVA+9+JQnTjHtiMoNbjLUfCDyNU+nA=;
 b=nXqabOqlfVBpVQwO7/Sk8efJ39tOm1Py6CNZWOWf9bTY1cnA0VnnvfEGYpGNMuacdD
 OZzj5SkUICpIMnpXcxUYRsnDayil9tkrifdnpealQzH0jQSHui03DkTGUKr1E3zNrOVa
 aEESH3RF93pvw3SjwirPHIsdKTVPSwdy/61li5KQVAgXtRv0/7RX/IMu5qg3v4eQakAo
 lXsCArzyJ/j/WKz5nYhnIWcYHNKfKuq5UuuHcvmJHrWImrJ5YLe+JzjAV7ES57uCYM+d
 9gZ2ywJfuiiyl5w+xutABqYtA2pd10oyu+dMKatyDnBgpslDH3+0l+7BmQpRMZXpH/VA
 rryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=MQRhs4P+PsmEXSVA+9+JQnTjHtiMoNbjLUfCDyNU+nA=;
 b=Fa3w7dPn0zMeeTFOHd65bB03jU9Ynuiuc249cHCOXBoffoqWVWjjlQTYGpe0cIdDwp
 A8tFLrLLr++uliLibGijAEI7Hm81kIC1U0HMxBERtD9j5j/fMEDcgkAwtaZRtVehQ+Uk
 gP/eVtHwCIxHf4iwssqfNRxoKLX5L0vWCO5lxC3/xU8anJRE4X+HG85R+kK7KrKFczQA
 ez1ryljF0dZEV03wv1sIyRytK6Vc5mTY1CrDItP3w0uNi7Ecw95I/JUw1dRiv1pck8f1
 UuQ38cdBJ7zGNYp+KZxNMNB3iWeRgtBSx2g6Rzz4znaTRhLGIN+nCP5xmhjZuj/0jkli
 41Tw==
X-Gm-Message-State: AMke39lHQ0prCZ+myfORTzUFWg7ueX+ur6dVwyw2YJmRxTjtS249wHB+RI0ew1vZg/Ejnkhmy4MzkTBYPwugVQo4
X-Received: by 10.36.64.70 with SMTP id n67mr1561192ita.21.1487042912763; Mon,
 13 Feb 2017 19:28:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.133.226 with HTTP; Mon, 13 Feb 2017 19:28:32 -0800 (PST)
Received: by 10.64.133.226 with HTTP; Mon, 13 Feb 2017 19:28:32 -0800 (PST)
In-Reply-To: <CACPK8XcTyap7kRPzd5MUYsbzFsrD7i97XDk4NBeM0pwfr6uE4g@mail.gmail.com>
References: <CACPK8XcTyap7kRPzd5MUYsbzFsrD7i97XDk4NBeM0pwfr6uE4g@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Mon, 13 Feb 2017 19:28:32 -0800
Message-ID: <CAPLgG==CENXhFJAw-_hJ_Y2CWN4OT0kUdNdv5dVVyMyUhqo5zw@mail.gmail.com>
Subject: Re: Booting FIT kernels
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a1135a57a952bd30548752889
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
X-List-Received-Date: Tue, 14 Feb 2017 03:28:36 -0000

--001a1135a57a952bd30548752889
Content-Type: text/plain; charset=UTF-8

Note that OpenBMC's Yocto builds put the .its used by the build system in
the deploy folder.

On Feb 13, 2017 7:06 PM, "Joel Stanley" <joel@jms.id.au> wrote:

> Hello,
>
> I've switched my kernel development workflow to use a FIT image
> containing the machine's dtb, initramfs and kenrel. By copying this
> over with tftp and booting it, I can test my changes with a real
> openbmc rootfs, but the changes go away once someone else reboots.
>
> This example uses witherspoon. Put the files in the root of your
> kernel object tree.
>
> 1. Download obmc-phosphor-initramfs-witherspoon.cpio.lzma[1]
> 2. Download http://ozlabs.org/~joel/openbmc.its
> 3. Build your kernel with `make`
> 4. Build your fit with `mkimgage -f openbmc.its myimage`
>
> You now have a FIT image called myimage. Copy it across to your tftp
> server and on a u-boot prompt as follows:
>
> ast > setenv serverip <tftp server>
> ast > tftp 0x83000000 myimage
> ast > bootm 0x83000000
>
> And off it goes! The magic was mostly working out where to find the
> .its file. In the future we could include this in the kernel tree and
> have a makefile rule that does the FIT-ing for us.
>
> Cheers,
>
> Joel
>
> [1] https://openpower.xyz/job/openbmc-build/distro=ubuntu,
> target=witherspoon/lastSuccessfulBuild/artifact/images/witherspoon/
>

--001a1135a57a952bd30548752889
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Note that OpenBMC&#39;s Yocto builds put the .its used by=
 the build system in the deploy folder.</div><div class=3D"gmail_extra"><br=
><div class=3D"gmail_quote">On Feb 13, 2017 7:06 PM, &quot;Joel Stanley&quo=
t; &lt;<a href=3D"mailto:joel@jms.id.au">joel@jms.id.au</a>&gt; wrote:<br t=
ype=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello,<br>
<br>
I&#39;ve switched my kernel development workflow to use a FIT image<br>
containing the machine&#39;s dtb, initramfs and kenrel. By copying this<br>
over with tftp and booting it, I can test my changes with a real<br>
openbmc rootfs, but the changes go away once someone else reboots.<br>
<br>
This example uses witherspoon. Put the files in the root of your<br>
kernel object tree.<br>
<br>
1. Download obmc-phosphor-initramfs-<wbr>witherspoon.cpio.lzma[1]<br>
2. Download <a href=3D"http://ozlabs.org/~joel/openbmc.its" rel=3D"noreferr=
er" target=3D"_blank">http://ozlabs.org/~joel/<wbr>openbmc.its</a><br>
3. Build your kernel with `make`<br>
4. Build your fit with `mkimgage -f openbmc.its myimage`<br>
<br>
You now have a FIT image called myimage. Copy it across to your tftp<br>
server and on a u-boot prompt as follows:<br>
<br>
ast &gt; setenv serverip &lt;tftp server&gt;<br>
ast &gt; tftp 0x83000000 myimage<br>
ast &gt; bootm 0x83000000<br>
<br>
And off it goes! The magic was mostly working out where to find the<br>
.its file. In the future we could include this in the kernel tree and<br>
have a makefile rule that does the FIT-ing for us.<br>
<br>
Cheers,<br>
<br>
Joel<br>
<br>
[1] <a href=3D"https://openpower.xyz/job/openbmc-build/distro=3Dubuntu,targ=
et=3Dwitherspoon/lastSuccessfulBuild/artifact/images/witherspoon/" rel=3D"n=
oreferrer" target=3D"_blank">https://openpower.xyz/job/<wbr>openbmc-build/d=
istro=3Dubuntu,<wbr>target=3Dwitherspoon/<wbr>lastSuccessfulBuild/artifact/=
<wbr>images/witherspoon/</a><br>
</blockquote></div></div>

--001a1135a57a952bd30548752889--
