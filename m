Return-Path: <tssheldonpotter@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::c42; helo=mail-yw1-xc42.google.com;
 envelope-from=tssheldonpotter@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="eneVGTlj"; 
 dkim-atps=neutral
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Zpkz37JDzDqLF
 for <openbmc@lists.ozlabs.org>; Thu, 10 Jan 2019 12:46:51 +1100 (AEDT)
Received: by mail-yw1-xc42.google.com with SMTP id g75so3791043ywb.1
 for <openbmc@lists.ozlabs.org>; Wed, 09 Jan 2019 17:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ROeKxjC0iA7FdDZw0FDD5z2HFGad77/vEVqoZjWG4z4=;
 b=eneVGTljO5DSvGg9Dx9UaK6O7CZbA7FmAadIANKK0bDFUhBuw0p8i1Bynr8eX6dw5s
 9ZOhxy/zlaCbIvgD3eTa9KTF2tJTRyc153sdCKLS2ngIlrLxXx8Ouat084qq+tgjYAlb
 Ochznmgbi7kOhcrCtJ0eXM375ZE9kdXG8oE9TaMbsaAT5CZW7fvzECpXjvwCmoBjRsNx
 r/cttpc9zSV5UlEfDrJLX9Q7q087qizx/BtC8DzG0jG6PNwpinVl97lqxp404RL4hcOd
 pWlKIsqDtTkEoSyptNjgB6V/vL6Mtz93s+HR6lBCFN35cGhO1iG9eBn/NhV1O2wj+g0R
 iXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ROeKxjC0iA7FdDZw0FDD5z2HFGad77/vEVqoZjWG4z4=;
 b=CpYg7YZjiydCauYoK1fDnQzIEXyYrA+Xx/0fA++JLsVSRg3xsGUITgE5uz/7lnu2dA
 0LPbInl9Y372gJyPB5FthnbKqxkrIZ73LkUtt4BBuwON6Irgz+QvoN9kY06uAVLNG08T
 XIr1aU6bOQKHRVLM6/ndxNQa0vp/2Bb32FGHSRO5IFe9b0N36k4hDCv3iPeFVFv3/bhG
 ZyrHvy3Ve3dydgCUp6RCiV7S9USy8YUld5AnwZSkKv6lIOV0DlnWspJkNJRwc+EE2P4a
 kQ+eE2Id1E9sFqZP697otr27Bdntll6cS3BHeOpac1Q82hm5IQWTD0OiBXwl0y3aiXox
 MG2Q==
X-Gm-Message-State: AJcUukdukq92DerjKSD16LPqzYoFZyAvqny6B/w4sB7gy78c5B6MAQ3L
 lb4IuHwA5LjzjAo4qTnVHSj9HctzjJVufejiw4I=
X-Google-Smtp-Source: ALg8bN5UcRK0HMI+H/YT6be37kxIRhqd15GtFLouJe22oddqWHKwjnlwrHbfDYOp0Y7CTxVkl1T7OdE+k/vcxsZRFQ4=
X-Received: by 2002:a81:7c04:: with SMTP id x4mr8005649ywc.264.1547084808535; 
 Wed, 09 Jan 2019 17:46:48 -0800 (PST)
MIME-Version: 1.0
References: <CAG4=AL-mZMe5iySguXGm9Nk2qXOtDvrj-9Acf+8eSMpX=MhbKA@mail.gmail.com>
 <CAO=notxSSvD2V_1tV+MBbfPqRD7qfSMvsOY2-6Q-aY0JzW-R9Q@mail.gmail.com>
 <CADKL2t5pdQ5zNEnn4S+Y9nEUR+XMBv5R2DdvoQLXZ4YNrz0dag@mail.gmail.com>
In-Reply-To: <CADKL2t5pdQ5zNEnn4S+Y9nEUR+XMBv5R2DdvoQLXZ4YNrz0dag@mail.gmail.com>
From: Sheldon 13 <tssheldonpotter@gmail.com>
Date: Thu, 10 Jan 2019 09:46:39 +0800
Message-ID: <CAG4=AL8xiASCsHJGsQ-w52uPYqvhWtf-Qs1m01rbekbZdsN39g@mail.gmail.com>
Subject: Re: do_cofigure fail
To: Benjamin Fair <benjaminfair@google.com>
Cc: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000734271057f10c09a"
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
X-List-Received-Date: Thu, 10 Jan 2019 01:46:52 -0000

