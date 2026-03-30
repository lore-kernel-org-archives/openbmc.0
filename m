Return-Path: <openbmc+bounces-1743-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB9DFF493F
	for <openbmc@archiver.kernel.org>; Mon, 30 Mar 2026 04:24:21 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fkdRy6w8hz2ygT;
	Mon, 30 Mar 2026 15:24:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::92d" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774844654;
	cv=pass; b=T4Wn7hHF81PsR5kxJSrkWg3RG/4jwiHBSV3OWu+5lmwF0hrfSN4YbbctauDTQ0wK4Ut5Gzx43mMhMQ2DLSBk1iTZzVwc0kU1kTu+EFPD4o+3CPzT/8gFFUUUi8h6D7EfJCWrY4Wl2snAZr/ieEPHkrOqIGAEAVBS/vgj8LRukOTdJpUUBoO/KE3kaKzHFowsHbJ3s2/Kj8VQRginlkGVfWim4pmq+IJt53JpwUNyE0LsC7lQBdQHbyNA96eX2bj01Z/OEeYVlIsUaY0Yy1DXVXVADMgxTaLZyivn/7V9dSJTRBl0pcJAvACVjxhp4jeAOrE+MQHQXNxc71umVVeFfA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774844654; c=relaxed/relaxed;
	bh=GMPO+qZ8ZLiCzzaoRi4tZ9bvqUSnK/9EfOVD5lcUXuw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LAM5jLebmfNLO/1v6H+dCa0MZfVSob1onqghYfIoQKmZ/+UFcSaKmW+NJRUlf2NjtNu65kQUEsH/CMdLSFgqdxtoKQj3xqbik4oidMqah4K77DH0Ctxf/GowQSYsXqW03K0A7lEpE3DVuuSjz0/UbsApnRtH8WqNNkNjTOBNVTK3GImDAoFcTKx6J3vfdZ3v8XmaGY+8rlRddDfeiLF6HItMVe/w3z0AWVX9sJt8yUDH5HRLJnKgrf8OAWUcq+gHvTugg194f5/9yg6vhM4OdPtKSlOOLpseHofFmFf/EmgHjL+X3IefDAnNwTNQHx+q5UalTNMBQ8ueU1VHHB+2yA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AabJccTq; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::92d; helo=mail-ua1-x92d.google.com; envelope-from=ratankgupta31@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AabJccTq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::92d; helo=mail-ua1-x92d.google.com; envelope-from=ratankgupta31@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fkdRw43JWz2xMQ
	for <openbmc@lists.ozlabs.org>; Mon, 30 Mar 2026 15:24:11 +1100 (AEDT)
