Return-Path: <geissonator@gmail.com>
Received: from mail-it0-x22b.google.com (mail-it0-x22b.google.com
 [IPv6:2607:f8b0:4001:c0b::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tv5TV1T8KzDqKD
 for <openbmc@lists.ozlabs.org>; Thu,  5 Jan 2017 09:44:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QnFde+Y2"; 
 dkim-atps=neutral
Received: by mail-it0-x22b.google.com with SMTP id x2so333153406itf.1
 for <openbmc@lists.ozlabs.org>; Wed, 04 Jan 2017 14:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=So7ISX1D5rtwww5dgZCgrSv2SjwohgT2Ah2Xpqt66NA=;
 b=QnFde+Y2J+cZYDUjbOM9Qzfky4pAvqCvRQ/40LkZZfm9BMvvRH1R2nm2KhGD5PYcAU
 g6BsWBBPBxILNYofdS0Tawqbc0p4GF+Gy24UGhObQMFxS1rtjb0oKr/HQuZFM+V6oKvM
 LC07jns9HyNDbEN9pL6skYYDXr5YUTEZJg7MAX7qM/gy6HbuIV8TNN1nCvMFr3nyxTPl
 wMlzwgajjJSBw885DJkUqyCrKLm3bbukI5ODUiPk/xBsM0kdyI0zLdPSussPLhi1nCUr
 ExKcRFmWoMYKf8wb0ZTixus4wyNmbta4AaaytSgvg7s87/9DK1zORCkvhsVUxPHmgQoI
 rt8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=So7ISX1D5rtwww5dgZCgrSv2SjwohgT2Ah2Xpqt66NA=;
 b=VVFaRAwVcNroVoQmoEEYmKFjyvHtET7HW1cTDG3iTDVkqLxJPbmiInBsJn6+RkPikG
 fNeG89wbsKa3h/tkHxzYmerlLBQw0vxUrGG7tmxmgI44qNjIkYHGdlF+z+OqBCuNmBAK
 kLaFaa8fEx1HkLMRpWLm23oeqphYz/Flcrov/PsJXKS6MsztBat65OTtW+ZpcVx6c/UZ
 4c+7jUZ2c3melpnZ0oAdqIfc1AP4KyjERjPG3YqKfUiHCOHA/eoVGAeJKnqtyR53VygH
 ZK3/B0QliPJO3zefvlehKvTNamdZQjXNT90Thc8YYUACUFgAwNiETvLucRaok0ql60+k
 HVMA==
X-Gm-Message-State: AIkVDXIwKUhfSW5yrcGbYwZDcatXWsuiyuQZ+Q5C8MU7fHWKJrSp1cJy5J6F3Psl//bzp6+JrOBZRRjEqR9kUg==
X-Received: by 10.36.43.147 with SMTP id h141mr61453879ita.47.1483569851926;
 Wed, 04 Jan 2017 14:44:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.9.155 with HTTP; Wed, 4 Jan 2017 14:44:11 -0800 (PST)
In-Reply-To: <20170104162820.GA30777@heinlein.lan>
References: <CALLMt=oZ7neAge4of5KwzEQbA9nZ_ayuaYwFyUPGqN14Oq-5fA@mail.gmail.com>
 <CACPK8XebH8SnRGkxqSHS=QN1PYyWL2vt-NBw-sNA6d8qL6ZCEw@mail.gmail.com>
 <CALLMt=pUaq39-YtUQgOcwPOzzhFM8pOB2LgML02uifpKCT3_5Q@mail.gmail.com>
 <1479786054.2503.23.camel@aj.id.au>
 <CALLMt=rNQSyYX6m--TKns1Hf1frFVmCfE+M77RVcADD8QyfuPg@mail.gmail.com>
 <1479863279.2503.42.camel@aj.id.au>
 <CALLMt=rMsUO4yKw9Cs5PVU67dE34Ru-WL+rfE67OtD9t-NKiow@mail.gmail.com>
 <CALLMt=o6td6kAprcHxTyq628mrDk-aAXaK-D_0A9kA+iwVUbUA@mail.gmail.com>
 <20170104162820.GA30777@heinlein.lan>
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 4 Jan 2017 16:44:11 -0600
Message-ID: <CALLMt=pB6V9Q-UNiOyn-S8ZaTpxDgz4xLvQA2qp8t7FcESyQng@mail.gmail.com>
Subject: Re: BMC and Host State Management Refactor
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Andrew Jeffery <andrew@aj.id.au>, jdking@us.ibm.com, 
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
X-List-Received-Date: Wed, 04 Jan 2017 22:44:15 -0000

On Wed, Jan 4, 2017 at 10:28 AM, Patrick Williams <patrick@stwcx.xyz> wrote=
:
> On Tue, Jan 03, 2017 at 04:24:00PM -0600, Andrew Geissler wrote:
>> Happy 2017 Everyone!!
>>
>> As I=E2=80=99ve been implementing the host and chassis state control, I =
ran
>> into an issue when moving some of our existing applications over to
>> the new interfaces.
>>
>> In skeleton/hostcheckstop/host_checkstop_obj.c there=E2=80=99s an assump=
tion
>> that a =E2=80=9CReboot=E2=80=9D request will do a hard power off (i.e. n=
o host
>> notification) and then a fresh boot of the system.  However, per the
>> design discussion of my new code, I=E2=80=99m implementing reboot to do =
a soft
>> power off (i.e. host notification) which obviously won=E2=80=99t work if=
 the
>> host has checkstopped.
>
> I don't think this is unique to "checkstop".  Any time the host has
> crashed the soft power off won't work.  Aren't there two phases to a
> "soft power off"?
>     1) Send SMS alert to host, have a short timeout for them to accept
>        the SMS alert.
>     2) Have a long timeout for them to acknowledge they are ready for
>        the reboot.

