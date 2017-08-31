Return-Path: <geissonator@gmail.com>
Received: from mail-io0-x236.google.com (mail-io0-x236.google.com
 [IPv6:2607:f8b0:4001:c06::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xjQKl4ZT6zDqR9
 for <openbmc@lists.ozlabs.org>; Thu, 31 Aug 2017 11:49:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="InhjaWKR"; 
 dkim-atps=neutral
Received: by mail-io0-x236.google.com with SMTP id n71so14327553iod.1
 for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2017 18:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wZZYFDTKiUceYyAIYzbREGjK92dAkfisfFF3swcaYTw=;
 b=InhjaWKRzUscQdSA7Uirk/Wi5V54fOcmlYTG3M+Q2dRkoQeUATskPkD99YOQN91lG0
 hiOAO1RqEUPV36MgLnr5E5ln6TWF7IQmJ7XvDP8GyHK0fyx/0GogYgf0DbvZhm4abvBJ
 9HOtSi3j5WJo93HATSU8ZD0Ll7jBYEyffs1Gm0SBRCi1JEqlE9WLYGDqIIsLiYWdCmDg
 uNM6u6WpFE5fhgxV7w5rJPu/M5Nb0xMM4UksTm4wUJadr5mJjgPiXa3vw5euk4elaT+N
 mttKnTGL5dTL7iPyEQfUydvUyjazR1bEQ4bmJoqlzcH+Eif1D90aWRGCp3fH6lZxSASg
 e9Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wZZYFDTKiUceYyAIYzbREGjK92dAkfisfFF3swcaYTw=;
 b=XAP8Ssf7DCMuclrJjF+80x2hCzcSWfiOwTzCx/kA2o3kom3eOYtQhLFtMFhKVYiG9M
 HAxtFPHDxKe3JXUO4Q/wMapga5/lR1E8+jlztrXWT7SrQmYTpNo+uIWCOwjZcWhTIT4/
 i1tG/0QED1DAcc6KtwKBKVU9Dc5/jVirUrZYeR6v2PzEGlwCMPxVEb9dPWwILpYeRjln
 Dp3GRbgqGjUgmwQhYk45ZfWzve9HohpWAvUODS7j2lm3WDgU0O3SCPWufxP/etoEpq+R
 P3SexpXadl1nmxUTJcCNt58hVPggEjaPf8zcu58lc6UGuemGq7Wzyem2EOtHnq0263ee
 9FMw==
X-Gm-Message-State: AHPjjUgnKT0xaUKd9CaGd2rrrl2osI1RZq/6CLYe/Uiubsew6RXP0VQ2
 eqshY9bVduEf9CIsxs+DoLeaqrwI5A==
X-Received: by 10.107.3.153 with SMTP id e25mr3392415ioi.292.1504144185370;
 Wed, 30 Aug 2017 18:49:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.182.139 with HTTP; Wed, 30 Aug 2017 18:49:44 -0700 (PDT)
In-Reply-To: <1503877767.32695.8.camel@aj.id.au>
References: <CALLMt=rD633fC_qLVzUZAtQwuU_EoQZ+1yD9okrd1tngp1cpzg@mail.gmail.com>
 <1503877767.32695.8.camel@aj.id.au>
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 30 Aug 2017 20:49:44 -0500
Message-ID: <CALLMt=oZ16Fv7XKRkHJZSEiQExpOOmS0Ddhw3dpx5FcsWF4rPQ@mail.gmail.com>
Subject: Re: Power Restore Policy
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 31 Aug 2017 01:49:48 -0000

On Sun, Aug 27, 2017 at 6:49 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Hi Andrew,
>
> On Fri, 2017-08-25 at 14:32 -0500, Andrew Geissler wrote:
>> The BMC has the concept of a Power Restore Policy.  It=E2=80=99s defined
>> within https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/x=
yz/openbmc_project/Control/Power/RestorePolicy.interface.yaml
>>
>> The point of this policy is to define the host boot behavior by the
>> BMC if it is rebooted.  The policies are:
>> o AlwaysOn
>> o AlwaysOff
>> o Restore
>>
>> What complicates things a bit is the scenario where the BMC is
>> rebooted, but the host is booted.  Rule number one in bmc management
>> firmware is don=E2=80=99t mess with the host if it=E2=80=99s up and runn=
ing.  So
>> basically, if the host is up and running, and the bmc is rebooted, the
>> bmc should do no actions other then to get it=E2=80=99s chassis and host=
 state
>> objects to reflect that of the chassis and host (on and running).
>>
>> If the host is not running, then here=E2=80=99s what the policies mean:
>>
>> o AlwaysOn -> Power on
>> o AlwaysOff -> Leave system in off state
>> o Restore -> Read last requested host state and re-request it
>>
>> OBMC has an application, somewhat misnamed, discover_system_state
>> which enforces the AlwaysOn logic.
>
> Out of curiousity, why do you think it is misnamed? Is it the ambiguity o=
f
> 'system' with respect to BMC vs host? Or something else? Is there a bette=
r
> name?
>

discover_system_state implies discovery of a state but what this
application is really doing is applying_system_restore_policy
I may rename some day but not with this set of changes.

>> The Restore logic was put into
>> phosphor-host-state-manager but I don=E2=80=99t believe this is the corr=
ect
>> place for it.
>
> Naive question as I'm not intimately familiar with the details: why not (=
on
> reflection, this is probably answered below)?
>
>> It does it when it reads it=E2=80=99s
>
> Mate.
>
> Can you rephrase that for clarity?

The host-state application currently reads the last requested state
from the BMC filesystem and then blindly tries to enforce that state.
The main goal I'm going for here is to take that enforcement out of
host-state and put it in discover_state so this "what do I do after a
bmc reboot" logic is all in one place.

>
>> persisted value for the
>> last requested state when it starts.  I=E2=80=99d like to move the Resto=
re
>> logic in with the discover_system_state application.
>>
>> The reasons are the following:
>> o discover_system_state=E2=80=99s service can easily be configured to no=
t run
>> when the host is already running
>
> Is this also part of your suggestion to rename the service? Because to me=
, from
> the name, it seems crucial to run it precisely because we want to know th=
e
> system's (host's) state. But it seems we know the state before running th=
e
> service? What does the actual discovery?
>

The application rename would be good, but not something I'm looking to
tackle here.  The discovery of the system state (i.e. is the host up)
is actually done within the chassis and host reset targets.  That
drives the discovery of pgood and host status and sets up the
host-state applications appropriately.

>> o phosphor-host-state-manager has to be started always and early, so
>> that it can monitor for any state change requests (like in the case
>> where the bmc is rebooted while the host is still up).
>
> This isn't a state change for the host though, if it remains up?
>
> I guess the idea is to start phosphor-host-state-manager seeded with the
> discovered state, and then let a service (started after
> phosphor-host-state-manager) poke phosphor-host-state-manager to enforce =
the
> policy?
>

Yep!  Except phosphor-host-state-manager initially just uses the value
written to the BMC filesystem (it does no real discovery).  The
discover_state service will then enforce the policy.

>> o Having all the policy in a single application is more testable and obv=
ious
>
> Sounds ideal on the surface of things.
>
>>
>> https://github.com/openbmc/openbmc/issues/2210 is tracking this.
>>
>> Thoughts or questions?
>
> Yeah - well a comment more than anything: From reading your email and the=
n
> reading #2210, it was not at all clear in the email that the *host reboot=
* case
> is what you're trying to resolve. It seemed like you were just trying to =
clean
> up a case of misplaced code ("[have] all policy in a single application")=
.
>
> Andrew
>
>>
>> Andrew