Received: by mail-ua1-x92d.google.com with SMTP id a1e0cc1a2514c-94e2ad66abcso1192748241.1
        for <openbmc@lists.ozlabs.org>; Sun, 29 Mar 2026 21:24:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774844649; cv=none;
        d=google.com; s=arc-20240605;
        b=bM7vIQ2E2A/aJ29WjKLiw+tL/Qk6rwxVAul47pTVX6JlmVkLn5c9vtyQKfkLzb+E3g
         d6StnKQx/z0bDwz11g2mSbLm0g6Y5rcL0YSToJyMaXt+tSNzf7fzDBfsFzMOsozbMqtg
         +WIpNH7I7PKXX8E3DJLx7JR7j5bYfAfIajayvKSkLdNyfGLMQV9YtFYzTzgDoiheGUKn
         /e+JjMbmso1d8j0YeMlZQq4DZ2hEX3mRWkE4Phb0K7dhBs4h2jJBI9i62qBofMWvkFwx
         F9pvmcupgX5W+IiQaj1WLRxhZZnYVCR9dPZpqJldEfCQRffCroP/OYErRI2wWRx5WBS5
         IBfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GMPO+qZ8ZLiCzzaoRi4tZ9bvqUSnK/9EfOVD5lcUXuw=;
        fh=E2VzyWvBEDrvlLr3XGnbaBvNB61ldDL28vPp/K+6ZyI=;
        b=Y4hXRhYzUnRiLnCdZQvyn5gBmV4dSEATV/XBQ2fMaHcx4ZrGVqLFm4VO17ZJ/MD7qw
         fs10Zuyk/nUOUrvXI6N0kUHlapuAGoc+1gpP2PpOKBa47qFWVFZ411p5VP3Ane/2L7A9
         Tn+C+lhdNKeoLDrKFcfzIOzZ5KpScL99eVyVcM4VioGE8TDATGxGTFZ8yrWrsz/Dl+sG
         Endf5F7kuaeIPWyKPWh0qCHNB1uGAJgvz3gGtlAxefKS7Z+0GFxDHioDVsD8IfN86l8E
         n5PQMHGUjHFXZGuFTemeGY8SD9hXEhVKJBeAWrSjH2YTHQjA9jpV1OLWKSZSFdp0IgOb
         2iNw==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774844649; x=1775449449; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GMPO+qZ8ZLiCzzaoRi4tZ9bvqUSnK/9EfOVD5lcUXuw=;
        b=AabJccTq9vWCtE721u3PoHameSs4Cx6N+y4/K37ZvxhUs+PYZaW7S4NenT9q3b9tqB
         TGIGVzn9zaxKaBcgLSaTrPT+a+S/lMAgN2xKQtlraE1w4csp7AhXPXNe6jZqMzZAThX1
         O/yIpRVyXcbLAcy3r+1Y94p+f2R/lXeYxL+C9HS3Jb+ndfQjzTuSCEZdk0FCjNJclo1Z
         MtTCgGQMnmj6FRIC9DsD2zaZuWXjvu9WzrsZklw6AyKhZKYHRiYz8p9YKp7O2T9cnHpB
         Gyp1rKoXQ5wIdC3yhOu9dPbD4l/bN43tKaWSNvAh7/nXJYErXA4WK/LudCeRoWE0EA72
         geXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774844649; x=1775449449;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GMPO+qZ8ZLiCzzaoRi4tZ9bvqUSnK/9EfOVD5lcUXuw=;
        b=kjMGQkIZPL2nQsTf6qowE704tEAq8/ZUuuvKDxmLXEdGpOuTUvDkJeqdmFHwKRzL78
         iN/Z1N7inf8r2gQYQ8Jp+YF8eWwz5xWassd2uLm7jgGppzEHt1bzq7Hj1C22q1I/jZhU
         Vz6RkjR/Y23NGnqaVToy+GT4FcyabyRtexdrcu3amHTUBUH8HMskzy+oRz1YJHNrPaUx
         8SNCygY1NKk7FXYla/k54Jwj43bRQLBhzOfZpFthM/RjbEtQ0kLRA1KgS9oeYsM8dLp3
         ncZtCukBU8B7XlRQgDW1i33SVg10Raeyl91UB3ENOe5KinQizSxZi4rII+Gcvs1aW3P/
         hE+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVfLUMsn4EKW8+yFYJkiYnYsA7KcI/aTm7bQnsqy4ITtNPWJl4DFAoXFHJHSGw/vAdjo8GMnnPc@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzfH+t78nYm/u8kn5K6Ml2No0bXW75OiaAfkR0exuFEeq5vAxg1
	3uWnbUwx52IhpZjD+v8490ff8MN9R0O/bj3Q8tOoXDUBost29FTRETZDJ0tPQ3/AXN5G/h6cHly
	x1njyEr3yPKzRsBtvBc5FphWvDdqdZos=
X-Gm-Gg: ATEYQzzwZdltxQjrWiunEpzi7h3AVQh2ut25pAlImWIUElsBErh5kJJk/nf8IvElDAm
	P26rYO7SVSdtWDciIocOF9RiAhonl34D0kphK7S6OV1654mxzRlhyKtClnY/AiphjRYT6Z8A+wA
	R9GUIrlqY75Fkj7pkfcLLq4fwT++vlrlHOZ7Q6ff5G9cLKp1DKOkGUQ8a2+eky+34HLYAJqXTmd
	0Y6CuvuaXjPSwBGyLBudk1cudNHJcA8zZq1xXo722ueUrYV3FY6TtHUhRl+LkHOyJWMEA82rhTV
	P1yfRlE=
