Return-Path: <hannwang@gmail.com>
Received: from mail-it0-x231.google.com (mail-it0-x231.google.com
 [IPv6:2607:f8b0:4001:c0b::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tKDNW0L5WzDvdr
 for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2016 19:11:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="zeP2D2/x"; 
 dkim-atps=neutral
Received: by mail-it0-x231.google.com with SMTP id y23so30181609itc.0
 for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2016 00:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=OnZqEohuOW743cs2Y50u67rxBTKZIB0dAO5b0FPtcl8=;
 b=zeP2D2/xIWu1L2ZhhG1bCZTFd/0bVMtQ1lHpKbJbDxrRatmN5lY+a4mjunatMXD9y2
 T1bDtmc1sAwld2i7RmbMZDRNWulVBCRXSYRrdzjCc4KieP6DqQkPwN8zeJxlHyL4l7QU
 FX/bl+5A+fuQ5h2N3WIxIhJe304AgX+aYH04nB/RkRIaCO+qZLnccMMLGbLY3r5znKGO
 Ggyco2JkcXVejGzIncSSSCiOIUR866CdgeKuI56lIO+BarKMMKygMixafGWBh00rRtBu
 NqqsdI5MRIgWFNDxNusxgWYcxpehFmcFmxjBYL/8+udDhYMtrKvwKpY/lqiX2tG6wiJU
 5VVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=OnZqEohuOW743cs2Y50u67rxBTKZIB0dAO5b0FPtcl8=;
 b=WP1w0/UM1VWTKxGEQdFYGYMLeewCk08HriFfjMRV/5yQV5KRj/GmrK8ZNM5QB32TWk
 wmePGAKYqL7dTMNOeCgGcAZkh2GnfxqWuVSUsTYx271/7Wa09c5T3PERFlpo8zMuxhBC
 O7mCrGZ2n8tx4oeX5XvB8TPzaiKryMckN4xrXNB9MqUnfIT6DoakJw1PoVoEBUWXBLYL
 79gHVHMxhRZV96BUXcQTmUMfkpRH2nrvnVSmgDep3snX6IUdiN1fUVmDWinPptV8H7lg
 WP1BwOVztEDrEbt09fhmndOEZn0qRqqehh7YQgMmaf8nk5l6rmyL4sKVvhvFaAmLyqe3
 bq+A==
X-Gm-Message-State: ABUngvc4j9Z24+L1NwZACUS4E+yFrQ84muswWieRIGtLLn3sAD+VzWOJ0HBZF1oSv22wd7SrCjVn3oRjaiYLqQ==
X-Received: by 10.36.178.74 with SMTP id h10mr1716967iti.37.1479370280112;
 Thu, 17 Nov 2016 00:11:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.133.153 with HTTP; Thu, 17 Nov 2016 00:10:59 -0800 (PST)
In-Reply-To: <DBD52556-FD44-4DD9-9868-FA931D0C29D9@linux.vnet.ibm.com>
References: <CALPyGmSubhKwB9NhGDyxfaiqTpv3CdypBcEhTM7wFTc=v9Qyqw@mail.gmail.com>
 <20161116160720.GL15757@heinlein.lan>
 <DBD52556-FD44-4DD9-9868-FA931D0C29D9@linux.vnet.ibm.com>
From: Hann Wang <hannwang@gmail.com>
Date: Thu, 17 Nov 2016 16:10:59 +0800
Message-ID: <CALPyGmT556dumTmJt6oBcY15XHg+adRF-0GpO-pt9DygHeofEg@mail.gmail.com>
Subject: Re: Firestone cannot access local network
To: Adriana Kobylak <anoo@linux.vnet.ibm.com>
Cc: Patrick Williams <patrick@stwcx.xyz>, openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary=f403045d8fb009967505417abc25
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
X-List-Received-Date: Thu, 17 Nov 2016 08:11:23 -0000

--f403045d8fb009967505417abc25
Content-Type: text/plain; charset=UTF-8

Hi Adriana,

This repository works, thanks for your help.


2016-11-17 5:54 GMT+08:00 Adriana Kobylak <anoo@linux.vnet.ibm.com>:

> Long story short, Firestone has a network issue that prevents ssh from
> working. This has been fixed by Tim here and the changes are in progress of
> being upstreamed:
>
> https://github.com/madscientist159/openbmc-openbmc/commits/firestone-
> test-last-working
>
> GIT hash 175c297c3e65e945ebb2df0cb4f4fcd2ba2e8779,
> branch firestone-test-last-working
>
> You can build a firestone openbmc image from that repository to get
> network working.
>
>
> On Nov 16, 2016, at 10:07 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Wed, Nov 16, 2016 at 07:03:44PM +0800, Hann Wang wrote:
>
> I add BCM54210E drvier to linux kernel, my machine can get IP from DHCP
> serverip now.
> I try access internet is good, but I can't access local network.
> I can ping my laptop in local network, but ssh/telnet/tftp doesn't work.
> I access from another laptop to my laptop is ok.
>
>
> That sounds like the subnet mask is wrong?  Have you confirmed
> 'ifconfig' and 'route' look correct?
>
> --
> Patrick Williams
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>
>
>

--f403045d8fb009967505417abc25
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Adriana,=C2=A0<div><br></div><div>This repository works=
, thanks for your help.</div><div><br><div class=3D"gmail_extra"><br><div c=
lass=3D"gmail_quote">2016-11-17 5:54 GMT+08:00 Adriana Kobylak <span dir=3D=
"ltr">&lt;<a href=3D"mailto:anoo@linux.vnet.ibm.com" target=3D"_blank">anoo=
@linux.vnet.ibm.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
style=3D"word-wrap:break-word"><div>Long story short, Firestone has a netwo=
rk issue that prevents ssh from working. This has been fixed by Tim here an=
d the changes are in progress of being upstreamed:</div><div><br></div><div=
><a href=3D"https://github.com/madscientist159/openbmc-openbmc/commits/fire=
stone-test-last-working" target=3D"_blank">https://github.com/<wbr>madscien=
tist159/openbmc-<wbr>openbmc/commits/firestone-<wbr>test-last-working</a></=
div><div><br></div><div><div style=3D"margin:0px;font-size:10px;line-height=
:normal;font-family:Courier">GIT hash=C2=A0<wbr>175c297c3e65e945ebb2df0cb4f=
4fc<wbr>d2ba2e8779, branch=C2=A0firestone-test-last-<wbr>working</div></div=
><div><br></div><div>You can build a firestone openbmc image from that repo=
sitory to get network working.</div><div><br></div><br><div><blockquote typ=
e=3D"cite"><div><div class=3D"h5"><div>On Nov 16, 2016, at 10:07 AM, Patric=
k Williams &lt;<a href=3D"mailto:patrick@stwcx.xyz" target=3D"_blank">patri=
ck@stwcx.xyz</a>&gt; wrote:</div><br class=3D"m_-6438807914474286684Apple-i=
nterchange-newline"></div></div><div><div><div><div class=3D"h5">On Wed, No=
v 16, 2016 at 07:03:44PM +0800, Hann Wang wrote:<br><blockquote type=3D"cit=
e">I add BCM54210E drvier to linux kernel, my machine can get IP from DHCP<=
br>serverip now.<br>I try access internet is good, but I can&#39;t access l=
ocal network.<br>I can ping my laptop in local network, but ssh/telnet/tftp=
 doesn&#39;t work.<br>I access from another laptop to my laptop is ok.<br><=
/blockquote><br>That sounds like the subnet mask is wrong?=C2=A0 Have you c=
onfirmed<br>&#39;ifconfig&#39; and &#39;route&#39; look correct?<br><br>-- =
<br>Patrick Williams<br></div></div>______________________________<wbr>____=
_____________<br>openbmc mailing list<br><a href=3D"mailto:openbmc@lists.oz=
labs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a><br><a href=3D"http=
s://lists.ozlabs.org/listinfo/openbmc" target=3D"_blank">https://lists.ozla=
bs.org/<wbr>listinfo/openbmc</a><br></div></div></blockquote></div><br></di=
v></blockquote></div><br></div></div></div>

--f403045d8fb009967505417abc25--
