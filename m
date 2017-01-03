Return-Path: <geissonator@gmail.com>
Received: from mail-io0-x22a.google.com (mail-io0-x22a.google.com
 [IPv6:2607:f8b0:4001:c06::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ttT4g5xHyzDqG0
 for <openbmc@lists.ozlabs.org>; Wed,  4 Jan 2017 09:24:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="t6D7qRw8"; 
 dkim-atps=neutral
Received: by mail-io0-x22a.google.com with SMTP id d9so441313375ioe.0
 for <openbmc@lists.ozlabs.org>; Tue, 03 Jan 2017 14:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EB6d83omGe7PQfv/KhHhqq73SxPZdw4fzp4Y3o3nOgQ=;
 b=t6D7qRw8Ge1U9+auJxxt6LU06mMTA9QNPPHH+M+sgNPA10ts0LrKQt4/EdqcrpM9y4
 MFDFBgxGQFNh0RnsWtY92AfCSDSkC5Ic/Loq2NBn/BEm0KjYhH9diMshzfCSQ6Q9OWez
 PMM151RTBjdgbyjJwHgoNj8tGFEN/xopqZDjZDNsNIJlkeZGUNDaF9hGrjY/B4Zxtr7f
 AYhJASoJuFlMOmo7lR3NYTaVAEUYq3TMf6pBoFVKeUwOqBQFRMEEIf3x9Q+HQP740ZLN
 bz+sVOJFbpPCMJsZsXXYqI8YKgecGBXR9ux7ZZ7GqWHFRK9n92QNaT/ucRGwBKOa5iqL
 Jg2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EB6d83omGe7PQfv/KhHhqq73SxPZdw4fzp4Y3o3nOgQ=;
 b=VWgMZ6heFQ2QpDhIGlWcYBth1+r5zcxAfyd/IwkTrjuakmzAkpzH9DQdHbBqNR0QWg
 W3UahVdd4uk+6cx8fv1FYG4p+s0MwErmSnQdJ4VF0wQlMEaL5hFFPd0QzLmRm6AAyWCq
 xtCOQXj5sFz5bKHnz1kejq5dBYH2Yob+QcpypdPFub/mrKYwrc6aKm0yGxpwkvQ3dRDK
 8FDTr80WiHWOgptqmnZxOk9vz7Clth+Eb7+o1C5KbfEjgheEI4BKpH77RfX4k9ZQRnBv
 gobfHxqhMwVt1xJ0sVf1UuNF6X0f1XGPPKqHKiKBaFoDwMGgpT+ED87/0R7EDSASpH2+
 359w==
X-Gm-Message-State: AIkVDXIJf2JLEQNkPdkL1zgxeDGcSHD7FWCMqZ8B5SYG0WDkNHNexbK4w2qCaqT0A6jeqbhlD6W8xax4fXKqNg==
X-Received: by 10.107.166.84 with SMTP id p81mr34056729ioe.15.1483482241373;
 Tue, 03 Jan 2017 14:24:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.138.23 with HTTP; Tue, 3 Jan 2017 14:24:00 -0800 (PST)
In-Reply-To: <CALLMt=rMsUO4yKw9Cs5PVU67dE34Ru-WL+rfE67OtD9t-NKiow@mail.gmail.com>
References: <CALLMt=oZ7neAge4of5KwzEQbA9nZ_ayuaYwFyUPGqN14Oq-5fA@mail.gmail.com>
 <CACPK8XebH8SnRGkxqSHS=QN1PYyWL2vt-NBw-sNA6d8qL6ZCEw@mail.gmail.com>
 <CALLMt=pUaq39-YtUQgOcwPOzzhFM8pOB2LgML02uifpKCT3_5Q@mail.gmail.com>
 <1479786054.2503.23.camel@aj.id.au>
 <CALLMt=rNQSyYX6m--TKns1Hf1frFVmCfE+M77RVcADD8QyfuPg@mail.gmail.com>
 <1479863279.2503.42.camel@aj.id.au>
 <CALLMt=rMsUO4yKw9Cs5PVU67dE34Ru-WL+rfE67OtD9t-NKiow@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 3 Jan 2017 16:24:00 -0600
Message-ID: <CALLMt=o6td6kAprcHxTyq628mrDk-aAXaK-D_0A9kA+iwVUbUA@mail.gmail.com>
Subject: Re: BMC and Host State Management Refactor
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, jdking@us.ibm.com, 
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
X-List-Received-Date: Tue, 03 Jan 2017 22:24:04 -0000

Happy 2017 Everyone!!

As I=E2=80=99ve been implementing the host and chassis state control, I ran
into an issue when moving some of our existing applications over to
the new interfaces.

In skeleton/hostcheckstop/host_checkstop_obj.c there=E2=80=99s an assumptio=
n
that a =E2=80=9CReboot=E2=80=9D request will do a hard power off (i.e. no h=
ost
notification) and then a fresh boot of the system.  However, per the
design discussion of my new code, I=E2=80=99m implementing reboot to do a s=
oft
power off (i.e. host notification) which obviously won=E2=80=99t work if th=
e
host has checkstopped.

I see a few options, I have my favorite last.

1. Have the checkstop code emit a checkstop signal, have the new host
state code monitor for it, if a reboot is requested after the
checkstop then the host code is smart enough to just power of the
chassis and do a power on (i.e. no soft power off)
- I=E2=80=99m not a big fan of the potential race conditions here on checks=
top
single vs reboot (I=E2=80=99m not sure if DBUS guarantees in-order messages=
)
nor do I really like all this logic in the host state code.

2. Have the checkstop code issue the chassis power off, which will be
detected by the host state code, and then have the checkstop code
issue a power on to the host state code once the power off is
complete.
- This fits with our original plan, put the owness on the caller, but
I don=E2=80=99t really like putting the state logic in the checkstop code. =
 It
would have to issue a command, wait for a signal that we=E2=80=99re powered
off, then issue the power on.

3. Put some logic into the soft power off code,
phosphor-host-ipmid/host-services.c, to know if the host is up or not
and act accordingly
- Doesn=E2=80=99t really seem like the right place for this logic

4. Provide a softReboot and hardReboot option in the host state code.
The hardReboot would do the chassis power off (hard power off) and
then power on.  The softReboot will work as expected and issue the
soft power down command to the host.
- Seems like a happy compromise in where the logic goes.  Checkstop is
smart enough to know it needs a hardReboot and host state code knows
how to do it.

Current Interfaces:
https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/openbmc=
_project/State

Andrew

On Sun, Nov 27, 2016 at 8:30 PM, Andrew Geissler <geissonator@gmail.com> wr=
ote:
> On Tue, Nov 22, 2016 at 7:07 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>> On Tue, 2016-11-22 at 11:23 -0600, Andrew Geissler wrote:
>>> > On Mon, Nov 21, 2016 at 9:40 PM, Andrew Jeffery <andrew@aj.id.au> wro=
te:
>>> > On Mon, 2016-11-21 at 20:28 -0600, Andrew Geissler wrote:
>>> > > > > > > > On Sun, Nov 20, 2016 at 11:55 PM, Joel Stanley <joel@jms.=
id.au> wrote:
>>> > > > Hi Andrew and Josh,
>>> > > >
>>> > > > On Sat, Nov 19, 2016 at 7:01 AM, Andrew Geissler <geissonator@gma=
il.com> wrote:
>>> > > > > Josh and I are working two stories this sprint that deal with
>>> > > > > refactoring the bmc and host state management code out of skele=
ton
>>> > > > > (#772/#783).  Here=E2=80=99s the proposal on this work.
>>> > > >
>>> > > > Thanks for sending out your plan, this is great. I have a few com=
ments
>>> > > > that came up as I was reading.
>>> > > >
>>> > > > > The overall design for both state management objects is that th=
ey will
>>> > > > > provide a set of properties on which to operate.
>>> > > > > - DesiredState
>>> > > > > - CurrentState
>>> > > > >
>>> > > > > CurrentState will be a read only property.
>>> > > >
>>> > > > You've chosen to make the desired and current states be separate,
>>> > > > which works. Another option would be to have them be the same lis=
t of
>>> > > > states, so you know that when current=3D=3Ddesired you're not wai=
ting on
>>> > > > anything to happen. What do you think?
>>> > > >
>>> > >
>>> > > Hmmm, I'm thinking from a DBUS/REST api perspective here.  2 seems
>>> > > more intuitive, but also I don't think I understand your proposal
>>> > > fully :)
>>> >
>>> > I think you might be misinterpreting. I don't think Joel was suggesti=
ng
>>> > you eliminate one of the DesiredState or CurrentState "variables",
>>> > rather that the /types/ of the CurrentState and DesiredState variable=
s
>>> > be equal. That is, that the same set of states can be assigned to bot=
h.
>>> >
>>>
>>> I see now.  I'm still not seeing any huge advantages on either
>>> proposal over my original.
>>
>> The advantage I see in Joel's proposal is that we have fewer types
>> involved in the problem. The alternative (as mentioned below) is you
>> rename DesiredState to Transition, in which case I think what you are
>> suggesting is okay. Transitions and states are distinct and well
>> defined concepts.
>>
>> I don't like the idea of "desiring" a state that doesn't exist. Joel's
>> initial question suggests he thinks along these lines as well.
>>
>
> Ahh, ok I see your guys point now.  I could def rename the Desired
> variables to something like DesiredHostTransition.  Maybe even make
> their values verbs (TURN_ON, TURN_OFF, REBOOT)?  I could even knock of
> the "Desired" part (i.e. HostTransition)?  I'm not real strong on it
> either way.
>
>>>  I think I'm just going to stick with it
>>> for now since there are times where the valid states associated with
>>> each (Desired vs. Current) are different
>>
>> Can you expand on this to make it clear what you are arguing for?
>>
>>>  and I think having the two as
>>> I've defined is a bit more user friendly.
>>
>> In what way?
>>
>> Cheers,
>>
>> Andrew
