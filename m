Return-Path: <geissonator@gmail.com>
Received: from mail-it0-x235.google.com (mail-it0-x235.google.com
 [IPv6:2607:f8b0:4001:c0b::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vpMTK1qF4zDq7Z
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 07:57:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FaPXOGtJ"; 
 dkim-atps=neutral
Received: by mail-it0-x235.google.com with SMTP id w124so30055318itb.1
 for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2017 13:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OgqJ19s24KoCfjtDDbnmvmraKglodbOSAEWvaRSxtjk=;
 b=FaPXOGtJWE/jsI3YUKsFO+DugwbFXM8g3rd4UEzJ+jAk912lNSlfKj/yFqx5337IpB
 Y/pSyeORZ7+Xv68fw4Y3nJirZ6Vu3YuS32ojJKwdc0apEA005GmYaV/DTcymPySialnf
 UHmpeM9phcOTmOriZNHtoVuOQXvZcE/gL72WEvmzZ/qA0Q9de2l0eUkcqlYaiFAMlk/F
 XfFDJrbtSkhLBbp4C4GgwVCFrbnU9ApY/E/h5iSMIcV2zw3ZrxcmCL7QW4R9x3pbv2Bu
 IiTPrZvLp9yh3Qaa6XFsYRAtUUJ8YIIirjgUSaPi3qNmJOCHUSxUswBAbg3zyfWwrkcj
 rxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OgqJ19s24KoCfjtDDbnmvmraKglodbOSAEWvaRSxtjk=;
 b=mXzDafJTQVczwzEJGHfQNMu58fUG6rVaRWDYPJivIovP3dmXY24DoOq9HnHan5xm4E
 0r8tp2t2pUBJ59rHeB5II2JPxThS4JlhtmIEGNqH/cRqqQOVh36MJhnP5Ec9ETM3ylR3
 K6z2824M6DwrukykpxTIKnfeWxgKR1g+eNKr56199szwxV9pdh9xTd87gZ0+P49HPJ7M
 ktMaDr3JTIDNHFWkzamzWw05WIKa5WNetGZGVyObLWndD3yBNvsLY5yVmIGnI5HDrgng
 pwwgu1pQg6sQK5pVa5xkWeF7MNOFsZx4GFiIbmrdT8caPtM2zkcWn9mk8GwOOhUA+X/N
 dOZQ==
X-Gm-Message-State: AFeK/H1z2cVOePW7lXczpA+S17QnZvbIIvLQJl9ktAiSiqSB3afghL7omAfXuOb55M24ExOmxZfVcqkBLjaM9g==
X-Received: by 10.36.58.207 with SMTP id m198mr10468767itm.31.1490216275117;
 Wed, 22 Mar 2017 13:57:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.53.156 with HTTP; Wed, 22 Mar 2017 13:57:54 -0700 (PDT)
In-Reply-To: <CAPH-5w7WoBtQP7hDtGS23+4S2YqckYsEVVajcj9hjTA+dOM19A@mail.gmail.com>
References: <CALLMt=pFzj+_RWoTo52Q_U+Ca5sH2FsSLOC1aRnJHOek2aZrQQ@mail.gmail.com>
 <CACPK8XcYE3Ysb8QdK-=+XV1vSpe63m6CTz3pdy5rTRT-NYfBsA@mail.gmail.com>
 <CAPH-5w7WoBtQP7hDtGS23+4S2YqckYsEVVajcj9hjTA+dOM19A@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 22 Mar 2017 15:57:54 -0500
Message-ID: <CALLMt=oTeWFqyqkFeWBMYtCdCWC=UsrpV6Ftagw15G-zvQ_Yxw@mail.gmail.com>
Subject: Re: Handling BMC Reboots when Host is Running
To: Xo Wang <xow@google.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 22 Mar 2017 20:57:58 -0000

A few updates for everyone on this.  The initial chassis code went in
via this commit and it's 2 next one's -
https://gerrit.openbmc-project.xyz/#/c/2817/

I've been working this sprint on refactoring host ipmid a bit to be
able to send up different commands (currently our only communication
up to the host is a hard coded soft reboot).  The host interface
proposal is out here - https://gerrit.openbmc-project.xyz/#/c/3098/.
We need this so there's a way to discover if the host is running after
a bmc reboot.

One thing I didn=E2=80=99t really like (and neither did anyone else) with
handling bmc reboots while the chassis is on or if the host is running
is that we have a target fail in the journal when they are not on or
running.  See https://github.com/openbmc/openbmc/issues/1337

Here=E2=80=99s what I did:
Action Target: obmc-chassis-reset.target
  Requires: op-reset-pgood-check.service (check for pgood, service
success if so, fail otherwise)
  Requires: op-reset-set-power-on.service (runs after pgood-check,
creates file indicating pgood on)
  Requires: op-reset-chasiss-on.service (runs after set-power-on,
starts chassis power on target)

There was also a synchronization target, obmc-power-reset-on.target,
which indicated power was on (pgood-check service a success).

If pgood was not on, then the pgood-check service would fail, causing
the other services to not run and the obmc-chassis-reset.target to
fail.  No harm, but confusing to see a target fail in the journal on
the way to BMC_READY.  The cool part was this was all contained to
targets and services with no applications needed.  You could easily
add other services that help determine if the chassis is =E2=80=9Con=E2=80=
=9D and
other services once it was found that power was on.


Here=E2=80=99s my new proposal:
Action Target: obmc-chassis-reset.target
   Requires: op-reset-power-check.service - a shell script that
verifies power is on, and creates the file if so

this service always return success (pgood on or off) unless it hits a
real failure
   Requires: op-reset-chassis-on.service     - start the chassis
target - setup service file to only run if =E2=80=9Cpower on=E2=80=9D file =
created.

We have to write a shell script, and we=E2=80=99re not quite as dynamic wit=
h
plug and play of services, but we now won=E2=80=99t have a target fail and =
it
simplifies the process a bit.

With this proposal in mind, I=E2=80=99d like to do something similar with h=
ost function

Action Target: obmc-host-reset.target:
   Requires: obmc-chassis-reset.target
   Requires: op-reset-host-check.service - Service runs after the
op-reset-chassis-on.service
                                                                    An
application that only runs if the chassis power service created the
=E2=80=9Cpower on=E2=80=9D file.

This issues the heartbeat command to the host and if the host
responds, it creates the

=E2=80=9Chost on=E2=80=9D file.  This will need to be an application since =
dbus signal
monitoring is required.

   Requires: op-reset-host-on.service       - start the host start
target - only run if =E2=80=9Chost on=E2=80=9D file created

Xo, wondering if the Zaius issue could be related to what we see on
Witherspoon, https://github.com/openbmc/openbmc/issues/1322?  Either
way we seem to have a similar problem on witherspoon so all of this
above code is moot until we get that figured out.  Testing on
barreleye has been fine though.

Thoughts/Ideas always appreciated,
Andrew

On Thu, Mar 2, 2017 at 12:04 PM, Xo Wang <xow@google.com> wrote:
> On Wed, Mar 1, 2017 at 5:01 PM, Joel Stanley <joel@jms.id.au> wrote:
>> On Wed, Mar 1, 2017 at 3:33 AM, Andrew Geissler <geissonator@gmail.com> =
wrote:
>>> My story this sprint, https://github.com/openbmc/openbmc/issues/1094,
>>> is to allow the BMC to be rebooted while the host is up and running.
>>
>> Cool. In addition to this work, we need to make sure the required bits
>> of the Aspeed hardware are not reset to a default state, either by the
>> SoC's reset mechanism, or by the loading of drivers.
>>
>> GPIOs are a good example of this. When we know that the host is
>> already up, any access should read the current state of the GPIO and
>> before it does any toggling. Another is the operation of flash (which
>> will now need to be handled by mboxd).
>
> FYI, we have an internal bug about Zaius-specific behavior with our
> board-level latches (between BMC and power sequencer) being set
> transparent prior to reading the host power state. This kills power to
> the host every time that the BMC resets.
>
> I'm currently working on this and it looks like a bug with my earlier
> changes to the glib-based power control daemon.
>
>>
>> I realise this is outside the scope of your "lets get the targets
>> sorted" work. I thought I'd mention it now so we can be on the look
>> out for strange behaviour as you do your rework.
>>
>> Cheers,
>>
>> Joel
>>
>>> After the BMC reboot, we need to keep the host running and also get to
>>> the appropriate systemd target states to represent this.   The
>>> challenge here is that if we just re-ran the existing targets and
>>> services, we would do things like run P9 vcs workarounds, bit bang the
>>> FSI bus, and even potentially toggle pgood.  We obviously need to
>>> avoid this in order to keep the host up and running.  This divides our
>>> services started during a obmc-host-start.target into 2 categories,
>>> services required to boot the system, and services which are required
>>> to support the host running.  We only want to run the latter in a
>>> situation where the BMC is reset while the host is up and running.
>>>
>>> Requirements:
>>>
>>> - The applications should have no knowledge of Host state
>>>   - i.e. the service starting or not starting is where we control what =
runs
>>>
>>> - Must handle being able to start and not start any arbitrary service
>>> within the host power on targets
>>>   - Lots of services have dependencies on each other and
>>> synchronization targets, this design has to handle starting services
>>> that depend on other services or targets that may not be required when
>>> the host is running
>>>
>>> - The obmc-host-start.target needs to get to the running state when
>>> the host is already running after a BMC reset
>>>   - This will ensure that any re-starts of this target do not harm the
>>> system and that the power off targets will work as expected
>>>
>>> Proposal:
>>>
>>> Use the ConditionPathExists=3D systemd unit feature.
>>>
>>> From the man page: "Before starting a unit, verify that the specified
>>> condition is true. If it is not true, the starting of the unit will be
>>> (mostly silently) skipped, however all ordering dependencies of it are
>>> still respected. A failing condition will not result in the unit being
>>> moved into a failure state. The condition is checked at the time the
>>> queued start job is to be executed. Use condition expressions in order
>>> to silently skip units that do not apply to the local running system,
>>> for example because the kernel or runtime environment doesn't require
>>> its functionality. "
>>>
>>> This will be put in the service files that we do not want to run in
>>> this reset scenario (services required to boot the system).  The first
>>> service we will run on a power on, is a service that detects whether
>>> the host is already running.  If the host is running, then this
>>> service will create a file which will then be used to determine
>>> whether the boot services are run or not.
>>>
>>> The nice part about ConditionPathExists=3D is that it doesn=E2=80=99t e=
xecute
>>> the application in the services, but it allows dependencies on that
>>> service to be satisfied so systemd will still start the dependent
>>> services and reach the dependent synchronization targets.
>>>
>>> This proposal has not gone off as well as I would have hoped
>>> internally here :)  There=E2=80=99s definitely a desire to not have thi=
s at
>>> the service level, but rather at the target level.  I have not found a
>>> solution in this area though that satisfies the above requirements.
>>> Thoughts/ideas are definitely appreciated.
>>>
>>> Andrew
>
> cheers
> xo