I haven't gotten to the bottom of this code flow yet.  But yes, based
on debug data, this seems to be the current flow.  Although current
code does not appear to have implemented any type of safe guard
timeouts.  If you issue a soft power off and the host is not running,
we will currently just hang in whatever state we're in.  I'll be sure
we get the final details documented somewhere once we have plan.

> The "short timeout" should be on the order of seconds, so adding that to
> the checkstop path doesn't really seem that unreasonable to me.  There
> are going to be other cases (pgood fault, host kernel panic, clock
> failure) where the host has similarly died and not all of them yield a
> checkstop signal.
>

So you want to add this short timeout to each application that has to
handle a bad host state?  That doesn't make a lot of sense to me,
seems like we want that logic in one place.

>>
>> I see a few options, I have my favorite last.
>>
>> 1. Have the checkstop code emit a checkstop signal, have the new host
>> state code monitor for it, if a reboot is requested after the
>> checkstop then the host code is smart enough to just power of the
>> chassis and do a power on (i.e. no soft power off)
>> - I=E2=80=99m not a big fan of the potential race conditions here on che=
ckstop
>> single vs reboot (I=E2=80=99m not sure if DBUS guarantees in-order messa=
ges)
>> nor do I really like all this logic in the host state code.
>
> "Checkstop" is a Power-specific concept anyhow.  I don't think a signal
> is all that useful.
>
>>
>> 2. Have the checkstop code issue the chassis power off, which will be
>> detected by the host state code, and then have the checkstop code
>> issue a power on to the host state code once the power off is
>> complete.
>> - This fits with our original plan, put the owness on the caller, but
>> I don=E2=80=99t really like putting the state logic in the checkstop cod=
e.  It
>> would have to issue a command, wait for a signal that we=E2=80=99re powe=
red
>> off, then issue the power on.
>
> Not a fan of this either for similar reasons.
>
> But, along those lines, can we have the checkstop code force the host
> state to "not running" / "failed"?  Then the reboot request can / should
> skip any of the host activity.  This does give us a similar pattern to
> follow for the other possible failure conditions.

Yes, definitely a possibility to do something like this.

>> 3. Put some logic into the soft power off code,
>> phosphor-host-ipmid/host-services.c, to know if the host is up or not
>> and act accordingly
>> - Doesn=E2=80=99t really seem like the right place for this logic
>
> I suspect it needs to have this anyhow, per my earlier comment.
>
>> 4. Provide a softReboot and hardReboot option in the host state code.
>> The hardReboot would do the chassis power off (hard power off) and
>> then power on.  The softReboot will work as expected and issue the
>> soft power down command to the host.
>> - Seems like a happy compromise in where the logic goes.  Checkstop is
>> smart enough to know it needs a hardReboot and host state code knows
>> how to do it.
>
> Other than failure conditions, I don't see a reason for a user to
> request a "hard reboot", being a reboot that keeps AC up but does not
> gracefully shutdown the OS, so I'd rather keep it simple.  FSP code has
> 9000 different boot-types and this is a slippery slope towards that.

I'm mis-using the soft/hard terms I think.  For this discussion, my
plan was a reboot always removes power and then reapplies it.  A soft
OS reboot where we leave AC power on is a future item.  When I said a
hard reboot, I was just thinking of a reboot where we don't send the
SMS alert to the host, we just cut a/c and then boot it back up.

Seems like we've come down to these points:
- If the host is up, give it a chance to power down properly, but
monitor it with 2 timeouts, 1 fast one where they ack they're alive
and processing the request and another longer one where they do the
shutdown.
- Allow application to tell the host state code when it knows the host
is dead (i.e. checkstop, power failure, watchdog) and in those cases
the state code should just power off/on the system on reboot requests.

The host power off code needs to honor this above rule.  Seems like
you were thinking the timeout logic for this should go into the host
ipmi code?  The IPMI code will have better access to the SMS attention
and general host status so seems ok.

