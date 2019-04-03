Return-Path: <susantjasinski@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com;
 envelope-from=susantjasinski@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="V6nk8yYl"; 
 dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ZBD06ZTpzDq5x
 for <openbmc@lists.ozlabs.org>; Thu,  4 Apr 2019 03:21:36 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id e24so8385958pfi.12
 for <openbmc@lists.ozlabs.org>; Wed, 03 Apr 2019 09:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=R+rL++t47dc5k05yQH3oDXT21F6+kYS3bD2Sd2iS9Hw=;
 b=V6nk8yYlYgadjAsX+tLn9cb4SMd7R3YdrMZkokeYgPyNbJlYsEg+Sv++MLs6XZz6V4
 QR2M2iDWf0q3Kc9FbjlJwP5aMC9rDvGBOGYmzDQPGiNEtrGUrhm0QMhXh1LbC20n1E81
 8S9n3QicGwt42ofibR6TUhQiBTcPyIX4nz1XojyCfAto+v0FnTzXzLizzfaXvFFnCYcG
 OHIcwfKCi1S63LT8heAzbevLk4pGoXOEESnviqmut2FSXSOpnDMCex4PLqD5k1jkdXAI
 oQcWDAjsLu3Xphl3Pxl4XANXgflH+ax1R8m7QOSovMxMWvWMIZLlMNct+0LBeEp8TktL
 7UPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=R+rL++t47dc5k05yQH3oDXT21F6+kYS3bD2Sd2iS9Hw=;
 b=Bd/5+4N8kh8xI3H/swNhyXE2Ga31uJLhND2sPa28Ib1FvUEJAUF0ojVIbiMS5LtjQs
 13GR5RgjX6my8L0gNTlPhaH0M9fr4DrJm/gwMUyj8phB5XAon+3GrwrpwwxAq41CcuKV
 O6CtVmtadm7m6mCwFzIXpSG2AvO/4q48yEzZT60izLOOCWIfvVfXQCjFS5kFMXS0sH1e
 5Plz2tN9c2NGpavh2f+gxmviSOqpPOU6DmQL4BEihRd4qnmbgIEQ2iyO80Bx3JSB4E0i
 /+rzpZ/WaEBNhWrlpz2L8jnxXqC/kNWCW1gU/gCPeWM/5XLJlneZLyLVNcfRWJH1l6o3
 IH6Q==
X-Gm-Message-State: APjAAAVX4M/oxhVas5XpxEn6i7ST2dzr1rLdvh/dDjbOlGbjA8DDeDF6
 65m/i2Z9vWwl52GCktoTp4iOvpxdYM6jmTilKoxk6PFr
X-Google-Smtp-Source: APXvYqwgolXdYGyXvvg3PbkLNMHxHIK4qTv3TSYdqT8Y/9FaaPV2zcp8beJcQ6kpO7QhGSmsGreykfy0OUDfKivv/UQ=
X-Received: by 2002:a62:7089:: with SMTP id l131mr318435pfc.158.1554308492528; 
 Wed, 03 Apr 2019 09:21:32 -0700 (PDT)
MIME-Version: 1.0
References: <CANT4Nr+ueeb1qGcWFeYuGHrtoovMvxdgP6+vKpJN+bKKDEUpwA@mail.gmail.com>
In-Reply-To: <CANT4Nr+ueeb1qGcWFeYuGHrtoovMvxdgP6+vKpJN+bKKDEUpwA@mail.gmail.com>
From: susan jasinski <susantjasinski@gmail.com>
Date: Wed, 3 Apr 2019 11:21:21 -0500
Message-ID: <CANT4Nr+QRGK3SDcBze2L3UC0ggJPUZz+5nGaG2VK2gsMOXW4vQ@mail.gmail.com>
Subject: Re: PLEASE ATTEND: GUI Work Group -- Wednesday April 3 at 7:30AM CT
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000918e6b0585a2a58c"
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
X-List-Received-Date: Wed, 03 Apr 2019 16:21:37 -0000

--000000000000918e6b0585a2a58c
Content-Type: text/plain; charset="UTF-8"

*Meeting minutes of 3 April 2019*
Attendees:  Susan Jasinski, Nicole Conser, Jandra Aranguren, Ryan Arnell,
Kuiying (Kwin) Wang

   - Please add designs to the agenda for review or topics that you want to
   discuss
   - Presented Firmware panel prototype; discussed comments provided by
   Intel team (via InVision), the panel will be updated to reflect these
   comments and posted to the community email
      -  How Release Data data is gathered?
      -   Missing date info on when the update occurred
      -   Only one "Update image" button is needed (this was a mistake in
      the prototype)
      -   Suggest Active/Backup to replace Primary/Secondary terminology
      -   Delete 'RUNNING/BACK-UP' from the image version label


   - Presented Remote Logging panel prototype; no comments
   - Briefly discuss how/when to provide reminders for this call


