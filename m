Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x22b.google.com (mail-yw0-x22b.google.com
 [IPv6:2607:f8b0:4002:c05::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vYYtk4y8DzDqKL
 for <openbmc@lists.ozlabs.org>; Thu,  2 Mar 2017 12:02:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MiwrFj89"; 
 dkim-atps=neutral
Received: by mail-yw0-x22b.google.com with SMTP id p77so46308236ywg.1
 for <openbmc@lists.ozlabs.org>; Wed, 01 Mar 2017 17:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=BA7nGwv4tdaLpuZjI5REiiaxsRgQdARQKVmTpFybEZs=;
 b=MiwrFj89txurQnusufrQ60RNeYA5O+rcYf5YBcONDBD1uRuOQbnni9w+beGKq66+Lo
 QdmXkANUU4nVuHwspILnLOZWCN692AM5zkC8UXodCQqJzMSebnEKl5zNaIxFXn0VlEg2
 fJGVHqotH72NUHu+h54rmK4xFDxBVJR1Z0vOsDgFXm/a19oMivXTWkRhbwhRoQ/gkOyA
 l9Q2CRbrcbZZTC2XTJJV5Q5eD2Y7r1M05kALAH3NFWVd2ld+98sDDPIkoo/YimFrjIJK
 H/8oeXuj/3NcxoaJlC9FQuUzGYgp5YxO5W0nuyCRfyTKolmTWKKBz9jwWkn9GSAn4UrX
 KMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=BA7nGwv4tdaLpuZjI5REiiaxsRgQdARQKVmTpFybEZs=;
 b=N/5Q7aPtrllgSKjj92HSLiMr3GW/sOjPyymv2wlpouoKSfDgFSMR3kIKKJDxSAEdlu
 By/tdbHYct+Ydbt+YnXn0SJzib/A3mfHEWG+nY5k1reZBTb1zD3y20Ev5Y46hGgE+UCp
 fvh9U5IpFgJEavfBnu6VlzgIkSwalimP2OkKIEH6mYkLPKdD2Ez0LJpITEXMtBV6CQRk
 aGkmU2JFmfwvvY7Ahm6Km0++DEnlWJtFFPTR6HBHm/K554lfiiHWgbVkpSKtLJ+6H2yn
 6lsIU7d1Z2Iekw9pjEiexoo/0HdjjSYXxw0odYybzFJ1EpTGnS3Rq+2EQEE4e6NV7bIx
 /hNw==
X-Gm-Message-State: AMke39nnKz3m5/XMNs8bpwkH7ek9IiB+kOnGQ/ruLxCc3BctzxCCyMXiGIOKs60bgDTirXNtXameIFOc9o4bgQ==
X-Received: by 10.37.194.5 with SMTP id s5mr3413374ybf.136.1488416524098; Wed,
 01 Mar 2017 17:02:04 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Wed, 1 Mar 2017 17:01:43 -0800 (PST)
In-Reply-To: <CALLMt=pFzj+_RWoTo52Q_U+Ca5sH2FsSLOC1aRnJHOek2aZrQQ@mail.gmail.com>
References: <CALLMt=pFzj+_RWoTo52Q_U+Ca5sH2FsSLOC1aRnJHOek2aZrQQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 2 Mar 2017 11:31:43 +1030
X-Google-Sender-Auth: ykfVznTXKtSwMLQ0Pr4j5hgsKfE
Message-ID: <CACPK8XcYE3Ysb8QdK-=+XV1vSpe63m6CTz3pdy5rTRT-NYfBsA@mail.gmail.com>
Subject: Re: Handling BMC Reboots when Host is Running
To: Andrew Geissler <geissonator@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Mar 2017 01:02:08 -0000

On Wed, Mar 1, 2017 at 3:33 AM, Andrew Geissler <geissonator@gmail.com> wro=
te:
> My story this sprint, https://github.com/openbmc/openbmc/issues/1094,
> is to allow the BMC to be rebooted while the host is up and running.

Cool. In addition to this work, we need to make sure the required bits
of the Aspeed hardware are not reset to a default state, either by the
SoC's reset mechanism, or by the loading of drivers.

GPIOs are a good example of this. When we know that the host is
already up, any access should read the current state of the GPIO and
before it does any toggling. Another is the operation of flash (which
will now need to be handled by mboxd).

I realise this is outside the scope of your "lets get the targets
sorted" work. I thought I'd mention it now so we can be on the look
out for strange behaviour as you do your rework.

Cheers,

Joel

> After the BMC reboot, we need to keep the host running and also get to
> the appropriate systemd target states to represent this.   The
> challenge here is that if we just re-ran the existing targets and
> services, we would do things like run P9 vcs workarounds, bit bang the
> FSI bus, and even potentially toggle pgood.  We obviously need to
> avoid this in order to keep the host up and running.  This divides our
> services started during a obmc-host-start.target into 2 categories,
> services required to boot the system, and services which are required
> to support the host running.  We only want to run the latter in a
> situation where the BMC is reset while the host is up and running.
>
> Requirements:
>
> - The applications should have no knowledge of Host state
>   - i.e. the service starting or not starting is where we control what ru=
ns
>
> - Must handle being able to start and not start any arbitrary service
> within the host power on targets
>   - Lots of services have dependencies on each other and
> synchronization targets, this design has to handle starting services
> that depend on other services or targets that may not be required when
> the host is running
>
> - The obmc-host-start.target needs to get to the running state when
> the host is already running after a BMC reset
>   - This will ensure that any re-starts of this target do not harm the
> system and that the power off targets will work as expected
>
> Proposal:
>
> Use the ConditionPathExists=3D systemd unit feature.
>
> From the man page: "Before starting a unit, verify that the specified
> condition is true. If it is not true, the starting of the unit will be
> (mostly silently) skipped, however all ordering dependencies of it are
> still respected. A failing condition will not result in the unit being
> moved into a failure state. The condition is checked at the time the
> queued start job is to be executed. Use condition expressions in order
> to silently skip units that do not apply to the local running system,
> for example because the kernel or runtime environment doesn't require
> its functionality. "
>
> This will be put in the service files that we do not want to run in
> this reset scenario (services required to boot the system).  The first
> service we will run on a power on, is a service that detects whether
> the host is already running.  If the host is running, then this
> service will create a file which will then be used to determine
> whether the boot services are run or not.
>
> The nice part about ConditionPathExists=3D is that it doesn=E2=80=99t exe=
cute
> the application in the services, but it allows dependencies on that
> service to be satisfied so systemd will still start the dependent
> services and reach the dependent synchronization targets.
>
> This proposal has not gone off as well as I would have hoped
> internally here :)  There=E2=80=99s definitely a desire to not have this =
at
> the service level, but rather at the target level.  I have not found a
> solution in this area though that satisfies the above requirements.
> Thoughts/ideas are definitely appreciated.
>
> Andrew
