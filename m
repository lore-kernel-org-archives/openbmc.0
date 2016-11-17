Return-Path: <hannwang@gmail.com>
Received: from mail-it0-x233.google.com (mail-it0-x233.google.com
 [IPv6:2607:f8b0:4001:c0b::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tK5S76kplzDvmk
 for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2016 13:59:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="yv/jZGUZ"; 
 dkim-atps=neutral
Received: by mail-it0-x233.google.com with SMTP id j191so14291398ita.1
 for <openbmc@lists.ozlabs.org>; Wed, 16 Nov 2016 18:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=qFQQHJN1fRtxkkPe5VDpXECJ7SRdwzKzAUl/Ca6V2Y4=;
 b=yv/jZGUZrsBToYeh8nRPqkUmd/4XvWV9cks09LaAmXf8sbnbuLkJ65xhdD/B2iz3ww
 UdtdZI/7KznMeLASVUFy7+4tk/rrtFndtCOKMjtChK60z4YJsau1VyxUYFSV9ldon9++
 oaKkNPZ0YToU6E/hKdYibEVKLpyzUdSp260D8UUgGwPUBKvkzpfBrQ8yndfyF76PK5iF
 mqDgc8Rwehdd8zL5VDwwYk/vwzZv6rqrvgmCgJn0qj31JvtFkr3htGYfifkwYOvPd/GS
 Lr2Ey00Ksqt25ykrWFSWgNYPd9j3i3Sk0YNLZkXmsDGBEEeV9rasoRwCnjGTOwWl76W4
 LCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=qFQQHJN1fRtxkkPe5VDpXECJ7SRdwzKzAUl/Ca6V2Y4=;
 b=MBWGEtK3RklR2lSqpKSPkbTwMFQ0kWFDzKloWhqsPQ5+7WY/cL2h1Wpbjnw00KJWgl
 Brw/Nb2PdXKTRbuR2f0mvLH0k1gMhsDT4uv5XGjFlONrV9WSWu4M3rFWhjUUrI9Ft7/a
 EkVQcZF1cF/xbEAFUANbdR7FTZSmMcGQyVHANCWIKv4QMlbKpY57ZT/UAfyO0C4L80zZ
 64NoOKk4T1Xw/5CPxlIsF3Gm867iH72qsucfZrx1WlrZjEUpVZLUOi1IdD2Uo6DeKr7f
 C2SinK8Ddmf3DL0WTokBNgmSJlzKgyQ341xDQYGeoKWUXOgXrJ0KwLcoCY8CRZSfpMZK
 giAQ==
X-Gm-Message-State: AKaTC01NauW+R7Go5x/sdMmiWPCdIE9ZGqI8nM8J3A4UdgNRepxSztrgm8fRA7o5u4Bn0NDyAQT4aSJJd/KLAQ==
X-Received: by 10.107.163.136 with SMTP id m130mr1068678ioe.106.1479351541845; 
 Wed, 16 Nov 2016 18:59:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.170.13 with HTTP; Wed, 16 Nov 2016 18:58:41 -0800 (PST)
In-Reply-To: <20161116160720.GL15757@heinlein.lan>
References: <CALPyGmSubhKwB9NhGDyxfaiqTpv3CdypBcEhTM7wFTc=v9Qyqw@mail.gmail.com>
 <20161116160720.GL15757@heinlein.lan>
From: Hann Wang <hannwang@gmail.com>
Date: Thu, 17 Nov 2016 10:58:41 +0800
Message-ID: <CALPyGmT2zBFWt2KR6FHCHh7v-zmVdujEmTm_OiV_0qGxoHKHDQ@mail.gmail.com>
Subject: Re: Firestone cannot access local network
To: Patrick Williams <patrick@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary=001a1140ecf22672de0541765fd0
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
X-List-Received-Date: Thu, 17 Nov 2016 02:59:04 -0000

--001a1140ecf22672de0541765fd0
Content-Type: text/plain; charset=UTF-8

Hi Patrick,

I confirmed subnet mask and route are correct.

eth0      Link encap:Ethernet  HWaddr 70:E2:84:14:0F:2F
          inet addr:172.18.0.151  Bcast:172.18.255.255  Mask:255.255.0.0
          inet6 addr: fe80::72e2:84ff:fe14:f2f%984/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:35 errors:0 dropped:0 overruns:0 frame:0
          TX packets:43 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:5992 (5.8 KiB)  TX bytes:9522 (9.2 KiB)

Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use
Iface
default         gateway         0.0.0.0         UG    1024   0        0 eth0
172.18.0.0      *               255.255.0.0     U     0      0        0 eth0
172.18.0.1      *               255.255.255.255 UH    1024   0        0 eth0


2016-11-17 0:07 GMT+08:00 Patrick Williams <patrick@stwcx.xyz>:

> On Wed, Nov 16, 2016 at 07:03:44PM +0800, Hann Wang wrote:
> > I add BCM54210E drvier to linux kernel, my machine can get IP from DHCP
> > serverip now.
> > I try access internet is good, but I can't access local network.
> > I can ping my laptop in local network, but ssh/telnet/tftp doesn't work.
> > I access from another laptop to my laptop is ok.
>
> That sounds like the subnet mask is wrong?  Have you confirmed
> 'ifconfig' and 'route' look correct?
>
> --
> Patrick Williams
>

--001a1140ecf22672de0541765fd0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Patrick,=C2=A0<div><br></div><div>I confirmed subnet ma=
sk and route are correct.</div><div><br></div><div><div>eth0 =C2=A0 =C2=A0 =
=C2=A0Link encap:Ethernet =C2=A0HWaddr 70:E2:84:14:0F:2F =C2=A0</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet addr:172.18.0.151 =C2=A0Bcast:172.1=
8.255.255 =C2=A0Mask:255.255.0.0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 inet6 addr: fe80::72e2:84ff:fe14:f2f%984/64 Scope:Link</div><div>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST RUNNING MULTICAST =C2=A0MTU:1500 =
=C2=A0Metric:1</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:35 e=
rrors:0 dropped:0 overruns:0 frame:0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 TX packets:43 errors:0 dropped:0 overruns:0 carrier:0</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:1000=C2=A0</div><di=
v>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:5992 (5.8 KiB) =C2=A0TX bytes=
:9522 (9.2 KiB)</div><div><br></div><div>Kernel IP routing table<br></div><=
/div><div><div>Destination =C2=A0 =C2=A0 Gateway =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Genmask =C2=A0 =C2=A0 =C2=A0 =C2=A0 Flags Metric Ref =C2=A0 =C2=A0Use I=
face</div><div>default =C2=A0 =C2=A0 =C2=A0 =C2=A0 gateway =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0.0.0.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UG =C2=A0 =C2=A01024 =C2=
=A0 0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 eth0</div><div>172.18.0.0 =C2=A0 =C2=A0 =
=C2=A0* =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 255.255.0.0 =C2=A0=
 =C2=A0 U =C2=A0 =C2=A0 0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0 eth0</div><div>172.18.0.1 =C2=A0 =C2=A0 =C2=A0* =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 255.255.255.255 UH =C2=A0 =C2=A01024 =C2=A0 0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00 eth0</div></div><div><br></div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">2016-11-17 0:07 GMT+08:00 P=
atrick Williams <span dir=3D"ltr">&lt;<a href=3D"mailto:patrick@stwcx.xyz" =
target=3D"_blank">patrick@stwcx.xyz</a>&gt;</span>:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On Wed, Nov 16, 2016 at =
07:03:44PM +0800, Hann Wang wrote:<br>
&gt; I add BCM54210E drvier to linux kernel, my machine can get IP from DHC=
P<br>
&gt; serverip now.<br>
&gt; I try access internet is good, but I can&#39;t access local network.<b=
r>
&gt; I can ping my laptop in local network, but ssh/telnet/tftp doesn&#39;t=
 work.<br>
&gt; I access from another laptop to my laptop is ok.<br>
<br>
</div></div>That sounds like the subnet mask is wrong?=C2=A0 Have you confi=
rmed<br>
&#39;ifconfig&#39; and &#39;route&#39; look correct?<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Patrick Williams<br>
</font></span></blockquote></div><br></div>

--001a1140ecf22672de0541765fd0--