X-Received: by 2002:a05:6102:2c17:b0:5ff:f366:dbe1 with SMTP id
 ada2fe7eead31-604f90f12f8mr3284539137.15.1774844648609; Sun, 29 Mar 2026
 21:24:08 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <LV2PR21MB6760A3F8E6E54A1BFC53709FA655A@LV2PR21MB6760.namprd21.prod.outlook.com>
 <PU4P216MB1072C37E5470E90705DE7839FB52A@PU4P216MB1072.KORP216.PROD.OUTLOOK.COM>
In-Reply-To: <PU4P216MB1072C37E5470E90705DE7839FB52A@PU4P216MB1072.KORP216.PROD.OUTLOOK.COM>
From: Ratan Gupta <ratankgupta31@gmail.com>
Date: Mon, 30 Mar 2026 09:53:57 +0530
X-Gm-Features: AQROBzB9VsvXNVHLOsMeLqLU1sGQAG2sZS8IjTzHF1W_ic5G-flgIw3i9LPkvQc
Message-ID: <CAMhqiMqr3C1XPmx4iAc58UF73yqWCq54MtCar2wR20THDxw+zA@mail.gmail.com>
Subject: Re: bmcweb ComponentIntegrity routes for SPDM attestation
To: Manojkiran Eda <manojkiran.eda@gmail.com>
Cc: Gary Beihl <garybeihl@microsoft.com>, 
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000cfddf0064e363856"

--000000000000cfddf0064e363856
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gary,

Sorry if I overlooked your patches. If they=E2=80=99re already available, p=
lease go
ahead and push them. Otherwise, we=E2=80=99ve been waiting for the SPDM bac=
kend
code (MCTP Discovery + SPDM attestation) to be merged first. After that,
NVIDIA can proceed with the bmcweb patches.
I understand that the bmcweb patches are not strictly dependent on the
backend and can be developed in parallel. However, as per the current
guideline, they won=E2=80=99t be merged until the backend is ready.

Thanks
Ratan

On Mon, Mar 30, 2026 at 9:26=E2=80=AFAM Manojkiran Eda <manojkiran.eda@gmai=
l.com>
wrote:

