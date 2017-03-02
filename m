Return-Path: <xow@google.com>
Received: from mail-yw0-x236.google.com (mail-yw0-x236.google.com
 [IPv6:2607:f8b0:4002:c05::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vZ0Zx4w3BzDqGj
 for <openbmc@lists.ozlabs.org>; Fri,  3 Mar 2017 05:04:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="kphNBKwx"; 
 dkim-atps=neutral
Received: by mail-yw0-x236.google.com with SMTP id d1so64064404ywd.2
 for <openbmc@lists.ozlabs.org>; Thu, 02 Mar 2017 10:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sv56ywbshgFHwPr7dbgbeei3UtxI9yETQG5WKYIpv5Y=;
 b=kphNBKwxoIvqVgGwACqZQ8M4CSJTD1aGH7RikGLPsVkrLPbMYsT/q91Lho5BguxRa2
 DuYYtn5vt6o1LAyFii5m6DVTlB6mgpZPKNnJpm9mYd+MNSpe7gmKLQbMx61SA9laZ9Vx
 vlDKbjSfAFG+7vaZduBsQ+XNi/lsHGD2W+7Hj/eGGdNsefOU8B80TTZedeSZb/iuCme0
 PJCRIFWYuZGLyQX8Z9QK9PnuHHYh4MDwFTtIaul6kphKBY0iZK2sbWZ6Zfn0k+nmTSaF
 MV9qPbBXtybrJlNxaqUZZBtJjLrBlyrRaTtvrO104y80B9SISftlMguTn6VHQI7ah9rN
 PfMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sv56ywbshgFHwPr7dbgbeei3UtxI9yETQG5WKYIpv5Y=;
 b=cclxw6CtbS5Qik4Z2fS4DiebPbUAEKInHuUKCwK+hnUkX4bTltke2Wx6qw2SII/vNG
 17wHHTuiTT56xd3+701PubLtd+b6lDQgw3o71bZwsmVqeDJ//vwldai2Q+C+gqsVqFAg
 7MUzSiV2Y+tGXP7DPuM0FBoksA4swxLArIR2fAtNLf2qgE70/Dy1G9EVG7OkZzptPl5n
 tmmpMYPaUxtH4L8yCzGaYZ3NUC6z+RsvOij5hfHWfvK8TZoVFJyomPeaTMAGDgcxO368
 +CB4s+BhIz43Szwft1qx5GvJJJK4ecSPfZKZk7onGjU/bo7buV1bA246+gRKms1FZyMe
 Agow==
X-Gm-Message-State: AMke39nGErwfizs0dBR0HxbY1A7YvumPBvofKhXGtVoj2PKPkKINmt8izFQDIkXXnQ7z6tKyymZP6AwG47uVdOcA
X-Received: by 10.237.34.125 with SMTP id o58mr18220935qtc.108.1488477895191; 
 Thu, 02 Mar 2017 10:04:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.21.116 with HTTP; Thu, 2 Mar 2017 10:04:54 -0800 (PST)
In-Reply-To: <CACPK8XcYE3Ysb8QdK-=+XV1vSpe63m6CTz3pdy5rTRT-NYfBsA@mail.gmail.com>
References: <CALLMt=pFzj+_RWoTo52Q_U+Ca5sH2FsSLOC1aRnJHOek2aZrQQ@mail.gmail.com>
 <CACPK8XcYE3Ysb8QdK-=+XV1vSpe63m6CTz3pdy5rTRT-NYfBsA@mail.gmail.com>
From: Xo Wang <xow@google.com>
Date: Thu, 2 Mar 2017 10:04:54 -0800
Message-ID: <CAPH-5w7WoBtQP7hDtGS23+4S2YqckYsEVVajcj9hjTA+dOM19A@mail.gmail.com>
Subject: Re: Handling BMC Reboots when Host is Running
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Geissler <geissonator@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 02 Mar 2017 18:04:58 -0000

On Wed, Mar 1, 2017 at 5:01 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Wed, Mar 1, 2017 at 3:33 AM, Andrew Geissler <geissonator@gmail.com> w=
rote:
>> My story this sprint, https://github.com/openbmc/openbmc/issues/1094,
>> is to allow the BMC to be rebooted while the host is up and running.
>
> Cool. In addition to this work, we need to make sure the required bits
> of the Aspeed hardware are not reset to a default state, either by the
> SoC's reset mechanism, or by the loading of drivers.
>
> GPIOs are a good example of this. When we know that the host is
> already up, any access should read the current state of the GPIO and
> before it does any toggling. Another is the operation of flash (which
> will now need to be handled by mboxd).

FYI, we have an internal bug about Zaius-specific behavior with our
board-level latches (between BMC and power sequencer) being set
transparent prior to reading the host power state. This kills power to
the host every time that the BMC resets.

I'm currently working on this and it looks like a bug with my earlier
changes to the glib-based power control daemon.

>
> I realise this is outside the scope of your "lets get the targets
> sorted" work. I thought I'd mention it now so we can be on the look
> out for strange behaviour as you do your rework.
>
> Cheers,
>
> Joel
>
>> After the BMC reboot, we need to keep the host running and also get to
>> the appropriate systemd target states to represent this.   The
>> challenge here is that if we just re-ran the existing targets and
>> services, we would do things like run P9 vcs workarounds, bit bang the
>> FSI bus, and even potentially toggle pgood.  We obviously need to
>> avoid this in order to keep the host up and running.  This divides our
>> services started during a obmc-host-start.target into 2 categories,
>> services required to boot the system, and services which are required
>> to support the host running.  We only want to run the latter in a
>> situation where the BMC is reset while the host is up and running.
>>
>> Requirements:
>>
>> - The applications should have no knowledge of Host state
>>   - i.e. the service starting or not starting is where we control what r=
uns
>>
>> - Must handle being able to start and not start any arbitrary service
>> within the host power on targets
>>   - Lots of services have dependencies on each other and
>> synchronization targets, this design has to handle starting services
>> that depend on other services or targets that may not be required when
>> the host is running
>>
>> - The obmc-host-start.target needs to get to the running state when
>> the host is already running after a BMC reset
>>   - This will ensure that any re-starts of this target do not harm the
>> system and that the power off targets will work as expected
>>
>> Proposal:
>>
>> Use the ConditionPathExists=3D systemd unit feature.
>>
>> From the man page: "Before starting a unit, verify that the specified
>> condition is true. If it is not true, the starting of the unit will be
>> (mostly silently) skipped, however all ordering dependencies of it are
>> still respected. A failing condition will not result in the unit being
>> moved into a failure state. The condition is checked at the time the
>> queued start job is to be executed. Use condition expressions in order
>> to silently skip units that do not apply to the local running system,
>> for example because the kernel or runtime environment doesn't require
>> its functionality. "
>>
>> This will be put in the service files that we do not want to run in
>> this reset scenario (services required to boot the system).  The first
>> service we will run on a power on, is a service that detects whether
>> the host is already running.  If the host is running, then this
>> service will create a file which will then be used to determine
>> whether the boot services are run or not.
>>
>> The nice part about ConditionPathExists=3D is that it doesn=E2=80=99t ex=
ecute
>> the application in the services, but it allows dependencies on that
>> service to be satisfied so systemd will still start the dependent
>> services and reach the dependent synchronization targets.
>>
>> This proposal has not gone off as well as I would have hoped
>> internally here :)  There=E2=80=99s definitely a desire to not have this=
 at
>> the service level, but rather at the target level.  I have not found a
>> solution in this area though that satisfies the above requirements.
>> Thoughts/ideas are definitely appreciated.
>>
>> Andrew

cheers
xo
