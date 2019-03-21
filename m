Return-Path: <tajudheenk@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=tajudheenk@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hX4t1Afi"; 
 dkim-atps=neutral
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44QBym1RsWzDqRm
 for <openbmc@lists.ozlabs.org>; Fri, 22 Mar 2019 03:27:26 +1100 (AEDT)
Received: by mail-wm1-x334.google.com with SMTP id o10so2398763wmc.1
 for <openbmc@lists.ozlabs.org>; Thu, 21 Mar 2019 09:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fyXucGNKVCpDjc8tq3ZBJt/wdxXjPB2kUHMdqK8ogOw=;
 b=hX4t1AfiUQw2R/Zd5aNqOoC/RbYoSESquVQ+y8E/bIwnGSx+pDN04RuSNKVdqI5Sqx
 7B6r1mYBGEYFPI1dKLRSfQwNeoWnaRMp5u5W+jgFifqBp6RAuq0Djw000v2UOMqA22u5
 yU1/CB3JO0eb3wO/gtHfbjAdgUnJpTru2FNNYHqlYKPVs1oBzg4SeHoL3SP7RSjDcQEM
 U/RWmUCZGDDX+onVH437HC707eUb+nFXx6RqF1LXrftVYzN5NmdQHrVPAra2dhM/M8Zs
 xbbtArAf/PQ94xmcGM+5RO/E1Nae/A8CrAssav4LWnGUdAMXIJTNDUG8x/85WQXAqcGj
 L3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fyXucGNKVCpDjc8tq3ZBJt/wdxXjPB2kUHMdqK8ogOw=;
 b=OTTQbR76afqV/IMJjCviNxl0EDHxJBy5/Ffsanq8f5aRwqG0uFu08Sv0cxUWXaVGfQ
 NLWetXwd/E8Om+J1LK1UzaUiQ3pzRF4JCqe8M7j4Vh2STUnE0Mk+JoxElngacUDzwxJG
 GSIQFF7HcDugrwDL8UvEzrj55K6sqwR/V8EhhGimyfBICeyO2Z0TxwzOKm+rTdp+UQJm
 VaGlJa6p7P3rmn0Ehc/XVlUWCwXea4zcAREFqzQpOvyi7RsIXNqaxGaBBgIu6NbdHaYv
 T2x7gZNGuo8A4CDSSHEV0jojhDch38P66OJEZphHqfoOPdYNA0AhGrMYNTD9dVwkl9if
 QhNw==
X-Gm-Message-State: APjAAAUhJhXMTeSveibf1+P4xB1oMNcglEQ+LjpZ4s+xi3sWy2s/jXw3
 3dCSgYkqgEi37hX49gGoxd4aONSM5IBobseJy9A=
X-Google-Smtp-Source: APXvYqxXmoeU9GHLeNcLAu5SxOUP6vgZf2FMakqkx274BmdW3IDZRC2LBKRAcethAU4AYGRnoIVA8JweMHhp9EbBcnQ=
X-Received: by 2002:a1c:5459:: with SMTP id p25mr99281wmi.20.1553185642715;
 Thu, 21 Mar 2019 09:27:22 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_2EF1C4452C43ADF74A37DF04@qq.com>
 <fa618273-b2e8-3d53-9c28-91f01fd83c05@linux.intel.com>
 <tencent_77BC148C0E378EFD5F488CE6@qq.com>
 <fa79e3d3-cc85-ba90-42b7-2e6ef69f6653@linux.intel.com>
 <CAARXrtn+ghtcdPLBDVMrMtX31==ZufsuPDCKm11dd92zQwm22A@mail.gmail.com>
 <fb4ea162-ae50-5c02-eea6-3adb200e6ed8@linux.intel.com>
 <e592f504-b7b4-ff40-543c-84e99502e1d1@linux.intel.com>
 <CAARXrt=wgz7zqDWpx3inzBnMJJdxQ=b5ebLrna1H8A5kXc4r5w@mail.gmail.com>
 <2d44c252-94b6-6441-d3e8-a8200d89aaa5@linux.intel.com>
 <CAARXrtkkmxHcgvkp1Mi8esY0onqdHxRzaymcf8NaBZSM9uVYRQ@mail.gmail.com>
 <CAH2KKeajTT96Y6rOdKGct+EBLdbFxGo97SEfWzMrcu0hqRh_Hw@mail.gmail.com>
 <77cb1f2b-96c5-bd14-eab7-0da527343ce1@linux.intel.com>
 <CAARXrtnAURfEDzTHZLHgOojRuD9T4DbUmuQLwvwsS4hvW-Sk_Q@mail.gmail.com>
 <bbc0ffe8-b30d-7d64-807a-b179a596a9ff@linux.intel.com>
