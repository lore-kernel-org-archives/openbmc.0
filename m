Return-Path: <yuenn@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::e2f; helo=mail-vs1-xe2f.google.com;
 envelope-from=yuenn@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="jca/XwVI"; 
 dkim-atps=neutral
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43gXfc1HxWzDqnG
 for <openbmc@lists.ozlabs.org>; Fri, 18 Jan 2019 05:29:27 +1100 (AEDT)
Received: by mail-vs1-xe2f.google.com with SMTP id b74so6815711vsd.9
 for <openbmc@lists.ozlabs.org>; Thu, 17 Jan 2019 10:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u8vwEVYX21o8BhcbGMsSba8PrSQiLTTVcQMeizyw3vc=;
 b=jca/XwVIF1VLe4/D6tbgrLyV0su1oCZLD5vb3hDpA+TY/ARks787scrB5prYU5KcSs
 DScKBwj5YMNy1130Op/oaCKyN+kOtdrj38TzD/z/jSLYU//5AzL/qQ5sSm7q53LWF+bM
 AON4JNQL43GKsHZDm6piwiU6mK+yTb5Bf9knLGct6jFQ40KjFjGcugl3dO9WVnALv/ly
 /1iWbiMkAX+mFysSbpMXhqBRm6aVSpCxj2L3qptrcRXgnhW+ShRW/JrhQ4JifZK058db
 DIFukcWvpSdnM1x48Stt9h5rRGFQ5q9SdaLoUUjeOYcCmNw6986dz2cTDMy6/uNFBPEK
 HzBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u8vwEVYX21o8BhcbGMsSba8PrSQiLTTVcQMeizyw3vc=;
 b=Fuf7boxKShW28fvzPosijWTJB6JEr5T1nn6S4N/VJIMGjZQzmvBRc7NpWhSpRr1tmy
 C+bXtZVxH5aUhg+DWtQUexKQr3J1r8o6ncsJ9t1K8/0y1IBhIIfFJlpdyH/QwpLarlVS
 KGa/TXItuVZO7ieiYl82wDauURtp6boV0ZDn/yC8c8ngwhldHM7l9pGVcs10h2pmnvSZ
 0Zqtgvi0dVQ8XR1itmEilby6wFxczZjifeojw5im/T/rYO9yAnX4GMJfwWCIRTszHrBb
 3/mjH3EfM3Bjg1evA8qtXoK9G7mfcHVPhEl0D7+41cs2mWmZ7Pv7feDyPeOHFEW7emf2
 CAbw==
X-Gm-Message-State: AJcUukc3N9mvaAJ4zofUrq6inaGnS+qBVlzzKgamtNvANgUzbowhxf2/
 vpKatrVG7KWP9cnATy4cXydhQbkaPLZOV4zQF6w7ww==
X-Google-Smtp-Source: ALg8bN57cMHGsz/x1Ktj+j7zNzLdFPwxZrVJeHGkmOSGJZ6bS3aepvhM5J9ECBlsUGhW/r6Mv/YH3WI2RzaWW8ZByyk=
X-Received: by 2002:a67:da93:: with SMTP id w19mr6383499vsj.144.1547749764847; 
 Thu, 17 Jan 2019 10:29:24 -0800 (PST)
MIME-Version: 1.0
References: <SN6PR02MB5693D3A8387A48C7453FEC0796830@SN6PR02MB5693.namprd02.prod.outlook.com>
 <CAHkHK08_MujVhwv2SaPfNPn+bS36a3uLEWjfvYU+CkFFE_2j4Q@mail.gmail.com>
In-Reply-To: <CAHkHK08_MujVhwv2SaPfNPn+bS36a3uLEWjfvYU+CkFFE_2j4Q@mail.gmail.com>
From: Nancy Yuen <yuenn@google.com>
Date: Thu, 17 Jan 2019 10:28:48 -0800
Message-ID: <CADfYTpE2fxL7KNZp7AvW9wh2hzHp9wHzXORLRg8jnj-6_BcbPA@mail.gmail.com>
Subject: Re: couple questions for OpenBMC
To: John Wang <wangzqbj@inspur.com>
Cc: Brenden Lai <Brenden_Lai@jabil.com>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000efcc70057fab92da"
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
X-List-Received-Date: Thu, 17 Jan 2019 18:29:29 -0000

