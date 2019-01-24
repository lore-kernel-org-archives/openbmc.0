Return-Path: <omkar.kuppa@sanmina.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=sanmina.com
 (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com;
 envelope-from=omkar.kuppa@sanmina.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=sanmina.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=sanmina.com header.i=@sanmina.com header.b="gxl4Of04"; 
 dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43lcTn1kjnzDqGS
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jan 2019 20:35:56 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id e11so2616130plt.11
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jan 2019 01:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sanmina.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=YGz9NL6/oR3NIbWjGIFD+BlcptyNr94Z4d4oTknE/Fc=;
 b=gxl4Of04vR9EPmWO8791V7P2O83Ct+WtI3mAR2kZHonR04JdI7ie4sGqfcZqGPpTIZ
 RHWd3D3taWQogkyiuEbD9OY0/lqAcIgRf+U1hQCYVZ9vOvXPSVxB0OLMFh7QFXQqNPoX
 XnOOVqt9NNsQFJGbgRVNZDjcBu0vtKEK54kws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=YGz9NL6/oR3NIbWjGIFD+BlcptyNr94Z4d4oTknE/Fc=;
 b=VXm2lYAD65zxPmo7VCoXV92bKZeMT6LBxbuVeP2Q1/45szrORuza82x5zlTNISygnH
 nbvCFPEpyUjtiflr/YxHEEo/u7+tW1o1YiSco6ow2oyTcfRniJYe+4Y+ZH59Jk+n06rf
 5X3apW6rKq4knJ7aqonD02lJ3uU2pZzTxGvwkk/bJGri50H+p6N6uYfLn9N80VI1vBgY
 Cmf85nb4BO6XlNLH8HuMka/m1RqRNNnmtvVbnq4WLFVGVcxuEge/co9VcB8oOAQSFZR/
 i882Y129I7xumxUd4Mm6tJJ6hoXE/FEUlhpwMYXs4+O8XjVUg5KJtht4k4eUlZFri+q1
 FAjw==
X-Gm-Message-State: AJcUukdhOQBpt8d3OcUAvAavGJpcy+sgzse42K8xTGm3xwh+hipCehIs
 Y/65c2n9o6uL9+gQdWcF/Ff8t969j2Z/4mfqInhskG6gOW/Vt45XMBqJUP0UwQbXNZoMEkK5TbJ
 56CgcDUCjZ+Nj1tS+SOURyPUQcZqL12RGMqI=
X-Google-Smtp-Source: ALg8bN5i+bdDoM8nyicxlstzE41p75BlOIIvRD+YE76yboOkyYaJw+LcK1BGsD3TMMx1q4lDOE5luH+0+z/XTzZAR1o=
X-Received: by 2002:a17:902:5a4d:: with SMTP id
 f13mr6007395plm.49.1548322554094; 
 Thu, 24 Jan 2019 01:35:54 -0800 (PST)
MIME-Version: 1.0
From: Omkar Kuppa <omkar.kuppa@sanmina.com>
Date: Thu, 24 Jan 2019 15:05:43 +0530
Message-ID: <CAOSNvHp=4p=XEBEfk+t+Sz02uYPoMcsi9GkLOKcouvtFgQna7Q@mail.gmail.com>
Subject: Build fail -reg
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000d5e1a0058030efba"
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
X-List-Received-Date: Thu, 24 Jan 2019 09:35:58 -0000

--000000000000d5e1a0058030efba
Content-Type: text/plain; charset="UTF-8"

Hi all,
I've downloaded the openbmc project from github. While building the
project, I'm facing the following error.

*Build Configuration:*
BB_VERSION           = "1.40.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "ubuntu-16.04"
TARGET_SYS           = "arm-openbmc-linux-gnueabi"
MACHINE              = "romulus"
DISTRO               = "openbmc-phosphor"
DISTRO_VERSION       = "0.1.0"
TUNE_FEATURES        = "arm armv6 thumb arm1176jzs"
TARGET_FPU           = "soft"
meta
meta-oe
meta-networking
meta-perl
meta-python
meta-webserver
meta-phosphor
meta-aspeed
meta-openpower
meta-ibm
meta-romulus         = "master:f4ae002524c4f24a5a78deca5fa59947bf91062e"

Initialising tasks: 100% |#######################################| Time:
0:00:03


*ERROR:* obmc-phosphor-initramfs-1.0-r0 do_rootfs: The postinstall
intercept hook 'update_pixbuf_cache' failed, details in
/home/sanminafw/JAYA/OPENBMC/openbmc/build/tmp/work/romulus-openbmc-linux-gnueabi/obmc-phosphor-initramfs/1.0-r0/temp/log.do_rootfs
ERROR: obmc-phosphor-initramfs-1.0-r0 do_rootfs: Function failed: do_rootfs
ERROR: Logfile of failure stored in:
/home/sanminafw/JAYA/OPENBMC/openbmc/build/tmp/work/romulus-openbmc-linux-gnueabi/obmc-phosphor-initramfs/1.0-r0/temp/log.do_rootfs.16915
ERROR: Task
(/home/sanminafw/JAYA/OPENBMC/openbmc/meta-phosphor/recipes-phosphor/images/obmc-phosphor-initramfs.bb:do_rootfs)
failed with exit code '1'

In the log mentioned, I observed the following:
..........
NOTE: Installing complementary packages ...
NOTE: Running ['oe-pkgdata-util', '-p',
'/home/sanminafw/JAYA/OPENBMC/openbmc/build/tmp/pkgdata/romulus', 'glob',
'/tmp/installed-pkgscu9eokiu', '']
NOTE: Running intercept scripts:
NOTE: > Executing update_pixbuf_cache intercept ...
NOTE: Exit code 2. Output:
/home/sanminafw/JAYA/OPENBMC/openbmc/build/tmp/work/romulus-openbmc-linux-gnueabi/obmc-phosphor-initramfs/1.0-r0/intercept_scripts-6d3037ee0d3eb34c6fb8f3b3b6fa2cb32e7505b11d495ad7c020152112adb575/update_pixbuf_cache:
8:
/home/sanminafw/JAYA/OPENBMC/openbmc/build/tmp/work/romulus-openbmc-linux-gnueabi/obmc-phosphor-initramfs/1.0-r0/intercept_scripts-6d3037ee0d3eb34c6fb8f3b3b6fa2cb32e7505b11d495ad7c020152112adb575/update_pixbuf_cache:
cannot create
/home/sanminafw/JAYA/OPENBMC/openbmc/build/tmp/work/romulus-openbmc-linux-gnueabi/obmc-phosphor-initramfs/1.0-r0/rootfs/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/../loaders.cache:
Directory nonexistent

ERROR: The postinstall intercept hook 'update_pixbuf_cache' failed, details
in
/home/sanminafw/JAYA/OPENBMC/openbmc/build/tmp/work/romulus-openbmc-linux-gnueabi/obmc-phosphor-initramfs/1.0-r0/temp/log.do_rootfs
DEBUG: Python function do_rootfs finished
ERROR: Function failed: do_rootfs

Please let me know how to resolve this error.

Thanks and Regards,
Omkar

-- 
CONFIDENTIALITY
This e-mail message and any attachments thereto, is 
intended only for use by the addressee(s) named herein and may contain 
legally privileged and/or confidential information. If you are not the 
intended recipient of this e-mail message, you are hereby notified that any 
dissemination, distribution or copying of this e-mail message, and any 
attachments thereto, is strictly prohibited.  If you have received this 
e-mail message in error, please immediately notify the sender and 
permanently delete the original and any copies of this email and any prints 
thereof.
ABSENT AN EXPRESS STATEMENT TO THE CONTRARY HEREINABOVE, THIS 
E-MAIL IS NOT INTENDED AS A SUBSTITUTE FOR A WRITING.  Notwithstanding the 
Uniform Electronic Transactions Act or the applicability of any other law 
of similar substance and effect, absent an express statement to the 
contrary hereinabove, this e-mail message its contents, and any attachments 
hereto are not intended to represent an offer or acceptance to enter into a 
contract and are not otherwise intended to bind the sender, Sanmina 
Corporation (or any of its subsidiaries), or any other person or entity.

--000000000000d5e1a0058030efba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi all,<div>I&#39;ve downloaded the openb=
mc project from github. While building the project, I&#39;m facing the foll=
owing error.=C2=A0</div><div>=C2=A0</div><div><b>Build Configuration:</b><b=
r>BB_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D &quot;1.40.0&quot;<br>BUILD_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;x86_64-linux&quot;<br>NATIVELSBSTRING=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;ubuntu-16.04&quot;<br>TARGET_SYS=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;arm-=
openbmc-linux-gnueabi&quot;<br>MACHINE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;romulus&quot;<br>DISTR=
O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =3D &quot;openbmc-phosphor&quot;<br>DISTRO_VERSION=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;0.1.0&quot;<br>TUNE_FEATURES=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;arm armv6 thumb arm1176jzs&quot;<b=
r>TARGET_FPU=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D &quot;soft&quot;<br>meta=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>meta-oe=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0<br>meta-networking=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>meta-perl=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>me=
ta-python=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>me=
ta-webserver=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>meta-phosphor=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>meta-aspeed=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>meta-openpower=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>meta-ibm=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>meta-romulus=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;master:f4ae002524c4f24a5a78d=
eca5fa59947bf91062e&quot;<br><br>Initialising tasks: 100% |################=
#######################| Time: 0:00:03=C2=A0</div><div><br></div><div>=C2=
=A0</div><div><div dir=3D"ltr"><b>ERROR:</b>=C2=A0obmc-phosphor-initramfs-1=
.0-r0 do_rootfs: The postinstall intercept hook &#39;update_pixbuf_cache&#3=
9; failed, details in /home/sanminafw/JAYA/OPENBMC/openbmc/build/tmp/work/r=
omulus-openbmc-linux-gnueabi/obmc-phosphor-initramfs/1.0-r0/temp/log.do_roo=
tfs<br>ERROR: obmc-phosphor-initramfs-1.0-r0 do_rootfs: Function failed: do=
_rootfs<br>ERROR: Logfile of failure stored in: /home/sanminafw/JAYA/OPENBM=
C/openbmc/build/tmp/work/romulus-openbmc-linux-gnueabi/obmc-phosphor-initra=
mfs/1.0-r0/temp/log.do_rootfs.16915<br>ERROR: Task (/home/sanminafw/JAYA/OP=
ENBMC/openbmc/meta-phosphor/recipes-phosphor/images/obmc-phosphor-initramfs=
.bb:do_rootfs) failed with exit code &#39;1&#39;<br></div><div dir=3D"ltr">=
<br></div><div>In the log mentioned, I observed the following:</div><div>..=
........</div><div><div>NOTE: Installing complementary packages ...</div><d=
iv>NOTE: Running [&#39;oe-pkgdata-util&#39;, &#39;-p&#39;, &#39;/home/sanmi=
nafw/JAYA/OPENBMC/openbmc/build/tmp/pkgdata/romulus&#39;, &#39;glob&#39;, &=
#39;/tmp/installed-pkgscu9eokiu&#39;, &#39;&#39;]</div><div>NOTE: Running i=
ntercept scripts:</div><div>NOTE: &gt; Executing update_pixbuf_cache interc=
ept ...</div><div>NOTE: Exit code 2. Output:</div><div>/home/sanminafw/JAYA=
/OPENBMC/openbmc/build/tmp/work/romulus-openbmc-linux-gnueabi/obmc-phosphor=
-initramfs/1.0-r0/intercept_scripts-6d3037ee0d3eb34c6fb8f3b3b6fa2cb32e7505b=
11d495ad7c020152112adb575/update_pixbuf_cache: 8: /home/sanminafw/JAYA/OPEN=
BMC/openbmc/build/tmp/work/romulus-openbmc-linux-gnueabi/obmc-phosphor-init=
ramfs/1.0-r0/intercept_scripts-6d3037ee0d3eb34c6fb8f3b3b6fa2cb32e7505b11d49=
5ad7c020152112adb575/update_pixbuf_cache: cannot create /home/sanminafw/JAY=
A/OPENBMC/openbmc/build/tmp/work/romulus-openbmc-linux-gnueabi/obmc-phospho=
r-initramfs/1.0-r0/rootfs/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/../loaders.=
cache: Directory nonexistent</div><div><br></div><div>ERROR: The postinstal=
l intercept hook &#39;update_pixbuf_cache&#39; failed, details in /home/san=
minafw/JAYA/OPENBMC/openbmc/build/tmp/work/romulus-openbmc-linux-gnueabi/ob=
mc-phosphor-initramfs/1.0-r0/temp/log.do_rootfs</div><div>DEBUG: Python fun=
ction do_rootfs finished</div><div>ERROR: Function failed: do_rootfs</div><=
/div><div><br></div><div dir=3D"ltr">Please let me know how to resolve this=
 error.<br></div><br class=3D"gmail-m_-3472475015850531672gmail-Apple-inter=
change-newline"><div>Thanks and Regards,</div><div>Omkar</div></div></div><=
/div>

<br>
CONFIDENTIALITY<br>This e-mail message and any attachments thereto, is inte=
nded only for use by the addressee(s) named herein and may contain legally =
privileged and/or confidential information. If you are not the intended rec=
ipient of this e-mail message, you are hereby notified that any disseminati=
on, distribution or copying of this e-mail message, and any attachments the=
reto, is strictly prohibited.  If you have received this e-mail message in =
error, please immediately notify the sender and permanently delete the orig=
inal and any copies of this email and any prints thereof.<br>ABSENT AN EXPR=
ESS STATEMENT TO THE CONTRARY HEREINABOVE, THIS E-MAIL IS NOT INTENDED AS A=
 SUBSTITUTE FOR A WRITING.  Notwithstanding the Uniform Electronic Transact=
ions Act or the applicability of any other law of similar substance and eff=
ect, absent an express statement to the contrary hereinabove, this e-mail m=
essage its contents, and any attachments hereto are not intended to represe=
nt an offer or acceptance to enter into a contract and are not otherwise in=
tended to bind the sender, Sanmina Corporation (or any of its subsidiaries)=
, or any other person or entity.<br>
--000000000000d5e1a0058030efba--