> Hi Gary,
>
> Welcome to OpenBMC!
>
> The previous bmcweb patches you referenced have been in review for quite =
a
> long time now (a couple of years) and haven=E2=80=99t seen any recent act=
ivity.
> Based on that, it doesn=E2=80=99t look like there=E2=80=99s active intere=
st or ongoing work
> in that area at the moment.
>
> Given that, it would make sense for you to go ahead and contribute your
> bmcweb implementation either as a fresh patch or revive the old one (it's
> your call). It sounds like your work nicely complements the spdmd D-Bus
> backend/PDI and helps complete the overall attestation stack, so it would
> be a valuable addition upstream.
>
> Looking forward to seeing your patches on Gerrit and collaborating furthe=
r.
>
>
> Thanks,
>
> Manoj
>
> *From: *Gary Beihl <garybeihl@microsoft.com>
> *Date: *Monday, 30 March 2026 at 2:49=E2=80=AFAM
> *To: *openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>
> *Cc: *Thirupathaiah Annapureddy <thiruan@microsoft.com>, Sagar Dharia <
> Sagar.Dharia@microsoft.com>, Giri Mudusuru <girimudusuru@microsoft.com>
> *Subject: *bmcweb ComponentIntegrity routes for SPDM attestation
>
> Hello everyone,
>
>
>
> I have been looking at SPDM attestation end-to-end testing using Renode
> and have a working bmcweb implementation of the Redfish ComponentIntegrit=
y
> routes that consumes the D-Bus interfaces already merged in
> phosphor-dbus-interfaces [1]. I noticed that the previous bmcweb WIP for
> ComponentIntegrity was auto-abandoned [2] and there does not appear to be
> an active effort to implement these routes upstream.
>
>
>
> The routes are designed to complement the spdmd D-Bus backend work
> currently in review [3][4], providing the Redfish frontend needed to
> complete the attestation stack described in the design document [5].
>
>
>
> I wanted to check whether anyone is already working on bmcweb routes
> downstream before submitting to Gerrit. If not, I am happy to contribute
> and collaborate on getting this piece upstream.
>
>
>
> References:
>
> 1. *https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/yaml/=
xyz/openbmc_project/Attestation
> <https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/yaml/xyz=
/openbmc_project/Attestation>*
>
> 2. *https://gerrit.openbmc.org/c/openbmc/bmcweb/+/61702
> <https://gerrit.openbmc.org/c/openbmc/bmcweb/+/61702>*
>
> 3. *https://gerrit.openbmc.org/c/openbmc/spdm/+/80272
> <https://gerrit.openbmc.org/c/openbmc/spdm/+/80272>*
>
> 4. *https://gerrit.openbmc.org/c/openbmc/spdm/+/80274
> <https://gerrit.openbmc.org/c/openbmc/spdm/+/80274>*
>
> 5. *https://github.com/openbmc/docs/blob/master/designs/redfish-spdm-atte=
station.md
> <https://github.com/openbmc/docs/blob/master/designs/redfish-spdm-attesta=
tion.md>*
>
>
>
> Looking forward to your thoughts,
>
>
>
> Gary Beihl
>
> Firmware Engineering
>
> Microsoft Corporation
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>

--000000000000cfddf0064e363856
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><font face=3D"arial, sans-serif">Hi Gary,</font><div><font=
 face=3D"arial, sans-serif"><br></font></div><div><font face=3D"arial, sans=
-serif">Sorry if I overlooked your patches. If they=E2=80=99re already avai=
lable, please go ahead and push them. Otherwise, we=E2=80=99ve been waiting=
 for the SPDM backend code (MCTP Discovery + SPDM attestation) to be merged=
 first. After that, NVIDIA can proceed with the bmcweb patches.<br>I unders=
tand that the bmcweb patches are not strictly dependent on the backend and =
can be developed in parallel. However, as per the current guideline, they w=
on=E2=80=99t be merged until the backend is ready.=C2=A0</font><div><font f=
ace=3D"arial, sans-serif"><br></font></div><div><font face=3D"arial, sans-s=
erif">Thanks</font></div><div><font face=3D"arial, sans-serif">Ratan</font>=
</div></div></div><br><div class=3D"gmail_quote gmail_quote_container"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 30, 2026 at 9:26=E2=80=AFAM M=
anojkiran Eda &lt;<a href=3D"mailto:manojkiran.eda@gmail.com">manojkiran.ed=
a@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">



