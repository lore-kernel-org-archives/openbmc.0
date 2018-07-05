Return-Path: <aaron_ppus@fmad.com>
Authentication-Results: lists.ozlabs.org;
 spf=neutral (mailfrom) smtp.mailfrom=fmad.com
 (client-ip=69.89.30.42; helo=gproxy3-pub.mail.unifiedlayer.com;
 envelope-from=aaron_ppus@fmad.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fmad.com
Authentication-Results: lists.ozlabs.org;
 dkim=policy reason="signing key too small" (768-bit key;
 unprotected) header.d=fmad.com header.i=@fmad.com header.b="s7kULof9"; 
 dkim-atps=neutral
Received: from gproxy3-pub.mail.unifiedlayer.com
 (gproxy3-pub.mail.unifiedlayer.com [69.89.30.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41LsL870kwzF1Qt
 for <openbmc@lists.ozlabs.org>; Thu,  5 Jul 2018 19:01:51 +1000 (AEST)
Received: from cmgw12.unifiedlayer.com (unknown [10.9.0.12])
 by gproxy3.mail.unifiedlayer.com (Postfix) with ESMTP id 81B1240567
 for <openbmc@lists.ozlabs.org>; Thu,  5 Jul 2018 02:34:22 -0600 (MDT)
Received: from box313.bluehost.com ([69.89.31.113]) by cmsmtp with ESMTP
 id aziWfb24zBMJeaziWfnA9n; Thu, 05 Jul 2018 02:34:21 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fmad.com;
 s=default; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:References:
 In-Reply-To:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=q8onWC94JjYMhdUxK/1I5iOexN/YiVemarbPzW0YV1A=; b=s7kULof9pRKULoPaRAbvsb9siJ
 g2QwWtmKYJrzdSHPdWEspRYy+s6hr0zF8r6/z1J3KhVDkw31Z2v/76PGbO9+TlJS+PaoWcgtYT89o
 HGzMjZ/au/rUEVnbkc3OuVIuR;
Received: from mail-oi0-f43.google.com ([209.85.218.43]:44286)
 by box313.bluehost.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.91) (envelope-from <aaron_ppus@fmad.com>) id 1faziY-001IV4-5l
 for openbmc@lists.ozlabs.org; Thu, 05 Jul 2018 02:34:22 -0600
Received: by mail-oi0-f43.google.com with SMTP id s198-v6so15268116oih.11
 for <openbmc@lists.ozlabs.org>; Thu, 05 Jul 2018 01:34:22 -0700 (PDT)
X-Gm-Message-State: APt69E3aZM5qMUkh+Pu0RyIkxVYkpR4vBx0el85HaN8g9UgM1xyimX+D
 5OM9W7VoLpfm5HAWEZP/ulSGMNBnAOsvzV+YoA==
X-Google-Smtp-Source: AAOMgpfycX63xtCo/uAhIWzEkU132XUZIVZP4x2wwDOAdSvhLYHYgPWR76Z1pDhehUxr366TxX7sMhfhYs9YNzlJzwA=
X-Received: by 2002:aca:5347:: with SMTP id
 h68-v6mr6123814oib.281.1530779661570; 
 Thu, 05 Jul 2018 01:34:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aca:ce05:0:0:0:0:0 with HTTP;
 Thu, 5 Jul 2018 01:34:21 -0700 (PDT)
In-Reply-To: <CABq4n+SRBLfsp+_U14DzjkaC88tHEwJAxpnw2E-UAWXnur7QSg@mail.gmail.com>
References: <CABq4n+T4aZ+iPerYDOrh8KJ09rxyUC96h-Qhvvznjz0AQuQ7Rg@mail.gmail.com>
 <CAARXrtmU-kfvyyWWbmM47AHoD5219bGnqgNTNY7O8JakvVt9XA@mail.gmail.com>
 <CABq4n+SRBLfsp+_U14DzjkaC88tHEwJAxpnw2E-UAWXnur7QSg@mail.gmail.com>
From: Aaron <aaron_ppus@fmad.com>
Date: Thu, 5 Jul 2018 17:34:21 +0900
X-Gmail-Original-Message-ID: <CABq4n+TD_L07cbhYe34zsQMgEbKY5o4+XTJuEnZ3NJFe9i6fUw@mail.gmail.com>
Message-ID: <CABq4n+TD_L07cbhYe34zsQMgEbKY5o4+XTJuEnZ3NJFe9i6fUw@mail.gmail.com>
Subject: Re: Netboot full image loading AST2400
To: Lei YU <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000f51ba205703c6971"
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - box313.bluehost.com
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - fmad.com
X-BWhitelist: no
X-Source-IP: 209.85.218.43
X-Source-L: No
X-Exim-ID: 1faziY-001IV4-5l
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: mail-oi0-f43.google.com [209.85.218.43]:44286
X-Source-Auth: aaron_ppus@fmad.com
X-Email-Count: 1
X-Source-Cap: Zm1hZGNvbTtmbWFkY29tO2JveDMxMy5ibHVlaG9zdC5jb20=
X-Org: HG=bhcustomer;ORG=bluehost;
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
X-List-Received-Date: Thu, 05 Jul 2018 09:01:55 -0000

--000000000000f51ba205703c6971
Content-Type: text/plain; charset="UTF-8"

After some hacking on  obmc-init it turns out theres an even easier way to
do this via kernel boot commands.

Just need

1) set  "openbmc-init-download-files" as kernel boot arg

2) create new env var to tftp over the ro image

