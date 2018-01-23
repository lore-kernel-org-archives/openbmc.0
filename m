Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::22f; helo=mail-vk0-x22f.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ulCXBOLp"; 
 dkim-atps=neutral
Received: from mail-vk0-x22f.google.com (mail-vk0-x22f.google.com
 [IPv6:2607:f8b0:400c:c05::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zQyNt2QQZzDr05
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jan 2018 06:02:53 +1100 (AEDT)
Received: by mail-vk0-x22f.google.com with SMTP id j204so957109vke.12
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jan 2018 11:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=c0BYS5OBgLj7793s4bmE5Ny8gGNCZ9p84yjRHm9wnCk=;
 b=ulCXBOLp46faoDV3/ao2F9FBHTzP1padfQ2WCrPF+c52eH0Zd5itSuOiv8Jpy5QH3E
 hUnbLwyeQBkcitwLBjVnDw/wYAlLTVT3Sknabg313jNsR/25dW/yOg98Lb46QBZXzZPA
 R5JnxHnXCWLcNTkcXztroCq31SkiJYFYP9mbeY7EQA9cyZSiuw5wEQJQwmkboSI6rRfl
 hfyYTkyqFHQCyg2tZWzZr8REa8Ya1c5bp+rbJHJvHEh40s4YDQd56A4SBt9y26PrxBAh
 wXgn3AedX+vw9gXfcFXq8XZ9xrrdl49+r8lnH5rR2b02IRqurR2TebVMICLmDxkit3zu
 vr3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=c0BYS5OBgLj7793s4bmE5Ny8gGNCZ9p84yjRHm9wnCk=;
 b=noqleLEiTyhNbXIAOHDm7wW5WO2EabyElbGy1llNbXCCpip7aeEpR9uEWSOpJAH2Ka
 84aBBoGgWQ5lzv7iA9/phXLMsg/yfRxsBZiFQpno06yTcjrWRpivx8QPSRDMKdXJloFt
 2wq24M2Q9icjTDGJJRILBhM8AOnIfuz+ERYTyBbiL1id4T+Dhn3R3h4xOgbWTEtbbdey
 gWg2YKlOMObd+AymeZOZm7ROfab5nd+HbVtHRbfk5AZGGx23cmj4VkLGi7X5zo55ULGM
 mJg5/DZZyZPLnMD5uAKIxG7l0etvWfiCWFMoITtpgjvULYq1pAhGexMorowtX5PeEwTJ
 XC0g==
X-Gm-Message-State: AKwxytc/FySV+qsZhCMZy3WxoXvuLKSgMsEsnG9UwoWynRiueMMKch9U
 OAZbTWpyrgxuLGv1sd5zTF7O0BYWJP/X9ZzXpp1V5A==
X-Google-Smtp-Source: AH8x226KovQSOZXQYG3KbE46obs2/um7K+DHWAc0BcOQ7jAxQdOaXBT52Lx1XK3UIwIkOCoPeirYY00nwJmlQIqB6bw=
X-Received: by 10.31.3.226 with SMTP id f95mr2257363vki.146.1516734169517;
 Tue, 23 Jan 2018 11:02:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.167.207 with HTTP; Tue, 23 Jan 2018 11:02:29 -0800 (PST)
In-Reply-To: <1953058b-4268-602d-cc68-00eae50b1f4f@yadro.com>
References: <CAARXrtm-yxJ4cVi_RjMUZVbNT9aSKqp5dPzeanW+kMb=JugW+w@mail.gmail.com>
 <1953058b-4268-602d-cc68-00eae50b1f4f@yadro.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 23 Jan 2018 11:02:29 -0800
Message-ID: <CAO=notwjPRBjP0A=YOX1Ht06-rdUp7RhcBphuQ1Hg47vRQkG0w@mail.gmail.com>
Subject: Re: RFC: calculating RPM from PWM for fan monitor
To: Alexander Amelkin <a.amelkin@yadro.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 23 Jan 2018 19:02:55 -0000

To reach a desired RPM, via PWM, we use a PID+FF algorithm that tries
to reduce the error between the current fan RPM and the set-point RPM
for the fan.  This is in our presently internal implementation of the
fan control for openbmc.  We're still working out how to open
source/upstream it, when there'll now be multiple implementations of
fan controls, etc.

Patrick

On Tue, Jan 23, 2018 at 6:42 AM, Alexander Amelkin <a.amelkin@yadro.com> wrote:
> Lei,
>
> I'm quite new to openbmc and do not yet fully understand its internal
> mechanics, but from my previous experience with other BMC software and
> hardware, I can say that every fan has it's own characteristics that include
> the minimum and maximum RPM it is able to react to and some not necessarily
> linear function between those points.
>
> As far as I remember, AST2500 is able to detect quite any RPM, no matter how
> low it is.
> However, some fans just stop if PWM falls below some threshold and rotate at
> max RPM beyond some max PWM which may be quite less than from 100% (255).
> I've seen Delta's fans that take about 70% PWM as a maximum and fully stop
> below like 20%.
>
> Hence, assuming a single linear slope from 0% to 100% pwm is a bad idea.
>
> Thus, IMO, the yaml file should define a piecewise linear function, and
> maybe jitter level to allow for RPM deviations.
> I would also add a delay after detection of a changed pwm before rpm is
> checked to allow for acceleration/deceleration. From my experience large
> fans (like 100mm) may take up to 4 seconds to reach max rpm from full stop
> condition. This should be taken in account to avoid false alarms.
>
> Alexander Amelkin,
> Leading BMC Firmware Engineer
> YADRO
>
>
> 23.01.2018 12:37, Lei YU wrote:
>>
>> phospohr-fan-monitor compares fan speed with target and determine if the
>> fan
>> is functional:
>>
>> https://github.com/openbmc/phosphor-fan-presence/blob/master/monitor/fan.cpp#L182-L185
>>
>> However, for systems using pwm as target, the logic does not work, because
>> the
>> fan speed is RPM but the target the PWM.
>>
>> So we probably need to have a conversion from PWM target to fan speed RPM.
>>
>> On Romulus, the observation is:
>>
>> | PWM | RPM  |
>> | --- | ---- |
>> | 64  | 3000 |
>> | 96  | 3700 |
>> | 128 | 4300 |
>> | 160 | 4900 |
>> | 192 | 5600 |
>> | 224 | 6300 |
>> | 255 | 7000 |
>>
>> And the linear fit becomes [RPM = 20.7147 * PWM + 1660.04][1]
>>
>> So how do we make fan-monitor to support this?
>>
>> My proposal is to define the parameters, e.g. slope, intercept in the
>> config
>> yaml, and add this support in phosphor-fan-monitor.
>> E.g.
>>      sensors:
>>        - name: fan0
>>          has_target: true
>>          slope: 21
>> intercept: 1600
>>
>> If the yaml config does not define slope/intercept, then the default value
>> is set to 1 and 0 which matches the fan speed target.
>>
>> My question (and concern) is, the fan RPM can not be queried correctly
>> when
>> PWM is set to a low value, e.g. 32, and it means the fit function may not
>> be
>> linear fit.
>>
>> What do you think?
>>
>> [1]:
>> http://m.wolframalpha.com/input/?i=linear+fit+%7B64%2C+3000%7D%2C%7B96%2C+3700%7D%2C%7B128%2C+4300%7D%2C%7B160%2C+4900%7D%2C%7B192%2C+5600%7D%2C%7B224%2C6300%7D%2C%7B255%2C7000%7D
>
>