In-Reply-To: <bbc0ffe8-b30d-7d64-807a-b179a596a9ff@linux.intel.com>
From: Thaju <tajudheenk@gmail.com>
Date: Thu, 21 Mar 2019 21:57:10 +0530
Message-ID: <CAH2KKeb2Jw+j4wOSEHY1HQwnyHxq9-9RSRKQ-shvdiBOvUf14w@mail.gmail.com>
Subject: Re: Does obmc-ikvm work with bmcweb?
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Lei YU <mine260309@gmail.com>, xiuzhi <1450335857@qq.com>, 
 openbmc <openbmc@lists.ozlabs.org>, ed <ed@tanous.net>, 
 Eddie James <eajames@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="0000000000008121f505849d36be"
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
X-List-Received-Date: Thu, 21 Mar 2019 16:27:29 -0000

--0000000000008121f505849d36be
Content-Type: text/plain; charset="UTF-8"

Hi Jae,

It works. Found one issue which is explained below.

I have applied below 3 patches:
https://gerrit.openbmc-project.xyz/c/openbmc/obmc-ikvm/+/19392
https://gerrit.openbmc-project.xyz/c/openbmc/obmc-ikvm/+/19433
https://gerrit.openbmc-project.xyz/c/openbmc/obmc-ikvm/+/19393

I can confirm that:
1. KVM video appears fine in webui
2. All keyboard characters works fine.
3. Both mouse buttons works fine (with patch)

Now the issue is when host OS ( RHEL 7.5 in my case ) goes to power saving
mode (black screen) after some N mins (depends on OS settings), looks like
it does not accept the KVM HID events, it doesn't wake up from power saving
mode through KVM. I see below error when this happens.

Mar 21 09:31:43  obmc-ikvm[1408]: Failed to query timings
Mar 21 09:31:43  kernel: aspeed-video 1e700000.video: Timed out; first mode
detect
Mar 21 09:31:44  kernel: aspeed-video 1e700000.video: Timed out when
stopping streaming
Mar 21 09:31:45  kernel: aspeed-video 1e700000.video: Timed out; first mode
detect
Mar 21 09:31:46  kernel: aspeed-video 1e700000.video: Timed out; first mode
detect
Mar 21 09:31:47  env[1408]: 21/03/2019 09:31:47 Sending
rfbEncodingNewFBSize for resize to (640x480)
Mar 21 09:31:48  obmc-ikvm[1408]: Failed to query timings
Mar 21 09:31:49  kernel: aspeed-video 1e700000.video: Timed out; first mode
detect
Mar 21 09:31:50  obmc-ikvm[1408]: Failed to query timings
Mar 21 09:31:51  kernel: aspeed-video 1e700000.video: Timed out; first mode
detect
Mar 21 09:31:52  obmc-ikvm[1408]: Failed to query timings
Mar 21 09:31:53  kernel: aspeed-video 1e700000.video: Timed out; first mode
detect

On this state, I used physical keyboard on the host OS to bring it back
from power saving mode and I see KVM also comes back. I have also tried
setting the power saving timeout to "never". It works fine.

To recreate this issue
1. Set power saving timeout to 1 min. (In RHEL 7.5, Settings > Power >
Blank Screen)
2. Leave the host OS to idle for 1 min.
3. You will see screen goes black after 1 min and KVM stops responding.

