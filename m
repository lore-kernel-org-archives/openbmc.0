Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c0f::22f; helo=mail-ot0-x22f.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lRMVRslC"; 
 dkim-atps=neutral
Received: from mail-ot0-x22f.google.com (mail-ot0-x22f.google.com
 [IPv6:2607:f8b0:4003:c0f::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Bsl475CxzF0Vt
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jun 2018 18:52:16 +1000 (AEST)
Received: by mail-ot0-x22f.google.com with SMTP id p95-v6so6703602ota.5
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jun 2018 01:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=gYW62+L20QCZN0hufnQeN975XyR8QvAQbfDEyKGwrT4=;
 b=lRMVRslCUSzDukwuvWN+u01TcGPR99bcIcsSoi+p2UhCyDpuCOQ8W2sbtZYuJFBaba
 B2sPWvBCiZdIGJSrTYZNBij5OX1YBUkkU7G/ism78Ms1JQmOInCbntyfKf5BAknG+GWd
 rxouL3Q/cam+7lXYx1ox7zEFYrszgN8m26vCop0vpnwJOWLbYlEe7qXkNG9EoITa4HiU
 HwwadYLR7HGAugPOFV67f8JjxfP/TrE9lcjauKsPMH1Z+k/OPCfb88TBTYHHJySoHmxx
 zneJogVQ4zKAenwvI79054rUmI8BhZ6I8gCP8LUpnjVtOvSbaYuyJRDB0iXZ7e3yPe67
 k2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=gYW62+L20QCZN0hufnQeN975XyR8QvAQbfDEyKGwrT4=;
 b=raBtLyJ1l3YvzmY6/nV6aSPtXpAqzTzTBvBzaDbwxzX0DJsva3R6B5mVgQX7vR7g/5
 +pbyHdVT2bVs8QTSgpSHFZ/k6NbE7B10SdZvxCf9JG8ktXFF3J7kUiQprUmrqeBAyLko
 LiD3X9xd2IQp0YFIHYY5S6AOZ21hSQ07CsoPojUIpMB2B7pbwsxeLYXK9lryDP/tN1Io
 muGzBPL8MKqrGjf9lLECdJs9ariOkhz7y0BOgTgvVBYxPoVsm+RYVCkV5f1+uuDBZevt
 j8EeI6YVp+p0wKsnqT8QDaxYBQOxa115MdONB7ZCHIU57RD6aIE6FokCiNGvA5w5Umyi
 niLg==
X-Gm-Message-State: APt69E3tud/JHXZhAOaRSNDtOJeXN7fhXnWwixf89eFurOLrDM1pR7Ro
 fB0XHtkJEDdJFRTBZI8xOqQlmrLJV8Tma1TNzjY=
X-Google-Smtp-Source: ADUXVKKrpWUBPp+A4OMaDPovD3mbUTpjI4l1ObenekOXVvSr0e/Ly34UndYGjlFyIU+6VPxy/gR5hLReu+0LGTDz0XY=
X-Received: by 2002:a9d:2487:: with SMTP id z7-v6mr414301ota.230.1529657534237; 
 Fri, 22 Jun 2018 01:52:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:2cce:0:0:0:0:0 with HTTP; Fri, 22 Jun 2018 01:52:13
 -0700 (PDT)
In-Reply-To: <d7dd04fed035470097a5f47483e5a9d4@BLRX13MDC413.AMER.DELL.COM>
References: <CAE33tLHe9TnUaphWhBv6THyExHZJrr_aS+wQJnHowE7gKxdfCw@mail.gmail.com>
 <d7dd04fed035470097a5f47483e5a9d4@BLRX13MDC413.AMER.DELL.COM>
From: AKASH G J <akashgj91@gmail.com>
Date: Fri, 22 Jun 2018 14:22:13 +0530
Message-ID: <CAE33tLEr1=iGdRNW6TRkPB-MMRLAWLkiBYMJstc-exQmyD5LDw@mail.gmail.com>
Subject: Re: Unable to use ipmitool in OpenBMC Linux
To: B.B.Singh@dell.com
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000f4d018056f3725ff"
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
X-List-Received-Date: Fri, 22 Jun 2018 08:52:18 -0000

--000000000000f4d018056f3725ff
Content-Type: text/plain; charset="UTF-8"

 I tried command  ipmitool  *-I dbus* sdr elist full.

but it is showing the error *Error loading interface dbus*


Thanks and Regards,

Akash



On Thu, Jun 21, 2018 at 4:38 PM, <B.B.Singh@dell.com> wrote:

>
> Hello Akash,
>
> Please use dbus interface while using the ipmitool in OpenBMC.
>
> ipmitool -I dbus sdr elist full
>
> Regards
> Balaji Singh
>
>
> >>From: openbmc [mailto:openbmc-bounces+b_b_singh=dell.com@lists.ozlabs.
> org] On Behalf Of AKASH G J
> >>Sent: Thursday, June 21, 2018 3:51 PM
> >>To: openbmc@lists.ozlabs.org
> >>Subject: Unable to use ipmitool in OpenBMC Linux
>
> >>  Hi Team,
> >> I added ipmitool into the root file system of OpenBMC Linux and booted
> it. When I tried to execute ipmi tool(inside OpenBMC Linux), it is showing
> the following error.
> >> root@zaius:# ipmitool sdr elist full
> >> Could not open device at /dev/ipmi0 or /dev/ipmi/0 or /dev/ipmidev/0.
> No such file or directory.
> >> Please someone help to resolve this.
>
>
>

--000000000000f4d018056f3725ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">

<span style=3D"font-size:small;text-decoration-style:initial;text-decoratio=
n-color:initial;float:none;display:inline">I tried command=C2=A0<span>=C2=
=A0</span></span><span style=3D"font-size:small;text-decoration-style:initi=
al;text-decoration-color:initial;font-family:sans-serif;float:none;display:=
inline">ipmitool =C2=A0</span><b style=3D"font-size:small;text-decoration-s=
tyle:initial;text-decoration-color:initial;font-family:sans-serif">-I dbus<=
/b><span style=3D"font-size:small;text-decoration-style:initial;text-decora=
tion-color:initial;font-family:sans-serif;float:none;display:inline"><span>=
=C2=A0</span>sdr elist full.</span><div style=3D"font-size:small;text-decor=
ation-style:initial;text-decoration-color:initial"><span style=3D"font-fami=
ly:sans-serif;font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;float:none;display:inline"><br></span></div><div style=3D"fo=
nt-size:small;text-decoration-style:initial;text-decoration-color:initial">=
<span style=3D"font-family:sans-serif;font-size:small;text-decoration-style=
:initial;text-decoration-color:initial;float:none;display:inline">but it is=
 showing the error=C2=A0<b>Error loading interface dbus</b></span></div><di=
v style=3D"font-size:small;text-decoration-style:initial;text-decoration-co=
lor:initial"><span style=3D"font-family:sans-serif;font-size:small;text-dec=
oration-style:initial;text-decoration-color:initial;float:none;display:inli=
ne"><b><br></b></span></div><div style=3D"font-size:small;text-decoration-s=
tyle:initial;text-decoration-color:initial"><span style=3D"font-family:sans=
-serif;font-size:small;text-decoration-style:initial;text-decoration-color:=
initial;float:none;display:inline"><b><br></b></span></div><div style=3D"fo=
nt-size:small;text-decoration-style:initial;text-decoration-color:initial">=
<span style=3D"font-family:sans-serif;font-size:small;text-decoration-style=
:initial;text-decoration-color:initial;float:none;display:inline">Thanks an=
d Regards,</span></div><div style=3D"font-size:small;text-decoration-style:=
initial;text-decoration-color:initial"><span style=3D"font-family:sans-seri=
f;font-size:small;text-decoration-style:initial;text-decoration-color:initi=
al;float:none;display:inline"><br></span></div><div style=3D"font-size:smal=
l;text-decoration-style:initial;text-decoration-color:initial"><span style=
=3D"font-family:sans-serif;font-size:small;text-decoration-style:initial;te=
xt-decoration-color:initial;float:none;display:inline">Akash</span></div><b=
r class=3D"gmail-Apple-interchange-newline">

<br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu,=
 Jun 21, 2018 at 4:38 PM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:B.B.Sing=
h@dell.com" target=3D"_blank">B.B.Singh@dell.com</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><br>
Hello Akash,<br>
<br>
Please use dbus interface while using the ipmitool in OpenBMC.<br>
<span class=3D"im HOEnZb"><br>
ipmitool -I dbus sdr elist full<br>
<br>
</span><span class=3D"im HOEnZb">Regards<br>
Balaji Singh<br>
<br>
<br>
&gt;&gt;From: openbmc [mailto:<a href=3D"mailto:openbmc-bounces%2Bb_b_singh=
">openbmc-bounces+b_b_<wbr>singh</a>=3D<a href=3D"mailto:dell.com@lists.ozl=
abs.org">dell.com@lists.ozlabs.<wbr>org</a>] On Behalf Of AKASH G J<br>
&gt;&gt;Sent: Thursday, June 21, 2018 3:51 PM<br>
&gt;&gt;To: <a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlab=
s.org</a><br>
</span><span class=3D"im HOEnZb">&gt;&gt;Subject: Unable to use ipmitool in=
 OpenBMC Linux<br>
<br>
</span><div class=3D"HOEnZb"><div class=3D"h5">&gt;&gt;=C2=A0 Hi Team,<br>
&gt;&gt; I added ipmitool into the root file system of OpenBMC Linux and bo=
oted it. When I tried to execute ipmi tool(inside OpenBMC Linux), it is sho=
wing the following error.<br>
&gt;&gt; root@zaius:# ipmitool sdr elist full<br>
&gt;&gt; Could not open device at /dev/ipmi0 or /dev/ipmi/0 or /dev/ipmidev=
/0. No such file or directory.<br>
&gt;&gt; Please someone help to resolve this.<br>
<br>
<br>
</div></div></blockquote></div><br></div>

--000000000000f4d018056f3725ff--
