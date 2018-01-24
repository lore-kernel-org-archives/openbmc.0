Return-Path: <xow@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c05::235; helo=mail-pg0-x235.google.com;
 envelope-from=xow@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="n00smy4T"; 
 dkim-atps=neutral
Received: from mail-pg0-x235.google.com (mail-pg0-x235.google.com
 [IPv6:2607:f8b0:400e:c05::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zR6pr58gpzDqFb
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jan 2018 12:22:28 +1100 (AEDT)
Received: by mail-pg0-x235.google.com with SMTP id m20so1545412pgc.11
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jan 2018 17:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=NwKSwHe3sJIxuBs1Z3oXdZ0DiXRBz/S766KO6m7/VFw=;
 b=n00smy4T1EXYL06z1xpKoqCfbeiO1rQEjtOQCj/1Bxkw7wM5+CBmhFldvM9kbu4DHk
 jHWuEgJNONNpUisJ1b7hFaLgjHkfiMnufcU+QlgR5Eu7nee+tAgTNn83FcuwG46APGjv
 8jnads0kc7rgUKtfUQflzYrpDhoWigyLv+YFmsAq5jmJxoBj8OiVD1zjmNuLPDiU6GuF
 zuksPKKi4c3E9OiYJtsIDxehOz0F1tWGsRE3ao2n4wVDxQH94Hx8fjwEwapMWdN5eYyo
 6Vu/gVOO9QOc4JqsidXSg87pYkV2gMiAF4x03dVJyQK1oCvD1fDiCcGp++AbFppwgNI4
 LlBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=NwKSwHe3sJIxuBs1Z3oXdZ0DiXRBz/S766KO6m7/VFw=;
 b=ESCmsGxeQO99YWQVixJLZTxIxfS3pUpbrRm6a5pl8qUCOSetV2Gn0KfS6CofW8UAqk
 CIJqKkAWyLHV/p6Tr2qwiXIIKNWCo9Ojj1aJlVVJAIXTFlDJE9jP4tRFHeMKDXec/uj5
 HunyS74wR/uS4VTlWS0CJrOZDetuuum8GpLLQJWOyk16MxkxJCpUFgtvv1s/eAkyowHi
 lgcm/aReE46RxJ0QEz/HQFGgjC76xHIBV2UWcW8TmmkZFpOrXxq+RPi9o762/zvq2C+V
 DN99SLSSCzNDP2+oaYfjsUKkVcB64aXOT9tV3CBtei2Xu+A/PU0PRfCQF0svz53Fto9B
 nAag==
X-Gm-Message-State: AKwxytf9p7cb1A+dco+3juzksKffF1gxDJd8zG3JvbuPir4cW/G/bmjE
 2D9ClYDK7GaCgQYreZRU4/7q/ckq46Sz8ZusOouB3w==
X-Google-Smtp-Source: AH8x2252xmdHYrljcUbp6OLOC+JVL2MHUPdFk2ZPG4g3yZrabsdA+aSZAGuVVbAE5NQb3iAAcAG7yy4HsA+VRFRK/0s=
X-Received: by 10.99.116.22 with SMTP id p22mr9307114pgc.182.1516756945766;
 Tue, 23 Jan 2018 17:22:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.236.189.140 with HTTP; Tue, 23 Jan 2018 17:22:25 -0800 (PST)
In-Reply-To: <CAO=notwjPRBjP0A=YOX1Ht06-rdUp7RhcBphuQ1Hg47vRQkG0w@mail.gmail.com>
References: <CAARXrtm-yxJ4cVi_RjMUZVbNT9aSKqp5dPzeanW+kMb=JugW+w@mail.gmail.com>
 <1953058b-4268-602d-cc68-00eae50b1f4f@yadro.com>
 <CAO=notwjPRBjP0A=YOX1Ht06-rdUp7RhcBphuQ1Hg47vRQkG0w@mail.gmail.com>
From: Xo Wang <xow@google.com>
Date: Tue, 23 Jan 2018 17:22:25 -0800
Message-ID: <CAPH-5w4A6LENO1jCcvm1-HAHTbaoJRj7oYPN78Z4h1qUZHSOOA@mail.gmail.com>
Subject: Re: RFC: calculating RPM from PWM for fan monitor
To: Patrick Venture <venture@google.com>
Cc: Alexander Amelkin <a.amelkin@yadro.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 24 Jan 2018 01:22:29 -0000

I think the parameters that Lei proposed are equivalent to the two
feedforward coefficients we have (a slope for an assumed linear
relationship between a fan's PWM command and its RPM output; and an
offset to account for fan start).

However adding feedforward coefficients isn't the same as detecting
fan malfunction as Lei wants. I think to do that, we have to look at
the feedback part of it and have a parameter that decides "too much
feedback has been required" to hit the target RPM and declare an error
condition.

On Tue, Jan 23, 2018 at 11:02 AM, Patrick Venture <venture@google.com> wrote:
> To reach a desired RPM, via PWM, we use a PID+FF algorithm that tries
> to reduce the error between the current fan RPM and the set-point RPM
> for the fan.  This is in our presently internal implementation of the
> fan control for openbmc.  We're still working out how to open
> source/upstream it, when there'll now be multiple implementations of
> fan controls, etc.
>
> Patrick
>
> On Tue, Jan 23, 2018 at 6:42 AM, Alexander Amelkin <a.amelkin@yadro.com> wrote:
>> Lei,
>>
>> I'm quite new to openbmc and do not yet fully understand its internal
>> mechanics, but from my previous experience with other BMC software and
>> hardware, I can say that every fan has it's own characteristics that include
>> the minimum and maximum RPM it is able to react to and some not necessarily
>> linear function between those points.
>>
>> As far as I remember, AST2500 is able to detect quite any RPM, no matter how
>> low it is.
>> However, some fans just stop if PWM falls below some threshold and rotate at
>> max RPM beyond some max PWM which may be quite less than from 100% (255).
>> I've seen Delta's fans that take about 70% PWM as a maximum and fully stop
>> below like 20%.
>>
>> Hence, assuming a single linear slope from 0% to 100% pwm is a bad idea.
>>
>> Thus, IMO, the yaml file should define a piecewise linear function, and
>> maybe jitter level to allow for RPM deviations.
>> I would also add a delay after detection of a changed pwm before rpm is
>> checked to allow for acceleration/deceleration. From my experience large
>> fans (like 100mm) may take up to 4 seconds to reach max rpm from full stop
>> condition. This should be taken in account to avoid false alarms.
>>
>> Alexander Amelkin,
>> Leading BMC Firmware Engineer
>> YADRO
>>
>>
>> 23.01.2018 12:37, Lei YU wrote:
>>>
>>> phospohr-fan-monitor compares fan speed with target and determine if the
>>> fan
>>> is functional:
>>>
>>> https://github.com/openbmc/phosphor-fan-presence/blob/master/monitor/fan.cpp#L182-L185
>>>
>>> However, for systems using pwm as target, the logic does not work, because
>>> the
>>> fan speed is RPM but the target the PWM.
>>>
>>> So we probably need to have a conversion from PWM target to fan speed RPM.
>>>
>>> On Romulus, the observation is:
>>>
>>> | PWM | RPM  |
>>> | --- | ---- |
>>> | 64  | 3000 |
>>> | 96  | 3700 |
>>> | 128 | 4300 |
>>> | 160 | 4900 |
>>> | 192 | 5600 |
>>> | 224 | 6300 |
>>> | 255 | 7000 |
>>>
>>> And the linear fit becomes [RPM = 20.7147 * PWM + 1660.04][1]
>>>
>>> So how do we make fan-monitor to support this?
>>>
>>> My proposal is to define the parameters, e.g. slope, intercept in the
>>> config
>>> yaml, and add this support in phosphor-fan-monitor.
>>> E.g.
>>>      sensors:
>>>        - name: fan0
>>>          has_target: true
>>>          slope: 21
>>> intercept: 1600
>>>
>>> If the yaml config does not define slope/intercept, then the default value
>>> is set to 1 and 0 which matches the fan speed target.
>>>
>>> My question (and concern) is, the fan RPM can not be queried correctly
>>> when
>>> PWM is set to a low value, e.g. 32, and it means the fit function may not
>>> be
>>> linear fit.
>>>
>>> What do you think?
>>>
>>> [1]:
>>> http://m.wolframalpha.com/input/?i=linear+fit+%7B64%2C+3000%7D%2C%7B96%2C+3700%7D%2C%7B128%2C+4300%7D%2C%7B160%2C+4900%7D%2C%7B192%2C+5600%7D%2C%7B224%2C6300%7D%2C%7B255%2C7000%7D
>>
>>
