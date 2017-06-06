Return-Path: <raltherr@google.com>
Received: from mail-wr0-x232.google.com (mail-wr0-x232.google.com
 [IPv6:2a00:1450:400c:c0c::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3whyPb6cZ8zDqGr
 for <openbmc@lists.ozlabs.org>; Wed,  7 Jun 2017 02:51:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="phw4vzyG"; 
 dkim-atps=neutral
Received: by mail-wr0-x232.google.com with SMTP id q97so56727398wrb.2
 for <openbmc@lists.ozlabs.org>; Tue, 06 Jun 2017 09:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Uma+ZU4mWQ4xEVSHnrBk3N5h6Qps7a6pfgUZ2w226gc=;
 b=phw4vzyG/728Dnu4dF5yRnXe1Favpq/8ufJNQCDjYgdr7J2th37W0qFN8GixBu/Y6u
 wwgJKXGf1QyB96m2K9Z/NFzN2DsU3JUDcIA2PZ0J5TY3LIuuaQRy2q3b+yBtihyoDn+i
 2wzP3qq8O6LKxKR8L1V0ntO4QMcPLjE/BxrG5sqUr+LbxD3h1Kg0MaIW37xXEpVll6JA
 Ne9aLKr1sQL1fTsjgIcy7OX7xpgYeAPcejMKhDFGwqepYRzh8huqVrHFPWdR3abhwm0d
 Xddg77LWy71rkkNYCjfZobk0jeKnBgqrgMBy59BnwO4d+oFIrN3/UPJLkVblpkqqhEej
 mzhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Uma+ZU4mWQ4xEVSHnrBk3N5h6Qps7a6pfgUZ2w226gc=;
 b=R+bp66RjUVIFC13TYFxsEKXCYXyegU4ww8dyqnz92USUp1jI5eJYcRRyvYD7tMxyzZ
 fNaV6qltCjylKzWBGvceliyEWne7GMw/iYHqveuXo7NOoQo6g+VrmL9qU870ZfjBQ1Dh
 NWOjxPPAr+S4+Bh4lPh5ix+ZnWzEufyXe4ATlxgl56NZJO37cs67fOw/Pc/s4Iy/Qym/
 t/L7OST8YWV/hC3248MuOt7dX5ciRd35MSNQJDgHzpZrJRsTnJPfcoj3qPVUas39zTfC
 ZePVdMmTr6DJKnUY2A4puCzCQnumyCwyKJAhX33sk4fFEL2nPqlb97V7B+lqgYv19P/T
 IWuw==
X-Gm-Message-State: AODbwcA9fMHNpe3wOrOUCTIKEoo03Qs28JgUJ6sEkZE4V+WR3Q1Cxv7X
 Ga/fR9L0EENskdfKqYh90/7O8wixH/9C
X-Received: by 10.223.139.89 with SMTP id v25mr12411070wra.132.1496767872054; 
 Tue, 06 Jun 2017 09:51:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.217.7 with HTTP; Tue, 6 Jun 2017 09:51:11 -0700 (PDT)
In-Reply-To: <CAK8P3a0BLCL8s+-iWut=himPsVUL==+jqzhDP92+NOPXEMsoNg@mail.gmail.com>
References: <20170602215322.24376-1-rlippert@google.com>
 <CACPK8XfWySi5kDEASVpmDKAmBSByB6w0ocQxinazqTHbv+omcQ@mail.gmail.com>
 <CAFRv3wxh-+KiaLfD7zc4+FeiUOn4AyvJtcRLshiPQfpNb8uk4g@mail.gmail.com>
 <CACPK8XfKmm9ZUesgNJsL=MeruOfLzi-j6Dfjb2Be1zfdYn7XcQ@mail.gmail.com>
 <CAK8P3a0BLCL8s+-iWut=himPsVUL==+jqzhDP92+NOPXEMsoNg@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Tue, 6 Jun 2017 09:51:11 -0700
Message-ID: <CAPLgG=mYiODs6KAjdJV3dZBXrdR=OWsFwdEJ9jT+5-_CC9_pYA@mail.gmail.com>
Subject: Re: [PATCH] drivers/misc: add Aspeed LPC snoop driver
To: Arnd Bergmann <arnd@arndb.de>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Robert Lippert <roblip@gmail.com>, Greg KH <gregkh@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="f403045e9be253ccc205514d6da8"
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
X-List-Received-Date: Tue, 06 Jun 2017 16:51:16 -0000

--f403045e9be253ccc205514d6da8
Content-Type: text/plain; charset="UTF-8"

I expect Nuvoton to be sending upstream support for their BMC SoCs later
this year.  LPC is slowly being replaced by eSPI so, even though I expect a
few more companies to introduce BMC SoCs in the next few years, I don't
expect a huge increase in the number of LPC slave drivers.

On Tue, Jun 6, 2017 at 1:07 AM, Arnd Bergmann <arnd@arndb.de> wrote:

> On Tue, Jun 6, 2017 at 4:16 AM, Joel Stanley <joel@jms.id.au> wrote:
> > On Tue, Jun 6, 2017 at 5:16 AM, Rob Lippert <rlippert@google.com> wrote:
> >> On Sun, Jun 4, 2017 at 8:25 PM, Joel Stanley <joel@jms.id.au> wrote:
> >
> > Yeah, get_maintainers.pl only suggested lkml. cc lkml I think.
> >
> > I'm not sure if we want to put these drivers in misc, or if we want to
> > use something like drivers/soc/aspeed.
> >
> > Arnd, Greg, do you have any suggestions here?
>
> I think the main question is whether there are going to be other drivers
> like this one. Are there any other BMCs that still survive on the market
> with an LPC slave port? The only other ones I have seen were the
> old Broadcom one (apparently discontinued when Broadcom acquired
> the Emulex BMC line) and those Emulex BMCs (now part of ASpeed,
> presumably merged with the other product line) and some obscure
> Nuvoton product I could not find out much about.
>
> If we do expect more drivers like this, I'd put it into a new drivers/lpc
> directory (which we might use for both slave and master drivers,
> at least one master driver is pending merge), otherwise drivers/bus/
> or drivers/soc/ would be better.
>
> Between the last two, I'm not sure, since this still doesn't fit perfectly
> in one or the other, but both would work.
>
>         Arnd
>

--f403045e9be253ccc205514d6da8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I expect Nuvoton to be sending upstream support for their =
BMC SoCs later this year.=C2=A0 LPC is slowly being replaced by eSPI so, ev=
en though I expect a few more companies to introduce BMC SoCs in the next f=
ew years, I don&#39;t expect a huge increase in the number of LPC slave dri=
vers.</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue=
, Jun 6, 2017 at 1:07 AM, Arnd Bergmann <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:arnd@arndb.de" target=3D"_blank">arnd@arndb.de</a>&gt;</span> wrote:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><span class=3D"">On Tue, Jun 6, 2017 at 4:=
16 AM, Joel Stanley &lt;<a href=3D"mailto:joel@jms.id.au">joel@jms.id.au</a=
>&gt; wrote:<br>
&gt; On Tue, Jun 6, 2017 at 5:16 AM, Rob Lippert &lt;<a href=3D"mailto:rlip=
pert@google.com">rlippert@google.com</a>&gt; wrote:<br>
&gt;&gt; On Sun, Jun 4, 2017 at 8:25 PM, Joel Stanley &lt;<a href=3D"mailto=
:joel@jms.id.au">joel@jms.id.au</a>&gt; wrote:<br>
&gt;<br>
</span><span class=3D"">&gt; Yeah, <a href=3D"http://get_maintainers.pl" re=
l=3D"noreferrer" target=3D"_blank">get_maintainers.pl</a> only suggested lk=
ml. cc lkml I think.<br>
&gt;<br>
&gt; I&#39;m not sure if we want to put these drivers in misc, or if we wan=
t to<br>
&gt; use something like drivers/soc/aspeed.<br>
&gt;<br>
&gt; Arnd, Greg, do you have any suggestions here?<br>
<br>
</span>I think the main question is whether there are going to be other dri=
vers<br>
like this one. Are there any other BMCs that still survive on the market<br=
>
with an LPC slave port? The only other ones I have seen were the<br>
old Broadcom one (apparently discontinued when Broadcom acquired<br>
the Emulex BMC line) and those Emulex BMCs (now part of ASpeed,<br>
presumably merged with the other product line) and some obscure<br>
Nuvoton product I could not find out much about.<br>
<br>
If we do expect more drivers like this, I&#39;d put it into a new drivers/l=
pc<br>
directory (which we might use for both slave and master drivers,<br>
at least one master driver is pending merge), otherwise drivers/bus/<br>
or drivers/soc/ would be better.<br>
<br>
Between the last two, I&#39;m not sure, since this still doesn&#39;t fit pe=
rfectly<br>
in one or the other, but both would work.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Arnd<br>
</font></span></blockquote></div><br></div>

--f403045e9be253ccc205514d6da8--
