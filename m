Return-Path: <raltherr@google.com>
Received: from mail-yw0-x230.google.com (mail-yw0-x230.google.com
 [IPv6:2607:f8b0:4002:c05::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sJ9Bw3y7pzDrK5
 for <openbmc@lists.ozlabs.org>; Tue, 23 Aug 2016 09:44:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=fR0IDJ6p; 
 dkim-atps=neutral
Received: by mail-yw0-x230.google.com with SMTP id j12so62563211ywb.2
 for <openbmc@lists.ozlabs.org>; Mon, 22 Aug 2016 16:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=A6d6YcHg+0Htxdxq7NCYnxg/d0EDHn+F2niwKBq7I0A=;
 b=fR0IDJ6pd0YJYh+Hex0LXEPG2ticH9zgXJEzYanu0Elw1M/Pj5KVrN1Kz7mQsuS0Nx
 dLPScTWm7WRnsRSUryk87lfzG4XIV9tVg+ykao3dwB5g6EMCHTut20tsvM3+5FGaZ0Rb
 6NDDZZuxbr2xArqL8rHQQY/4V1iefKzsB2DuNFwyUFVB2fuAgKT1J487uiwqRsFXPV6D
 3K3vaypwajPdAlp0K7VEf8Ojh04gnF31+coion2qTclJpxovhYW9DwDebD8Qv42JVKBe
 BML1Pp3I5DI3P+gqYZcTWeeDPO187+53qKF2rrVD2y1S5QoVY18y+NdxC+txp3j9V1XN
 WABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=A6d6YcHg+0Htxdxq7NCYnxg/d0EDHn+F2niwKBq7I0A=;
 b=UMIpC+Y/4xx2cYsQ6EbL9ArJshK1t1adKkCrmZ3/kSvvtuv3FEEs0HvoyA326SWwXH
 EitTLMhraK8B6I2xO4uu5MqAr72ZIBCcFLYute+97EIsYGgcb50ZhTltOBvU7Xr7c2EM
 GaqYFIgXTbPAE1YRrJIam1FODAcnVALkLrpGeU+K1LJkhliSAcsrZMKRABK6E97zFiR/
 1viYtdDBOX6J08zknbZH0b3vaYfh3xj4Sx3e8XjtNVKs2WwwpvhW7sohddtyHTlrOrTQ
 ojwoBf1a1aD6FZIlWxzPEIhrYzTr49ISLlrP5UpTXk6SPy5SETdyiFNhcaQsaS8/FQ5u
 A2Cw==
X-Gm-Message-State: AEkoouuNS37G/oGOBUsDbyFxPkThlwGUeZuuOa3DjGaMUUliuhu3dSPKWKMxGsS4aN9wTh60mQfjQn38mRbocw+w
X-Received: by 10.13.230.2 with SMTP id p2mr18865008ywe.125.1471909445708;
 Mon, 22 Aug 2016 16:44:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.160.4 with HTTP; Mon, 22 Aug 2016 16:44:05 -0700 (PDT)
In-Reply-To: <c91f438b-8baa-808c-35d6-fffb928d22f1@linux.vnet.ibm.com>
References: <c91f438b-8baa-808c-35d6-fffb928d22f1@linux.vnet.ibm.com>
From: Rick Altherr <raltherr@google.com>
Date: Mon, 22 Aug 2016 16:44:05 -0700
Message-ID: <CAPLgG=koY4pB-kc=2eVCg5+CWVAVHdEN=SWwyBjK+4Bx7cPhyg@mail.gmail.com>
Subject: Re: Document on : Time Manager in OpenBMC --> Need your review.
To: vishwa <vishwa@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=94eb2c0878d6a7ab94053ab19fe2
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Aug 2016 23:44:09 -0000

--94eb2c0878d6a7ab94053ab19fe2
Content-Type: text/plain; charset=UTF-8

In the future, please just send the text inline instead of as an attachment.

I don't understand the setting hierarchy.  To me,
/org/openbmc/settings/Host/host0 implies I am modifying something related
to the host CPU, not the BMC.  TimeMode only applies to the BMC so having
it under host0 feels weird.

1. I like the clear separation of NTP vs manual.

2.1. "Both" seems like what we have today which doesn't really work at
all.  I suggest omitting it.  "Split" feels like it should work for all
cases.  If TimeMode is NTP, an offset is recorded.  If TimeMode is Manual,
the BMC time is set.

APIs:
1. What time zone does SetTime assume?  If UTC, make sure to add tests for
a valid leap second and leap year.
2. I really dislike APIs that change behavior.  Provide separate GetBmcTime
and GetHostTime APIs if you must.
3. SetNTP is a very limiting name.  if this really changes TimeMode, call
it SetTimeMode.  That way we can support things like 1588, GPS, etc later.

Changes to NetworkManager:
- I don't see the point of UseNTP for SetDHCP.  Configuring an NTP address
is different from using NTP as a time source.  It's up to the DHCP server
to provide NTP options.  Whether the BMC uses them is controlled by
TimeMode.
- Add a SetNtpServer API instead of adding to SetAddress4.  NTP is entirely
separate from IPv4 address configuration.

On Thu, Aug 18, 2016 at 4:08 AM, vishwa <vishwa@linux.vnet.ibm.com> wrote:

> Team,
>
> Please help look into this document that describes what I think the
> TimeManager on openBMC systems should look like.
>
> Please weigh in your thoughts.
>
> Thanks.
>
> Vishwanath.
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>
>

--94eb2c0878d6a7ab94053ab19fe2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">In the future, please just send the text inline instead of=
 as an attachment.<div><br></div><div>I don&#39;t understand the setting hi=
erarchy.=C2=A0 To me, /org/openbmc/settings/Host/host0 implies I am modifyi=
ng something related to the host CPU, not the BMC.=C2=A0 TimeMode only appl=
ies to the BMC so having it under host0 feels weird.</div><div><br></div><d=
iv>1. I like the clear separation of NTP vs manual.</div><div><br></div><di=
v>2.1. &quot;Both&quot; seems like what we have today which doesn&#39;t rea=
lly work at all.=C2=A0 I suggest omitting it. =C2=A0&quot;Split&quot; feels=
 like it should work for all cases.=C2=A0 If TimeMode is NTP, an offset is =
recorded.=C2=A0 If TimeMode is Manual, the BMC time is set.</div><div><br><=
/div><div>APIs:</div><div>1. What time zone does SetTime assume?=C2=A0 If U=
TC, make sure to add tests for a valid leap second and leap year.</div><div=
>2. I really dislike APIs that change behavior.=C2=A0 Provide separate GetB=
mcTime and GetHostTime APIs if you must.</div><div>3. SetNTP is a very limi=
ting name. =C2=A0if this really changes TimeMode, call it SetTimeMode.=C2=
=A0 That way we can support things like 1588, GPS, etc later.</div><div><br=
></div><div>Changes to NetworkManager:</div><div>- I don&#39;t see the poin=
t of UseNTP for SetDHCP.=C2=A0 Configuring an NTP address is different from=
 using NTP as a time source.=C2=A0 It&#39;s up to the DHCP server to provid=
e NTP options.=C2=A0 Whether the BMC uses them is controlled by TimeMode.</=
div><div>- Add a SetNtpServer API instead of adding to SetAddress4.=C2=A0 N=
TP is entirely separate from IPv4 address configuration.</div></div><div cl=
ass=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Aug 18, 2016 at =
4:08 AM, vishwa <span dir=3D"ltr">&lt;<a href=3D"mailto:vishwa@linux.vnet.i=
bm.com" target=3D"_blank">vishwa@linux.vnet.ibm.com</a>&gt;</span> wrote:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">Team,<br>
<br>
Please help look into this document that describes what I think the TimeMan=
ager on openBMC systems should look like.<br>
<br>
Please weigh in your thoughts.<br>
<br>
Thanks.<br>
<br>
Vishwanath.<br>
<br>______________________________<wbr>_________________<br>
openbmc mailing list<br>
<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br=
>
<a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lists.ozlabs.org/<wbr>listinfo/openbmc</a><br>
<br></blockquote></div><br></div>

--94eb2c0878d6a7ab94053ab19fe2--
