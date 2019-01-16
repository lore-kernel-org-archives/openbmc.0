Return-Path: <omkar.kuppa@sanmina.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=sanmina.com
 (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com;
 envelope-from=omkar.kuppa@sanmina.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=sanmina.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=sanmina.com header.i=@sanmina.com header.b="N3SiHiuV"; 
 dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43fc0l6TcvzDqPY
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jan 2019 16:56:53 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id t13so2296875pgr.11
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jan 2019 21:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sanmina.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qnm4R3qPeVcYZTMuY+hHTG1L9rz4jh/watUt4UWd6ps=;
 b=N3SiHiuVWQv81TAUJ6NSPbs4fMyh5EoAsHWJyu1mnjZmbVfyhjzJlODG+Dd7Mq23fQ
 8YGIsbEU2f03wHNuUYu1t9erzx/OwKgJcE+sqdAx/omox8Zpe+C6VDIWuItlHMFloIvV
 etJdhh9FToLS/701nq8gO1uAXdk0qqNwCrW6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qnm4R3qPeVcYZTMuY+hHTG1L9rz4jh/watUt4UWd6ps=;
 b=fUuVlbPuDZYB9y0PzrYB2kTzWlGl0OyuM5N64Mg58oMYaBbhgvDGMcK6mOIBUPmxXV
 LxxH9nkzOF2a8q+Q68ouhCtQIQuAgUH24OgehVh1y6TythS0tUX2Ie9VCVwjGVp0OKWa
 0a5U5hC6MnpEDURpNdb9HeOL6Sx1ZyyTrC30wmROijlRHFCn8Kae3San7l8Nn3YJWp5r
 mO6GNmsEzyYda9evUeJi6h7u6RBWyB8HRG8Dms34HIj5Acfma+ZPhgPTQ+SRVlWv0FLF
 ie7lujq2ugmPXqXIgqnxs40l/YGkExWDMTd5pjuS6/59ACRRuITTG+9EBIKInZLSLVd/
 GXPQ==
X-Gm-Message-State: AJcUukfcA0OKZMPb2xIczPwBU9mXS5KKdv/kFz07ApJDO1l5CoGdHzzu
 uxbsGIcrD239GQxps4LcWPkpGZwEQ7mMCoTyEi6hZF1eueh95G+zmMeAXbtAC00fUJnvUeh3SCp
 8MCtqd6rXfbCzCSdP70NRFTSaocA=
X-Google-Smtp-Source: ALg8bN7tkn7T+ZupNHkSgfnI8t4OM+UrW6iTUf/LErrukXNXwpz3GP7SypCBK0NhjFBLiVLZzT1IMVkJYWN4WnpNSEw=
X-Received: by 2002:a62:43c1:: with SMTP id l62mr8149196pfi.22.1547618211479; 
 Tue, 15 Jan 2019 21:56:51 -0800 (PST)
MIME-Version: 1.0
References: <CAOSNvHpQqF_7=RCN+jcR7enA+x_ikWfUP70P0rizau7MoZYFbw@mail.gmail.com>
 <CALLMt=q75TCAEhAnLD1sv=cdN8dWdUZwwt3ZjyOK4HeTS9m9zA@mail.gmail.com>
In-Reply-To: <CALLMt=q75TCAEhAnLD1sv=cdN8dWdUZwwt3ZjyOK4HeTS9m9zA@mail.gmail.com>
From: Omkar Kuppa <omkar.kuppa@sanmina.com>
Date: Wed, 16 Jan 2019 11:26:39 +0530
Message-ID: <CAOSNvHpOW8Pbosn1fsMjacj_nZ8eUZ-3HOzBiOF=73nOmcBD5Q@mail.gmail.com>
Subject: Re: Build fail - Reg
To: Andrew Geissler <geissonator@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000be7574057f8cf101"
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
X-List-Received-Date: Wed, 16 Jan 2019 05:56:57 -0000

--000000000000be7574057f8cf101
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes. I tried normal build for few times and rebuild also.

On Fri, Jan 11, 2019 at 7:04 PM Andrew Geissler <geissonator@gmail.com>
wrote:

> On Fri, Jan 11, 2019 at 6:12 AM Omkar Kuppa <omkar.kuppa@sanmina.com>
> wrote:
> >
> > Hi all,
> > I've downloaded the openbmc project from github. While building the
> project, I'm facing the following error.
> >
> > Build Configuration:
> > BB_VERSION           =3D "1.40.0"
> > BUILD_SYS            =3D "i686-linux"
> > NATIVELSBSTRING      =3D "ubuntu-14.04"
> > TARGET_SYS           =3D "arm-openbmc-linux-gnueabi"
> > MACHINE              =3D "zaius"
> > DISTRO               =3D "openbmc-phosphor"
> > DISTRO_VERSION       =3D "0.1.0"
> > TUNE_FEATURES        =3D "arm armv6 thumb arm1176jzs"
> > TARGET_FPU           =3D "soft"
> > meta-zaius           =3D "master:1a4b7ee28bf7413af6513fb45ad0d0736048f8=
66"
> >
> > ERROR: dbus-broker-16+gitAUTOINC+fc874afa09-r0 do_fetch: Fetcher
> failure: Fetch command export PSEUDO_DISABLED=3D1; export
> DBUS_SESSION_BUS_ADDRESS=3D"unix:abstract=3D/tmp/dbus-4MEPus6gYW"; export
> SSH_AUTH_SOCK=3D"/run/user/1000/keyring-5RCWfK/ssh"; export
> PATH=3D"/../openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/dbus-broke=
r/16+gitAUTOINC+fc874afa09-r0/recipe-sysroot-native/usr/bin/python3-native:=
/../openbmc/scripts:/../openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/=
dbus-broker/16+gitAUTOINC+fc874afa09-r0/recipe-sysroot-native/usr/bin/arm-o=
penbmc-linux-gnueabi:/../openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi=
/dbus-broker/16+gitAUTOINC+fc874afa09-r0/recipe-sysroot/usr/bin/crossscript=
s:/../openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/dbus-broker/16+git=
AUTOINC+fc874afa09-r0/recipe-sysroot-native/usr/sbin:/../openbmc/build/tmp/=
work/armv6-openbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/re=
cipe-sysroot-native/usr/bin:/../openbmc/build/tmp/work/armv6-openbmc-linux-=
gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/recipe-sysroot-native/sbin:=
/../openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/dbus-broker/16+gitAU=
TOINC+fc874afa09-r0/recipe-sysroot-native/bin:/../openbmc/poky/bitbake/bin:=
/../openbmc/build/tmp/hosttools";
> export HOME=3D"/home/omkar"; LANG=3DC git -c core.fsyncobjectfiles=3D0 cl=
one
> --bare --mirror git://github.com/bus1/dbus-broker
> /../openbmc/build/downloads/git2/github.com.bus1.dbus-broker --progress
> failed with exit code 128, output:
> > Cloning into bare repository
> '/../openbmc/build/downloads/git2/github.com.bus1.dbus-broker'...
> > fatal: unable to connect to github.com:
> > github.com[0: 52.74.223.119]: errno=3DConnection timed out
> > github.com[1: 13.250.177.223]: errno=3DConnection timed out
> > github.com[2: 13.229.188.59]: errno=3DConnection timed out
>
> These certainly looks suspicious. Intermittent github connection issues?
> Did you try rebuilding a few times? The initial build requires a lot
> of network based downloads.
>
> >
> > ERROR: dbus-broker-16+gitAUTOINC+fc874afa09-r0 do_fetch: Fetcher failur=
e
> for URL: 'gitsm://github.com/bus1/dbus-broker;protocol=3Dgit'. Unable to
> fetch URL from any source.
> > ERROR: dbus-broker-16+gitAUTOINC+fc874afa09-r0 do_fetch: Function
> failed: base_do_fetch
> > ERROR: Logfile of failure stored in:
> /../openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/dbus-broker/16+git=
AUTOINC+fc874afa09-r0/temp/log.do_fetch.2531
> > ERROR: Task
> (/../openbmc/meta-openembedded/meta-oe/recipes-core/dbus/dbus-broker_git.=
bb:do_fetch)
> failed with exit code '1'
> > NOTE: Tasks Summary: Attempted 2757 tasks of which 2756 didn't need to
> be rerun and 1 failed.
> >
> > Summary: 1 task failed:
> >
>  /../openbmc/meta-openembedded/meta-oe/recipes-core/dbus/dbus-broker_git.=
bb:
> do_fetch
> >
> > I'm trying to build the open bmc project for the first time. I tried to
> build for Romulus, Palmetto and Zaius. Each build failed with a different
> error. I don't have the errors for other builds. Please let me know how t=
o
> resolve this error.
> >
> > Thanks in advance,
> > Omkar
> >
> > CONFIDENTIALITY
> > This e-mail message and any attachments thereto, is intended only for
> use by the addressee(s) named herein and may contain legally privileged
> and/or confidential information. If you are not the intended recipient of
> this e-mail message, you are hereby notified that any dissemination,
> distribution or copying of this e-mail message, and any attachments
> thereto, is strictly prohibited. If you have received this e-mail message
> in error, please immediately notify the sender and permanently delete the
> original and any copies of this email and any prints thereof.
> > ABSENT AN EXPRESS STATEMENT TO THE CONTRARY HEREINABOVE, THIS E-MAIL IS
> NOT INTENDED AS A SUBSTITUTE FOR A WRITING. Notwithstanding the Uniform
> Electronic Transactions Act or the applicability of any other law of
> similar substance and effect, absent an express statement to the contrary
> hereinabove, this e-mail message its contents, and any attachments hereto
> are not intended to represent an offer or acceptance to enter into a
> contract and are not otherwise intended to bind the sender, Sanmina
> Corporation (or any of its subsidiaries), or any other person or entity.
>

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

--000000000000be7574057f8cf101
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes. I tried normal build for few times and rebuild also.<=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri, Jan 11, 2019 a=
t 7:04 PM Andrew Geissler &lt;<a href=3D"mailto:geissonator@gmail.com">geis=
sonator@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On Fri, Jan 11, 2019 at 6:12 AM Omkar Kuppa &lt;<a href=3D=
"mailto:omkar.kuppa@sanmina.com" target=3D"_blank">omkar.kuppa@sanmina.com<=
/a>&gt; wrote:<br>
&gt;<br>
&gt; Hi all,<br>
&gt; I&#39;ve downloaded the openbmc project from github. While building th=
e project, I&#39;m facing the following error.<br>
&gt;<br>
&gt; Build Configuration:<br>
&gt; BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;1.40.0&qu=
ot;<br>
&gt; BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;i686-linu=
x&quot;<br>
&gt; NATIVELSBSTRING=C2=A0 =C2=A0 =C2=A0 =3D &quot;ubuntu-14.04&quot;<br>
&gt; TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;arm-openb=
mc-linux-gnueabi&quot;<br>
&gt; MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;zaiu=
s&quot;<br>
&gt; DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot=
;openbmc-phosphor&quot;<br>
&gt; DISTRO_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;0.1.0&quot;<br>
&gt; TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;arm armv6 thumb arm=
1176jzs&quot;<br>
&gt; TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;soft&quot=
;<br>
&gt; meta-zaius=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;master:1a=
4b7ee28bf7413af6513fb45ad0d0736048f866&quot;<br>
&gt;<br>
&gt; ERROR: dbus-broker-16+gitAUTOINC+fc874afa09-r0 do_fetch: Fetcher failu=
re: Fetch command export PSEUDO_DISABLED=3D1; export DBUS_SESSION_BUS_ADDRE=
SS=3D&quot;unix:abstract=3D/tmp/dbus-4MEPus6gYW&quot;; export SSH_AUTH_SOCK=
=3D&quot;/run/user/1000/keyring-5RCWfK/ssh&quot;; export PATH=3D&quot;/../o=
penbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC=
+fc874afa09-r0/recipe-sysroot-native/usr/bin/python3-native:/../openbmc/scr=
ipts:/../openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/dbus-broker/16+=
gitAUTOINC+fc874afa09-r0/recipe-sysroot-native/usr/bin/arm-openbmc-linux-gn=
ueabi:/../openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/dbus-broker/16=
+gitAUTOINC+fc874afa09-r0/recipe-sysroot/usr/bin/crossscripts:/../openbmc/b=
uild/tmp/work/armv6-openbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc874af=
a09-r0/recipe-sysroot-native/usr/sbin:/../openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/recipe-sysroot-na=
tive/usr/bin:/../openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/dbus-br=
oker/16+gitAUTOINC+fc874afa09-r0/recipe-sysroot-native/sbin:/../openbmc/bui=
ld/tmp/work/armv6-openbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa0=
9-r0/recipe-sysroot-native/bin:/../openbmc/poky/bitbake/bin:/../openbmc/bui=
ld/tmp/hosttools&quot;; export HOME=3D&quot;/home/omkar&quot;; LANG=3DC git=
 -c core.fsyncobjectfiles=3D0 clone --bare --mirror git://<a href=3D"http:/=
/github.com/bus1/dbus-broker" rel=3D"noreferrer" target=3D"_blank">github.c=
om/bus1/dbus-broker</a> /../openbmc/build/downloads/git2/github.com.bus1.db=
us-broker --progress failed with exit code 128, output:<br>
&gt; Cloning into bare repository &#39;/../openbmc/build/downloads/git2/git=
hub.com.bus1.dbus-broker&#39;...<br>
&gt; fatal: unable to connect to <a href=3D"http://github.com" rel=3D"noref=
errer" target=3D"_blank">github.com</a>:<br>
&gt; <a href=3D"http://github.com" rel=3D"noreferrer" target=3D"_blank">git=
hub.com</a>[0: 52.74.223.119]: errno=3DConnection timed out<br>
&gt; <a href=3D"http://github.com" rel=3D"noreferrer" target=3D"_blank">git=
hub.com</a>[1: 13.250.177.223]: errno=3DConnection timed out<br>
&gt; <a href=3D"http://github.com" rel=3D"noreferrer" target=3D"_blank">git=
hub.com</a>[2: 13.229.188.59]: errno=3DConnection timed out<br>
<br>
These certainly looks suspicious. Intermittent github connection issues?<br=
>
Did you try rebuilding a few times? The initial build requires a lot<br>
of network based downloads.<br>
<br>
&gt;<br>
&gt; ERROR: dbus-broker-16+gitAUTOINC+fc874afa09-r0 do_fetch: Fetcher failu=
re for URL: &#39;gitsm://<a href=3D"http://github.com/bus1/dbus-broker;prot=
ocol=3Dgit" rel=3D"noreferrer" target=3D"_blank">github.com/bus1/dbus-broke=
r;protocol=3Dgit</a>&#39;. Unable to fetch URL from any source.<br>
&gt; ERROR: dbus-broker-16+gitAUTOINC+fc874afa09-r0 do_fetch: Function fail=
ed: base_do_fetch<br>
&gt; ERROR: Logfile of failure stored in: /../openbmc/build/tmp/work/armv6-=
openbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/temp/log.do_f=
etch.2531<br>
&gt; ERROR: Task (/../openbmc/meta-openembedded/meta-oe/recipes-core/dbus/d=
bus-broker_git.bb:do_fetch) failed with exit code &#39;1&#39;<br>
&gt; NOTE: Tasks Summary: Attempted 2757 tasks of which 2756 didn&#39;t nee=
d to be rerun and 1 failed.<br>
&gt;<br>
&gt; Summary: 1 task failed:<br>
&gt;=C2=A0 =C2=A0/../openbmc/meta-openembedded/meta-oe/recipes-core/dbus/db=
us-broker_git.bb:do_fetch<br>
&gt;<br>
&gt; I&#39;m trying to build the open bmc project for the first time. I tri=
ed to build for Romulus, Palmetto and Zaius. Each build failed with a diffe=
rent error. I don&#39;t have the errors for other builds. Please let me kno=
w how to resolve this error.<br>
&gt;<br>
&gt; Thanks in advance,<br>
&gt; Omkar<br>
&gt;<br>
&gt; CONFIDENTIALITY<br>
&gt; This e-mail message and any attachments thereto, is intended only for =
use by the addressee(s) named herein and may contain legally privileged and=
/or confidential information. If you are not the intended recipient of this=
 e-mail message, you are hereby notified that any dissemination, distributi=
on or copying of this e-mail message, and any attachments thereto, is stric=
tly prohibited. If you have received this e-mail message in error, please i=
mmediately notify the sender and permanently delete the original and any co=
pies of this email and any prints thereof.<br>
&gt; ABSENT AN EXPRESS STATEMENT TO THE CONTRARY HEREINABOVE, THIS E-MAIL I=
S NOT INTENDED AS A SUBSTITUTE FOR A WRITING. Notwithstanding the Uniform E=
lectronic Transactions Act or the applicability of any other law of similar=
 substance and effect, absent an express statement to the contrary hereinab=
ove, this e-mail message its contents, and any attachments hereto are not i=
ntended to represent an offer or acceptance to enter into a contract and ar=
e not otherwise intended to bind the sender, Sanmina Corporation (or any of=
 its subsidiaries), or any other person or entity.<br>
</blockquote></div>

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
--000000000000be7574057f8cf101--