Hope you understood the issue. Thanks for your support.

Regards,
Thaj

On Thu, Mar 21, 2019 at 9:49 PM Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
wrote:

> Hi Lei,
>
> Are you using a web browser from Windows OS? It seems that there is an
> issue of Windows websockify/novnc. Use a browser from OS other than
> Windows til the issue is resolved.
>
> Did you test it using Tight VNC viewer after enabling external
> connection? The reason why I suggested that is to identify whether
> this issue comes from KVM web proxy or from KVM server.
>
> Need more information of your test environment.
> Server platform:
> BMC SoC:
> Host OS:
>
> Regards,
> Jae
>
> On 3/21/2019 12:02 AM, Lei YU wrote:
> >> Check journal (journalctl -f) while you're testing KVM if there is any
> >> suspicious error. In normal opration, you should see logs like below:
> >
> > I see the same logs as Thaj, only below logs show when the issue occurs.
> >
> > Mar 21 05:26:02 romulus env[1564]: 21/03/2019 05:26:02 Unable to
> > establish connection with systemd socket
> > Mar 21 05:26:02 romulus env[1564]: 21/03/2019 05:26:02 Listening for
> > VNC connections on TCP port 5900
> > Mar 21 05:26:02 romulus env[1564]: 21/03/2019 05:26:02 Listening for
> > VNC connections on TCP6 port 5900
> > Mar 21 05:26:06 romulus env[1564]: 21/03/2019 05:26:06 Got connection
> > from client 127.0.0.1
> > Mar 21 05:26:06 romulus env[1564]: 21/03/2019 05:26:06   other clients:
> > Mar 21 05:26:06 romulus env[1564]: 21/03/2019 05:26:06 Normal socket
> connection
> >
> > And sometimes it works, then I see logs like:
> >
> > Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Normal socket
> connection
> > Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Client Protocol
> > Version 3.8
> > Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Protocol
> > version sent 3.8, using 3.8
> > Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12
> > rfbProcessClientSecurityType: executing handler for type 1
> > Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12
> > rfbProcessClientSecurityType: returning securityResult for client rfb
> > version >= 3.8
> > Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Pixel format
> > for client 192.168.10.11:
> > Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12   32 bpp, depth
> > 24, little endian
> > Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12   true colour:
> > max r 255 g 255 b 255, shift r 16 g 8 b 0
> > Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Using
> > compression level 1 for client 192.168.10.11
> > Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Using image
> > quality level 6 for client 192.168.10.11
> > Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Using JPEG
> > subsampling 0, Q79 for client 192.168.10.11
> > Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Enabling
> > X-style cursor updates for client 192.168.10.11
> > Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Enabling
> > full-color cursor updates for client 192.168.10.11
> > Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Enabling cursor
> > position updates for client 192.168.10.11
> > Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Enabling
> > LastRect protocol extension for client 192.168.10.11
> > Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Using tight
> > encoding for client 192.168.10.11
> >
> > It's found that the VNC server may work when the screen is changed, e.g.
> > reboot the OS, or enter the OS.
> > When OS is in idle, usually it will not work.
> >
> >> Also, try these two patches. I added one more patch.
> >> https://gerrit.openbmc-project.xyz/c/openbmc/obmc-ikvm/+/19392
> >> https://gerrit.openbmc-project.xyz/c/openbmc/obmc-ikvm/+/19433
> >
> > Tried the patches, still the same issue as above.
> >
>

