Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="i8SzRSUz"; 
 dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43bmQr4tbZzDqvh
 for <openbmc@lists.ozlabs.org>; Sat, 12 Jan 2019 02:06:12 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id d72so6413749pga.9
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 07:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=pEdh4aK675468BM1eF7EjMjNSE+OoD/DoiLr3Yn1h38=;
 b=i8SzRSUzr2j9Bl9x/ww5YMsAUt+IBPzrSFQKFbAEs4hPRLOQPN5MPhVes6OANy77A5
 urw8Pb63AdG+bhM6WdftLBHZxM8A2M2vPYEsNycuzEgMq37iTqsX3GgPXh9lFoPSJlPu
 iQN3xiPaxp2VC0+IZf7u2OSAwKCGeYu7+lhx6j264MiiWKPvMtJ1xRjMtd9QAiefJQz6
 EQWpxZkyJf2/uXLyhHX7zIwbVuA/tMH/oIf0XgNkRVXpeeSceC2r7cWKEPrVZMMcCM2P
 dc1Jd3Bt0BSI81o0n1amDEp68DYLJYoTHL+DZcqwpWwc5OCUWGF+ERAwvV4TXBsLh3Pa
 Awjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=pEdh4aK675468BM1eF7EjMjNSE+OoD/DoiLr3Yn1h38=;
 b=fzT8SckzQX6LQOrlZGVK9JLd0sAxvgQRFETCwaaJAp7Tlr0ohrxNSHkZmd2nGWsF19
 19UQuR1a4JGzA9Cips7xFbu9sWWb+brpRJ++nY7Zqkr+g50GWzJj4HZkPDkE3khJ0PFk
 ZqcdYFTDutZAgNkbnWIYF4avf/YpA4WrsIHXF0os+L2qCiQzt+dcoBnYjLxfMPgmH4Ci
 hsmlfGAR2COu1rt806boWuETkOl3UDwEyJuPvdiThL7ePbUa68ICDNUuqtNIxQ+ltdUt
 2S+Xe3ilit1fNdSLndoMsJPat3bOijQ5U7OrtJ+hHPWwQ52qTI1P98pa8WNVFp8Hv/o+
 Uf2g==
X-Gm-Message-State: AJcUukfhTv7pZ5NgPFVGXwTK7xmYCFU98sUNdOB1Iyffwp14l1y92/mU
 ug/NiB8OQH3/H0TXttF7482MS/lcZOSxQEggR6cTCg==
X-Google-Smtp-Source: ALg8bN6Jv7S6dTitPAvCOICspBk+bRfninWoMIiJ1weHwX1bvsXvFO0Oma6dNDhBP6NgLYNMd7hwfGJeO1fHfN2RlfU=
X-Received: by 2002:a63:9a09:: with SMTP id o9mr13127781pge.94.1547219167985; 
 Fri, 11 Jan 2019 07:06:07 -0800 (PST)
MIME-Version: 1.0
References: <CAG4=AL-mZMe5iySguXGm9Nk2qXOtDvrj-9Acf+8eSMpX=MhbKA@mail.gmail.com>
 <CAO=notxSSvD2V_1tV+MBbfPqRD7qfSMvsOY2-6Q-aY0JzW-R9Q@mail.gmail.com>
 <CADKL2t5pdQ5zNEnn4S+Y9nEUR+XMBv5R2DdvoQLXZ4YNrz0dag@mail.gmail.com>
 <CAG4=AL8xiASCsHJGsQ-w52uPYqvhWtf-Qs1m01rbekbZdsN39g@mail.gmail.com>
 <CAO=notwABHYAZ04S4JjUGXAoEfWz2eDLXHGk3_Hd+skt5va0KQ@mail.gmail.com>
 <CAG4=AL_O4MLzMHp+zq6udUang4sXiPr7-Lnr_vEXQcSewGeoyQ@mail.gmail.com>
In-Reply-To: <CAG4=AL_O4MLzMHp+zq6udUang4sXiPr7-Lnr_vEXQcSewGeoyQ@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 11 Jan 2019 07:05:56 -0800
Message-ID: <CAO=notyOgM_ZEBsGZ_RaUULBu8adio=XZvpSZuVjP5JDaHtkDQ@mail.gmail.com>
Subject: Re: do_cofigure fail
To: Sheldon 13 <tssheldonpotter@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Fri, 11 Jan 2019 15:06:13 -0000

On Thu, Jan 10, 2019 at 6:16 PM Sheldon 13 <tssheldonpotter@gmail.com> wrot=
e:
>
> Sorry,I didn't know the sdbus has already in this project, if that's the =
case, then I won't do this. But there is phosphor-fan recipe in the project=
, so do you know how to check the state of fans by it? If I want to update =
it to the newest  version, called phosphor-fan-presence, I guess, what shou=
ld I do?

i'm not super familiar with phosphor-fan-presence configuration, but
searching, I found:

https://github.com/openbmc/openbmc/blob/master/meta-ibm/meta-romulus/recipe=
s-phosphor/fans/phosphor-fan-presence-config-native/config.yaml

