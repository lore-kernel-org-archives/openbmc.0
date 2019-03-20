Return-Path: <tajudheenk@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::341; helo=mail-wm1-x341.google.com;
 envelope-from=tajudheenk@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fj8sGB7z"; 
 dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44PS2b3XtvzDqGQ
 for <openbmc@lists.ozlabs.org>; Wed, 20 Mar 2019 22:13:08 +1100 (AEDT)
Received: by mail-wm1-x341.google.com with SMTP id v14so11154450wmf.2
 for <openbmc@lists.ozlabs.org>; Wed, 20 Mar 2019 04:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OHLRqgQ8Kp4bUsHzu+5XK5KywObUlY0iG0jHp1Z5eCQ=;
 b=fj8sGB7zTp2i0DHB/Sr83qsQqYawfiW09ahbsCzqLxZ8klVqDrWYnrHb58o3vjkEVw
 so7DphZxX102ZMHXVW5wFkQLHz8gBKZJSfhuQfiVYa8r1JOfKWt56X0OFsi7p54Nsux6
 V74vqd6xMniYN4109qr8o6ldz23a3wPIQNTrS++5nll4y8umDspo/XFgHVZJIVr60yQF
 XaAgiWpMRK0sDwC+fcSqQGvf6hsB3qNGWg5nRyV3/l6jYj9A2hCOTorruiwOVxh0h1bO
 HYRRDhBiuP2G+vLJB2EBV8ERvIuuoWfS5i7TY5BzaILVa/CwDJ7WOtPdLI6KRKR8K8OG
 EBOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OHLRqgQ8Kp4bUsHzu+5XK5KywObUlY0iG0jHp1Z5eCQ=;
 b=fIfXhxPOmrgijTQsKsdmiz4ebiKerJ+NuWBw5EMGEPy39hlO5di7dvtijk8qPgkw0B
 jwn9/VPWLLxyCoTUUg5ETX0PSz3NZirQBL6NsBszF1nPcFUxaorB3Sr86EIvzuccFaXd
 Xn1ARFYFk/rr5giHVeZvrOqUVW6Dt+7XJXrPfLSf0fa67j319Ul8DJh2tCxXZuvm9yVp
 tQa0D+Td86uf6J+lx5qSUeB/yslFygTqKGoi+B9pnPT0iGERWvLxfRir59Xfx6QMQ5Kg
 7rmT6IuVy2zqUwCCU7HvdxidOvow4+IyEshGTuwKBmhfiQxxTZkVHX6knQU60t4qvBlm
 G2Wg==
X-Gm-Message-State: APjAAAWkSKQ0T5uD586KJt3tPCBWCiPctQryaeoF6a72dyEQTJfuFAra
 WWbfaV0t7/WbWeWKe6JsBS5EXF0ypSUAFhJkI7A=
X-Google-Smtp-Source: APXvYqwjQR1nRECNeM5Rewhm5TIvK7gPiDBS1mGerAZn8A3DnBlEQy5xx2YYTQdvGtl39xQ7S42rDSDAPPOEdrbOtRo=
X-Received: by 2002:a7b:c34e:: with SMTP id l14mr8273569wmj.68.1553080384238; 
 Wed, 20 Mar 2019 04:13:04 -0700 (PDT)
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
In-Reply-To: <CAARXrtkkmxHcgvkp1Mi8esY0onqdHxRzaymcf8NaBZSM9uVYRQ@mail.gmail.com>
From: Thaju <tajudheenk@gmail.com>
Date: Wed, 20 Mar 2019 16:42:53 +0530
Message-ID: <CAH2KKeajTT96Y6rOdKGct+EBLdbFxGo97SEfWzMrcu0hqRh_Hw@mail.gmail.com>
Subject: Re: Does obmc-ikvm work with bmcweb?
To: Lei YU <mine260309@gmail.com>
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, xiuzhi <1450335857@qq.com>, 
 openbmc <openbmc@lists.ozlabs.org>, ed <ed@tanous.net>, 
 Eddie James <eajames@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="0000000000009c3b19058484b44f"
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
X-List-Received-Date: Wed, 20 Mar 2019 11:13:12 -0000

--0000000000009c3b19058484b44f
Content-Type: text/plain; charset="UTF-8"

