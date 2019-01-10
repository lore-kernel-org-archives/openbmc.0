Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="QcNzk4lA"; 
 dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43bBWq1dlDzDqsM
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 03:38:31 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id v28so5034091pgk.10
 for <openbmc@lists.ozlabs.org>; Thu, 10 Jan 2019 08:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9f/iL1ccqgdK5bF7WFi+redVkBxtsCWBOX2qGU0dXco=;
 b=QcNzk4lAvX/27d/1Ra5Yv8AltU14dImPzYcMyx/HrBoNIZMstlvNQ9kVCa7xb3Nx2J
 LV0ubKtzi5AK6QU4TBKsHsZgRrimu8VDSjIOtKSKk/am4MN3ToyHSH3D6o0ba0sJPedB
 HLICeKyW1EUtR41jHarK4+s8U/+5Fy+N2iAkUcpwkvtpMe3tvAKniYG3oYss7yGbBt72
 xaIbFnMXC2IBzIHx9CAHbf2+Mn78xfG3q7ftNYcGaYGGhOc3Ok+NvJkTw9wBA9waVxA/
 Rh0lU+k4jvhyJOyIMgXFK3g5223VN58QI7gAHU2YuouFhtdKMehMSvC/Qz8P4Zhg3F43
 lCJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9f/iL1ccqgdK5bF7WFi+redVkBxtsCWBOX2qGU0dXco=;
 b=GqSpwDKnP9U1inV219yyN6d9Dh4vYzeveZ16OAoOmEHKE641vR17POUdmE/qLfYqi7
 ConBrydMJ3KJSiIocMVcyP0pqLAsBQEaRk3H3mpumUUgROKYMiP9ELLH+6PhDQ9ReIrE
 GjoXBHtTXbclgAug0y0u9jWT0snzixlfiORv2DbOVSZN6WahsUtXeQpSceAtnAptm5au
 Vw0G6M55C0QL1KHa3vwI0+alhf3PrJxYHDkoXs0mPO5SSiOCwVBG6k8wjaLS7kAdW/AG
 Hj7dOMRXmzQq2aFKAGhTN08fMDw3FHcqsR8ljB/nCjI5k/qbzU74DG9TvZlqNBfZQn+Z
 4eJg==
X-Gm-Message-State: AJcUukfLNkOY2cUuaVFM32C+JrnszDCE+snOpXwgt50TFesL31bDT3r0
 OEOhZ/31Cp26DrXvf4O3Fu8VGU6naKLtLR3+x4dsmw==
X-Google-Smtp-Source: ALg8bN637S7GCv2j14S/2gGYhg2ek9VdVmovszzoZTThKz0bhQIa5RqaxC8WoJ+IGqWZX2tWrbQ6FTCu4R8Q/ZswrwI=
X-Received: by 2002:a63:9a09:: with SMTP id o9mr9594557pge.94.1547138308810;
 Thu, 10 Jan 2019 08:38:28 -0800 (PST)
MIME-Version: 1.0
References: <CAG4=AL-mZMe5iySguXGm9Nk2qXOtDvrj-9Acf+8eSMpX=MhbKA@mail.gmail.com>
 <CAO=notxSSvD2V_1tV+MBbfPqRD7qfSMvsOY2-6Q-aY0JzW-R9Q@mail.gmail.com>
 <CADKL2t5pdQ5zNEnn4S+Y9nEUR+XMBv5R2DdvoQLXZ4YNrz0dag@mail.gmail.com>
 <CAG4=AL8xiASCsHJGsQ-w52uPYqvhWtf-Qs1m01rbekbZdsN39g@mail.gmail.com>
In-Reply-To: <CAG4=AL8xiASCsHJGsQ-w52uPYqvhWtf-Qs1m01rbekbZdsN39g@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 10 Jan 2019 08:38:17 -0800
Message-ID: <CAO=notwABHYAZ04S4JjUGXAoEfWz2eDLXHGk3_Hd+skt5va0KQ@mail.gmail.com>
Subject: Re: do_cofigure fail
To: Sheldon 13 <tssheldonpotter@gmail.com>
Cc: Benjamin Fair <benjaminfair@google.com>,
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
X-List-Received-Date: Thu, 10 Jan 2019 16:38:32 -0000

