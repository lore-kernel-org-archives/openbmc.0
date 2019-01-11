Return-Path: <omkar.kuppa@sanmina.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=sanmina.com
 (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=omkar.kuppa@sanmina.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=sanmina.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=sanmina.com header.i=@sanmina.com header.b="TQrWPfTk"; 
 dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43bhYP40cYzDqy9
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 23:11:36 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id 101so6693189pld.6
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 04:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sanmina.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=obK5j4c9BJXa3S4102hTChEbLdFinqD1ncKdBvhD/kI=;
 b=TQrWPfTkKA+72+sdw8XjX2HJZ+jT1ebGdr0I9PHznC02rfO2Z1913sEFx/d+o9pjlO
 OOI3actp4xlZ/xYktr2ZtTUK3xu6NHr2cg0nqns3YFDbJOZbHdmc6cs8tPd+v/0rq5FB
 r1aVsHJV6TQtpg6BdGjCZzCiJje4HiTMdk4D4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=obK5j4c9BJXa3S4102hTChEbLdFinqD1ncKdBvhD/kI=;
 b=AFPpRPCBe3ewd5K8n4AvOzeII66GVES2b/Bp0eujS0gwJ5sdBklx8jV2B533aA2cMJ
 XJrqvGnfqq9Fp4BmUn3b3cH/okSnpEouC+wCuG2Em2okNYcaB+os/bwaNrP/JZsNcFNR
 YpOpYpxweCVOAVWfNxxtQkQ/D68hLQ904tDViSmqVoqTejTfVEXsV7rzY9ymQglKb2KL
 i2ZCRmm2bLRH9H9l9vcclrpTHjzAM36XrfSBBhjcSpxyWpkv9wiuOz9ZqcMogUdOPMrJ
 8cT5+UUFeH/VwcLsnp4vhRdUwqvArmI6S09ywD+rVTnlA5PLFkD05LMOVRRaNp4xJWXH
 4viQ==
X-Gm-Message-State: AJcUukeldpWgml0/au6DtW7Oa8FX57R//0uyO+RZy3rwlKcFUiYmLFaf
 V8KUAg24a4r8M3l4Bqr4myNst7lUi1SLvijnHBp6NEx2MW6X/W7iw55MZQHk8mw6NHH7W+GrksW
 qz5Sxz0utwX12KHDao2rvI0wqYCZx50y1
X-Google-Smtp-Source: ALg8bN7LDH/qdmNjT2/HhEim3luWMYQBae4ECJxT5femD/9xR3qGBDm3L2ByPaR4jXNllfPRJYHb6wU7lqa/5sPRqF0=
X-Received: by 2002:a17:902:5a4d:: with SMTP id
 f13mr14844549plm.49.1547208693870; 
 Fri, 11 Jan 2019 04:11:33 -0800 (PST)
MIME-Version: 1.0
From: Omkar Kuppa <omkar.kuppa@sanmina.com>
Date: Fri, 11 Jan 2019 17:41:22 +0530
Message-ID: <CAOSNvHpQqF_7=RCN+jcR7enA+x_ikWfUP70P0rizau7MoZYFbw@mail.gmail.com>
Subject: Build fail - Reg
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000097a969057f2d987b"
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
X-List-Received-Date: Fri, 11 Jan 2019 12:11:40 -0000

--00000000000097a969057f2d987b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,
I've downloaded the openbmc project from github. While building the
project, I'm facing the following error.

*Build Configuration:*
BB_VERSION           =3D "1.40.0"
BUILD_SYS            =3D "i686-linux"
NATIVELSBSTRING      =3D "ubuntu-14.04"
TARGET_SYS           =3D "arm-openbmc-linux-gnueabi"
MACHINE              =3D "zaius"
DISTRO               =3D "openbmc-phosphor"
DISTRO_VERSION       =3D "0.1.0"
TUNE_FEATURES        =3D "arm armv6 thumb arm1176jzs"
TARGET_FPU           =3D "soft"
meta-zaius           =3D "master:1a4b7ee28bf7413af6513fb45ad0d0736048f866"

*ERROR:* dbus-broker-16+gitAUTOINC+fc874afa09-r0 do_fetch: Fetcher failure:
Fetch command export PSEUDO_DISABLED=3D1; export
DBUS_SESSION_BUS_ADDRESS=3D"unix:abstract=3D/tmp/dbus-4MEPus6gYW"; export
SSH_AUTH_SOCK=3D"/run/user/1000/keyring-5RCWfK/ssh"; export
PATH=3D"/../openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/dbus-broker/=
16+gitAUTOINC+fc874afa09-r0/recipe-sysroot-native/usr/bin/python3-native:/.=
./openbmc/scripts:/../openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/db=
us-broker/16+gitAUTOINC+fc874afa09-r0/recipe-sysroot-native/usr/bin/arm-ope=
nbmc-linux-gnueabi:/../openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/d=
bus-broker/16+gitAUTOINC+fc874afa09-r0/recipe-sysroot/usr/bin/crossscripts:=
/../openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/dbus-broker/16+gitAU=
TOINC+fc874afa09-r0/recipe-sysroot-native/usr/sbin:/../openbmc/build/tmp/wo=
rk/armv6-openbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/reci=
pe-sysroot-native/usr/bin:/../openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/recipe-sysroot-native/sbin:/.=
./openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/dbus-broker/16+gitAUTO=
INC+fc874afa09-r0/recipe-sysroot-native/bin:/../openbmc/poky/bitbake/bin:/.=
./openbmc/build/tmp/hosttools";
export HOME=3D"/home/omkar"; LANG=3DC git -c core.fsyncobjectfiles=3D0 clon=
e
--bare --mirror git://github.com/bus1/dbus-broker
/../openbmc/build/downloads/git2/github.com.bus1.dbus-broker --progress
failed with exit code 128, output:
Cloning into bare repository
'/../openbmc/build/downloads/git2/github.com.bus1.dbus-broker'...
fatal: unable to connect to github.com:
github.com[0: 52.74.223.119]: errno=3DConnection timed out
github.com[1: 13.250.177.223]: errno=3DConnection timed out
github.com[2: 13.229.188.59]: errno=3DConnection timed out

ERROR: dbus-broker-16+gitAUTOINC+fc874afa09-r0 do_fetch: Fetcher failure
for URL: 'gitsm://github.com/bus1/dbus-broker;protocol=3Dgit'. Unable to
fetch URL from any source.
ERROR: dbus-broker-16+gitAUTOINC+fc874afa09-r0 do_fetch: Function failed:
base_do_fetch
ERROR: Logfile of failure stored in:
/../openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/dbus-broker/16+gitAU=
TOINC+fc874afa09-r0/temp/log.do_fetch.2531
ERROR: Task
(/../openbmc/meta-openembedded/meta-oe/recipes-core/dbus/dbus-broker_git.bb=
:do_fetch)
failed with exit code '1'
NOTE: Tasks Summary: Attempted 2757 tasks of which 2756 didn't need to be
rerun and 1 failed.

Summary: 1 task failed:

/../openbmc/meta-openembedded/meta-oe/recipes-core/dbus/dbus-broker_git.bb:
do_fetch

I'm trying to build the open bmc project for the first time. I tried to
build for Romulus, Palmetto and Zaius. Each build failed with a different
error. I don't have the errors for other builds. Please let me know how to
resolve this error.

Thanks in advance,
Omkar

--=20
CONFIDENTIALITY
This e-mail message and any attachments thereto, is=20
intended only for use by the addressee(s) named herein and may contain=20
legally privileged and/or confidential information. If you are not the=20
intended recipient of this e-mail message, you are hereby notified that any=
=20
dissemination, distribution or copying of this e-mail message, and any=20
attachments thereto, is strictly prohibited.  If you have received this=20
e-mail message in error, please immediately notify the sender and=20
permanently delete the original and any copies of this email and any prints=
=20
thereof.
ABSENT AN EXPRESS STATEMENT TO THE CONTRARY HEREINABOVE, THIS=20
E-MAIL IS NOT INTENDED AS A SUBSTITUTE FOR A WRITING.  Notwithstanding the=
=20
Uniform Electronic Transactions Act or the applicability of any other law=
=20
of similar substance and effect, absent an express statement to the=20
contrary hereinabove, this e-mail message its contents, and any attachments=
=20
hereto are not intended to represent an offer or acceptance to enter into a=
=20
contract and are not otherwise intended to bind the sender, Sanmina=20
Corporation (or any of its subsidiaries), or any other person or entity.

--00000000000097a969057f2d987b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hi=
 all,</div><div>I&#39;ve downloaded the openbmc project from github. While =
building the project, I&#39;m facing the following error.</div><div><br></d=
iv><div><div><div><b>Build Configuration:</b></div><div>BB_VERSION=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;1.40.0&quot;</div><div>BUILD_SY=
S=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;i686-linux&quot;</div>=
<div>NATIVELSBSTRING=C2=A0 =C2=A0 =C2=A0 =3D &quot;ubuntu-14.04&quot;</div>=
<div>TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;arm-openb=
mc-linux-gnueabi&quot;</div><div>MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =3D &quot;zaius&quot;</div><div>DISTRO=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;openbmc-phosphor&quot;</div><di=
v>DISTRO_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;0.1.0&quot;</div><div>=
TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;arm armv6 thumb arm1176j=
zs&quot;</div><div>TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &=
quot;soft&quot;</div></div><div>meta-zaius=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D &quot;master:1a4b7ee28bf7413af6513fb45ad0d0736048f866&quot;<b=
r></div><div><br></div></div><div><b>ERROR:</b> dbus-broker-16+gitAUTOINC+f=
c874afa09-r0 do_fetch: Fetcher failure: Fetch command export PSEUDO_DISABLE=
D=3D1; export DBUS_SESSION_BUS_ADDRESS=3D&quot;unix:abstract=3D/tmp/dbus-4M=
EPus6gYW&quot;; export SSH_AUTH_SOCK=3D&quot;/run/user/1000/keyring-5RCWfK/=
ssh&quot;; export PATH=3D&quot;/../openbmc/build/tmp/work/armv6-openbmc-lin=
ux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/recipe-sysroot-native/us=
r/bin/python3-native:/../openbmc/scripts:/../openbmc/build/tmp/work/armv6-o=
penbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/recipe-sysroot=
-native/usr/bin/arm-openbmc-linux-gnueabi:/../openbmc/build/tmp/work/armv6-=
openbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/recipe-sysroo=
t/usr/bin/crossscripts:/../openbmc/build/tmp/work/armv6-openbmc-linux-gnuea=
bi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/recipe-sysroot-native/usr/sbin:/=
../openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/dbus-broker/16+gitAUT=
OINC+fc874afa09-r0/recipe-sysroot-native/usr/bin:/../openbmc/build/tmp/work=
/armv6-openbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/recipe=
-sysroot-native/sbin:/../openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi=
/dbus-broker/16+gitAUTOINC+fc874afa09-r0/recipe-sysroot-native/bin:/../open=
bmc/poky/bitbake/bin:/../openbmc/build/tmp/hosttools&quot;; export HOME=3D&=
quot;/home/omkar&quot;; LANG=3DC git -c core.fsyncobjectfiles=3D0 clone --b=
are --mirror git://<a href=3D"http://github.com/bus1/dbus-broker">github.co=
m/bus1/dbus-broker</a> /../openbmc/build/downloads/git2/github.com.bus1.dbu=
s-broker --progress failed with exit code 128, output:</div><div>Cloning in=
to bare repository &#39;/../openbmc/build/downloads/git2/github.com.bus1.db=
us-broker&#39;...</div><div>fatal: unable to connect to <a href=3D"http://g=
ithub.com">github.com</a>:</div><div><a href=3D"http://github.com">github.c=
om</a>[0: 52.74.223.119]: errno=3DConnection timed out</div><div><a href=3D=
"http://github.com">github.com</a>[1: 13.250.177.223]: errno=3DConnection t=
imed out</div><div><a href=3D"http://github.com">github.com</a>[2: 13.229.1=
88.59]: errno=3DConnection timed out</div><div><br></div><div>ERROR: dbus-b=
roker-16+gitAUTOINC+fc874afa09-r0 do_fetch: Fetcher failure for URL: &#39;g=
itsm://<a href=3D"http://github.com/bus1/dbus-broker;protocol=3Dgit">github=
.com/bus1/dbus-broker;protocol=3Dgit</a>&#39;. Unable to fetch URL from any=
 source.<br></div><div>ERROR: dbus-broker-16+gitAUTOINC+fc874afa09-r0 do_fe=
tch: Function failed: base_do_fetch</div><div>ERROR: Logfile of failure sto=
red in: /../openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/dbus-broker/=
16+gitAUTOINC+fc874afa09-r0/temp/log.do_fetch.2531</div><div>ERROR: Task (/=
../openbmc/meta-openembedded/meta-oe/recipes-core/dbus/dbus-broker_git.bb:d=
o_fetch) failed with exit code &#39;1&#39;</div><div>NOTE: Tasks Summary: A=
ttempted 2757 tasks of which 2756 didn&#39;t need to be rerun and 1 failed.=
</div><div><br></div><div>Summary: 1 task failed:</div><div>=C2=A0 /../open=
bmc/meta-openembedded/meta-oe/recipes-core/dbus/dbus-broker_git.bb:do_fetch=
</div><div><br></div><div><div>I&#39;m trying to build the open bmc project=
 for the first time. I tried to build for Romulus, Palmetto and Zaius. Each=
 build failed with a different error. I don&#39;t have the errors for other=
 builds. Please let me know how to resolve this error.<br></div></div><div>=
<br></div><div>Thanks in advance,</div><div>Omkar</div></div></div></div></=
div>

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
--00000000000097a969057f2d987b--