--000000000000734271057f10c09a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am using openbmc-v2.2 and want to add some new features,just for test.
But when I try to add any application, not only sdbus
or phosphor-fan-presence, but all the application I tried have this problem=
.
Here is my step:
(1)export TEMPLATECONF=3Dmeta-ibm/meta-palmetto/conf
(2)openbmc-env
(3)devtool add sdbusplus https://github.com/openbmc/sdbusplus.git
(4) vim openbmc/build/conf/local.conf
     add"IMAGE_INSTALL_append =3D " welcome" "
(5)bitbake bitbake obmc-phosphor-image

I have change to existing recipes but the problem is as the same.

Benjamin Fair <benjaminfair@google.com> =E4=BA=8E2019=E5=B9=B41=E6=9C=8810=
=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=882:59=E5=86=99=E9=81=93=EF=BC=
=9A

> On Wed, Jan 9, 2019 at 10:05 AM Patrick Venture <venture@google.com>
> wrote:
> >
> > On Wed, Jan 9, 2019 at 12:16 AM Sheldon 13 <tssheldonpotter@gmail.com>
> wrote:
> > >
> > > After I add a new application (such as sdbus or phosphor-fan-presence=
)
> using DEVTOOL, I build it with BITBAKE, but it always get error like this=
:
>
> Why are you adding a new recipe for these applications? You should be
> able to use the existing recipes that have already been written.
>
> Here's the one for sdbusplus for instance:
>
> https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-exte=
nded/sdbusplus/sdbusplus_git.bb
>
> > > ##########################################################
> > > NOTE: Executing RunQueue Tasks
> > > ERROR: sdbusplus-1.0+git999-r0 do_configure: configure failed
> > > ERROR: sdbusplus-1.0+git999-r0 do_configure: Function failed:
> do_configure (log file is located at
> /home/sheldon13/dev/openbmc-2.2/build/tmp/work/armv5e-openbmc-linux-gnuea=
bi/sdbusplus/1.0+git999-r0/temp/log.do_configure.114229)
> > > ERROR: Logfile of failure stored in:
> /home/sheldon13/dev/openbmc-2.2/build/tmp/work/armv5e-openbmc-linux-gnuea=
bi/sdbusplus/1.0+git999-r0/temp/log.do_configure.114229
> > > Log data follows:
> > > | DEBUG: Executing python function externalsrc_configure_prefunc
> > > ############################################################
> > >
> > >
> > >
> > > My recipe file sdbusplus_git.bb was automatically generated by the
> DEVTOOL command ,it is like this:
> > >
> #########################################################################=
#########################################
> > > # Recipe created by recipetool
> > > # This is the basis of a recipe and may need further editing in order
> to be fully functional.
> > > # (Feel free to remove these comments when editing.)
> > >
> > > # WARNING: the following LICENSE and LIC_FILES_CHKSUM values are best
> guesses - it is
> > > # your responsibility to verify that the values are complete and
> correct.
> > > #
> > > # The following license files were not able to be identified and are
> > > # represented as "Unknown" below, you will need to check them yoursel=
f:
> > > #   LICENSE
> > > LICENSE =3D "Unknown"
> > > LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3De3fc50a88d0a364313df4b21ef20c29e"
> > >
> > > SRC_URI =3D "git://github.com/openbmc/sdbusplus.git;protocol=3Dhttps"
> > >
> > > # Modify these as desired
> > > PV =3D "1.0+git${SRCPV}"
> > > SRCREV =3D "09c981700d7bd98eed54a670e959a424585dcd84"
> > >
> > > S =3D "${WORKDIR}/git"
> > >
> > > # NOTE: the following library dependencies are unknown, ignoring:
> gtest gmock
> > > #       (this is based on recipes that have previously been built and
> packaged)
> > > DEPENDS =3D "gtest systemd"
> > >
> > > # NOTE: if this software is not capable of being built in a separate
> build directory
> > > # from the source, you should replace autotools with
> autotools-brokensep in the
> > > # inherit line
> > > inherit pkgconfig pythonnative autotools
> > >
> > > # Specify any options you want to pass to the configure script using
> EXTRA_OECONF:
> > > EXTRA_OECONF =3D ""
> > >
> #########################################################################=
######################################
> > > and I didn't change the recipe and didn't know how to change it. Can
> you help me build my project?
> >
> > Can you provide your full steps to reproduce your workspace, such as,
> > git clone openbmc, git clone sdbusplus, and so on, as I haven't had
> > issues recently with devtool.
>
> Can you also describe what you're trying to accomplish? Feel free to
> join the IRC channel #openbmc on freenode.net if that's easier.
>
> Benjamin
>

