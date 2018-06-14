Return-Path: <chou.brad@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::244; helo=mail-it0-x244.google.com;
 envelope-from=chou.brad@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kaVPYBRo"; 
 dkim-atps=neutral
Received: from mail-it0-x244.google.com (mail-it0-x244.google.com
 [IPv6:2607:f8b0:4001:c0b::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 415xWW66LLzDrpC
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jun 2018 18:25:10 +1000 (AEST)
Received: by mail-it0-x244.google.com with SMTP id a3-v6so7578074itd.0
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jun 2018 01:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=R4o3/A09qWRoLvDbi5CbOVknSUlXCVzPMaeLX1HB4CM=;
 b=kaVPYBRoBcNKZXTGqLCCzrkOo3kcpiuBXP7AmiIzHkB5/YK8DbmImAWPXTPybkdmVn
 e47rLaSzoP+BmKUFLNBo5CwsKoM0SCnrSgv/Nm1CMV28lUov2nLmRV1ExZUO2wT7QZNn
 L0gd/t5o2k9/zFYXQEhbzFZ//oVu3UfkK91FQRMcC08vvAQLHPRHgqUGQchGCyXbNFmU
 HqMoCDRTe34GbZw/UWwVvDE9a0RIlZp/22vKL03p8jY+Kt2AwDQpPIOY+4boene1dGDs
 Uz+HKo4F7Vq1AbwozmNAyPSkisiH8DU7YFCD3vkFjK2rnOQQpfqW5axtR31EMMtV6Kl6
 dilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=R4o3/A09qWRoLvDbi5CbOVknSUlXCVzPMaeLX1HB4CM=;
 b=hGeIw86DqWwYlewqnldECVckqxxhZSBof+ebgYmT71hJmuSyQjd/p89xl5EioTC9AT
 acboPHgu4Td/Yh466YC6YqXdUeoX5FpdaWEqRR7JZ6FwRHt1NINiTSASm/ySir7gCVqb
 7r9FCg0vGZBiq7dIIw6xyy1pcHzW4OEZFPEnyk6dvs8q+v0t2gw55IgdQmbphMFYvKAR
 gkOLTY0YMEOTXUNzsH8zuA3ONQgvd6zDFLZ7esK1K2MHTAddomShf/beTKJCyONHhXY+
 LlGa0lhMVuEN6Wvf0BOM4Xx+B2Ei127AhyVgNYo7OO3RBiTxoZD8FgHLj/PeSG+1SAgm
 waGw==
X-Gm-Message-State: APt69E1EWKoZ4tGv0hV6n1j+WtyE0mDWzLcrzLxkQ/p25uYexn+qijOj
 eQANrUl9B/nqzQ9lmj0SWzph9lNZZP1KB22HGM4=
X-Google-Smtp-Source: ADUXVKK1hrKCJaD8DrsOVSKhArz4iJc7MGsnv1UhDmeQHUwGB/QhOnaFgAyIUCIJM+0bHGa/By2OxN2Kmv0T/J4sB78=
X-Received: by 2002:a24:ba1a:: with SMTP id
 p26-v6mr1366504itf.116.1528964708992; 
 Thu, 14 Jun 2018 01:25:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4f:4d8b:0:0:0:0:0 with HTTP; Thu, 14 Jun 2018 01:25:08
 -0700 (PDT)
From: Brad Chou <chou.brad@gmail.com>
Date: Thu, 14 Jun 2018 16:25:08 +0800
Message-ID: <CAPt_=C6axmsy5mByx-Zv6QGi6fT3zG6SW5_WdfcOt7vy_faeQQ@mail.gmail.com>
Subject: Re: IPMI KCS support in openbmc Linux
To: "Tanous, Ed" <ed.tanous@intel.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000005a8cd2056e95d6d2"
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
X-List-Received-Date: Thu, 14 Jun 2018 08:25:12 -0000

--0000000000005a8cd2056e95d6d2
Content-Type: text/plain; charset="UTF-8"

Hi Ed,
I have tried to add your patches.
https://gerrit.openbmc-project.xyz/#/c/10946/
https://gerrit.openbmc-project.xyz/#/c/10951/

Also another patch for aspeed-g5.dtsi on
https://patchwork.kernel.org/patch/10263369/

Now, I can see there are kcs devices in /dev/ipmi-kcs, looks like the kcs
driver is working.
But on my OEM x86 board, the BIOS still can't communicate with BMC by kcs.
Do I need to config anything ?
Any tool I can use to test the kcs interface ?

Thanks.


2018-06-04 21:49 GMT+08:00 Tanous, Ed <ed.tanous@intel.com>:

> There is no KCS bridge merged with master yet, although I submitted one
> for code review last week.   Your best bet at making it available on master
> would be to provide review feedback to the Gerrit reviews below, which
> should help get it merged quickly.
>
> https://gerrit.openbmc-project.xyz/#/c/10946/
> https://gerrit.openbmc-project.xyz/#/c/10951/
>
> Alternately, you can simply pull in those commits and add the
> phosphor-ipmi-kcs component to your build while it's in code review.  I
> already have a few reports of people having used it successfully.
>
> -Ed
>
>
> From: openbmc [mailto:openbmc-bounces+ed.tanous=intel.com@lists.ozlabs.org]
> On Behalf Of Brad Chou
> Sent: Sunday, June 3, 2018 10:39 PM
> To: openbmc@lists.ozlabs.org
> Subject: RE: IPMI and Redfish support in openbmc Linux
>
> Hi Ed,
> May I know how to use kcs with host ipmi ?
> Any recipe need to be changed ?
>
> Thanks.
>
>
> On Jun 2, 2018, at 00:46, openbmc-request@lists.ozlabs.org wrote:
>
> A subset of Ipmi 2.0 is provided by the Ipmi daemons here:
> https://github.com/openbmc/phosphor-host-ipmid
> https://github.com/openbmc/phosphor-net-ipmid
>
> Net IPMI supports the out of band ipmi over network.  Host ipmi supports
> in band ipmi over kcs or block transfer.
>
> There are several servers that support Redfish, and we have a working
> group that meets weekly to talk through technical issues each week, which
> you're welcome to attend.  The only one checked into the upstream project
> is bmcweb.  If you need help getting it started, I'm happy to help.
> https://github.com/openbmc/bmcweb
>
> Yes, ipmitool works compiles for the target, and includes an extra
> transport to be able to connect directly to dbus and do ipmi transactions
> from there.
>
> -Ed
>
> From: openbmc [mailto:openbmc-bounces+ed.tanous=intel.com@lists.ozlabs.org]
> On Behalf Of AKASH G J
> Sent: Friday, June 1, 2018 2:23 AM
> To: openbmc@lists.ozlabs.org
> Subject: IPMI and Redfish support in openbmc Linux
>
> Hi Team,
>
> I build the Linux image using the steps given in
> https://github.com/openbmc/openbmc, target machine as Zaius. Whether
> support is available for IPMI 2.0 and Redfish interface? Is it possible to
> use ipmitool in the cross compiled Linux?
>
>

--0000000000005a8cd2056e95d6d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Ed,</div><div>I have tried to add your patches.</d=
iv><div>
<a href=3D"https://gerrit.openbmc-project.xyz/#/c/10946/" rel=3D"noreferrer=
" target=3D"_blank">https://gerrit.openbmc-<wbr>project.xyz/#/c/10946/</a><=
br>
<a href=3D"https://gerrit.openbmc-project.xyz/#/c/10951/" rel=3D"noreferrer=
" target=3D"_blank">https://gerrit.openbmc-<wbr>project.xyz/#/c/10951/</a>

<br></div><div><br></div><div>Also another patch for aspeed-g5.dtsi on <br>=
</div><div><a href=3D"https://patchwork.kernel.org/patch/10263369/">https:/=
/patchwork.kernel.org/patch/10263369/</a></div><div><br></div><div> Now, I =
can see there are kcs devices in /dev/ipmi-kcs, looks like the kcs driver i=
s working.<br></div><div>But on my OEM x86 board, the BIOS still can&#39;t =
communicate with BMC by kcs.</div><div>Do I need to config anything ?</div>=
<div>Any tool I can use to test the kcs interface ?<br></div><div><br></div=
><div>Thanks.</div><div><br></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">2018-06-04 21:49 GMT+08:00 Tanous, Ed <span dir=3D"ltr">&l=
t;<a href=3D"mailto:ed.tanous@intel.com" target=3D"_blank">ed.tanous@intel.=
com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">There is no KCS bridg=
e merged with master yet, although I submitted one for code review last wee=
k.=C2=A0 =C2=A0Your best bet at making it available on master would be to p=
rovide review feedback to the Gerrit reviews below, which should help get i=
t merged quickly.<br>
<br>
<a href=3D"https://gerrit.openbmc-project.xyz/#/c/10946/" rel=3D"noreferrer=
" target=3D"_blank">https://gerrit.openbmc-<wbr>project.xyz/#/c/10946/</a><=
br>
<a href=3D"https://gerrit.openbmc-project.xyz/#/c/10951/" rel=3D"noreferrer=
" target=3D"_blank">https://gerrit.openbmc-<wbr>project.xyz/#/c/10951/</a><=
br>
<br>
Alternately, you can simply pull in those commits and add the phosphor-ipmi=
-kcs component to your build while it&#39;s in code review.=C2=A0 I already=
 have a few reports of people having used it successfully. <br>
<br>
-Ed<br>
<br>
<br>
From: openbmc [mailto:<a href=3D"mailto:openbmc-bounces%2Bed.tanous">openbm=
c-bounces+ed.<wbr>tanous</a>=3D<a href=3D"mailto:intel.com@lists.ozlabs.org=
">intel.com@lists.ozlabs.<wbr>org</a>] On Behalf Of Brad Chou<br>
Sent: Sunday, June 3, 2018 10:39 PM<br>
To: <a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a=
><br>
Subject: RE: IPMI and Redfish support in openbmc Linux<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
Hi Ed,<br>
May I know how to use kcs with host ipmi ?<br>
Any recipe need to be changed ?<br>
<br>
Thanks.<br>
<br>
<br>
On Jun 2, 2018, at 00:46, <a href=3D"mailto:openbmc-request@lists.ozlabs.or=
g">openbmc-request@lists.ozlabs.<wbr>org</a> wrote:<br>
<br>
A subset of Ipmi 2.0 is provided by the Ipmi daemons here:<br>
<a href=3D"https://github.com/openbmc/phosphor-host-ipmid" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/openbmc/<wbr>phosphor-host-ipmid</a=
><br>
<a href=3D"https://github.com/openbmc/phosphor-net-ipmid" rel=3D"noreferrer=
" target=3D"_blank">https://github.com/openbmc/<wbr>phosphor-net-ipmid</a><=
br>
<br>
Net IPMI supports the out of band ipmi over network.=C2=A0 Host ipmi suppor=
ts in band ipmi over kcs or block transfer.<br>
<br>
There are several servers that support Redfish, and we have a working group=
 that meets weekly to talk through technical issues each week, which you&#3=
9;re welcome to attend.=C2=A0 The only one checked into the upstream projec=
t is bmcweb.=C2=A0 If you need help getting it started, I&#39;m happy to he=
lp.<br>
<a href=3D"https://github.com/openbmc/bmcweb" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/openbmc/<wbr>bmcweb</a><br>
<br>
Yes, ipmitool works compiles for the target, and includes an extra transpor=
t to be able to connect directly to dbus and do ipmi transactions from ther=
e.<br>
<br>
-Ed<br>
<br>
From: openbmc [mailto:<a href=3D"mailto:openbmc-bounces%2Bed.tanous">openbm=
c-bounces+ed.<wbr>tanous</a>=3D<a href=3D"mailto:intel.com@lists.ozlabs.org=
">intel.com@lists.ozlabs.<wbr>org</a>] On Behalf Of AKASH G J<br>
Sent: Friday, June 1, 2018 2:23 AM<br>
To:=C2=A0<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.o=
rg</a><br>
Subject: IPMI and Redfish support in openbmc Linux<br>
<br>
Hi Team,<br>
<br>
I build the Linux image using the steps given in=C2=A0<a href=3D"https://gi=
thub.com/openbmc/openbmc" rel=3D"noreferrer" target=3D"_blank">https://gith=
ub.com/openbmc/<wbr>openbmc</a>, target machine as Zaius. Whether support i=
s available for IPMI 2.0 and Redfish interface? Is it possible to use ipmit=
ool in the cross compiled Linux?<br>
<br>
</div></div></blockquote></div><br></div></div>

--0000000000005a8cd2056e95d6d2--
