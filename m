Return-Path: <xow@google.com>
Received: from mail-qt0-x22b.google.com (mail-qt0-x22b.google.com
 [IPv6:2607:f8b0:400d:c0d::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vpzRl2d6fzDq93
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 07:58:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="QYV3jVfz"; 
 dkim-atps=neutral
Received: by mail-qt0-x22b.google.com with SMTP id x35so186274017qtc.2
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 13:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EsMe8mskfteOW90+NJCJPjQdHJvZ1SscfKOdANMhNQQ=;
 b=QYV3jVfzcc0OT6u/HN5gcFXNWNRVZ3p1DNsxwH598k/lEdMfQMOURVK0KS24D7r0Ut
 BAl1HsMc7Mjr11hy98BeQWtiQqL0zk5i6ODXDGJ+rnOh3++/R5D7ATPGUHpRK28PI/5q
 v/M2T6KzbolW62tb/7D/kqwdl/nZ/Xt4G/tA63LIfhMhlerFCqkMHY4EEIUAn8fIonqD
 NTeQIL3E3brZrk6O5lXpBDE4ksjwlwlvfcp5A/nvDBVczm/0OZxli4202vjrYH6tVr+8
 a0qhi9Saw8ZlGLiKb9qyBhqwL62CWTth8qr5So/iB7pqciX3A65xkyILsAzLiT7keuzq
 qMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EsMe8mskfteOW90+NJCJPjQdHJvZ1SscfKOdANMhNQQ=;
 b=tP2AGr6j80+As7vS2kEhGXBpDK/TLuu/giDslzAtgrD4m/p8tkOskGbWEqBpaTi6I4
 ft6PHES4DSBohcJfcdsLW18ifdeIIN3HBMyE8J3clvcCBcGKcRt577SfC24aVbXaEj3N
 rN9dOUwLVBcb/VbuW9Uali4LAgNgUdaVPfRDFi7nEzTN1cf/H82DYKY2Ky8zfCrzTVnp
 pCnvfdYeKo8oaHoSJDX5IVb5Axjcgxc0r2LaDeaZxR92ZboI+Q1K+pj5qCisvCNE1Gzg
 WaZQUg/fBLCgKYL5HhavsUl/HL4S0lmTGYLBgwN1ON/PGvWMmn2jUKcP5gY+sC35LX4M
 Loqg==
X-Gm-Message-State: AFeK/H23irXwXpWoSgLGDQGe94BD/UWQfxWmmABZwmDuiK2lvyzeHSqyR6Tts6NYu6/xAzcQl8qgwhSgwf172gOl
X-Received: by 10.200.3.230 with SMTP id z38mr4731716qtg.181.1490302720520;
 Thu, 23 Mar 2017 13:58:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.17.56 with HTTP; Thu, 23 Mar 2017 13:58:40 -0700 (PDT)
In-Reply-To: <CALLMt=oTeWFqyqkFeWBMYtCdCWC=UsrpV6Ftagw15G-zvQ_Yxw@mail.gmail.com>
References: <CALLMt=pFzj+_RWoTo52Q_U+Ca5sH2FsSLOC1aRnJHOek2aZrQQ@mail.gmail.com>
 <CACPK8XcYE3Ysb8QdK-=+XV1vSpe63m6CTz3pdy5rTRT-NYfBsA@mail.gmail.com>
 <CAPH-5w7WoBtQP7hDtGS23+4S2YqckYsEVVajcj9hjTA+dOM19A@mail.gmail.com>
 <CALLMt=oTeWFqyqkFeWBMYtCdCWC=UsrpV6Ftagw15G-zvQ_Yxw@mail.gmail.com>
From: Xo Wang <xow@google.com>
Date: Thu, 23 Mar 2017 13:58:40 -0700
Message-ID: <CAPH-5w41yzbu_HYitrDwMMWfv_gVXD+ZxnBFV7GFux09ZsNruw@mail.gmail.com>
Subject: Re: Handling BMC Reboots when Host is Running
To: Andrew Geissler <geissonator@gmail.com>
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
X-List-Received-Date: Thu, 23 Mar 2017 20:58:44 -0000

Hi Andrew,

On Wed, Mar 22, 2017 at 1:57 PM, Andrew Geissler <geissonator@gmail.com> wr=
ote:
> A few updates for everyone on this.  The initial chassis code went in
> via this commit and it's 2 next one's -
> https://gerrit.openbmc-project.xyz/#/c/2817/
>
> I've been working this sprint on refactoring host ipmid a bit to be
> able to send up different commands (currently our only communication
> up to the host is a hard coded soft reboot).  The host interface
> proposal is out here - https://gerrit.openbmc-project.xyz/#/c/3098/.
> We need this so there's a way to discover if the host is running after
> a bmc reboot.
>
> One thing I didn=E2=80=99t really like (and neither did anyone else) with
> handling bmc reboots while the chassis is on or if the host is running
> is that we have a target fail in the journal when they are not on or
> running.  See https://github.com/openbmc/openbmc/issues/1337
>
> Here=E2=80=99s what I did:
> Action Target: obmc-chassis-reset.target
>   Requires: op-reset-pgood-check.service (check for pgood, service
> success if so, fail otherwise)
>   Requires: op-reset-set-power-on.service (runs after pgood-check,
> creates file indicating pgood on)
>   Requires: op-reset-chasiss-on.service (runs after set-power-on,
> starts chassis power on target)
>
> There was also a synchronization target, obmc-power-reset-on.target,
> which indicated power was on (pgood-check service a success).
>
> If pgood was not on, then the pgood-check service would fail, causing
> the other services to not run and the obmc-chassis-reset.target to
> fail.  No harm, but confusing to see a target fail in the journal on
> the way to BMC_READY.  The cool part was this was all contained to
> targets and services with no applications needed.  You could easily
> add other services that help determine if the chassis is =E2=80=9Con=E2=
=80=9D and
> other services once it was found that power was on.
>
>
> Here=E2=80=99s my new proposal:
> Action Target: obmc-chassis-reset.target
>    Requires: op-reset-power-check.service - a shell script that
> verifies power is on, and creates the file if so
>
> this service always return success (pgood on or off) unless it hits a
> real failure
>    Requires: op-reset-chassis-on.service     - start the chassis
> target - setup service file to only run if =E2=80=9Cpower on=E2=80=9D fil=
e created.
>
> We have to write a shell script, and we=E2=80=99re not quite as dynamic w=
ith
> plug and play of services, but we now won=E2=80=99t have a target fail an=
d it
> simplifies the process a bit.
>
> With this proposal in mind, I=E2=80=99d like to do something similar with=
 host function
>
> Action Target: obmc-host-reset.target:
>    Requires: obmc-chassis-reset.target
>    Requires: op-reset-host-check.service - Service runs after the
> op-reset-chassis-on.service
>                                                                     An
> application that only runs if the chassis power service created the
> =E2=80=9Cpower on=E2=80=9D file.
>
> This issues the heartbeat command to the host and if the host
> responds, it creates the
>
> =E2=80=9Chost on=E2=80=9D file.  This will need to be an application sinc=
e dbus signal
> monitoring is required.
>
>    Requires: op-reset-host-on.service       - start the host start
> target - only run if =E2=80=9Chost on=E2=80=9D file created
>
> Xo, wondering if the Zaius issue could be related to what we see on
> Witherspoon, https://github.com/openbmc/openbmc/issues/1322?  Either
> way we seem to have a similar problem on witherspoon so all of this
> above code is moot until we get that figured out.  Testing on
> barreleye has been fine though.

The issue I described of "power control daemon setting the latch
transparent shuts off power" is probably unique to Zaius since that's
the only board with latches between BMC and power sequencer.

However, GPIO glitches across BMC reboot would affect Zaius as well.
That's why we designed in those latches in the first place. It appears
that after some moving some logic around
(https://gerrit.openbmc-project.xyz/#/c/2837/), BMC reset no longer
brings down the host power on Zaius.

>
> Thoughts/Ideas always appreciated,
> Andrew
>
> On Thu, Mar 2, 2017 at 12:04 PM, Xo Wang <xow@google.com> wrote:
>> On Wed, Mar 1, 2017 at 5:01 PM, Joel Stanley <joel@jms.id.au> wrote:
>>> On Wed, Mar 1, 2017 at 3:33 AM, Andrew Geissler <geissonator@gmail.com>=
 wrote:
>>>> My story this sprint, https://github.com/openbmc/openbmc/issues/1094,
>>>> is to allow the BMC to be rebooted while the host is up and running.
>>>
>>> Cool. In addition to this work, we need to make sure the required bits
>>> of the Aspeed hardware are not reset to a default state, either by the
>>> SoC's reset mechanism, or by the loading of drivers.
>>>
>>> GPIOs are a good example of this. When we know that the host is
>>> already up, any access should read the current state of the GPIO and
>>> before it does any toggling. Another is the operation of flash (which
>>> will now need to be handled by mboxd).
>>
>> FYI, we have an internal bug about Zaius-specific behavior with our
>> board-level latches (between BMC and power sequencer) being set
>> transparent prior to reading the host power state. This kills power to
>> the host every time that the BMC resets.
>>
>> I'm currently working on this and it looks like a bug with my earlier
>> changes to the glib-based power control daemon.
>>
>>>
>>> I realise this is outside the scope of your "lets get the targets
>>> sorted" work. I thought I'd mention it now so we can be on the look
>>> out for strange behaviour as you do your rework.
>>>
>>> Cheers,
>>>
>>> Joel
>>>
>>>> After the BMC reboot, we need to keep the host running and also get to
>>>> the appropriate systemd target states to represent this.   The
>>>> challenge here is that if we just re-ran the existing targets and
>>>> services, we would do things like run P9 vcs workarounds, bit bang the
>>>> FSI bus, and even potentially toggle pgood.  We obviously need to
>>>> avoid this in order to keep the host up and running.  This divides our
>>>> services started during a obmc-host-start.target into 2 categories,
>>>> services required to boot the system, and services which are required
>>>> to support the host running.  We only want to run the latter in a
>>>> situation where the BMC is reset while the host is up and running.
>>>>
>>>> Requirements:
>>>>
>>>> - The applications should have no knowledge of Host state
>>>>   - i.e. the service starting or not starting is where we control what=
 runs
>>>>
>>>> - Must handle being able to start and not start any arbitrary service
>>>> within the host power on targets
>>>>   - Lots of services have dependencies on each other and
>>>> synchronization targets, this design has to handle starting services
>>>> that depend on other services or targets that may not be required when
>>>> the host is running
>>>>
>>>> - The obmc-host-start.target needs to get to the running state when
>>>> the host is already running after a BMC reset
>>>>   - This will ensure that any re-starts of this target do not harm the
>>>> system and that the power off targets will work as expected
>>>>
>>>> Proposal:
>>>>
>>>> Use the ConditionPathExists=3D systemd unit feature.
>>>>
>>>> From the man page: "Before starting a unit, verify that the specified
>>>> condition is true. If it is not true, the starting of the unit will be
>>>> (mostly silently) skipped, however all ordering dependencies of it are
>>>> still respected. A failing condition will not result in the unit being
>>>> moved into a failure state. The condition is checked at the time the
>>>> queued start job is to be executed. Use condition expressions in order
>>>> to silently skip units that do not apply to the local running system,
>>>> for example because the kernel or runtime environment doesn't require
>>>> its functionality. "
>>>>
>>>> This will be put in the service files that we do not want to run in
>>>> this reset scenario (services required to boot the system).  The first
>>>> service we will run on a power on, is a service that detects whether
>>>> the host is already running.  If the host is running, then this
>>>> service will create a file which will then be used to determine
>>>> whether the boot services are run or not.
>>>>
>>>> The nice part about ConditionPathExists=3D is that it doesn=E2=80=99t =
execute
>>>> the application in the services, but it allows dependencies on that
>>>> service to be satisfied so systemd will still start the dependent
>>>> services and reach the dependent synchronization targets.
>>>>
>>>> This proposal has not gone off as well as I would have hoped
>>>> internally here :)  There=E2=80=99s definitely a desire to not have th=
is at
>>>> the service level, but rather at the target level.  I have not found a
>>>> solution in this area though that satisfies the above requirements.
>>>> Thoughts/ideas are definitely appreciated.
>>>>
>>>> Andrew
>>
>> cheers
>> xo

cheers
xo
