Return-Path: <aaron_ppus@fmad.com>
Authentication-Results: lists.ozlabs.org;
 spf=neutral (mailfrom) smtp.mailfrom=fmad.com
 (client-ip=67.222.38.55; helo=gproxy5-pub.mail.unifiedlayer.com;
 envelope-from=aaron_ppus@fmad.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fmad.com
Authentication-Results: lists.ozlabs.org;
 dkim=policy reason="signing key too small" (768-bit key;
 unprotected) header.d=fmad.com header.i=@fmad.com header.b="KuDK/61t"; 
 dkim-atps=neutral
Received: from gproxy5-pub.mail.unifiedlayer.com
 (gproxy5-pub.mail.unifiedlayer.com [67.222.38.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41RY6q2PHBzF35Q
 for <openbmc@lists.ozlabs.org>; Fri, 13 Jul 2018 10:08:18 +1000 (AEST)
Received: from cmgw15.unifiedlayer.com (unknown [10.9.0.15])
 by gproxy5.mail.unifiedlayer.com (Postfix) with ESMTP id 7AFA8140450
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 18:08:14 -0600 (MDT)
Received: from box313.bluehost.com ([69.89.31.113]) by cmsmtp with ESMTP
 id dld8fg9J6j0sodld8fWIJL; Thu, 12 Jul 2018 18:08:14 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fmad.com;
 s=default; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:References:
 In-Reply-To:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=yS33YuSQTgJK/QnbJzbCwK8glwDr2sXmBEIfJTTHw3c=; b=KuDK/61tRrP2I5etDGhQABbNPj
 chu/ymTj+SZuUG1QTZmnrxzxfCCPttHoQT/lu+PXVLZ90aQqONQYtiGMdH5x8JU5jXOrQH10Z5EEd
 p0TvSmTzB27Ey56JRvVid6wu3;
Received: from mail-oi0-f53.google.com ([209.85.218.53]:37896)
 by box313.bluehost.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.91) (envelope-from <aaron_ppus@fmad.com>) id 1fdld7-002Itg-V0
 for openbmc@lists.ozlabs.org; Thu, 12 Jul 2018 18:08:13 -0600
Received: by mail-oi0-f53.google.com with SMTP id v8-v6so59121394oie.5
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 17:08:13 -0700 (PDT)
X-Gm-Message-State: AOUpUlEHNc3YlFvFMOwyZSTCfWcMq5SO6j9YggjV5F12FSaJixiumQdt
 z1bGDi0hfl+fRm3XSdPjYLnpulzt1uJhweN4YQ==
X-Google-Smtp-Source: AAOMgpdpdlFXp44ERdwjLBmHlAsz/SyPmXdD4iptF7sVUfxMq58PFmD4JrtHTLRwU8GfGOObLCFL/C+QJc6YG3acTkw=
X-Received: by 2002:aca:df42:: with SMTP id
 w63-v6mr4374894oig.295.1531440493474; 
 Thu, 12 Jul 2018 17:08:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aca:ce05:0:0:0:0:0 with HTTP; Thu, 12 Jul 2018 17:08:12
 -0700 (PDT)
In-Reply-To: <41CF8000-5798-4EB4-BACA-C072BFA00F9D@fb.com>
References: <CABq4n+RwYT8UN4EO75DkhMr2zKnPQW-PEbKtYB+Tb1yA_JYawQ@mail.gmail.com>
 <CABq4n+Qw_vq1QZpYdgiB9LofUp0MZchkzXXOqiUC+vyqCKR-KQ@mail.gmail.com>
 <41CF8000-5798-4EB4-BACA-C072BFA00F9D@fb.com>
From: Aaron <aaron_ppus@fmad.com>
Date: Fri, 13 Jul 2018 09:08:12 +0900
X-Gmail-Original-Message-ID: <CABq4n+Q3_=2JEq+F0xJzrnoVndwBsYWS05od97YtvdE=+J4wzQ@mail.gmail.com>
Message-ID: <CABq4n+Q3_=2JEq+F0xJzrnoVndwBsYWS05od97YtvdE=+J4wzQ@mail.gmail.com>
Subject: Re: AST2400 x86 bringup LPC problems
To: Tao Ren <taoren@fb.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000009bc2020570d646eb"
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - box313.bluehost.com
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - fmad.com
X-BWhitelist: no
X-Source-IP: 209.85.218.53
X-Source-L: No
X-Exim-ID: 1fdld7-002Itg-V0
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: mail-oi0-f53.google.com [209.85.218.53]:37896
X-Source-Auth: aaron_ppus@fmad.com
X-Email-Count: 1
X-Source-Cap: Zm1hZGNvbTtmbWFkY29tO2JveDMxMy5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Jul 2018 00:08:20 -0000

--0000000000009bc2020570d646eb
Content-Type: text/plain; charset="UTF-8"

Thanks thats an interesting read and good to know. Was just a dts config
problem, we`re using dual Xeon sockets which boot over SPI.

Cheers
Aaron

On 13 July 2018 at 02:26, Tao Ren <taoren@fb.com> wrote:

> Looks like you are facing the same/similar issue mentioned in below page?
>
>
>
> https://www.anandtech.com/show/11110/semi-critical-intel-atom-c2000-flaw-
> discovered
>
>
>
>
>
> - Tao
>
>
>
> *From: *openbmc <openbmc-bounces+taoren=fb.com@lists.ozlabs.org> on
> behalf of Aaron <aaron_ppus@fmad.com>
> *Date: *Thursday, July 12, 2018 at 7:35 AM
> *To: *OpenBMC Maillist <openbmc@lists.ozlabs.org>
> *Subject: *Re: AST2400 x86 bringup LPC problems
>
>
>
> Per usual found the issue after spamming the list. The LCLK was disabled
> because lpc_ctrl was not setup correctly and error`ed out which cleans up
> and disables the lclk entirely... doh.
>
>
>
> Aaron
>
>
>
> On 12 July 2018 at 16:47, Aaron <aaron_ppus@fmad.com> wrote:
>
> Hi,
>
>
>
> Currently stuck bringup an x86 server board with the AST2400 and looking
> for advice.
>
>
>
> Have based the code on the Quanta machine, theres a bunch of dst changes
> and different gpio / i2c etc mappings. Most things work now, power control,
> can control, gpios are good etc however the LPC is broken.
>
>
>
> What I cant working out is why the LPC interface is completely dead.
>
>
>
> Symptoms are:
>
> - LPC post code sniffer caches nothing
>
> - Host UART is completely missing
>
> - Host IO port range reading returns 0xff`s
>
>
>
> Its as if the LPC block is not being reset or theres no clock or being
> muxed out or something. Been a few days now and still cant work it out.
>
>
>
> Originally thought it was because Strap[14] = 1  (LPC reset not connected
> to PCI reset) but on the board they physically routed PERST to the to the
> pin, so it should be ok.
>
>
>
> Any suggestions or advice ?
>
>
>
> Thanks
>
> Aaron
>
>
>
>
>
>
>

--0000000000009bc2020570d646eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks thats an interesting read and good to know. Was jus=
t a dts config problem, we`re using dual Xeon sockets which boot over SPI.<=
div><br></div><div>Cheers</div><div>Aaron</div></div><div class=3D"gmail_ex=
tra"><br><div class=3D"gmail_quote">On 13 July 2018 at 02:26, Tao Ren <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:taoren@fb.com" target=3D"_blank">taoren@=
fb.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">





<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"m_8337887526448798311WordSection1">
<p class=3D"MsoNormal">Looks like you are facing the same/similar issue men=
tioned in below page?<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><a href=3D"https://www.anandtech.com/show/11110/semi=
-critical-intel-atom-c2000-flaw-discovered" target=3D"_blank">https://www.a=
nandtech.com/<wbr>show/11110/semi-critical-<wbr>intel-atom-c2000-flaw-<wbr>=
discovered</a>
<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">- Tao<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border:none;border-top:solid #b5c4df 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:12.0pt;color:black">From=
: </span></b><span style=3D"font-size:12.0pt;color:black">openbmc &lt;openb=
mc-bounces+taoren=3D<a href=3D"mailto:fb.com@lists.ozlabs.org" target=3D"_b=
lank">fb.<wbr>com@lists.ozlabs.org</a>&gt; on behalf of Aaron &lt;<a href=
=3D"mailto:aaron_ppus@fmad.com" target=3D"_blank">aaron_ppus@fmad.com</a>&g=
t;<br>
<b>Date: </b>Thursday, July 12, 2018 at 7:35 AM<br>
<b>To: </b>OpenBMC Maillist &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org"=
 target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;<br>
<b>Subject: </b>Re: AST2400 x86 bringup LPC problems<u></u><u></u></span></=
p>
</div><div><div class=3D"h5">
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Per usual found the issue after spamming the list. T=
he LCLK was disabled because lpc_ctrl was not setup correctly and error`ed =
out which cleans up and disables the lclk entirely... doh.
<u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Aaron<u></u><u></u></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">On 12 July 2018 at 16:47, Aaron &lt;<a href=3D"mailt=
o:aaron_ppus@fmad.com" target=3D"_blank">aaron_ppus@fmad.com</a>&gt; wrote:=
<u></u><u></u></p>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
<div>
<p class=3D"MsoNormal">Hi, <u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Currently stuck bringup an x86 server board with the=
 AST2400 and looking for advice.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Have based the code on the Quanta machine, theres a =
bunch of dst changes and different gpio / i2c etc mappings. Most things wor=
k now, power control, can control, gpios are good etc however the LPC is br=
oken.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">What I cant working out is why the LPC interface is =
completely dead.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Symptoms are:<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">- LPC post code sniffer caches nothing<u></u><u></u>=
</p>
</div>
<div>
<p class=3D"MsoNormal">- Host UART is completely missing<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">- Host IO port range reading returns 0xff`s=C2=A0<u>=
</u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Its as if the LPC block is not being reset or theres=
 no clock or being muxed out or something. Been a few days now and still ca=
nt work it out.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Originally thought it was because Strap[14] =3D 1=C2=
=A0 (LPC reset not connected to PCI reset) but on the board they physically=
 routed PERST to the to the pin, so it should be ok.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Any suggestions or advice ?<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:#888888">Aaron<u></u><u></u></s=
pan></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:#888888"><u></u>=C2=A0<u></u></=
span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:#888888"><u></u>=C2=A0<u></u></=
span></p>
</div>
</div>
</blockquote>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div></div></div>
</div>

</blockquote></div><br></div>

--0000000000009bc2020570d646eb--