<div>
<div style=3D"direction:ltr;font-family:Aptos,Arial,Helvetica,sans-serif;fo=
nt-size:12pt;color:rgb(0,0,0)">
Hi Gary,</div>
<div style=3D"direction:ltr;font-family:Aptos,Arial,Helvetica,sans-serif;fo=
nt-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"direction:ltr;font-family:Aptos,Arial,Helvetica,sans-serif;fo=
nt-size:12pt;color:rgb(0,0,0)">
Welcome to OpenBMC!</div>
<div style=3D"direction:ltr;font-family:Aptos,Arial,Helvetica,sans-serif;fo=
nt-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"direction:ltr;font-family:Aptos,Arial,Helvetica,sans-serif;fo=
nt-size:12pt;color:rgb(0,0,0)">
The previous bmcweb patches you referenced have been in review for quite a =
long time now (a couple of years) and haven=E2=80=99t seen any recent activ=
ity. Based on that, it doesn=E2=80=99t look like there=E2=80=99s active int=
erest or ongoing work in that area at the moment.</div>
<p style=3D"text-align:left;text-indent:0px"><span style=3D"font-size:16px"=
>Given that, it would make sense for you to go ahead and contribute your bm=
cweb implementation either as a fresh
</span>patch or revive the old one (it&#39;s your call)<span style=3D"font-=
size:16px">. It sounds like your work nicely complements the spdmd D-Bus ba=
ckend/PDI and helps complete the overall attestation stack, so it would be =
a valuable addition upstream.</span></p>
<p style=3D"text-align:left;text-indent:0px;text-transform:none"><span styl=
e=3D"font-family:Aptos,Arial,Helvetica,sans-serif;font-size:12pt;color:rgb(=
0,0,0)">Looking forward to seeing your patches on Gerrit and collaborating =
further.</span></p>
<p style=3D"text-align:left;text-indent:0px;text-transform:none"><span styl=
e=3D"font-family:Aptos,Arial,Helvetica,sans-serif;font-size:12pt;color:rgb(=
0,0,0)"><br>
</span></p>
<p style=3D"text-align:left;text-indent:0px;text-transform:none"><span styl=
e=3D"font-family:Aptos,Arial,Helvetica,sans-serif;font-size:12pt;color:rgb(=
0,0,0)">Thanks,</span></p>
<p style=3D"text-align:left;text-indent:0px;text-transform:none"><span styl=
e=3D"font-family:Aptos,Arial,Helvetica,sans-serif;font-size:12pt;color:rgb(=
0,0,0)">Manoj</span></p>
<div style=3D"direction:ltr;font-family:Aptos,Arial,Helvetica,sans-serif;fo=
nt-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div id=3D"m_4883384286116860933mail-editor-reference-message-container">
<div style=3D"direction:ltr">

</div>
<div style=3D"text-align:left;padding:3pt 0in 0in;border-width:1pt medium m=
edium;border-style:solid none none;border-color:rgb(181,196,223) currentcol=
or currentcolor;font-family:Aptos;font-size:12pt;color:black">
<b>From: </b>Gary Beihl &lt;<a href=3D"mailto:garybeihl@microsoft.com" targ=
et=3D"_blank">garybeihl@microsoft.com</a>&gt;<br>
<b>Date: </b>Monday, 30 March 2026 at 2:49=E2=80=AFAM<br>
<b>To: </b><a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">op=
enbmc@lists.ozlabs.org</a> &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org" =
target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;<br>
<b>Cc: </b>Thirupathaiah Annapureddy &lt;<a href=3D"mailto:thiruan@microsof=
t.com" target=3D"_blank">thiruan@microsoft.com</a>&gt;, Sagar Dharia &lt;<a=
 href=3D"mailto:Sagar.Dharia@microsoft.com" target=3D"_blank">Sagar.Dharia@=
microsoft.com</a>&gt;, Giri Mudusuru &lt;<a href=3D"mailto:girimudusuru@mic=
rosoft.com" target=3D"_blank">girimudusuru@microsoft.com</a>&gt;<br>
<b>Subject: </b>bmcweb ComponentIntegrity routes for SPDM attestation<br>
<br>
</div>
<p class=3D"MsoNormal" style=3D"margin:0in;font-family:Aptos,sans-serif;fon=
t-size:12pt">
<span style=3D"font-size:11pt">Hello everyone,</span></p>
<p class=3D"MsoNormal" style=3D"margin:0in;font-family:Aptos,sans-serif;fon=
t-size:12pt">
<span style=3D"font-size:11pt">=C2=A0</span></p>
<p class=3D"MsoNormal" style=3D"margin:0in;font-family:Aptos,sans-serif;fon=
t-size:12pt">
<span style=3D"font-size:11pt">I have been looking at SPDM attestation end-=
to-end testing using Renode and have a working bmcweb implementation of the=
 Redfish ComponentIntegrity routes that consumes the D-Bus interfaces alrea=
dy merged in phosphor-dbus-interfaces
 [1]. I noticed that the previous bmcweb WIP for ComponentIntegrity was aut=