--000000000000734271057f10c09a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"lt=
r">I am using openbmc-v2.2 and want to add some new features,just for test.=
 But when I try to add any=C2=A0application, not only sdbus or=C2=A0phospho=
r-fan-presence, but all the application I tried have this problem.</div><di=
v>Here is my step:</div><div><div>(1)export TEMPLATECONF=3Dmeta-ibm/meta-pa=
lmetto/conf</div></div><div>(2)openbmc-env<br></div><div>(3)devtool add sdb=
usplus=C2=A0<a href=3D"https://github.com/openbmc/sdbusplus.git">https://gi=
thub.com/openbmc/sdbusplus.git</a></div><div>(4) vim openbmc/build/conf/loc=
al.conf</div><div>=C2=A0 =C2=A0 =C2=A0add&quot;IMAGE_INSTALL_append =3D &qu=
ot; welcome&quot; &quot;</div><div>(5)bitbake=C2=A0bitbake obmc-phosphor-im=
age</div><div><br></div><div>I have change to existing recipes but the prob=
lem is as the same.</div></div></div></div></div></div></div></div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr">Benjamin Fair &lt;<a href=3D"=
mailto:benjaminfair@google.com">benjaminfair@google.com</a>&gt; =E4=BA=8E20=
19=E5=B9=B41=E6=9C=8810=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=882:59=
=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Wed, Jan 9, 2019 at 10:05 AM Patrick Venture &lt;<a href=3D"=
mailto:venture@google.com" target=3D"_blank">venture@google.com</a>&gt; wro=
te:<br>
&gt;<br>
&gt; On Wed, Jan 9, 2019 at 12:16 AM Sheldon 13 &lt;<a href=3D"mailto:tsshe=
ldonpotter@gmail.com" target=3D"_blank">tssheldonpotter@gmail.com</a>&gt; w=
rote:<br>
&gt; &gt;<br>
&gt; &gt; After I add a new application (such as sdbus or phosphor-fan-pres=
ence) using DEVTOOL, I build it with BITBAKE, but it always get error like =
this:<br>
<br>
Why are you adding a new recipe for these applications? You should be<br>
able to use the existing recipes that have already been written.<br>
<br>
Here&#39;s the one for sdbusplus for instance:<br>
<a href=3D"https://github.com/openbmc/openbmc/blob/master/meta-phosphor/rec=
ipes-extended/sdbusplus/sdbusplus_git.bb" rel=3D"noreferrer" target=3D"_bla=
nk">https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-ex=
tended/sdbusplus/sdbusplus_git.bb</a><br>
<br>
&gt; &gt; ##########################################################<br>
&gt; &gt; NOTE: Executing RunQueue Tasks<br>
&gt; &gt; ERROR: sdbusplus-1.0+git999-r0 do_configure: configure failed<br>
&gt; &gt; ERROR: sdbusplus-1.0+git999-r0 do_configure: Function failed: do_=
configure (log file is located at /home/sheldon13/dev/openbmc-2.2/build/tmp=
/work/armv5e-openbmc-linux-gnueabi/sdbusplus/1.0+git999-r0/temp/log.do_conf=
igure.114229)<br>
&gt; &gt; ERROR: Logfile of failure stored in: /home/sheldon13/dev/openbmc-=
2.2/build/tmp/work/armv5e-openbmc-linux-gnueabi/sdbusplus/1.0+git999-r0/tem=
p/log.do_configure.114229<br>
&gt; &gt; Log data follows:<br>
&gt; &gt; | DEBUG: Executing python function externalsrc_configure_prefunc<=
br>
&gt; &gt; ############################################################<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; My recipe file <a href=3D"http://sdbusplus_git.bb" rel=3D"norefer=
rer" target=3D"_blank">sdbusplus_git.bb</a> was automatically generated by =
the DEVTOOL command ,it is like this:<br>
&gt; &gt; #################################################################=
#################################################<br>
&gt; &gt; # Recipe created by recipetool<br>
&gt; &gt; # This is the basis of a recipe and may need further editing in o=
rder to be fully functional.<br>
&gt; &gt; # (Feel free to remove these comments when editing.)<br>
&gt; &gt;<br>
&gt; &gt; # WARNING: the following LICENSE and LIC_FILES_CHKSUM values are =
best guesses - it is<br>
&gt; &gt; # your responsibility to verify that the values are complete and =
correct.<br>
&gt; &gt; #<br>
&gt; &gt; # The following license files were not able to be identified and =
are<br>
&gt; &gt; # represented as &quot;Unknown&quot; below, you will need to chec=
k them yourself:<br>
&gt; &gt; #=C2=A0 =C2=A0LICENSE<br>
&gt; &gt; LICENSE =3D &quot;Unknown&quot;<br>
&gt; &gt; LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3De3fc50a88d0a36431=
3df4b21ef20c29e&quot;<br>
&gt; &gt;<br>
&gt; &gt; SRC_URI =3D &quot;git://<a href=3D"http://github.com/openbmc/sdbu=
splus.git;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com=
/openbmc/sdbusplus.git;protocol=3Dhttps</a>&quot;<br>
&gt; &gt;<br>
&gt; &gt; # Modify these as desired<br>
&gt; &gt; PV =3D &quot;1.0+git${SRCPV}&quot;<br>
&gt; &gt; SRCREV =3D &quot;09c981700d7bd98eed54a670e959a424585dcd84&quot;<b=
r>
&gt; &gt;<br>
&gt; &gt; S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &gt;<br>
&gt; &gt; # NOTE: the following library dependencies are unknown, ignoring:=
 gtest gmock<br>
