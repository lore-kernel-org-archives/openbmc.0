Return-Path: <geissonator@gmail.com>
Received: from mail-it0-x234.google.com (mail-it0-x234.google.com
 [IPv6:2607:f8b0:4001:c0b::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tN8XF2rmHzDsxm
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 13:28:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="m2wdnCot"; 
 dkim-atps=neutral
Received: by mail-it0-x234.google.com with SMTP id y23so1138112itc.0
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 18:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=r9DPHq9hqakTkXySr2upUDt6lJ311ks3vSPq0yCwosE=;
 b=m2wdnCotKnsMOhq9sgdZE8XLE/n16gD0hG2KIE79xn+9gu6fDZT8IugfnB7wmibYWJ
 +CsZoCPV4Pc9vnj9pmrqiFjCUknX7sYe7dsy7Skq3ZN7V9SXrGDhCfV9/7Pa0oRYDbkL
 iC6QMiX/Rxoq/xKNb6Hry1xdOrR1McNEY1loPPlckJSJbnyNn1RwxQ1CEkZUwZs2Mb5H
 T/hJI2wPhoNW3uwk/QqckNa8mR0ET/AU+z3trDbZMhyplnmioiSN9vOyG7mdKPmEOBQS
 MrgpEH9MnZxEHW7/sAUDd00aTf6hsYAFn6BdhZXOjV2P0H7/rS9t/teXv+mgLpuGKnX6
 TAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=r9DPHq9hqakTkXySr2upUDt6lJ311ks3vSPq0yCwosE=;
 b=J7yxGykcYAOudbXKu44mg/7ET0GBJfytVSgUfKNv65ZTSfbyB9JkD8c+ra4JKDseQ3
 cXdsxX53YogkzbkIQ6y+6yZU2drfx0E4xzNESLOo9stOt0y4vGVl7MZHCsG9fOFsqm7/
 yViRO8a3c6PdDyNuHkAvKYunKdjlsvMsoc3eV6vcreJRTKhPIW4WV2ZCFvNFSFyR3kkl
 7P1SsPfnhCqIpfM8tlbd5WG3c6Nt04Bw1ZWrDwwkDtOfAWucNY+xrCMh+7hjE0Y6dTr9
 wB4RQESoDxRThGevAvEuuAMr6wFH3wiu4tA93WBya0lFQETPYy/jYJLVL9XF/XvYfcs1
 jqgw==
X-Gm-Message-State: AKaTC02HTuviD1AUoh5rXNsvt3aH0OY0NVC3q6qLT17/8sqS6mx4O71HbuyrMYKxpaqEoNs1aOju6bYLlSDAOA==
X-Received: by 10.36.43.147 with SMTP id h141mr188999ita.47.1479781691028;
 Mon, 21 Nov 2016 18:28:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.164.83 with HTTP; Mon, 21 Nov 2016 18:28:10 -0800 (PST)
In-Reply-To: <CACPK8XebH8SnRGkxqSHS=QN1PYyWL2vt-NBw-sNA6d8qL6ZCEw@mail.gmail.com>
References: <CALLMt=oZ7neAge4of5KwzEQbA9nZ_ayuaYwFyUPGqN14Oq-5fA@mail.gmail.com>
 <CACPK8XebH8SnRGkxqSHS=QN1PYyWL2vt-NBw-sNA6d8qL6ZCEw@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 21 Nov 2016 20:28:10 -0600
Message-ID: <CALLMt=pUaq39-YtUQgOcwPOzzhFM8pOB2LgML02uifpKCT3_5Q@mail.gmail.com>
Subject: Re: BMC and Host State Management Refactor
To: Joel Stanley <joel@jms.id.au>
Cc: jdking@us.ibm.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 22 Nov 2016 02:28:14 -0000

On Sun, Nov 20, 2016 at 11:55 PM, Joel Stanley <joel@jms.id.au> wrote:
> Hi Andrew and Josh,
>
> On Sat, Nov 19, 2016 at 7:01 AM, Andrew Geissler <geissonator@gmail.com> =
wrote:
>> Josh and I are working two stories this sprint that deal with
>> refactoring the bmc and host state management code out of skeleton
>> (#772/#783).  Here=E2=80=99s the proposal on this work.
>
> Thanks for sending out your plan, this is great. I have a few comments
> that came up as I was reading.
>
>> The overall design for both state management objects is that they will
>> provide a set of properties on which to operate.
>> - DesiredState
>> - CurrentState
>>
>> CurrentState will be a read only property.
>
> You've chosen to make the desired and current states be separate,
> which works. Another option would be to have them be the same list of
> states, so you know that when current=3D=3Ddesired you're not waiting on
> anything to happen. What do you think?
>

Hmmm, I'm thinking from a DBUS/REST api perspective here.  2 seems
more intuitive, but also I don't think I understand your proposal
fully :)  What would this look like from an implementation perspective
and DBUS/REST interfaces?

>>
>> The host control will have these additional properties:
>> - DesiredPowerState
>> - CurrentPowerState
>>
>> Valid states to request for OpenBMC (DesiredState)
>> - READY, REBOOT
>> Valid states to be in for OpenBMC (CurrentState)
>> - NOT_READY, READY (note this proposal removes BASE_APPS and BMC_STARTIN=
G).
>
> Does this need to consider states where the device is updating? That
> is, it is not attempting to be ready to control the host, but it is
> turned on and able to accept new firmware?
>

I think READY implies available for code update?  But good point on
code updates, when a code update is being performed, a FW_UPDATE state
seems reasonable.

>>
>> READY implies all services started and running successfully (i.e. we
>> reached obmc-standby.target)
>>
>>
>> Valid states to request for Host (DesiredState)
>> - OFF, ON, REBOOT
>
> This might need to distinguish between soft-off/soft-reboot and
> printer-on-fire OFF requests.
>

Yeah, the focus of this story was to keep similar function as what's
in place now, but refactor into c++ and the new sdbusplus interfaces.
We do probably need more work done with things like you say here.
We've tended to call the printer-on-fire off's EMERGENCY_ type event
requests.  At a minimum, I'll be sure these are tracked in future
stories.

>> Validate states to be in for Host (CurrentState)
>> - OFF, BOOTING, BOOTED
>
> STANDBY, BOOTING, RUNNING?
>
> The bikeshed should be blue.
>

Agree

>>
>> BOOTED implies petitboot has reached it's "ready" state.
>>
>>
>> Valid power states to request for DesiredPowerState
>> - OFF, ON
>> Validate states to be in for CurrentPowerState
>> - OFF, TRANSITION, ON
>
> Does TRANSITION need to distinguish between coming up and going down?
>

I'd prefer to keep simple and let the user determine this by looking
at the DesiredPowerState if it's needed.

>>
>> Patrick and I had some discussion on providing more details on the
>> host booted state (petitboot vs. os booted) but that can be an
>> extension in the future if needed.
>
> I think baking this in from the start is a worthy goal. This then
> feeds into the user-facing APIs, weather that is an IPMI sensor or a
> REST endpoint, that can be queried to ask "what is that damn computer
> up to". If we can make it informative enough that no one ever feels
> the need to watch the console output when the machine is booting then
> we have done a good job.
>

Agree but please see above comment about the scope of this story.  I'm
concerned this opens up a can of worms on extra stuff we'll need from
hostboot and petitboot.  I'll def make sure to write this down for
future stories and there wont be anything in this base design that
will limit that later.

> Cheers,
>
> Joel

Thanks for the feedback Joel!
Andrew
