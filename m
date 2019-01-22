Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Kh2L/HXl"; 
 dkim-atps=neutral
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43kV8k3D4KzDqLk
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jan 2019 00:47:18 +1100 (AEDT)
Received: by mail-ot1-x336.google.com with SMTP id s5so23630702oth.7
 for <openbmc@lists.ozlabs.org>; Tue, 22 Jan 2019 05:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3wMMd5gTBZ1ikjTeYVWTqkLtfF54WGZd0jjpd6fEWFo=;
 b=Kh2L/HXlNWZKxpoU+/pxg9i01tIFxyssEIQDmOP+AsBlro/x8WJ74g5otyFYVwhRCR
 XHdSHTDdDlBsucov7zTEUuy+IAu2U334tV8HgVKdecSo2CaLbat+4a5RKuZgJqOBQv4W
 rAil/ZpYeK108jUEGOgt67UaD2wRzhSpLHeLh5fhPkWukVo9C2CBetRN5HGGqIccGkL4
 iY9mZLFDsBR2b7qC8Z6YJD6i4/kEp5Cm0Sp0Z7B6yaYkD2NOUnZ5g+tZBj4HygsbNw06
 UjUnoLLzvp4UCaftFEEYo0VUarx2sbismyPtnshT2vHmtqjyuylQ/vNKRRhcPDLuDFpM
 ntRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3wMMd5gTBZ1ikjTeYVWTqkLtfF54WGZd0jjpd6fEWFo=;
 b=qZ14b2qLszpJ9VWvvSgdJuJVLNEQV5BYGZ6HhM9R3tRMvzsV1pjbL/tFz0DZDQBAqw
 x02lBaM1bCuxNBGxt1eSj9AKa5gGR6+xo4CyksbyFWpuLTVIIWtSEbmbg4jSOHMI55T1
 Uoli+rCNi4QXOITK1TgIzWxrwuMlvciH/ClMGkIwxo9viRP19OLt6Rgg5nQ6FmuHtRIq
 +TR0cluWgivPzrPjXOAx0qSAH7emr2nWbgUYFq3AZEkgfQGssQShCQ2A4gFAgp49+ykf
 C8rRkGV4y2K4u/N8esza5qrtFTXasVmMhe2cp/zpAFK9YmdSj1Rdb5vpZ5CLczyVj/HS
 E4EA==
X-Gm-Message-State: AJcUukf4LGzurOFEuyPfHrR6Au5QRyKa/FLogkRJ9Hw124GKcA/81BTN
 GvwYYDQUgM86w5NKWGAEtcKBjNsR/vhFkndtkiIIb+Kp
X-Google-Smtp-Source: ALg8bN4wwD+wQPyzjLYWM4BHFiX0PbJcfGAyNMrFHxh7vKidv/+nkfcUw9x+1swKRzuWvr3HVKXGM0ECi1aF01/BxfU=
X-Received: by 2002:a9d:71c9:: with SMTP id z9mr23000456otj.294.1548164836529; 
 Tue, 22 Jan 2019 05:47:16 -0800 (PST)
MIME-Version: 1.0
References: <SN6PR02MB569357D7F6705F757F805F3796980@SN6PR02MB5693.namprd02.prod.outlook.com>
In-Reply-To: <SN6PR02MB569357D7F6705F757F805F3796980@SN6PR02MB5693.namprd02.prod.outlook.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 22 Jan 2019 07:47:00 -0600
Message-ID: <CALLMt=pqGNzLqiED=o=hK9N9Td-Q+r_y0mpvQTVm7UNsjMMMSg@mail.gmail.com>
Subject: Re: build and enviroment questions
To: Brenden Lai <Brenden_Lai@jabil.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 22 Jan 2019 13:47:19 -0000

On Tue, Jan 22, 2019 at 12:35 AM Brenden Lai <Brenden_Lai@jabil.com> wrote:
>
> Hi all ,
>
> I have couple questions about build code
>
> Question 1 :
>
> If  I follow the steps of GITHUB openbmc readme to build code , it always=
 failed due to bitbake not found as below :
> export TEMPLATECONF=3Dmeta-ibm/meta-palmetto/conf
> ./openbmc-env
> brenden@brenden-VirtualBox:~/OCP/openbmc$ bitbake obmc-phosphor-image
> WARNING:root:could not open file '/etc/apt/sources.list.d/nodesource.list=
'
>
> bitbake: command not found
> But after I try use :
> source ./setup palmetto
> Then the build process goes smoothly .What the difference between this tw=
o method ?

I'm not sure, the directions are ". openbmc-env" but I'm not sure if
that's really much different
then what you're doing. I don't think by default it's executable though.

> Question 2 :
> The build configuration info MACHINE always show =E2=80=9Czaius=E2=80=9D =
, even if  build for palmetto and  romulus
>
> Build Configuration:
> BB_VERSION           =3D "1.40.0"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "ubuntu-16.04"
> TARGET_SYS           =3D "arm-openbmc-linux-gnueabi"
> MACHINE              =3D "zaius"
> DISTRO               =3D "openbmc-phosphor"
> DISTRO_VERSION       =3D "0.1.0"
> TUNE_FEATURES        =3D "arm armv6 thumb arm1176jzs"
> TARGET_FPU           =3D "soft"
> meta
> meta-poky
> meta-oe
> meta-networking
> meta-perl
> meta-python
> meta-webserver
> meta-phosphor
> meta-aspeed
> meta-openpower
> meta-ingrasys
> meta-zaius           =3D "master:50ea7cc89521929e29d0836367fa8b06776ce4c2=
"
>
> Here is my scripts:
> For: romulus
> source ./setup romulus
> bitbake obmc-phosphor-imag
> For
>                source ./setup palmetto
>
> bitbake obmc-phosphor-imag
>
> Is it a normal behavior or my environment setting wrong ?

If you're reusing a build directory then it will only use whatever it
was first setup for. You need
to remove the conf directory before entering into the build env if you
want it to look at your
new TEMPLATECONF (i.e. rm -r build/conf && . openbmc-env)

>
> Question 3 :
> I understand it long time for first build , due to it may install some pr=
erequisite
> But Why it still take so long time to build while the build target machin=
e is different from previous build ?
> I saw it take over 5000 task(see below ) just like first build , Does it =
make sense ?
>
> Initialising tasks: 100% |#######################################| Time: =
0:00:05
> Sstate summary: Wanted 1476 Found 0 Missed 1476 Current 345 (0% match, 18=
% complete)
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> Currently  1 running tasks (440 of 5152)   8% |##                        =
      |

If you're moving between an AST2400 or AST2500 system you'll
definitely see a big impact
due to different version packages in each. Even going between fairly
similar systems usually
has a pretty big hit the first time. Internally we've created a shared
nfs folder that has the
downloads and sstate cache and we have a job that periodically builds
all systems and
updates those caches. When we setup our dev environment we utilize
that customrc feature
from openbmc-env to setup the SOURCE_MIRROR_URL and SSTATE_MIRRORS flags
to use those share caches. The infrastructure workgroup has an action
item to generate
these cache files up on openpower.xyz so people could download them to
speed up their
own builds.

>
> Thanks -Brenden
> Brenden Lai
> SR. BMC Design Engineer
> E&I, Jabil Design Services
>
>