&gt; &gt; #=C2=A0 =C2=A0 =C2=A0 =C2=A0(this is based on recipes that have p=
reviously been built and packaged)<br>
&gt; &gt; DEPENDS =3D &quot;gtest systemd&quot;<br>
&gt; &gt;<br>
&gt; &gt; # NOTE: if this software is not capable of being built in a separ=
ate build directory<br>
&gt; &gt; # from the source, you should replace autotools with autotools-br=
okensep in the<br>
&gt; &gt; # inherit line<br>
&gt; &gt; inherit pkgconfig pythonnative autotools<br>
&gt; &gt;<br>
&gt; &gt; # Specify any options you want to pass to the configure script us=
ing EXTRA_OECONF:<br>
&gt; &gt; EXTRA_OECONF =3D &quot;&quot;<br>
&gt; &gt; #################################################################=
##############################################<br>
&gt; &gt; and I didn&#39;t change the recipe and didn&#39;t know how to cha=
nge it. Can you help me build my project?<br>
&gt;<br>
&gt; Can you provide your full steps to reproduce your workspace, such as,<=
br>
&gt; git clone openbmc, git clone sdbusplus, and so on, as I haven&#39;t ha=
d<br>
&gt; issues recently with devtool.<br>
<br>
Can you also describe what you&#39;re trying to accomplish? Feel free to<br=
>
join the IRC channel #openbmc on <a href=3D"http://freenode.net" rel=3D"nor=
eferrer" target=3D"_blank">freenode.net</a> if that&#39;s easier.<br>
<br>
Benjamin<br>
</blockquote></div>

--000000000000734271057f10c09a--
