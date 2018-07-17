Return-Path: <guhan.sac@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::236; helo=mail-lf0-x236.google.com;
 envelope-from=guhan.sac@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Zl9fWnXZ"; 
 dkim-atps=neutral
Received: from mail-lf0-x236.google.com (mail-lf0-x236.google.com
 [IPv6:2a00:1450:4010:c07::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41VSy40tRKzF3Hb
 for <openbmc@lists.ozlabs.org>; Wed, 18 Jul 2018 04:10:48 +1000 (AEST)
Received: by mail-lf0-x236.google.com with SMTP id a4-v6so1527375lff.5
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jul 2018 11:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=jZSkciL2Ccn+9O1SaxsW2l4PWkHswNfv9qITtvRVO8I=;
 b=Zl9fWnXZGjjRilfd3c3EqcZTr41Be3BoS/ftMg3hr+8IA1KmSJjEMxA3ShBSqI8rwO
 l4Ggtgr2568i1g0VPjpLKa1HyCQ6wBQ5ORG7vzEDWOL403zkfwaW+z8c2w1jfLpD+DSa
 JB8HPZKI94gPc0Bw2jGomlCRQmf+7LFk49aA2ECvKbBO4R0n3AO4cr5TqKSEMy+UzYyU
 aBPn4PI9ZYhMPYVSHC9Kj2xfX0MVuxEydS0FTvNT/M4f+bnBCl3XqNM1UmUDx2I+PgMk
 eShTurpPR6uHydi+W6oE8ulhGhFG0NftP1x7vpf0HWY1TNiMQg6HIswIoT54UdGqkt8j
 w/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=jZSkciL2Ccn+9O1SaxsW2l4PWkHswNfv9qITtvRVO8I=;
 b=i8I4NNgSRN+IjtxI3bjpPELBBOdhiCu3AeXyOjJoXYXFkCXvwb7tfoD9yn74dawXR+
 RRziJvr5XW/4+pQo0hPGAkIA7MNzhPhU/vJSGk2DGPjUWDcgRNhw+uQ0wM/jXOwe+yBw
 yYN0s+K/oYJhI32jd/+gk/Q+ioven6lQ67tkMHRLqQ3EShIU6+hOWnihHz2y7wKLxSUj
 S6zaJc0TGcsMC+mSOeMCCJB0AFAzsJYn7lzg1UD6H2APxvAYeYH33XDezi26xyCZGMxy
 gUQxaV++FLee4X5CSOYAx2Jcfe9NK1clvvqStTn0+R0cYoQmwHLujQ+MQoqaD0UpYwma
 yQTA==
X-Gm-Message-State: AOUpUlEQS1A+nNaOQ2RFHzn5ij93myo/yt78E7R9j8pae6zyWDLwHWKU
 LYXOzx7uefAzeU0pARDRtJN11KK7nchTVGCALYrC17r4
X-Google-Smtp-Source: AAOMgpcfjrzfsOQSdUOH9K5CbGOnbnh1JCEl9v4gaJVcNDXAOWXUC7TKYxhn8u4QAweaKRcNfb/89FKPEJ7aPxMEIqU=
X-Received: by 2002:a19:5f11:: with SMTP id
 t17-v6mr1980022lfb.64.1531851044456; 
 Tue, 17 Jul 2018 11:10:44 -0700 (PDT)
MIME-Version: 1.0
From: guhan balasubramanian <guhan.sac@gmail.com>
Date: Tue, 17 Jul 2018 11:10:37 -0700
Message-ID: <CAMNAJg33kMTbK-H=Aq--rxT=-K+7P1efGqR5XqV8ANy9spbwDw@mail.gmail.com>
Subject: Help patching rest_dbus.py
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000005a910e057135dd7c"
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
X-List-Received-Date: Tue, 17 Jul 2018 18:10:53 -0000

--0000000000005a910e057135dd7c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

We are trying to make some custom changes to the phosphor web application.
Since the web application is present in meta-phosphor, we were trying to
patch the web application from our own meta layer.

From the tmp/work/ directory, I was able to create a git patch for the
rest_dbus.py file in phosphor-gevent and phosphor-rest.

But since the source is not included directly, I get a quilt error saying
that there is no file to patch.

The web (bottle) application I see, is included through the following
variable:
SYSTEMD_ENVIRONMENT_FILE_${PN} +=3D "obmc/wsgi_app"

Can someone please help with what I am missing or the best way to go about
this?

-----
bash-4.2$ tree phosphor-rest/
phosphor-rest/
=E2=94=9C=E2=94=80=E2=94=80 phosphor-rest
=E2=94=82   =E2=94=94=E2=94=80=E2=94=80 0001-rest-dbus-test.patch
=E2=94=94=E2=94=80=E2=94=80 phosphor-rest.bbappend

1 directory, 2 files
bash-4.2$ cat phosphor-rest/phosphor-rest.bbappend
FILESEXTRAPATHS_prepend :=3D "${THISDIR}/phosphor-rest:"
SRC_URI +=3D " \
     file://0001-rest-dbus-test.patch \
"
bash-4.2$
-------


Thanks,
Guhan

--0000000000005a910e057135dd7c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>We are trying to make some custom c=
hanges to the phosphor web application. Since the web application is presen=
t in meta-phosphor, we were trying to patch the web application from our ow=
n meta layer.=C2=A0</div><div><br></div><div>From the tmp/work/ directory, =
I was able to create a git patch for the rest_dbus.py file in phosphor-geve=
nt and phosphor-rest.=C2=A0</div><div><br></div><div>But since the source i=
s not included directly, I get a quilt error saying that there is no file t=
o patch.=C2=A0</div><div><br></div><div>The web (bottle) application I see,=
 is included through the following variable:=C2=A0</div><div>SYSTEMD_ENVIRO=
NMENT_FILE_${PN} +=3D &quot;obmc/wsgi_app&quot;<br></div><div><br></div><di=
v><span style=3D"font-size:small;background-color:rgb(255,255,255);text-dec=
oration-style:initial;text-decoration-color:initial;float:none;display:inli=
ne">Can someone please help with what I am missing or the best way to go ab=
out this?=C2=A0</span><br></div><div><span style=3D"font-size:small;backgro=
und-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-co=
lor:initial;float:none;display:inline"><br></span></div><div>-----</div><di=
v><div>bash-4.2$ tree phosphor-rest/</div><div>phosphor-rest/</div><div>=E2=
=94=9C=E2=94=80=E2=94=80 phosphor-rest</div><div>=E2=94=82=C2=A0 =C2=A0=E2=
=94=94=E2=94=80=E2=94=80 0001-rest-dbus-test.patch</div><div>=E2=94=94=E2=
=94=80=E2=94=80 phosphor-rest.bbappend</div><div><br></div><div>1 directory=
, 2 files</div><div><div>bash-4.2$ cat phosphor-rest/phosphor-rest.bbappend=
=C2=A0</div><div>FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/phosphor-res=
t:&quot;</div><div>SRC_URI +=3D &quot; \</div><div>=C2=A0 =C2=A0 =C2=A0file=
://0001-rest-dbus-test.patch \</div><div>&quot;</div><div>bash-4.2$=C2=A0</=
div></div></div><div>-------</div><div><br></div><div><br></div><div>Thanks=
,</div><div>Guhan</div></div>

--0000000000005a910e057135dd7c--