But it also seems out of this discussion we're thinking a "host
reboot" when the host is running should really just be a reboot of the
host where we keep the AC applied?  The current "chassis reboot" which
I'm trying to port over(and is the usecase in checkstop code) was for
the whole chassis.

Final code logic would look something like this on a "reboot" request
to the host dbus object
Cec power  OS State  Action
on               off             remove cec power, power back on (i.e.
checkstop code has told host state code host is off)
on               on             send reboot to host, verify it's
processed (on fail, power down and then up)
off               off             just power on system

If a user really wants a full "hard" reboot, they can call the chassis
code to cut power and then boot the system again.

>> Current Interfaces:
>> https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/open=
bmc_project/State
>>
>> Andrew
>>
>> On Sun, Nov 27, 2016 at 8:30 PM, Andrew Geissler <geissonator@gmail.com>=
 wrote:
>> > On Tue, Nov 22, 2016 at 7:07 PM, Andrew Jeffery <andrew@aj.id.au> wrot=
e:
>> >> On Tue, 2016-11-22 at 11:23 -0600, Andrew Geissler wrote:
>> >>> > On Mon, Nov 21, 2016 at 9:40 PM, Andrew Jeffery <andrew@aj.id.au> =
wrote:
>> >>> > On Mon, 2016-11-21 at 20:28 -0600, Andrew Geissler wrote:
>> >>> > > > > > > > On Sun, Nov 20, 2016 at 11:55 PM, Joel Stanley <joel@j=
ms.id.au> wrote:
>> >>> > > > Hi Andrew and Josh,
>> >>> > > >
>> >>> > > > On Sat, Nov 19, 2016 at 7:01 AM, Andrew Geissler <geissonator@=
gmail.com> wrote:
>> >>> > > > > Josh and I are working two stories this sprint that deal wit=
h
>> >>> > > > > refactoring the bmc and host state management code out of sk=
eleton
>> >>> > > > > (#772/#783).  Here=E2=80=99s the proposal on this work.
>> >>> > > >
>> >>> > > > Thanks for sending out your plan, this is great. I have a few =
comments
>> >>> > > > that came up as I was reading.
>> >>> > > >
>> >>> > > > > The overall design for both state management objects is that=
 they will
>> >>> > > > > provide a set of properties on which to operate.
>> >>> > > > > - DesiredState
>> >>> > > > > - CurrentState
>> >>> > > > >
>> >>> > > > > CurrentState will be a read only property.
>> >>> > > >
>> >>> > > > You've chosen to make the desired and current states be separa=
te,
>> >>> > > > which works. Another option would be to have them be the same =
list of
>> >>> > > > states, so you know that when current=3D=3Ddesired you're not =
waiting on
>> >>> > > > anything to happen. What do you think?
>> >>> > > >
>> >>> > >
>> >>> > > Hmmm, I'm thinking from a DBUS/REST api perspective here.  2 see=
ms
>> >>> > > more intuitive, but also I don't think I understand your proposa=
l
>> >>> > > fully :)
>> >>> >
>> >>> > I think you might be misinterpreting. I don't think Joel was sugge=
sting
>> >>> > you eliminate one of the DesiredState or CurrentState "variables",
>> >>> > rather that the /types/ of the CurrentState and DesiredState varia=
bles
>> >>> > be equal. That is, that the same set of states can be assigned to =
both.
>> >>> >
>> >>>
>> >>> I see now.  I'm still not seeing any huge advantages on either
>> >>> proposal over my original.
>> >>
>> >> The advantage I see in Joel's proposal is that we have fewer types
>> >> involved in the problem. The alternative (as mentioned below) is you
>> >> rename DesiredState to Transition, in which case I think what you are
>> >> suggesting is okay. Transitions and states are distinct and well
>> >> defined concepts.
>> >>
>> >> I don't like the idea of "desiring" a state that doesn't exist. Joel'=
s
>> >> initial question suggests he thinks along these lines as well.
>> >>
>> >
>> > Ahh, ok I see your guys point now.  I could def rename the Desired
>> > variables to something like DesiredHostTransition.  Maybe even make
>> > their values verbs (TURN_ON, TURN_OFF, REBOOT)?  I could even knock of
>> > the "Desired" part (i.e. HostTransition)?  I'm not real strong on it
>> > either way.
>> >
>> >>>  I think I'm just going to stick with it
>> >>> for now since there are times where the valid states associated with
>> >>> each (Desired vs. Current) are different
>> >>
>> >> Can you expand on this to make it clear what you are arguing for?
>> >>
>> >>>  and I think having the two as
>> >>> I've defined is a bit more user friendly.
>> >>
>> >> In what way?
>> >>
>> >> Cheers,
>> >>
>> >> Andrew
>> _______________________________________________
>> openbmc mailing list
>> openbmc@lists.ozlabs.org
>> https://lists.ozlabs.org/listinfo/openbmc
>
> --
> Patrick Williams

Andrew
