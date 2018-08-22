Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::244; helo=mail-oi0-x244.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="u4naSwNq"; 
 dkim-atps=neutral
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41wgTZ0NvVzDqC8
 for <openbmc@lists.ozlabs.org>; Thu, 23 Aug 2018 07:21:37 +1000 (AEST)
Received: by mail-oi0-x244.google.com with SMTP id q11-v6so5644603oic.12
 for <openbmc@lists.ozlabs.org>; Wed, 22 Aug 2018 14:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=J1csXnZHtHM6aYRIc4oUnAXWXXZ1UkZ58DFbH8Gl/pE=;
 b=u4naSwNq6Lq/gu9hnKvFJ2UsaLm0PafSn+crhVjJMHhGmjElGwecYeDHEzgTzyKXi6
 1T23Gz6K2R/TUHrUnlPV8l1UUzrGisN16XMYET8nkNYcMGU+D7QRnmu5akIZjDPZY37p
 JP0ADZxXBhpr+PL+NuF6GwnoGBJFU4FxW2rCWDzuxhHPZX5yVkZ+522tPVMU9d37eOCW
 zNpuVi3KVvwUVPk5iOsDAd6Cc0+6rapT7KsS7+rubAi1yon5kVIMb13PUtQT3c8TggR2
 q3cZkaSL5AKmHx//1dHOjTM/ManvU8FaTddjrmoaTGC4Tj9dEz+Zy9wVm+QKrZ616Ne1
 r6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=J1csXnZHtHM6aYRIc4oUnAXWXXZ1UkZ58DFbH8Gl/pE=;
 b=Va29TMIhYYz0LeIp9+oiC3UwGyQCU2j1aQKuXI3HyQ6jSSM7cPLeqSaLw9htXtVRSO
 7E+mxE6NqhAaiHyow0b93BffY+SMnTkLWC/66DwYFmpox30ao/yDUsgM5IKXp5S/qdwf
 rBA0zxHyLxlCmZKh5H9hNcTg2XhVyJAaxrWVyLffo5ji3Pka9gJHyRrrC6NJaRNO0LJp
 tARxrrs5gG8oQZwZYt6be/MmJnFgp5iQqWZZxe28IvJI3fEBIm+Jk1D8Dt+LyTovIyeR
 BeXuccGY7lTwHAoVtnybvoYb7dIDlQlh13IDSoSXW9QajmLgA/aB653UG3QP/cuLKGj7
 ZYiQ==
X-Gm-Message-State: APzg51CxY0+ykmBazdMmcNg/W3nOtWORcalAYwxNs9KxBrzJMQHPh1tR
 vGeBfw9dk01XiphMx4qaGfEQjxf3TVK7CpArkdQpC0at
X-Google-Smtp-Source: ANB0VdZIPUDBy1XRhkCbcywON7zJ5DS2hjk3s18LjWpZhr4Vu+mq9oErhyDTH5wrrnhMNqgrsD+SnpCp3uF5tkHt/no=
X-Received: by 2002:aca:120e:: with SMTP id
 14-v6mr4018133ois.146.1534950847364; 
 Wed, 22 Aug 2018 08:14:07 -0700 (PDT)
MIME-Version: 1.0
References: <CALLMt=rzbdeBy9zH-Kz8qG+xnVucPY1pNptidK8SvjLq1KZgTA@mail.gmail.com>
 <955064c2-13d6-c130-58d4-ce8c9ee1c714@splitted-desktop.com>
In-Reply-To: <955064c2-13d6-c130-58d4-ce8c9ee1c714@splitted-desktop.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 22 Aug 2018 10:13:56 -0500
Message-ID: <CALLMt=o_0nhxcR3uAuPpDf2Kym9pxR78AcHeKUxKYi4XkxSV=Q@mail.gmail.com>
Subject: Re: CI compute resources
To: jean-marie.verdun@splitted-desktop.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 ggiamarchi@splitted-desktop.com, Joel Stanley <joel.stan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Wed, 22 Aug 2018 21:21:38 -0000

Hi Jean-Marie,

Thanks for the offer!  I didn't even know we had splitted-desktop in
our OpenBMC community, great to hear from you.  It seems like you have
a mechanism to actually flash OpenBMC firmware on your system, and
then verify the server still boots.  This would be great for the
future, but currently we're just looking to access the Ubuntu OS of a
system and use it to build our OpenBMC distros during our CI process.
Building OpenBMC takes a lot of compute power and our CI jobs build
them for multiple systems in parallel
(https://openpower.xyz/job/openbmc-build-gerrit-trigger-multi/).

If you have an initial system we could use for this then Joel and I
could work with you privately to connect it up to our jenkins server
(ssh key exchanges).

Thanks!
Andrew
On Wed, Aug 22, 2018 at 3:40 AM Jean-Marie Verdun
<jean-marie.verdun@splitted-desktop.com> wrote:
>
> Hi Andrew,
>
> We can provide access to a couple of additionnal servers without any
> issues. Here are the characteristics that we can supply
>
> Open Compute type server with Dual Xeon 2680v2, 64GB of RAM (DDR3 ECC),
> 3TB HDD, 1Gbps ethernet connected to the internet, Ubuntu 16.04 server.
>
> We can start with 1 and then increase that number gradually depending on
> the need and if that works. I can probably allocate 4 of them straight
> forward if this is easing life of the community. Lead time to get access
> to them is a couple of days.
>
> These machines will be located in France in Data4 Datacenter. So latency
> might be a little bit long compared to US based hosting.
>
> We work on setting up a CI for the linuxboot project and have also
> developped a solution based on this machine to connect a flash emulator
> straight to the PCB which is automatized through an API (still under
> development)
>
> Currently we can upload a firmware to the emulator remotely control the
> servers through hard power on/off options, reset, get console access
> through serial, and feedback end user on the capability of the firmware
> (in that case linuxboot) to start properly the machine. The intend is to
> validate within the CI process that each build is able to start a
> machine and run regression tests on live hardware.
>
> We are also able to test if we can boot the node etc ... and validate
> that we didn't broke features like NUMA etc ...
>
> This technology can be easily adapted to OpenBMC, as we connect to a SPI
> bus, and I bet that the flash on ASpeed chips might be connected through
> such bus. If not, we could work on doing that.
>
> One of the advantage is that we use OCP hardware and we can change a lot
> of things on top of them.
>
> Let me know if that works for you.
>
> vejmarie
>
> Le 20/08/2018 =C3=A0 19:20, Andrew Geissler a =C3=A9crit :
> > Hey Everyone,
> >
> > Per this mornings community call, it was noted that the upcoming
> > changes to our bitbake layers and the use of subtree to manage it,
> > we're going to double our CI build requirements for openbmc/openbmc.
> >
> > We could short change ourselves and just do the new subtree commits
> > but Brad noted that yocto does CI for both the subtree and the main
> > merge for a variety of reasons, so we should too.
> >
> > We have some other alternatives (build fewer machine configs, or only
> > build certain one's in each CI, or just wait longer) but it would be
> > best to first see if anyone can cough up a few more cloud machines for
> > CI.
> >
> > Current server contributors for openbmc:
> >
> > Rackspace: 1
> > Google: 2
> > IBM: 1
> >
> > The ideal server has:
> >
> > 16 or greater cpu threads
> > 64GB or greater memory
> > 1TB or greater hard drive
> > Ubuntu 16 or greater
> >
> > It needs to be on a public network that openpower.xyz can talk too.
> > All of the build scripts use docker so the system just needs to have
> > docker installed.
> >
> > Let me and Joel know if you got something!
> >
> > Thanks,
> > Andrew
> >
>
>