On Mon, Apr 1, 2019 at 1:14 PM susan jasinski <susantjasinski@gmail.com>
wrote:

> This is a reminder that the GUI Design Workgroup is this Wednesday, *March
> 20 at 7:30 am CT*.
>
> Web conference:
> https://ibm.webex.com/meet/susantj
>
> Anyone can add feature or panel designs to the agenda here:
> https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group
>
> So far we will be looking at
> - *Firmware *panel redesign
> - (new) *Backup and Restore* design and GUI panel
> - (new) *Remote Logging* Server Configuration design and GUI panel
>
> Thank you, Susan Jasinski
>

--000000000000918e6b0585a2a58c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr" style=3D"font-size:14px"><u><strong>Meeti=
ng minutes of 3 April 2019</strong></u></div><div dir=3D"ltr" style=3D""><f=
ont face=3D"arial, helvetica, sans-serif" style=3D"">Attendees:=C2=A0=C2=A0=
<span style=3D"background-color:transparent;color:rgb(36,41,46)">Susan Jasi=
nski, Nicole Conser, Jandra Aranguren, Ryan Arnell, Kuiying (Kwin) Wang</sp=
an></font></div><div dir=3D"ltr" style=3D""><ul><li><font face=3D"arial, he=
lvetica, sans-serif">Please add designs to the agenda for review or topics =
that you want to discuss</font></li><li><font face=3D"arial, helvetica, san=
s-serif">Presented Firmware panel prototype; discussed comments provided by=
 Intel team<span class=3D"gmail-Apple-converted-space">=C2=A0</span>(via In=
Vision), the panel will be updated to reflect these comments and posted to<=
span class=3D"gmail-Apple-converted-space">=C2=A0</span>the community email=
<span class=3D"gmail-Apple-converted-space">=C2=A0</span></font></li><ul><l=
i><font face=3D"arial, helvetica, sans-serif"><span class=3D"gmail-Apple-co=
nverted-space">=C2=A0</span>How Release Data data is gathered?</font></li><=
li><font face=3D"arial, helvetica, sans-serif"><span class=3D"gmail-Apple-c=
onverted-space">=C2=A0=C2=A0</span>Missing date info on when the update occ=
urred</font></li><li><font face=3D"arial, helvetica, sans-serif"><span clas=
s=3D"gmail-Apple-converted-space">=C2=A0=C2=A0</span>Only one &quot;Update =
image&quot; button is needed (this was a mistake in the prototype)</font></=
li><li><font face=3D"arial, helvetica, sans-serif"><span class=3D"gmail-App=
le-converted-space">=C2=A0=C2=A0</span>Suggest Active/Backup to replace Pri=
mary/Secondary terminology</font></li><li><font face=3D"arial, helvetica, s=
ans-serif"><span class=3D"gmail-Apple-converted-space">=C2=A0=C2=A0</span>D=
elete &#39;RUNNING/BACK-UP&#39; from the image version label</font></li></u=
l></ul></div><div dir=3D"ltr" style=3D""><ul style=3D""><li style=3D""><fon=
t face=3D"arial, helvetica, sans-serif">Presented Remote Logging panel prot=
otype; no comments</font></li><li style=3D""><font face=3D"arial, helvetica=
, sans-serif" style=3D"">Briefly discuss how/when to provide reminders for =
this call</font></li></ul></div>















</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Mon, Apr 1, 2019 at 1:14 PM susan jasinski &lt;<a href=3D"mailto:susantj=
asinski@gmail.com">susantjasinski@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr=
">This is a reminder that the GUI=C2=A0Design Workgroup is this Wednesday,=
=C2=A0<b>March 20 at 7:30 am CT</b>.<br></div><div dir=3D"ltr"><br>Web conf=
erence:<br><a href=3D"https://ibm.webex.com/meet/susantj" rel=3D"noreferrer=
" target=3D"_blank">https://ibm.webex.com/meet/susantj</a><br><br>Anyone ca=
n add feature or panel designs to the agenda here:<br><a href=3D"https://gi=
thub.com/openbmc/openbmc/wiki/GUI-Design-work-group" rel=3D"noreferrer" tar=
get=3D"_blank">https://github.com/openbmc/openbmc/wiki/GUI-Design-work-grou=
p</a><br><br>So far we will be looking at<br>- <b>Firmware </b>panel redesi=
gn<div>- (new) <b>Backup and Restore</b> design and=C2=A0GUI panel<br>- (ne=
w) <b>Remote Logging</b> Server Configuration design and=C2=A0GUI panel</di=
v><div><br></div><div>Thank you, Susan Jasinski</div></div></div>
</blockquote></div>

--000000000000918e6b0585a2a58c--