--0000000000008121f505849d36be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Jae,<div><br></div><div>It works. Foun=
d one issue which is explained below.</div><div><br></div><div>I have appli=
ed below 3 patches:</div><div><a href=3D"https://gerrit.openbmc-project.xyz=
/c/openbmc/obmc-ikvm/+/19392">https://gerrit.openbmc-project.xyz/c/openbmc/=
obmc-ikvm/+/19392</a><br></div><div><a href=3D"https://gerrit.openbmc-proje=
ct.xyz/c/openbmc/obmc-ikvm/+/19433">https://gerrit.openbmc-project.xyz/c/op=
enbmc/obmc-ikvm/+/19433</a><br></div><div><a href=3D"https://gerrit.openbmc=
-project.xyz/c/openbmc/obmc-ikvm/+/19393">https://gerrit.openbmc-project.xy=
z/c/openbmc/obmc-ikvm/+/19393</a><br></div><div><br></div><div>I can confir=
m that:</div><div>1. KVM video appears fine in webui</div><div>2. All keybo=
ard characters works fine.</div><div>3. Both mouse buttons works fine (with=
 patch)</div><div><br></div><div>Now the issue is when host OS ( RHEL 7.5 i=
n my case ) goes to power saving mode (black screen) after some N mins (dep=
ends on OS settings), looks like it does not accept the KVM HID events, it =
doesn&#39;t wake up from power saving mode through KVM. I see below error w=
hen this happens.</div><div><br></div><div><div>Mar 21 09:31:43=C2=A0 obmc-=
ikvm[1408]: Failed to query timings</div><div>Mar 21 09:31:43=C2=A0 kernel:=
 aspeed-video 1e700000.video: Timed out; first mode detect</div><div>Mar 21=
 09:31:44=C2=A0 kernel: aspeed-video 1e700000.video: Timed out when stoppin=