o-abandoned [2] and there does not appear to be an active effort to impleme=
nt these routes upstream.</span></p>
<p class=3D"MsoNormal" style=3D"margin:0in;font-family:Aptos,sans-serif;fon=
t-size:12pt">
<span style=3D"font-size:11pt">=C2=A0</span></p>
<p class=3D"MsoNormal" style=3D"margin:0in;font-family:Aptos,sans-serif;fon=
t-size:12pt">
<span style=3D"font-size:11pt">The routes are designed to complement the sp=
dmd D-Bus backend work currently in review [3][4], providing the Redfish fr=
ontend needed to complete the attestation stack described in the design doc=
ument [5].</span></p>
<p class=3D"MsoNormal" style=3D"margin:0in;font-family:Aptos,sans-serif;fon=
t-size:12pt">
<span style=3D"font-size:11pt">=C2=A0</span></p>
<p class=3D"MsoNormal" style=3D"margin:0in;font-family:Aptos,sans-serif;fon=
t-size:12pt">
<span style=3D"font-size:11pt">I wanted to check whether anyone is already =
working on bmcweb routes downstream before submitting to Gerrit. If not, I =
am happy to contribute and collaborate on getting this piece upstream.</spa=
n></p>
<p class=3D"MsoNormal" style=3D"margin:0in;font-family:Aptos,sans-serif;fon=
t-size:12pt">
<span style=3D"font-size:11pt">=C2=A0</span></p>
<p class=3D"MsoNormal" style=3D"margin:0in;font-family:Aptos,sans-serif;fon=
t-size:12pt">
<span style=3D"font-size:11pt">References:</span></p>
<p class=3D"MsoNormal" style=3D"margin:0in;font-family:Aptos,sans-serif;fon=
t-size:12pt">
<span style=3D"font-size:11pt">1. </span><span style=3D"font-size:11pt;colo=
r:rgb(70,120,134)"><u><a href=3D"https://github.com/openbmc/phosphor-dbus-i=
nterfaces/tree/master/yaml/xyz/openbmc_project/Attestation" style=3D"color:=
rgb(70,120,134);margin-top:0px;margin-bottom:0px" target=3D"_blank">https:/=
/github.com/openbmc/phosphor-dbus-interfaces/tree/master/yaml/xyz/openbmc_p=
roject/Attestation</a></u></span></p>
<p class=3D"MsoNormal" style=3D"margin:0in;font-family:Aptos,sans-serif;fon=
t-size:12pt">
<span style=3D"font-size:11pt">2. </span><span style=3D"font-size:11pt;colo=
r:rgb(70,120,134)"><u><a href=3D"https://gerrit.openbmc.org/c/openbmc/bmcwe=
b/+/61702" style=3D"color:rgb(70,120,134);margin-top:0px;margin-bottom:0px"=
 target=3D"_blank">https://gerrit.openbmc.org/c/openbmc/bmcweb/+/61702</a><=
