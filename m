Return-Path: <geissonator@gmail.com>
Received: from mail-it0-x236.google.com (mail-it0-x236.google.com
 [IPv6:2607:f8b0:4001:c0b::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tNXPr1T3wzDw2F
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 04:24:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="TMerBQIM"; 
 dkim-atps=neutral
Received: by mail-it0-x236.google.com with SMTP id y23so17502804itc.0
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 09:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GdLFcikKvNJx8cYKrsdA+UiW8qIRE6gUpgFn2r5kH44=;
 b=TMerBQIM0jux19xOznwkzvLFMX+DEi20Z6pvIpCkkmi7V28M07NyRxvDd8vWP7UssC
 m9WlBa2vpNZLMd0XuiVqVnQ6DkFqRwGMZT168yoVv4dvjckogegWPyqs/y6mcWBEOsCc
 0OZ1Lw5m/qbqRo69jPMhoxd8W4/4QdQAghGJWokqEnBKjAaL0DVTEDrjcGJuC8Pit1uN
 ESSjVLBhj3FrRfaB3/orWyFvJculFix31jNunYpdphpsiuuHMMD2Z1tyQ8z00PmushAN
 taakFUHVjlshIvFQZ0eo30ubp4Mbk+e1wC9lRofy5gDut9TW9kb7HohjTaIN1QJhY6Hg
 Hmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GdLFcikKvNJx8cYKrsdA+UiW8qIRE6gUpgFn2r5kH44=;
 b=PFsTafz19mMQpLSjjpfqGCZrBcalX21mf8ogOX/jd8taMvI7JHqf4q9TpJfyLKK6Zb
 rnpk021o8ooMkQUjDQtZ5NDY9joZSuJKSnZ7XAmChSCD992c669dTcyHla1GDpt8J1zp
 Fm4IrAnHBIThjtTfN30Ez55W32dyuzf9unhbvxw1MeX6P86PlERoks8/lmxTeT5EJ+1S
 cJbKeXPXADWgO/Ft0jWjnRANulhiOCxFNEgCro3Pj45eCL49xcbdXy/89jJremfDZQhb
 kiwbCgiy1EPjEiDWd3PShz4Gnyiyc/LMX+jZ+xf60Q8UpAA+tUoHKwuOxHOM4bqXbPTC
 9uPw==
X-Gm-Message-State: AKaTC001G/vdcRROavPIntZh2oz1dNnoqLD4AU1IXOFy9hBRl7kblE1GXupHxgXxP9HbGyl/taWObnFURI8fIQ==
X-Received: by 10.36.214.67 with SMTP id o64mr3609436itg.31.1479835437971;
 Tue, 22 Nov 2016 09:23:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.12.151 with HTTP; Tue, 22 Nov 2016 09:23:57 -0800 (PST)
In-Reply-To: <1479786054.2503.23.camel@aj.id.au>
References: <CALLMt=oZ7neAge4of5KwzEQbA9nZ_ayuaYwFyUPGqN14Oq-5fA@mail.gmail.com>
 <CACPK8XebH8SnRGkxqSHS=QN1PYyWL2vt-NBw-sNA6d8qL6ZCEw@mail.gmail.com>
 <CALLMt=pUaq39-YtUQgOcwPOzzhFM8pOB2LgML02uifpKCT3_5Q@mail.gmail.com>
 <1479786054.2503.23.camel@aj.id.au>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 22 Nov 2016 11:23:57 -0600
Message-ID: <CALLMt=rNQSyYX6m--TKns1Hf1frFVmCfE+M77RVcADD8QyfuPg@mail.gmail.com>
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
X-List-Received-Date: Tue, 22 Nov 2016 17:24:00 -0000

On Mon, Nov 21, 2016 at 9:40 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Mon, 2016-11-21 at 20:28 -0600, Andrew Geissler wrote:
>> > On Sun, Nov 20, 2016 at 11:55 PM, Joel Stanley <joel@jms.id.au> wrote:
>> > Hi Andrew and Josh,
>> >
>> > On Sat, Nov 19, 2016 at 7:01 AM, Andrew Geissler <geissonator@gmail.co=
m> wrote:
>> > > Josh and I are working two stories this sprint that deal with
>> > > refactoring the bmc and host state management code out of skeleton
>> > > (#772/#783).  Here=E2=80=99s the proposal on this work.
>> >
>> > Thanks for sending out your plan, this is great. I have a few comments
>> > that came up as I was reading.
>> >
>> > > The overall design for both state management objects is that they wi=
ll
>> > > provide a set of properties on which to operate.
>> > > - DesiredState
>> > > - CurrentState
>> > >
>> > > CurrentState will be a read only property.
>> >
>> > You've chosen to make the desired and current states be separate,
>> > which works. Another option would be to have them be the same list of
>> > states, so you know that when current=3D=3Ddesired you're not waiting =
on
>> > anything to happen. What do you think?
>> >
>>
>> Hmmm, I'm thinking from a DBUS/REST api perspective here.  2 seems
>> more intuitive, but also I don't think I understand your proposal
>> fully :)
>
> I think you might be misinterpreting. I don't think Joel was suggesting
> you eliminate one of the DesiredState or CurrentState "variables",
> rather that the /types/ of the CurrentState and DesiredState variables
> be equal. That is, that the same set of states can be assigned to both.
>

I see now.  I'm still not seeing any huge advantages on either
proposal over my original.  I think I'm just going to stick with it
for now since there are times where the valid states associated with
each (Desired vs. Current) are different and I think having the two as
I've defined is a bit more user friendly.

>>  What would this look like from an implementation perspective
>> and DBUS/REST interfaces?
>
> No different, just the set of possible states would be consistent
> between the two variables.
>
> Alternatively you could define transitions on the states and rename
> DesiredState to Transition, or something similar. This might better
> align with what you're proposing (a state machine).
>
>>
>> > >
>> > > The host control will have these additional properties:
>> > > - DesiredPowerState
>> > > - CurrentPowerState
>> > >
>> > > Valid states to request for OpenBMC (DesiredState)
>> > > - READY, REBOOT
>> > > Valid states to be in for OpenBMC (CurrentState)
>> > > - NOT_READY, READY (note this proposal removes BASE_APPS and BMC_STA=
RTING).
>
> What does it mean to request a READY state? When can you do this? Can
> you request it whilst the BMC is in NOT_READY? Requesting READY in
> READY doesn't seem productive.
>
> If there are restrictions on combinations of source and target state it
> might be better to make use of the transition concept to spell it out
> (i.e. describe a formal state machine).
>

Yeah good point, READY is not a valid state to request.  We get to
that via systemd, so the only valid DesiredState would be REBOOT.  I'm
trying to keep things as simple as possible right now, and to utilize
as much of systemd's built in function for state transitions.

>> >
>> > Does this need to consider states where the device is updating? That
>> > is, it is not attempting to be ready to control the host, but it is
>> > turned on and able to accept new firmware?
>> >
>>
>> I think READY implies available for code update?  But good point on
>> code updates, when a code update is being performed, a FW_UPDATE state
>> seems reasonable.
>>
>> > >
>> > > READY implies all services started and running successfully (i.e. we
>> > > reached obmc-standby.target)
>> > >
>> > >
>> > > Valid states to request for Host (DesiredState)
>> > > - OFF, ON, REBOOT
>> >
>> > This might need to distinguish between soft-off/soft-reboot and
>> > printer-on-fire OFF requests.
>> >
>>
>> Yeah, the focus of this story was to keep similar function as what's
>> in place now, but refactor into c++ and the new sdbusplus interfaces.
>> We do probably need more work done with things like you say here.
>> We've tended to call the printer-on-fire off's EMERGENCY_ type event
>> requests.  At a minimum, I'll be sure these are tracked in future
>> stories.
>>
>> > > Validate states to be in for Host (CurrentState)
>> > > - OFF, BOOTING, BOOTED
>> >
>> > STANDBY, BOOTING, RUNNING?
>> >
>> > The bikeshed should be blue.
>> >
>>
>> Agree
>
> Okay so the bikeshed is blue, but what about the state names?? ;)

I finally googled this... http://bikeshed.org/  nice

>
> Andrew
