Return-Path: <mine260309@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::242; helo=mail-it0-x242.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="C+pJSkbo"; 
 dkim-atps=neutral
Received: from mail-it0-x242.google.com (mail-it0-x242.google.com
 [IPv6:2607:f8b0:4001:c0b::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zSYXV0DkJzF0QD
 for <openbmc@lists.ozlabs.org>; Fri, 26 Jan 2018 20:30:01 +1100 (AEDT)
Received: by mail-it0-x242.google.com with SMTP id q8so1127872itb.2
 for <openbmc@lists.ozlabs.org>; Fri, 26 Jan 2018 01:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=/R4eQPWxv6jWB6UJkfTZO39wPqvUFCVxy+ErUwceYOk=;
 b=C+pJSkboP9ftwlTmRhK2agxZapvoQoLONaVu0Wpepo/L3Fxj8rGPugM2gXa/E16zJo
 tn/bIjeh3fB7RcCpxe9VfrOiOZvCia/zJ2m11mUXzVKW9t3G8dDWNPWvRIHl1VGLca6P
 sYcjYBbzgiChDw72lP/Xcly6pFN2leM+/c7vzmNOw/8roO3uJUV9aXVz2npE1caVx+4c
 e29W/Xbdbo4sk/3W4E2BwvYs0vnW4dKg8q4hbXdXSaC2eIY3H5ghaH8Yt0yNVQuAV857
 YZkvFD/AweGKDsVp8zzJuulh6qp5jNaDxZ5dA70PANZNnLBc8ZNmFEOiSjBdSB0iVUp7
 kr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=/R4eQPWxv6jWB6UJkfTZO39wPqvUFCVxy+ErUwceYOk=;
 b=I3dV9L8xl424/QEKQVozZLvtiv2aEU3UmZUQA1pm23lIs5aFMQXvXuB/QVYA4shCKT
 7tOXAlgQWjtMkpjlgZCXAxnM+ketwgY/SKdPM6p/RhjqtZslEugSFnwbMfWFdNOp5U+5
 D8/O3R73BjrOTGFipoPC0IhlJONnmAdLQRGGJjLeQOPZebHRxS/JYLuo23yzU5mFqXif
 Nr3OfjH1EX3FrrCGHNu69JTnST/T3CIAagwWejK3YLuL6sgDgi9NC2amEq6bJhOgfVt7
 OJUWUvj8BWK68/yWWRUArGp8IluqBrytiTH1FwMdMl3IS2tjSY+YvfTgVN58E3IlCZho
 K8yA==
X-Gm-Message-State: AKwxytdbr9yydSmshAro6O/jgyWCHy4N9oRubxcBT7W1pyt+tYT6Pyj0
 TMcenSPN5thpv4wXMc3DVjMneaQo9eSAniYNY9Y=
X-Google-Smtp-Source: AH8x227PSWmHwe+m6vazM3kt0cay1W+ueX0tMYWGQEhqw6nGmzOSCoMKxvpOxgMP7p/BjuDZOm/z0ZaFIc8PdMmeIbQ=
X-Received: by 10.36.101.2 with SMTP id u2mr7439868itb.55.1516958999483; Fri,
 26 Jan 2018 01:29:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.159.68 with HTTP; Fri, 26 Jan 2018 01:29:58 -0800 (PST)
In-Reply-To: <CAARXrtkAKR=15-B_O09J-KBw-M8v4d_ct-2B5YmmDTaugHBmqg@mail.gmail.com>
References: <CAARXrtm-yxJ4cVi_RjMUZVbNT9aSKqp5dPzeanW+kMb=JugW+w@mail.gmail.com>
 <1953058b-4268-602d-cc68-00eae50b1f4f@yadro.com>
 <CAO=notwjPRBjP0A=YOX1Ht06-rdUp7RhcBphuQ1Hg47vRQkG0w@mail.gmail.com>
 <CAPH-5w4A6LENO1jCcvm1-HAHTbaoJRj7oYPN78Z4h1qUZHSOOA@mail.gmail.com>
 <CAARXrtkAKR=15-B_O09J-KBw-M8v4d_ct-2B5YmmDTaugHBmqg@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 26 Jan 2018 17:29:58 +0800
Message-ID: <CAARXrt=rsjRsPOWtsPE=K9oFKswBmZG1NAxiOGH=h3NS9T04LA@mail.gmail.com>
Subject: Re: RFC: calculating RPM from PWM for fan monitor
To: Xo Wang <xow@google.com>
Cc: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Alexander Amelkin <a.amelkin@yadro.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Jan 2018 09:30:02 -0000

I have submitted this proposal to https://gerrit.openbmc-project.xyz/#/c/8661/

On Wed, Jan 24, 2018 at 2:50 PM, Lei YU <mine260309@gmail.com> wrote:
> On Wed, Jan 24, 2018 at 9:22 AM, Xo Wang <xow@google.com> wrote:
>> I think the parameters that Lei proposed are equivalent to the two
>> feedforward coefficients we have (a slope for an assumed linear
>> relationship between a fan's PWM command and its RPM output; and an
>> offset to account for fan start).
>
> Thanks Xo for the info!
>
>>
>> However adding feedforward coefficients isn't the same as detecting
>> fan malfunction as Lei wants. I think to do that, we have to look at
>> the feedback part of it and have a parameter that decides "too much
>> feedback has been required" to hit the target RPM and declare an error
>> condition.
>
> The idea of detecting fan error is simple in the code, which uses a deviation to
> check if the fan speed in in the expected range.
> So if we have defined the slope and the offset for a fan, the monitor is able to
> calculate the expected RPM and check if the fan speed. is out of range,
>
> And this proposal will not impact the current phosphor-fan-monitor too
> much, only
> two new parameters are added.
>
>>
>> On Tue, Jan 23, 2018 at 11:02 AM, Patrick Venture <venture@google.com> wrote:
>>> To reach a desired RPM, via PWM, we use a PID+FF algorithm that tries
>>> to reduce the error between the current fan RPM and the set-point RPM
>>> for the fan.  This is in our presently internal implementation of the
>>> fan control for openbmc.  We're still working out how to open
>>> source/upstream it, when there'll now be multiple implementations of
>>> fan controls, etc.
>>>
>
> Thanks Patrick for this info. I guess the community would like to have
> alternatives for
> fan controls. Maybe a new repo like "google-fan-control" for this?
> Anyway it's up to you and the community to decide what is the best :D
>
>>> Patrick
>>>
>>> On Tue, Jan 23, 2018 at 6:42 AM, Alexander Amelkin <a.amelkin@yadro.com> wrote:
>>>> Lei,
>>>>
>>>> I'm quite new to openbmc and do not yet fully understand its internal
>>>> mechanics, but from my previous experience with other BMC software and
>>>> hardware, I can say that every fan has it's own characteristics that include
>>>> the minimum and maximum RPM it is able to react to and some not necessarily
>>>> linear function between those points.
>>>>
>>>> As far as I remember, AST2500 is able to detect quite any RPM, no matter how
>>>> low it is.
>>>> However, some fans just stop if PWM falls below some threshold and rotate at
>>>> max RPM beyond some max PWM which may be quite less than from 100% (255).
>>>> I've seen Delta's fans that take about 70% PWM as a maximum and fully stop
>>>> below like 20%.
>>>>
>>>> Hence, assuming a single linear slope from 0% to 100% pwm is a bad idea.
>>>>
>>>> Thus, IMO, the yaml file should define a piecewise linear function, and
>>>> maybe jitter level to allow for RPM deviations.
>>>> I would also add a delay after detection of a changed pwm before rpm is
>>>> checked to allow for acceleration/deceleration. From my experience large
>>>> fans (like 100mm) may take up to 4 seconds to reach max rpm from full stop
>>>> condition. This should be taken in account to avoid false alarms.
>>>>
>>>> Alexander Amelkin,
>>>> Leading BMC Firmware Engineer
>>>> YADRO
>>>>
>>>>
>>>> 23.01.2018 12:37, Lei YU wrote:
>>>>>
>>>>> phospohr-fan-monitor compares fan speed with target and determine if the
>>>>> fan
>>>>> is functional:
>>>>>
>>>>> https://github.com/openbmc/phosphor-fan-presence/blob/master/monitor/fan.cpp#L182-L185
>>>>>
>>>>> However, for systems using pwm as target, the logic does not work, because
>>>>> the
>>>>> fan speed is RPM but the target the PWM.
>>>>>
>>>>> So we probably need to have a conversion from PWM target to fan speed RPM.
>>>>>
>>>>> On Romulus, the observation is:
>>>>>
>>>>> | PWM | RPM  |
>>>>> | --- | ---- |
>>>>> | 64  | 3000 |
>>>>> | 96  | 3700 |
>>>>> | 128 | 4300 |
>>>>> | 160 | 4900 |
>>>>> | 192 | 5600 |
>>>>> | 224 | 6300 |
>>>>> | 255 | 7000 |
>>>>>
>>>>> And the linear fit becomes [RPM = 20.7147 * PWM + 1660.04][1]
>>>>>
>>>>> So how do we make fan-monitor to support this?
>>>>>
>>>>> My proposal is to define the parameters, e.g. slope, intercept in the
>>>>> config
>>>>> yaml, and add this support in phosphor-fan-monitor.
>>>>> E.g.
>>>>>      sensors:
>>>>>        - name: fan0
>>>>>          has_target: true
>>>>>          slope: 21
>>>>> intercept: 1600
>>>>>
>>>>> If the yaml config does not define slope/intercept, then the default value
>>>>> is set to 1 and 0 which matches the fan speed target.
>>>>>
>>>>> My question (and concern) is, the fan RPM can not be queried correctly
>>>>> when
>>>>> PWM is set to a low value, e.g. 32, and it means the fit function may not
>>>>> be
>>>>> linear fit.
>>>>>
>>>>> What do you think?
>>>>>
>>>>> [1]:
>>>>> http://m.wolframalpha.com/input/?i=linear+fit+%7B64%2C+3000%7D%2C%7B96%2C+3700%7D%2C%7B128%2C+4300%7D%2C%7B160%2C+4900%7D%2C%7B192%2C+5600%7D%2C%7B224%2C6300%7D%2C%7B255%2C7000%7D
>>>>
>>>>