/u></span></p>
<p class=3D"MsoNormal" style=3D"margin:0in;font-family:Aptos,sans-serif;fon=
t-size:12pt">
<span style=3D"font-size:11pt">3. </span><span style=3D"font-size:11pt;colo=
r:rgb(70,120,134)"><u><a href=3D"https://gerrit.openbmc.org/c/openbmc/spdm/=
+/80272" style=3D"color:rgb(70,120,134);margin-top:0px;margin-bottom:0px" t=
arget=3D"_blank">https://gerrit.openbmc.org/c/openbmc/spdm/+/80272</a></u><=
/span></p>
<p class=3D"MsoNormal" style=3D"margin:0in;font-family:Aptos,sans-serif;fon=
t-size:12pt">
<span style=3D"font-size:11pt">4. </span><span style=3D"font-size:11pt;colo=
r:rgb(70,120,134)"><u><a href=3D"https://gerrit.openbmc.org/c/openbmc/spdm/=
+/80274" style=3D"color:rgb(70,120,134);margin-top:0px;margin-bottom:0px" t=
arget=3D"_blank">https://gerrit.openbmc.org/c/openbmc/spdm/+/80274</a></u><=
/span></p>
<p class=3D"MsoNormal" style=3D"margin:0in;font-family:Aptos,sans-serif;fon=
t-size:12pt">
<span style=3D"font-size:11pt">5. </span><span style=3D"font-size:11pt;colo=
r:rgb(70,120,134)"><u><a href=3D"https://github.com/openbmc/docs/blob/maste=
r/designs/redfish-spdm-attestation.md" style=3D"color:rgb(70,120,134);margi=
n-top:0px;margin-bottom:0px" target=3D"_blank">https://github.com/openbmc/d=
ocs/blob/master/designs/redfish-spdm-attestation.md</a></u></span></p>
<p class=3D"MsoNormal" style=3D"margin:0in;font-family:Aptos,sans-serif;fon=
t-size:12pt">
<span style=3D"font-size:11pt">=C2=A0</span></p>
<p class=3D"MsoNormal" style=3D"margin:0in;font-family:Aptos,sans-serif;fon=
t-size:12pt">
<span style=3D"font-size:11pt">Looking forward to your thoughts,</span></p>
<p class=3D"MsoNormal" style=3D"margin:0in;font-family:Aptos,sans-serif;fon=
t-size:12pt">
<span style=3D"font-size:11pt">=C2=A0</span></p>
<p class=3D"MsoNormal" style=3D"margin:0in;font-family:Aptos,sans-serif;fon=
t-size:12pt">
<span style=3D"font-size:11pt">Gary Beihl</span></p>
<p class=3D"MsoNormal" style=3D"margin:0in;font-family:Aptos,sans-serif;fon=
t-size:12pt">
<span style=3D"font-size:11pt">Firmware Engineering</span></p>
<p class=3D"MsoNormal" style=3D"margin:0in;font-family:Aptos,sans-serif;fon=
t-size:12pt">
<span style=3D"font-size:11pt">Microsoft Corporation</span></p>
<p class=3D"MsoNormal" style=3D"margin:0in;font-family:Aptos,sans-serif;fon=
t-size:12pt">
<span style=3D"font-size:11pt">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0</span></p>
<p class=3D"MsoNormal" style=3D"margin:0in;font-family:Aptos,sans-serif;fon=
t-size:12pt">
<span style=3D"font-size:11pt">=C2=A0</span></p>
<p class=3D"MsoNormal" style=3D"margin:0in;font-family:Aptos,sans-serif;fon=
t-size:12pt">
<span style=3D"font-size:11pt">=C2=A0</span></p>
<p class=3D"MsoNormal" style=3D"margin:0in;font-family:Aptos,sans-serif;fon=
t-size:12pt">
<span style=3D"font-size:11pt">=C2=A0</span></p>
<p class=3D"MsoNormal" style=3D"margin:0in;font-family:Aptos,sans-serif;fon=
t-size:12pt">
<span style=3D"font-size:11pt">=C2=A0</span></p>
<p class=3D"MsoNormal" style=3D"margin:0in;font-family:Aptos,sans-serif;fon=
t-size:12pt">
<span style=3D"font-size:11pt">=C2=A0</span></p>
<p class=3D"MsoNormal" style=3D"text-align:center;margin:0in;font-family:Ap=
tos,sans-serif;font-size:12pt">
<span style=3D"font-size:11pt">=C2=A0</span></p>
<p class=3D"MsoNormal" style=3D"margin:0in;font-family:Aptos,sans-serif;fon=
t-size:12pt">
<span style=3D"font-size:11pt">=C2=A0</span></p>
<p class=3D"MsoNormal" style=3D"margin:0in;font-family:Aptos,sans-serif;fon=
t-size:12pt">
<span style=3D"font-size:11pt">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0</span=
></p>
</div>
</div>

</blockquote></div>

--000000000000cfddf0064e363856--

