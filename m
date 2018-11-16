Return-Path: <osk@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::341; helo=mail-wm1-x341.google.com;
 envelope-from=osk@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Frx6Y9NA"; 
 dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42xW3f0dvzzF3mm
 for <openbmc@lists.ozlabs.org>; Sat, 17 Nov 2018 08:05:49 +1100 (AEDT)
Received: by mail-wm1-x341.google.com with SMTP id u13-v6so22305627wmc.4
 for <openbmc@lists.ozlabs.org>; Fri, 16 Nov 2018 13:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=82Kq4JiPvcb/rGkOD4eazMZFlrvVIyQ/BB/CyQGr0Y8=;
 b=Frx6Y9NANmAiQUKJsRSsPSF2uJMmX22MFZC/epphMQT0wdalZ1cj1DvcELnv/k3/3m
 k7Ab1Pz6nuBXFFRgCD4z0nvCXLZQIfr1gmr212yOqZDucRTB/+3SyUobqmrONWP++KGr
 AhprgXzNb9N8r+QBiJdMlaxOO4WZkTzYnCS+pOKtJd+NRuMQqA25dbhA4Sk32s45eyh3
 KRKyG5Xg+uMqqrw2zU+ENrLWip3wjzM248OsuG9KAGbcVbYleafhn+cQz2LbbkxeARdj
 0/REsG34Ho5l6o1NwDBSPgjgmzVIdf5orV4wh4kYjm5CuJiGgEpRopltnIi/fCVFZq5m
 aoag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=82Kq4JiPvcb/rGkOD4eazMZFlrvVIyQ/BB/CyQGr0Y8=;
 b=tOBhVwUF89K5tJj9yXEZHxrR8N9wZlTQyC8HknPivY5mCpYqHK46LmIoLvCTAO/6Q/
 lWTd+ejvab47IHO7AAcoP1ELOOiZzWF27Lor/Fao8Y2JX0i/5dOH5xVRbguj035oH7K8
 4dYPXFrfwlhRETPG8xkADlcQDWRPqQrPrwzh2M5n8JPIIzL/RWPw3w0hBwzfnlZ++u/z
 aya5/IxX9T+c0/a6DIGJuG00LvE0hi/QihuYYaoxlVtXwWSQnjahp2ZPuVsNpPaIbgi4
 +SxXZzYJEEEAm7HBtAp8ah4Mf2YEEH/kCJvEt8EccCjsUDbJYQHTd4K2EGZTPKeRcM9H
 NCpQ==
X-Gm-Message-State: AGRZ1gJqdAM3Qx/8XgT64h/3t+SBnhlX17oJohf5YI1bWYJlWG2Vl6tC
 yCORF1MKRT2+peANzii8kbOiD3UYzIlK7FWHr2d4TQ==
X-Google-Smtp-Source: AJdET5e7paY2rOwOeC7c2XefOGokLRTexFowRDaDYSWgxqGP/0yU3qN446n7sb8V3eliZHJ5yW4MthV9p5inJTR+o3g=
X-Received: by 2002:a1c:3a8d:: with SMTP id
 h135-v6mr9975933wma.92.1542402345501; 
 Fri, 16 Nov 2018 13:05:45 -0800 (PST)
MIME-Version: 1.0
References: <CABoTLcSpcTKHJu5xwWx4TQr1_5FjLvb9QsOAYQhCfMaQwQ5qug@mail.gmail.com>
 <a5ae8d37-1f43-ed48-382b-fc5286b46ff5@andrewnesbit.org>
In-Reply-To: <a5ae8d37-1f43-ed48-382b-fc5286b46ff5@andrewnesbit.org>
From: Oskar Senft <osk@google.com>
Date: Fri, 16 Nov 2018 16:05:33 -0500
Message-ID: <CABoTLcS7wiAUcdz8spfOgCjsZR_TTRCQeNz6VVVPYR+Txj1jsA@mail.gmail.com>
Subject: Re: Submit board schematics to OpenBMC docs repo
To: ullbeking@andrewnesbit.org
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, bradleyb@fuzziesquirrel.com, 
 gmills@linux.vnet.ibm.com
Content-Type: multipart/alternative; boundary="000000000000e7fa99057ace87b8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Nov 2018 21:05:51 -0000

--000000000000e7fa99057ace87b8
Content-Type: text/plain; charset="UTF-8"

Hi Andrew

There are a number of specifics on both the Linux kernel and in user space
code that are much easier to implement by having access to the board
schematics. Some examples:

   - What devices are connected to which I2C bus?
   - Which fan headers are connected to which PWM and TACH signals?
   - ...

By having the vendor publish this information, it can used by anyone to
create the necessary files and changes without having to deal with legal
implications of using unpublished information. Does that make sense?

Thanks
Oskar.

On Fri, Nov 16, 2018 at 3:10 PM Andrew Luke Nesbit <
ullbeking@andrewnesbit.org> wrote:

> Dear Oskar,
>
> This sounds great.  But I have a feeling I'm sure I'm misunderstanding
> something important.
>
> On 16/11/2018 19:58, Oskar Senft wrote:
>
> > They offered to post the relevant
> > schematics to OpenBMC so that we (and others) can officially use the
> > information to adapt OpenBMC.
>
> Please could you explain what this means exactly?  Thank you!!
>
> Kind regards,
>
> Andrew
> --
> OpenPGP key: EB28 0338 28B7 19DA DAB0  B193 D21D 996E 883B E5B9
>

--000000000000e7fa99057ace87b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Andrew<div><br></div><div>There are a number of specifi=
cs on both the Linux kernel and in user space code that are much easier to =
implement by having access to the board schematics. Some examples:</div><di=
v><ul><li>What devices are connected to which I2C bus?</li><li>Which fan he=
aders are connected to which PWM and TACH signals?</li><li>...</li></ul><di=
v>By having the vendor publish this information, it can used by anyone to c=
reate the necessary files and changes without having to deal with legal imp=
lications of using unpublished information. Does that make sense?</div></di=
v><div><br></div><div>Thanks</div><div>Oskar.</div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr">On Fri, Nov 16, 2018 at 3:10 PM Andrew Luke N=
esbit &lt;<a href=3D"mailto:ullbeking@andrewnesbit.org">ullbeking@andrewnes=
bit.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Dear Oskar,<=
br>
<br>
This sounds great.=C2=A0 But I have a feeling I&#39;m sure I&#39;m misunder=
standing<br>
something important.<br>
<br>
On 16/11/2018 19:58, Oskar Senft wrote:<br>
<br>
&gt; They offered to post the relevant<br>
&gt; schematics to OpenBMC so that we (and others) can officially use the<b=
r>
&gt; information to adapt OpenBMC.<br>
<br>
Please could you explain what this means exactly?=C2=A0 Thank you!!<br>
<br>
Kind regards,<br>
<br>
Andrew<br>
-- <br>
OpenPGP key: EB28 0338 28B7 19DA DAB0=C2=A0 B193 D21D 996E 883B E5B9<br>
</blockquote></div>

--000000000000e7fa99057ace87b8--