>
> Thank you!
>
> Patrick Venture <venture@google.com> =E4=BA=8E2019=E5=B9=B41=E6=9C=8811=
=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8A=E5=8D=8812:38=E5=86=99=E9=81=93=EF=BC=
=9A
>>
>> On Wed, Jan 9, 2019 at 5:46 PM Sheldon 13 <tssheldonpotter@gmail.com> wr=
ote:
>> >
>> > I am using openbmc-v2.2 and want to add some new features,just for tes=
t. But when I try to add any application, not only sdbus or phosphor-fan-pr=
esence, but all the application I tried have this problem.
>> > Here is my step:
>> > (1)export TEMPLATECONF=3Dmeta-ibm/meta-palmetto/conf
>> > (2)openbmc-env
>> > (3)devtool add sdbusplus https://github.com/openbmc/sdbusplus.git
>> > (4) vim openbmc/build/conf/local.conf
>> >      add"IMAGE_INSTALL_append =3D " welcome" "
>> > (5)bitbake bitbake obmc-phosphor-image
>> >
>> > I have change to existing recipes but the problem is as the same.
>> >
>> > Benjamin Fair <benjaminfair@google.com> =E4=BA=8E2019=E5=B9=B41=E6=9C=
=8810=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=882:59=E5=86=99=E9=81=93=
=EF=BC=9A
>> >>
>> >> On Wed, Jan 9, 2019 at 10:05 AM Patrick Venture <venture@google.com> =
wrote:
>> >> >
>> >> > On Wed, Jan 9, 2019 at 12:16 AM Sheldon 13 <tssheldonpotter@gmail.c=
om> wrote:
>> >> > >
>> >> > > After I add a new application (such as sdbus or phosphor-fan-pres=
ence) using DEVTOOL, I build it with BITBAKE, but it always get error like =
this:
>> >>
>> >> Why are you adding a new recipe for these applications? You should be
>> >> able to use the existing recipes that have already been written.
>>
>> ^--- per Benjamin, sdbusplus is already a recipe.  If you want to
>> develop against it use:
>>
>> devtool modify -n sdbusplus /workspaces/sdbusplus_wip
>>
>> s.t. sdbusplus_wip is where you've checked out the code you wish to
>> modify.  That said, v2.2 of openbmc may be too old to work with HEAD
>> of sdbusplus.
>>
>>
>> >>
>> >> Here's the one for sdbusplus for instance:
>> >> https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-=
extended/sdbusplus/sdbusplus_git.bb
>> >>
>> >> > > ##########################################################
>> >> > > NOTE: Executing RunQueue Tasks
>> >> > > ERROR: sdbusplus-1.0+git999-r0 do_configure: configure failed
>> >> > > ERROR: sdbusplus-1.0+git999-r0 do_configure: Function failed: do_=
configure (log file is located at /home/sheldon13/dev/openbmc-2.2/build/tmp=
/work/armv5e-openbmc-linux-gnueabi/sdbusplus/1.0+git999-r0/temp/log.do_conf=
igure.114229)
>> >> > > ERROR: Logfile of failure stored in: /home/sheldon13/dev/openbmc-=
2.2/build/tmp/work/armv5e-openbmc-linux-gnueabi/sdbusplus/1.0+git999-r0/tem=
p/log.do_configure.114229
>> >> > > Log data follows:
>> >> > > | DEBUG: Executing python function externalsrc_configure_prefunc
>> >> > > ############################################################
>> >> > >
>> >> > >
>> >> > >
>> >> > > My recipe file sdbusplus_git.bb was automatically generated by th=
e DEVTOOL command ,it is like this:
>> >> > > #################################################################=
#################################################
>> >> > > # Recipe created by recipetool
>> >> > > # This is the basis of a recipe and may need further editing in o=
rder to be fully functional.
>> >> > > # (Feel free to remove these comments when editing.)
>> >> > >
>> >> > > # WARNING: the following LICENSE and LIC_FILES_CHKSUM values are =
best guesses - it is
>> >> > > # your responsibility to verify that the values are complete and =
correct.
>> >> > > #
>> >> > > # The following license files were not able to be identified and =
are
>> >> > > # represented as "Unknown" below, you will need to check them you=
rself:
>> >> > > #   LICENSE
>> >> > > LICENSE =3D "Unknown"
>> >> > > LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De3fc50a88d0a364313df4b=
21ef20c29e"
>> >> > >
>> >> > > SRC_URI =3D "git://github.com/openbmc/sdbusplus.git;protocol=3Dht=
tps"
>> >> > >
>> >> > > # Modify these as desired
>> >> > > PV =3D "1.0+git${SRCPV}"
>> >> > > SRCREV =3D "09c981700d7bd98eed54a670e959a424585dcd84"
>> >> > >
>> >> > > S =3D "${WORKDIR}/git"
>> >> > >
>> >> > > # NOTE: the following library dependencies are unknown, ignoring:=
 gtest gmock
>> >> > > #       (this is based on recipes that have previously been built=
 and packaged)
>> >> > > DEPENDS =3D "gtest systemd"
>> >> > >
>> >> > > # NOTE: if this software is not capable of being built in a separ=
ate build directory
>> >> > > # from the source, you should replace autotools with autotools-br=
okensep in the
>> >> > > # inherit line
>> >> > > inherit pkgconfig pythonnative autotools
>> >> > >
>> >> > > # Specify any options you want to pass to the configure script us=
ing EXTRA_OECONF:
>> >> > > EXTRA_OECONF =3D ""
>> >> > > #################################################################=
##############################################
>> >> > > and I didn't change the recipe and didn't know how to change it. =
Can you help me build my project?
>> >> >
>> >> > Can you provide your full steps to reproduce your workspace, such a=
s,
>> >> > git clone openbmc, git clone sdbusplus, and so on, as I haven't had
>> >> > issues recently with devtool.
>> >>
>> >> Can you also describe what you're trying to accomplish? Feel free to
>> >> join the IRC channel #openbmc on freenode.net if that's easier.
>> >>
>> >> Benjamin