g streaming</div><div>Mar 21 09:31:45=C2=A0 kernel: aspeed-video 1e700000.v=
ideo: Timed out; first mode detect</div><div>Mar 21 09:31:46=C2=A0 kernel: =
aspeed-video 1e700000.video: Timed out; first mode detect</div><div>Mar 21 =
09:31:47=C2=A0 env[1408]: 21/03/2019 09:31:47 Sending rfbEncodingNewFBSize =
for resize to (640x480)</div><div>Mar 21 09:31:48=C2=A0 obmc-ikvm[1408]: Fa=
iled to query timings</div><div>Mar 21 09:31:49=C2=A0 kernel: aspeed-video =
1e700000.video: Timed out; first mode detect</div><div>Mar 21 09:31:50=C2=
=A0 obmc-ikvm[1408]: Failed to query timings</div><div>Mar 21 09:31:51=C2=
=A0 kernel: aspeed-video 1e700000.video: Timed out; first mode detect</div>=
<div>Mar 21 09:31:52=C2=A0 obmc-ikvm[1408]: Failed to query timings</div><d=
iv>Mar 21 09:31:53=C2=A0 kernel: aspeed-video 1e700000.video: Timed out; fi=
rst mode detect</div></div><div><br></div><div>On this state, I used physic=
al keyboard on the host OS to bring it back from power saving mode and I se=
e KVM also comes back. I have also tried setting the power saving timeout t=
o &quot;never&quot;. It works fine.</div><div><br></div><div>To recreate th=
is issue</div><div>1. Set power saving timeout to 1 min. (In RHEL 7.5, Sett=
ings &gt; Power &gt; Blank Screen)</div><div>2. Leave the host OS to idle f=
or 1 min.</div><div>3. You will see screen goes black after 1 min and KVM s=
tops responding.=C2=A0</div><div><br></div><div>Hope you understood the iss=
ue. Thanks for your support.</div></div><div dir=3D"ltr"><br></div><div>Reg=
ards,</div><div>Thaj</div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Thu, Mar 21, 2019 at 9:49 PM Jae Hyun Yoo &lt;=
<a href=3D"mailto:jae.hyun.yoo@linux.intel.com">jae.hyun.yoo@linux.intel.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Hi Lei,<br>
<br>
Are you using a web browser from Windows OS? It seems that there is an<br>
issue of Windows websockify/novnc. Use a browser from OS other than<br>
Windows til the issue is resolved.<br>
<br>
Did you test it using Tight VNC viewer after enabling external<br>
connection? The reason why I suggested that is to identify whether<br>
this issue comes from KVM web proxy or from KVM server.<br>
<br>
Need more information of your test environment.<br>
Server platform:<br>
BMC SoC:<br>
Host OS:<br>
<br>
Regards,<br>
Jae<br>
<br>
On 3/21/2019 12:02 AM, Lei YU wrote:<br>
&gt;&gt; Check journal (journalctl -f) while you&#39;re testing KVM if ther=
e is any<br>
&gt;&gt; suspicious error. In normal opration, you should see logs like bel=
ow:<br>
&gt; <br>
&gt; I see the same logs as Thaj, only below logs show when the issue occur=
s.<br>
&gt; <br>
&gt; Mar 21 05:26:02 romulus env[1564]: 21/03/2019 05:26:02 Unable to<br>
&gt; establish connection with systemd socket<br>
&gt; Mar 21 05:26:02 romulus env[1564]: 21/03/2019 05:26:02 Listening for<b=
r>
&gt; VNC connections on TCP port 5900<br>
&gt; Mar 21 05:26:02 romulus env[1564]: 21/03/2019 05:26:02 Listening for<b=
r>
&gt; VNC connections on TCP6 port 5900<br>
&gt; Mar 21 05:26:06 romulus env[1564]: 21/03/2019 05:26:06 Got connection<=
br>
&gt; from client 127.0.0.1<br>
&gt; Mar 21 05:26:06 romulus env[1564]: 21/03/2019 05:26:06=C2=A0 =C2=A0oth=
er clients:<br>
&gt; Mar 21 05:26:06 romulus env[1564]: 21/03/2019 05:26:06 Normal socket c=
onnection<br>
&gt; <br>
&gt; And sometimes it works, then I see logs like:<br>
&gt; <br>
&gt; Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Normal socket c=
onnection<br>
&gt; Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Client Protocol=
<br>
&gt; Version 3.8<br>
&gt; Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Protocol<br>
&gt; version sent 3.8, using 3.8<br>
&gt; Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12<br>
&gt; rfbProcessClientSecurityType: executing handler for type 1<br>
&gt; Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12<br>
&gt; rfbProcessClientSecurityType: returning securityResult for client rfb<=
br>
&gt; version &gt;=3D 3.8<br>
&gt; Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Pixel format<br=
>
&gt; for client <a href=3D"http://192.168.10.11" rel=3D"noreferrer" target=
=3D"_blank">192.168.10.11</a>:<br>
&gt; Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12=C2=A0 =C2=A032 =
bpp, depth<br>
&gt; 24, little endian<br>
&gt; Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12=C2=A0 =C2=A0tru=
e colour:<br>
&gt; max r 255 g 255 b 255, shift r 16 g 8 b 0<br>
&gt; Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Using<br>
&gt; compression level 1 for client 192.168.10.11<br>
&gt; Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Using image<br>
&gt; quality level 6 for client 192.168.10.11<br>
&gt; Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Using JPEG<br>
&gt; subsampling 0, Q79 for client 192.168.10.11<br>
&gt; Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Enabling<br>
&gt; X-style cursor updates for client 192.168.10.11<br>
&gt; Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Enabling<br>
&gt; full-color cursor updates for client 192.168.10.11<br>
&gt; Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Enabling cursor=
<br>
&gt; position updates for client 192.168.10.11<br>
&gt; Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Enabling<br>
&gt; LastRect protocol extension for client 192.168.10.11<br>
&gt; Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Using tight<br>
&gt; encoding for client 192.168.10.11<br>
&gt; <br>
&gt; It&#39;s found that the VNC server may work when the screen is changed=
, e.g.<br>
&gt; reboot the OS, or enter the OS.<br>
&gt; When OS is in idle, usually it will not work.<br>
&gt; <br>
&gt;&gt; Also, try these two patches. I added one more patch.<br>
&gt;&gt; <a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/obmc-ikvm/=
+/19392" rel=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc-projec=
t.xyz/c/openbmc/obmc-ikvm/+/19392</a><br>
&gt;&gt; <a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/obmc-ikvm/=
+/19433" rel=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc-projec=
t.xyz/c/openbmc/obmc-ikvm/+/19433</a><br>
&gt; <br>
&gt; Tried the patches, still the same issue as above.<br>
&gt; <br>
</blockquote></div>

--0000000000008121f505849d36be--