On Wed, Jan 9, 2019 at 5:46 PM Sheldon 13 <tssheldonpotter@gmail.com> wrote=
:
>
> I am using openbmc-v2.2 and want to add some new features,just for test. =
But when I try to add any application, not only sdbus or phosphor-fan-prese=
nce, but all the application I tried have this problem.
> Here is my step:
> (1)export TEMPLATECONF=3Dmeta-ibm/meta-palmetto/conf
> (2)openbmc-env
> (3)devtool add sdbusplus https://github.com/openbmc/sdbusplus.git
> (4) vim openbmc/build/conf/local.conf
>      add"IMAGE_INSTALL_append =3D " welcome" "
> (5)bitbake bitbake obmc-phosphor-image
>
> I have change to existing recipes but the problem is as the same.
>
> Benjamin Fair <benjaminfair@google.com> =E4=BA=8E2019=E5=B9=B41=E6=9C=881=
0=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=882:59=E5=86=99=E9=81=93=EF=BC=
=9A
>>
>> On Wed, Jan 9, 2019 at 10:05 AM Patrick Venture <venture@google.com> wro=
te:
>> >
>> > On Wed, Jan 9, 2019 at 12:16 AM Sheldon 13 <tssheldonpotter@gmail.com>=
 wrote:
>> > >
>> > > After I add a new application (such as sdbus or phosphor-fan-presenc=
e) using DEVTOOL, I build it with BITBAKE, but it always get error like thi=
s:
>>
>> Why are you adding a new recipe for these applications? You should be
>> able to use the existing recipes that have already been written.

^--- per Benjamin, sdbusplus is already a recipe.  If you want to
develop against it use:

devtool modify -n sdbusplus /workspaces/sdbusplus_wip

s.t. sdbusplus_wip is where you've checked out the code you wish to
modify.  That said, v2.2 of openbmc may be too old to work with HEAD
of sdbusplus.


>>
>> Here's the one for sdbusplus for instance:
>> https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-ext=
ended/sdbusplus/sdbusplus_git.bb
>>
>> > > ##########################################################
>> > > NOTE: Executing RunQueue Tasks
>> > > ERROR: sdbusplus-1.0+git999-r0 do_configure: configure failed
>> > > ERROR: sdbusplus-1.0+git999-r0 do_configure: Function failed: do_con=
figure (log file is located at /home/sheldon13/dev/openbmc-2.2/build/tmp/wo=
rk/armv5e-openbmc-linux-gnueabi/sdbusplus/1.0+git999-r0/temp/log.do_configu=
re.114229)
>> > > ERROR: Logfile of failure stored in: /home/sheldon13/dev/openbmc-2.2=
/build/tmp/work/armv5e-openbmc-linux-gnueabi/sdbusplus/1.0+git999-r0/temp/l=
og.do_configure.114229
>> > > Log data follows:
>> > > | DEBUG: Executing python function externalsrc_configure_prefunc
>> > > ############################################################
>> > >
>> > >
>> > >
>> > > My recipe file sdbusplus_git.bb was automatically generated by the D=
EVTOOL command ,it is like this:
>> > > ####################################################################=
##############################################
>> > > # Recipe created by recipetool
>> > > # This is the basis of a recipe and may need further editing in orde=
r to be fully functional.
>> > > # (Feel free to remove these comments when editing.)
>> > >
>> > > # WARNING: the following LICENSE and LIC_FILES_CHKSUM values are bes=
t guesses - it is
>> > > # your responsibility to verify that the values are complete and cor=
rect.
>> > > #
>> > > # The following license files were not able to be identified and are
>> > > # represented as "Unknown" below, you will need to check them yourse=
lf:
>> > > #   LICENSE
>> > > LICENSE =3D "Unknown"
>> > > LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De3fc50a88d0a364313df4b21e=
f20c29e"
>> > >
>> > > SRC_URI =3D "git://github.com/openbmc/sdbusplus.git;protocol=3Dhttps=
"
>> > >
>> > > # Modify these as desired
>> > > PV =3D "1.0+git${SRCPV}"
>> > > SRCREV =3D "09c981700d7bd98eed54a670e959a424585dcd84"
>> > >
>> > > S =3D "${WORKDIR}/git"
>> > >
>> > > # NOTE: the following library dependencies are unknown, ignoring: gt=
est gmock
>> > > #       (this is based on recipes that have previously been built an=
d packaged)
>> > > DEPENDS =3D "gtest systemd"
>> > >
>> > > # NOTE: if this software is not capable of being built in a separate=
 build directory
>> > > # from the source, you should replace autotools with autotools-broke=
nsep in the
>> > > # inherit line
>> > > inherit pkgconfig pythonnative autotools
>> > >
>> > > # Specify any options you want to pass to the configure script using=
 EXTRA_OECONF:
>> > > EXTRA_OECONF =3D ""
>> > > ####################################################################=
###########################################
>> > > and I didn't change the recipe and didn't know how to change it. Can=
 you help me build my project?
>> >
>> > Can you provide your full steps to reproduce your workspace, such as,
>> > git clone openbmc, git clone sdbusplus, and so on, as I haven't had
>> > issues recently with devtool.
>>
>> Can you also describe what you're trying to accomplish? Feel free to
>> join the IRC channel #openbmc on freenode.net if that's easier.
>>
>> Benjamin