--000000000000efcc70057fab92da
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 17, 2019 at 2:34 AM John Wang <wangzqbj@inspur.com> wrote:

> On Thu, Jan 17, 2019 at 3:52 PM Brenden Lai <Brenden_Lai@jabil.com> wrote:
> >
> > Hi
> >
> > I have couple questions about OpenBMC .
>
> >
> > 1.if I decide use OpenBMC solution , Does it mean I should put all BMC
> source code on github including some commercial software  ?

I don't know what you mean by commercial software.  In OpenBMC we strive to
use open source software.

To build OpenBMC you only need to check out one repo
github.com/openbmc/openbmc and invoke the bitbake commands to build for a
supported platform.  The repo page has build instructions on it  The
recipes in openbmc/openbmc will download the necessary package sources from
other online sources and invoke the build commands for each of those
packages.  The downloaded packages are cached locally.  It's also possible
to create a local mirror of downloaded packages for your team to use.



>
> >
> >
> > 2.Are there any tutorial or /document  for using dbus within OpenBMC ?
> please refer to this link [https://github.com/openbmc/sdbusplus] for
> documentation and examples.
> or you can use busctrl to find out it.
>
> example:
>     busctl tree xyz.openbmc_project.LED.GroupManager
>     busctl introspect   xyz.openbmc_project.LED.GroupManager
> /xyz/openbmc_project/led/groups/enclosure_fault
>
> > 3.Why there is no release note after V1.05 ?  Will the coming release
> attach release note ?
>

The tags you see are just random tags points, not a coordinated release.
We are in the middle of testing the 2.6 official release at the moment.  It
will be done early February and it will contain release notes.  You can
search this mailing list for release activities and also the meeting
minutes from the release planning workgroup are here
<https://github.com/openbmc/openbmc/wiki/Release-Planning>.


> >
> >
> > 4.I know openBMC is using some file text to represent  device (LED ,
> sensor)
>
> Linux uses device tree to describe the hardware component,you can
> refer to https://elinux.org/Device_Tree_Usage
> This link[https://github.com/openbmc/docs/blob/master/LED-architecture.md]
> tells you how openbmc controls led.
>
> Can be roughly described:
>           phosphor-led-manager(strategy) -->
> phosphor-led->sysfs(action)  --> linux led subsystem
>
>  linux led subsystem :
>
> https://github.com/openbmc/linux/blob/dev-4.19/Documentation/leds/leds-class.txt
>
> >but I am curious about how this files bind to real device ?
> >    Where is the low level operation relate code ?
>
>
> https://github.com/openbmc/phosphor-led-sysfs/blob/e0844ff447abad01fa6f902caab3839336d1518d/physical.cpp#L131
>
> >
> >
> > Thanks -Brenden
> >
> >
> >
> >
> >
> > Brenden Lai
> > SR. BMC Design Engineer
> > E&I, Jabil Design Services
> >
> >
>

--000000000000efcc70057fab92da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr">On Thu, Jan 17, 2019 at 2:34 AM John Wang &lt;<a href=3D"mailt=
o:wangzqbj@inspur.com">wangzqbj@inspur.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On Thu, Jan 17, 2019 at 3:52 PM B=
renden Lai &lt;<a href=3D"mailto:Brenden_Lai@jabil.com" target=3D"_blank">B=
renden_Lai@jabil.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi<br>
&gt;<br>
&gt; I have couple questions about OpenBMC .<br>
<br>
&gt;<br>
&gt; 1.if I decide use OpenBMC solution , Does it mean I should put all BMC=
 source code on github including some commercial software=C2=A0 ?</blockquo=
te><div>I don&#39;t know what you mean by commercial software.=C2=A0 In Ope=
nBMC we strive to use open source software.</div><div><br></div><div>To bui=
ld OpenBMC you only need to check out one repo <a href=3D"http://github.com=
/openbmc/openbmc">github.com/openbmc/openbmc</a> and invoke the bitbake com=
mands to build for a supported platform.=C2=A0 The repo page has build inst=
ructions on it=C2=A0 The recipes in openbmc/openbmc will download the neces=
sary package sources from other online sources and invoke the build command=
s for each of those packages.=C2=A0 The downloaded packages are cached loca=
lly.=C2=A0 It&#39;s also possible to create a local mirror of downloaded pa=
ckages for your team to use.</div><div><br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">=C2=A0</blockquote><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
&gt;<br>
&gt;<br>
&gt;<br>
&gt; 2.Are there any tutorial or /document=C2=A0 for using dbus within Open=
BMC ?<br>
please refer to this link [<a href=3D"https://github.com/openbmc/sdbusplus"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/sdbusplus<=
/a>] for<br>
documentation and examples.<br>
or you can use busctrl to find out it.<br>
<br>
example:<br>
=C2=A0 =C2=A0 busctl tree xyz.openbmc_project.LED.GroupManager<br>
=C2=A0 =C2=A0 busctl introspect=C2=A0 =C2=A0xyz.openbmc_project.LED.GroupMa=
nager<br>
/xyz/openbmc_project/led/groups/enclosure_fault<br>
<br>
&gt; 3.Why there is no release note after V1.05 ?=C2=A0 Will the coming rel=
ease=C2=A0 attach release note ?<br></blockquote><div><br></div><div>The ta=
gs you see are just random tags points, not a coordinated release.=C2=A0 We=
 are in the middle of testing the 2.6 official release at the moment.=C2=A0=
 It will be done early February and it will contain release notes.=C2=A0 Yo=
u can search this mailing list for release activities and also the meeting =
minutes from the release planning workgroup are <a href=3D"https://github.c=
om/openbmc/openbmc/wiki/Release-Planning">here</a>.</div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt;<br>
&gt; 4.I know openBMC is using some file text to represent=C2=A0 device (LE=
D , sensor)<br>
<br>
Linux uses device tree to describe the hardware component,you can<br>
refer to <a href=3D"https://elinux.org/Device_Tree_Usage" rel=3D"noreferrer=
" target=3D"_blank">https://elinux.org/Device_Tree_Usage</a><br>
This link[<a href=3D"https://github.com/openbmc/docs/blob/master/LED-archit=
ecture.md" rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/=
docs/blob/master/LED-architecture.md</a>]<br>
tells you how openbmc controls led.<br>
<br>
Can be roughly described:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 phosphor-led-manager(strategy) --&gt;<br=
>
phosphor-led-&gt;sysfs(action)=C2=A0 --&gt; linux led subsystem<br>
<br>
=C2=A0linux led subsystem :<br>
<a href=3D"https://github.com/openbmc/linux/blob/dev-4.19/Documentation/led=
s/leds-class.txt" rel=3D"noreferrer" target=3D"_blank">https://github.com/o=
penbmc/linux/blob/dev-4.19/Documentation/leds/leds-class.txt</a><br>
<br>
&gt;but I am curious about how this files bind to real device ?<br>
&gt;=C2=A0 =C2=A0 Where is the low level operation relate code ?<br>
<br>
<a href=3D"https://github.com/openbmc/phosphor-led-sysfs/blob/e0844ff447aba=
d01fa6f902caab3839336d1518d/physical.cpp#L131" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/openbmc/phosphor-led-sysfs/blob/e0844ff447abad0=
1fa6f902caab3839336d1518d/physical.cpp#L131</a><br>
<br>
&gt;<br>
&gt;<br>
&gt; Thanks -Brenden<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Brenden Lai<br>
&gt; SR. BMC Design Engineer<br>
&gt; E&amp;I, Jabil Design Services<br>
&gt;<br>
&gt;<br>
</blockquote></div></div>

--000000000000efcc70057fab92da--