Hi Jae/Xiuzhi,

I have tried enabling KVM as mentioned in the mail thread. But unable to
get the video in the web. Also tried using vnc viewer, but connection
refused.

I see the following:

# obmc-ikvm -v /dev/video0 -f 10 -k /dev/hidg0 -p /dev/hidg1
26/02/2019 09:41:04 Unable to establish connection with systemd socket
26/02/2019 09:41:04 Listening for VNC connections on TCP port 5900
26/02/2019 09:41:04 Listening for VNC connections on TCP6 port 5900
26/02/2019 09:42:17 Got connection from client 127.0.0.1
26/02/2019 09:42:17   other clients:
26/02/2019 09:42:17 Normal socket connection

# dmesg | grep video
[   18.921547] aspeed-video 1e700000.video: assigned reserved memory node
framebuffer
[   59.799015] aspeed-video 1e700000.video: Timed out; first mode detect

obmc-ikvm recipe:

SUMMARY = "obmc kvm application"
DESCRIPTION = "Interfaces video device and USB HID device on BMC"

FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

inherit systemd
inherit obmc-phosphor-systemd
inherit autotools pkgconfig

LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"

PV = "1.0+git${SRCPV}"

SRC_URI = "git://github.com/openbmc/obmc-ikvm \
        file://Fix_video_restarting_sync_issue.patch \
        "
SRCREV = "2bc661d34abd1fda92a9d2b256ed88ca0e90d09a"

DEPENDS += "autoconf-archive"
DEPENDS += "libvncserver"
DEPENDS += "sdbusplus"
DEPENDS += "sdeventplus"
DEPENDS += "phosphor-logging"
DEPENDS += "phosphor-dbus-interfaces"
DEPENDS += "systemd"

S = "${WORKDIR}/git"

SERVICE_FILE = "start-ipkvm.service"
SYSTEMD_PACKAGES = "${PN}"
SYSTEMD_SERVICE_${PN} += "${SERVICE_FILE}"
SYSTEMD_DEFAULT_TARGET ?= "${SYSTEMD_DEFAULT_TARGET}"

What am I doing wrong here?
Do we need to set "-DBMCWEB_ENABLE_KVM=ON" in bmcweb?

Regards,
Thaj

On Wed, Mar 20, 2019 at 11:01 AM Lei YU <mine260309@gmail.com> wrote:

> > Check if there are /dev/hidg0 and /dev/hidg1. If not, check kernel
> > configs again.
> > Also, check 'start-ipkvm.service' file whether that launches obmc-ikvm
> > using this options:
> > ExecStart=/usr/bin/env obmc-ikvm -v /dev/video0 -f 10 -k /dev/hidg0 -p
> > /dev/hidg1
>
> Confirmed that both /dev/hidg0 and /dev/hidg1 are created, and the service
> is
> started with obmc-ikvm -v /dev/video0 -f 10 -k /dev/hidg0 -p /dev/hidg1.
>
> >
> > Try this patch:
> > https://gerrit.openbmc-project.xyz/c/openbmc/obmc-ikvm/+/19392
>
> Unfortunately, the patch does not fix the issue, the KVM page still shows a
> small black block when browsed to another page and back.
>

--0000000000009c3b19058484b44f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr">Hi Jae/Xiuzhi,<div><br></div><div>I have tried enabling KVM as me=
ntioned in the mail thread. But unable to get the video in the web. Also tr=
ied using vnc viewer, but connection refused.</div><div><br></div><div>I se=
e the following:</div><div><br></div><div><div># obmc-ikvm -v /dev/video0 -=
f 10 -k /dev/hidg0 -p /dev/hidg1</div><div>26/02/2019 09:41:04 Unable to es=
tablish connection with systemd socket</div><div>26/02/2019 09:41:04 Listen=
ing for VNC connections on TCP port 5900</div><div>26/02/2019 09:41:04 List=
ening for VNC connections on TCP6 port 5900</div><div>26/02/2019 09:42:17 G=
ot connection from client 127.0.0.1</div><div>26/02/2019 09:42:17=C2=A0 =C2=
=A0other clients:</div><div>26/02/2019 09:42:17 Normal socket connection</d=
iv></div><div><br></div><div><div># dmesg | grep video</div><div>[=C2=A0 =
=C2=A018.921547] aspeed-video 1e700000.video: assigned reserved memory node=
 framebuffer</div><div>[=C2=A0 =C2=A059.799015] aspeed-video 1e700000.video=
