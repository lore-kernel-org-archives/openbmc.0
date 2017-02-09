Return-Path: <geissonator@gmail.com>
Received: from mail-it0-x233.google.com (mail-it0-x233.google.com
 [IPv6:2607:f8b0:4001:c0b::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vK3WX4HdJzDq5x
 for <openbmc@lists.ozlabs.org>; Fri, 10 Feb 2017 03:32:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qZ9RvvZp"; 
 dkim-atps=neutral
Received: by mail-it0-x233.google.com with SMTP id r185so20057043ita.0
 for <openbmc@lists.ozlabs.org>; Thu, 09 Feb 2017 08:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=73y2stniXh35+WgiP1JO1SHUSqtJ0trjxyWDbKTWLJo=;
 b=qZ9RvvZpQhgPBWaFG43NThcD96VzCb3YpBzkXV3dvX8YUJUZ1rW68VREmu7AJ3kFTu
 T6xJjRRd/dEoAw6VrSZeO4Ab4YsyFBEigTRoOxlCN9+Z80kQ74UGq+HNAJiVbNh5/Zbg
 ia7icvPBVAthhGF6tQb7fl49wOEoyG8ErlVn/PaGtz7uyn2NuvJvhKnJzJMP/Elv5Noh
 skqLkd8lH+dfnultJ1P1Xse3UHlY/5DoVebk5lj5xH7rPEc2PAK6HS5rpwLysBzC9jDk
 8N6BKuG3wulgC8SEUQoCqXZw038Bl3KJR1bPhEiS4DL7GQ1jGoJ4Yl/M+pmWPcZPXz+k
 eYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=73y2stniXh35+WgiP1JO1SHUSqtJ0trjxyWDbKTWLJo=;
 b=fxwWTjuIzxqp9xq4nDo9AL/DjuZAJgEwVPBa7yNyCq64U5GlQZBv6BGV3o2u9LYQjr
 8P+GAcAff+N1OFv7Ytx6kp3jNJAHjtLSw9ARst9z5wGwcccEG0OVxZx3FE0xX24tCWIH
 6Cg275lu+rNr+aEqg4xRxToUEyG8Ko3Nza9TBP5o3j8IUIwSTzI8OVl2zTEweMgq//aD
 jnBbZ8NMJTRQuhkBmqXzf+YM37evpbGUTcuX+I3ExcIQXC8z7Fxx9sGiEQpymaSl6pPg
 k8hCpNSzauYglo4r5w2qto0wIFTJ/HPeX+pCG4SBrLvM9qGlGhw77ds96fgMpJiYsF9C
 yaZw==
X-Gm-Message-State: AMke39m1uNldQQH/LP75ZnYPGoLvBClE7YSrUrNfV0FCcFJBnG2M+NQ1iCcb7mzom+lWOwWbqm01yN3rKIKKyA==
X-Received: by 10.36.7.5 with SMTP id f5mr4119200itf.33.1486657926255; Thu, 09
 Feb 2017 08:32:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.9.155 with HTTP; Thu, 9 Feb 2017 08:32:05 -0800 (PST)
In-Reply-To: <1486104037.7271.10.camel@aj.id.au>
References: <CAPH-5w4WA8aVbKA0ptR7ubtpCUuGxZ2RQpuS0W4m1csen-kU-w@mail.gmail.com>
 <1485479779.4137.13.camel@aj.id.au>
 <CALLMt=qq97zpRTxomzzucenceiZBEJqgbXANoeU_3Kd1S0313A@mail.gmail.com>
 <1486104037.7271.10.camel@aj.id.au>
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 9 Feb 2017 10:32:05 -0600
Message-ID: <CALLMt=rHDvrGppGkNp8hXNu0Lwxbr36HFDwptFkeTP62nS+7XQ@mail.gmail.com>
Subject: Re: How to deal with failing services in the boot targets
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Xo Wang <xow@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 09 Feb 2017 16:32:09 -0000

Some updates on this topic as I've gone into implementation.

The use of "system" in the quiesce target resulted in a lot of
discussion.  What's a system in relation to a chassis or host?  We
then started discussing blade centers (1 bmc to many blade servers)
and high end servers (1 bmc to many chassis).

This also led to discussion on whether we can really do a generic
recovery when the chassis power on target vs. the host start target
fails.

The outcome was the following:
- We'll rename the  obmc-quiesce-system@.target to
obmc-quiesce-host@.target.  We'll create an instance per host (which
is currently 1 for all systems).
- When the chassis power on target fails, we'll have it's
"onFailure=3Dchassis power off" instead of quiesce.  The power on should
be very minimal and if we fail, the only recovery is to power off and
try again.  When the host start target fails, we'll go to the host
quiesce target.  The recovery from that could be to power on/off again
but it could also be to just re-run the host start target (i.e. leave
chassis power on).

Also, Brad noted in the code review that we should not be putting the
target to service dependencies in the target files.  The target files
are meant to be generic to allow different implementations on the
services required to achieve them.  Instead, I'll be putting the
relationship into the recipe files.

If you'd like to follow along on the reviews:
https://gerrit.openbmc-project.xyz/#/c/2253/  # doc updates
https://gerrit.openbmc-project.xyz/#/c/2115/  # target and recipe updates

Andrew

On Fri, Feb 3, 2017 at 12:40 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Wed, 2017-02-01 at 14:42 -0600, Andrew Geissler wrote:
>> Finally got around to doing some testing on this, here's what I got.
>>
>> > My story this sprint, https://github.com/openbmc/openbmc/issues/1033,
>> is focused on handling errors when things go wrong.  Specifically,
>> when required services fail to execute properly during a systemd
>> target execution (power on, power off).  When a fail happens, the obmc
>> software needs to notify the users of the system and provide
>> mechanisms for either the system to automatically retry the failed
>> operation (i.e. reboot the system) or to stay in a quiesced state so
>> that error data can be collected and the fail can be investigated.
>>
>> Michael is working on a story that ties in with this function this
>> > sprint, https://github.com/openbmc/openbmc/issues/942, in which we=E2=
=80=99ll
>> allow system users to enable or disable the auto reboot function on
>> errors (service failure, host checkstop failure, host watchdog
>> failure).  He will utilize the new target I=E2=80=99ll be creating in my=
 story
>> for this.
>>
>> So we have two main fail scenarios:
>>
>> 1. A service within a target fails
>> - If the service is a oneshot type, and you put that it is required
>> (not wanted) by the target then the target will fail if the service
>> fails
>>   - You can simply define a behavior for when the target fails using
>> the =E2=80=9COnFailure=E2=80=9D option (i.e. go to a new failure target =
if any
>> required service fails)
>>
>> - If the service is not a oneshot, then you can not have it fail the
>> target (the target only knows that it started successfully)
>>   - You have to define a behavior for when the service fails (OnFailure)=
 option.
>>   - The service can not have "RemainAfterExit=3Dyes=E2=80=9D otherwise t=
he
>> OnFailure action does not occur until the service is stopped (instead
>> of when it fails)
>>
>> 2. A failure outside of a normal systemd target/service (host watchdog
>> expires, host checkstop detected)
>> - The service which detects this failure is responsible for logging
>> the appropriate error, and instructing systemd to go to the
>> appropriate target
>>
>> The current proposal is that we create a new quiesce target.  This is
>> the target that the target/services put for their =E2=80=9COnFailure=3D=
=E2=80=9C
>> instruction and where the services in fail #2 above detect a problem
>> will instruct systemd to go to.  We=E2=80=99ll then have code that monit=
ors
>> for the entry into this new quiesce target and handles the halt vs
>> automatic reboot functionality.
>>
>> The above info sets up some general guidelines for our targets and
>> services (and some refactoring for my story this sprint)
>>
>> - All targets should have an =E2=80=9COnFailure=3Dobmc-quiesce-system@.t=
arget=E2=80=9D
>> - All services which are required for a target to achieve it=E2=80=99s
>> function should be RequiredBy that target (not WantedBy)
>> - All services should first try to be Type=3Doneshot so that we can just
>> rely on the target fail path
>> - If a service can not be =E2=80=9CType=3Doneshot=E2=80=9D, then it need=
s to have a
>> =E2=80=9COnFailure=3Dobmc-quiesce-system@.target=E2=80=9D and a "RemainA=
fterExit=3Dno=E2=80=9D
>> - If a service can not be any of these then it=E2=80=99s up to the servi=
ce
>> application to call systemd with the obmc-quiesce-system@.target on
>> failures
>>
>> Thoughts/Questions?
>
> I think this is a sensible set of suggestions. We need to document them
> somewhere obvious so a) we can point people at them and b) reviewers
> can refer to them when reviewing patches adding/updating systemd unit
> files and targets.
>
> Thanks for considering the problem.
>
> Andrew
