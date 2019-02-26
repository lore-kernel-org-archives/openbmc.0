Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::82a; helo=mail-qt1-x82a.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="uabvqLfN"; 
 dkim-atps=neutral
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 447hY61Gk9zDqC4
 for <openbmc@lists.ozlabs.org>; Tue, 26 Feb 2019 12:48:25 +1100 (AEDT)
Received: by mail-qt1-x82a.google.com with SMTP id v10so13101490qtp.8
 for <openbmc@lists.ozlabs.org>; Mon, 25 Feb 2019 17:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EgJmEm2AZiajl3i9T2+4xYrKHR71K+abyJUpy8ySzfs=;
 b=uabvqLfNgErRz35kUKpNckF1W/Qr9RGbtKmJUUa1IGYVp82nWMG5eT5EIbLzz6uyJ7
 XoV+XtCnNzYQ68IKbK5qINXFwbj1KCaQr4d4mhQsDuqjorSssHf7EWTGBjX7ANAZSpch
 BWnJ/Jxq6UAiLqlgTt8b23IpfwG8QkxT43sdK+UvClHJR3ee5gOMfPsMIdTWo5ySEgqn
 GpjrdLu8vqdYX40yM4RP/57hGqUunteHzAjpq261jdCjICndsm6p8Z5Ma29HFirXghbm
 6koW2+RA+/7GGIEf9d3ALWR8RQJTydQqBEezMFqUrw+huw4NThAtYgeQhCcctswMyhix
 8XdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EgJmEm2AZiajl3i9T2+4xYrKHR71K+abyJUpy8ySzfs=;
 b=bfjN60GmFL5fROMQv6LTJny/qrMf+m1sxkGJAtbQKdYRiDLTE1Jyl9u19G4yOWpGLx
 NYSAnxKvocJZ/UTNPs+kVoDVZMeXvzeKiWZl3LuIkl/dEBK49rSkBTl7qeMZVpZVFvuL
 u2k5z7WpNa6kt2fka1xEeBmPH3BESLQpRid//KkkyY2Ef7majutd/PK7ZAssB0hoISDp
 5A+BecwvFFT9PPxu2M/b0MpQKa1n6LDFRm3xIAcxTzFbZuGiVu7ay2NZc9SHcNRU3rTn
 zFlay5Bu23+mMP1v8eUFiB4TLOlLDnCDvFOK3Z1D0Jw4SwhjK0NiRrLoku7jFYytS4yo
 msoQ==
X-Gm-Message-State: AHQUAuZ3oBlnpTRKFk475LovZ/138Dl9yjf/HyY0v0Ni9qQYcyDbSYgP
 ALK3zeQVEZJnDh+JMisjd1fXNW3qYis4vPqezllN6Q==
X-Google-Smtp-Source: AHgI3IZT+CA4mPfiFnm7TijYbWSyXX/6jGtKsuSvK9MGdP2Oq2xB0VbUUvf4i4/26U7csseLjcccGuw5OO+54Ivh5QE=
X-Received: by 2002:ac8:38b3:: with SMTP id f48mr16599746qtc.125.1551145702513; 
 Mon, 25 Feb 2019 17:48:22 -0800 (PST)
MIME-Version: 1.0
References: <7146489c577d4784bd57fa4cb22a65b2@quantatw.com>
In-Reply-To: <7146489c577d4784bd57fa4cb22a65b2@quantatw.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Mon, 25 Feb 2019 17:48:11 -0800
Message-ID: <CAJoAoZnkkNJsTZ4Yoe7=RA87HazPa7kcLSpNjGEMfLVDfvEAwA@mail.gmail.com>
Subject: Re: Support for NVMe-MI?
To: =?UTF-8?B?VG9ueSBMZWUgKOadjuaWh+WvjCk=?= <Tony.Lee@quantatw.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
 "benjaminfair@google.com" <benjaminfair@google.com>, 
 =?UTF-8?B?QnVkZHkgSHVhbmcgKOm7g+Wkqem0uyk=?= <Buddy.Huang@quantatw.com>
Content-Type: multipart/alternative; boundary="000000000000983b6c0582c2407b"
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
X-List-Received-Date: Tue, 26 Feb 2019 01:48:27 -0000

--000000000000983b6c0582c2407b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I expect you will be able to use the same command out-of-band if you add
the relevant parameters to ipmitool to use the LAN. Can you report back if
that isn't working for you?

On Thu, Feb 21, 2019 at 7:14 PM Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) <Ton=
y.Lee@quantatw.com>
wrote:

> Hi,
>
>
>
> https://github.com/openbmc/openbmc/issues/3482 is asking support for
> NVMe-MI.
>
> Now, we found that Google has a package called =E2=80=9Cgoogle-ipmi-i2c=
=E2=80=9D. It
> provides a ipmi bridge command which can get the device data where are on
> the i2c bus.
>
>
>
> There are the command and response example below:
>
> $ ipmitool -I dbus raw 0x2e 2 0x79 0x2b 0x00 14 0 0xd4 0 1 0 0xd5 0 8
> response: 79 2b 00 06 bb ff 2a 00 00 00 2e
>
> $ ipmitool -I dbus raw 0x2e 2 0x79 0x2b 0x00 14 0 0xd4 0 1 8 0xd5 0 24
> response : 79 2b 00 16 80 86 50 48 4c 46 37 31 31 35 30 30
>
> Response is define in NVM Express Management Interface SPEC
>
> It's only used for in-band now.
>
> How about adding support for out-of-band for this useful OEM command?
>
>
>
>
>
> Thanks
>
> Best Regards,
>
> Tony
>
>
>

--000000000000983b6c0582c2407b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I expect you will be able to use the same command out-of-b=
and if you add the relevant parameters to ipmitool to use the LAN. Can you =
report back if that isn&#39;t working for you?</div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 21, 2019 at 7:14 =
PM Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) &lt;<a href=3D"mailto:Tony.Lee@qu=
antatw.com">Tony.Lee@quantatw.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">





<div lang=3D"ZH-TW" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"m_-3355478774038688319WordSection1">
<p class=3D"m_-3355478774038688319MsoPlainText"><span lang=3D"EN-US">Hi,<u>=
</u><u></u></span></p>
<p class=3D"m_-3355478774038688319MsoPlainText"><span lang=3D"EN-US"><u></u=
>=C2=A0<u></u></span></p>
<p class=3D"m_-3355478774038688319MsoPlainText"><span lang=3D"EN-US"><a hre=
f=3D"https://github.com/openbmc/openbmc/issues/3482" target=3D"_blank">http=
s://github.com/openbmc/openbmc/issues/3482</a> is asking support for NVMe-M=
I.<u></u><u></u></span></p>
<p class=3D"m_-3355478774038688319MsoPlainText"><span lang=3D"EN-US">Now, w=
e found that Google has a package called
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Courier New&quot;">=
=E2=80=9C</span><span lang=3D"EN-US">google-ipmi-i2c</span><span lang=3D"EN=
-US" style=3D"font-family:&quot;Courier New&quot;">=E2=80=9D</span><span la=
ng=3D"EN-US">. It provides a ipmi bridge command which can get the device d=
ata where
 are on the i2c bus.<u></u><u></u></span></p>
<p class=3D"m_-3355478774038688319MsoPlainText"><span lang=3D"EN-US"><u></u=
>=C2=A0<u></u></span></p>
<p class=3D"m_-3355478774038688319MsoPlainText"><span lang=3D"EN-US" style=
=3D"font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">=
There are the command and response example below:</span><span lang=3D"EN-US=
"><u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span lang=3D"EN-US" =
style=3D"font-family:&quot;Arial&quot;,sans-serif">$ ipmitool -I dbus raw 0=
x2e 2 0x79 0x2b 0x00 14 0 0xd4 0 1 0 0xd5 0 8<br>
response: 79 2b 00 06 bb ff 2a 00 00 00 2e<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span lang=3D"EN-US" =
style=3D"font-family:&quot;Arial&quot;,sans-serif">$</span><span lang=3D"EN=
-US" style=3D"font-family:&quot;Arial&quot;,sans-serif">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Arial&quot;,sans-ser=
if">ipmitool -I dbus raw 0x2e 2 0x79 0x2b 0x00 14 0 0xd4 0 1 8 0xd5 0 24<br=
>
response : 79 2b 00 16 80 86 50 48 4c 46 37 31 31 35 30 30<u></u><u></u></s=
pan></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span lang=3D"EN-US" =
style=3D"font-family:&quot;Arial&quot;,sans-serif">Response is define in NV=
M Express Management Interface SPEC<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span lang=3D"EN-US">=
It&#39;s only used for in-band now.<u></u><u></u></span></p>
<p class=3D"m_-3355478774038688319MsoPlainText"><span lang=3D"EN-US">How ab=
out adding support for out-of-band for this useful OEM command?<u></u><u></=
u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Best Regards,<u></u><u></u></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Tony<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
</div>

</blockquote></div>

--000000000000983b6c0582c2407b--