: Timed out; first mode detect</div></div><div><br></div><div><div>obmc-ikv=
m recipe:<br></div><div><br></div><div>SUMMARY =3D &quot;obmc kvm applicati=
on&quot;</div><div>DESCRIPTION =3D &quot;Interfaces video device and USB HI=
D device on BMC&quot;</div><div><br></div><div>FILESEXTRAPATHS_append :=3D =
&quot;:${THISDIR}/${PN}&quot;</div><div><br></div><div>inherit systemd</div=
><div>inherit obmc-phosphor-systemd</div><div>inherit autotools pkgconfig</=
div><div><br></div><div>LICENSE =3D &quot;Apache-2.0&quot;</div><div>LIC_FI=
LES_CHKSUM =3D &quot;file://LICENSE;md5=3De3fc50a88d0a364313df4b21ef20c29e&=
quot;</div><div><br></div><div>PV =3D &quot;1.0+git${SRCPV}&quot;</div><div=
><br></div><div>SRC_URI =3D &quot;git://<a href=3D"http://github.com/openbm=
c/obmc-ikvm">github.com/openbmc/obmc-ikvm</a> \</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 file://Fix_video_restarting_sync_issue.patch \</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &quot;</div><div>SRCREV =3D &quot;2bc661d34abd1fda92a9=
d2b256ed88ca0e90d09a&quot;</div><div><br></div><div>DEPENDS +=3D &quot;auto=
conf-archive&quot;</div><div>DEPENDS +=3D &quot;libvncserver&quot;</div><di=
v>DEPENDS +=3D &quot;sdbusplus&quot;</div><div>DEPENDS +=3D &quot;sdeventpl=
us&quot;</div><div>DEPENDS +=3D &quot;phosphor-logging&quot;</div><div>DEPE=
NDS +=3D &quot;phosphor-dbus-interfaces&quot;</div><div>DEPENDS +=3D &quot;=
systemd&quot;</div><div><br></div><div>S =3D &quot;${WORKDIR}/git&quot;</di=
v><div><br></div><div>SERVICE_FILE =3D &quot;start-ipkvm.service&quot;</div=
><div>SYSTEMD_PACKAGES =3D &quot;${PN}&quot;</div><div>SYSTEMD_SERVICE_${PN=
} +=3D &quot;${SERVICE_FILE}&quot;</div><div>SYSTEMD_DEFAULT_TARGET ?=3D &q=
uot;${SYSTEMD_DEFAULT_TARGET}&quot;</div></div><div><br></div><div>What am =
I doing wrong here?</div><div>Do we need to set=C2=A0&quot;-DBMCWEB_ENABLE_=
KVM=3DON&quot; in bmcweb?</div><div><br></div><div>Regards,</div><div>Thaj<=
/div></div></div></div></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Mar 20, 2019 at 11:01 AM Lei YU &lt;<=
a href=3D"mailto:mine260309@gmail.com">mine260309@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; Check if th=
ere are /dev/hidg0 and /dev/hidg1. If not, check kernel<br>
&gt; configs again.<br>
&gt; Also, check &#39;start-ipkvm.service&#39; file whether that launches o=
bmc-ikvm<br>
&gt; using this options:<br>
&gt; ExecStart=3D/usr/bin/env obmc-ikvm -v /dev/video0 -f 10 -k /dev/hidg0 =
-p<br>
&gt; /dev/hidg1<br>
<br>
Confirmed that both /dev/hidg0 and /dev/hidg1 are created, and the service =
is<br>
started with obmc-ikvm -v /dev/video0 -f 10 -k /dev/hidg0 -p /dev/hidg1.<br=
>
<br>
&gt;<br>
&gt; Try this patch:<br>
&gt; <a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/obmc-ikvm/+/19=
392" rel=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc-project.xy=
z/c/openbmc/obmc-ikvm/+/19392</a><br>
<br>
Unfortunately, the patch does not fix the issue, the KVM page still shows a=
<br>
small black block when browsed to another page and back.<br>
</blockquote></div>

--0000000000009c3b19058484b44f--