env set openbmcinitdownloadurl tftp://192.168.2.136/image-rofs

3) copy from the deploy/images directory the  image-rofs file to tftp root.

ast# env print
1c800b5b=0
baudrate=115200
bootargs=console=ttyS4,115200n8 root=/dev/ram rw openbmc-init-download-files
bootcmd=tftpboot 40a00000 image-current;bootm 40a80000;
bootdelay=2
ethact=FTGMAC100#0
ethaddr=00:24:EC:F0:55:6B
ipaddr=192.168.2.143
openbmcinitdownloadurl=tftp://192.168.2.136/image-rofs
serverip=192.168.2.136
spi_dma=yes
stderr=serial
stdin=serial
stdout=serial
verify=yes

Environment size: 411/65531 bytes
ast#

What I cant work out is how to get the eth0 IP set before init runs, so
hacked it into obmc-init for now.

Aaron


On 20 June 2018 at 03:44, Aaron <aaron_ppus@fmad.com> wrote:

> Nice thanks. Kind of curious why alot of the AST2400 BMC images limit RAM
> to 210MB or so. Perhaps its so you can load the full image in the reserved
> ram?
>
> On 19 June 2018 at 11:17, Lei YU <mine260309@gmail.com> wrote:
>
>> > It seems like there would an easy way to do this for
>> development/bringup, asking instead of hacking on the code for a change.
>> >
>> > Im bringing up a system by loading an image via u-boot across the
>> network into the upper section of ram, then booting from there. It
>> relocates itself to the reset vector and generally works well.
>>
>> You could refer to
>> https://lists.ozlabs.org/pipermail/openbmc/2017-December/010264.html
>> for TFTP kernel + NFS rootfs boot.
>>
>
>

--000000000000f51ba205703c6971
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">After some hacking on=C2=A0 obmc-init it turns out theres =
an even easier way to do this via kernel boot commands.<div><br></div><div>=
Just need</div><div><br></div><div>1) set=C2=A0 &quot;<span style=3D"font-s=
ize:small;background-color:rgb(255,255,255);text-decoration-style:initial;t=
ext-decoration-color:initial;float:none;display:inline">openbmc-init-downlo=
ad-files</span>&quot; as kernel boot arg</div><div><br></div><div>2) create=
 new env var to tftp over the ro image</div><div><br></div><div>

<div style=3D"font-size:small;background-color:rgb(255,255,255);text-decora=
tion-style:initial;text-decoration-color:initial">env set openbmcinitdownlo=
adurl tftp://<a href=3D"http://192.168.2.136/image-rofs">192.168.2.136/imag=
e-rofs</a></div><div><br></div>3) copy from the deploy/images directory the=
=C2=A0 image-rofs file to tftp root.<br class=3D"gmail-Apple-interchange-ne=
wline"></div><div><br></div><div><div><div>ast# env print</div><div>1c800b5=
b=3D0</div><div>baudrate=3D115200</div><div>bootargs=3Dconsole=3DttyS4,1152=
00n8 root=3D/dev/ram rw openbmc-init-download-files</div><div>bootcmd=3Dtft=
pboot 40a00000 image-current;bootm 40a80000;</div><div>bootdelay=3D2</div><=
div>ethact=3DFTGMAC100#0</div><div>ethaddr=3D00:24:EC:F0:55:6B</div><div>ip=
addr=3D192.168.2.143</div><div>openbmcinitdownloadurl=3Dtftp://<a href=3D"h=
ttp://192.168.2.136/image-rofs">192.168.2.136/image-rofs</a></div><div>serv=
erip=3D192.168.2.136</div><div>spi_dma=3Dyes</div><div>stderr=3Dserial</div=
><div>stdin=3Dserial</div><div>stdout=3Dserial</div><div>verify=3Dyes</div>=
<div><br></div><div>Environment size: 411/65531 bytes</div><div>ast#</div><=
/div><div><br></div><div>What I cant work out is how to get the eth0 IP set=
 before init runs, so hacked it into obmc-init for now.</div><div><br></div=
><div>Aaron</div><div><br></div></div></div><div class=3D"gmail_extra"><br>=
<div class=3D"gmail_quote">On 20 June 2018 at 03:44, Aaron <span dir=3D"ltr=
">&lt;<a href=3D"mailto:aaron_ppus@fmad.com" target=3D"_blank">aaron_ppus@f=
mad.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D=
"ltr">Nice thanks. Kind of curious why alot of the AST2400 BMC images limit=
 RAM to 210MB or so. Perhaps its so you can load the full image in the rese=
rved ram?</div><div class=3D"HOEnZb"><div class=3D"h5"><div class=3D"gmail_=
extra"><br><div class=3D"gmail_quote">On 19 June 2018 at 11:17, Lei YU <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:mine260309@gmail.com" target=3D"_blank"=
>mine260309@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><span>&gt; It seems like there would an easy way to do this for developm=
ent/bringup, asking instead of hacking on the code for a change.<br>
&gt;<br>
&gt; Im bringing up a system by loading an image via u-boot across the netw=
ork into the upper section of ram, then booting from there. It relocates it=
self to the reset vector and generally works well.<br>
<br>
</span>You could refer to<br>
<a href=3D"https://lists.ozlabs.org/" target=3D"_blank">https://lists.ozlab=
s.org/</a>piper<wbr>mail/openbmc/2017-December/<wbr>010264.html<br>
for TFTP kernel + NFS rootfs boot.<br>
</blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--000000000000f51ba205703c6971--
