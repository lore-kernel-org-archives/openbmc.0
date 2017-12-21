Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::22b; helo=mail-ua0-x22b.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="VMyUUOCo"; 
 dkim-atps=neutral
Received: from mail-ua0-x22b.google.com (mail-ua0-x22b.google.com
 [IPv6:2607:f8b0:400c:c08::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z2fk16Fs1zF0B8
 for <openbmc@lists.ozlabs.org>; Fri, 22 Dec 2017 05:07:20 +1100 (AEDT)
Received: by mail-ua0-x22b.google.com with SMTP id g16so3388222uak.2
 for <openbmc@lists.ozlabs.org>; Thu, 21 Dec 2017 10:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=S0tQGFRjR07GKZ7PakSu6CVJDSqDe9MCIdru4qeJIG0=;
 b=VMyUUOCoayprcg/TqlxsxkyiJ8AEE/c4fVyD07L7Rodb3VkIpQR4BJ/zQzNWAJNg3N
 h8rR3niSvGCySy1cqngLtm9/cDDEZtaRXXO8K1EyEfunPIyl0PkVDbGrhKoUnnQUApAD
 eMLESGVasOO4Dq7ThZS6MtzE2e+dHbRR9UUHHg5/q3wmQfehNMcz4VMdA0A5m+M+Bo26
 b35115Wh/0jCV8eqrzIFG00aoz0lHaIv5nkvdcZQNYNjBzn+3e5BBplU+CnSqKxp6KQ3
 Dj/cMM0R/A3BRUQLz72SkiA5+BX/c7Cz6+7BuNyI1joDBmq3GIiLNgFffALzm0tykLgK
 dX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=S0tQGFRjR07GKZ7PakSu6CVJDSqDe9MCIdru4qeJIG0=;
 b=WNg2YrGzjjakp8V/mH5+fzAeIW6IaQ/UkD1meg/FA5uV4BBsh2ailc64rNPTt/B93x
 w70sthpvHQGUkP21oGdlvmTAyApTnB7d22ON/ipCUAFQF93oLJPTdpneOEYMdjFZ1ulM
 q8O3TFHGIZhESp+4Hbr4pVDoN/m0ut0VQ0ArBzdgf0OEaYYghKcS8/waDvOcGKr3AtK/
 GmwW+S7D3UupuWtVBHrECZ60apJosA1Jipvnu2OJyEE1dv+DwEStUK2M6m+M6dhvQkhH
 ME3EOflxuNFNuFwfrXOVIMP327RE/wZizCQHkiq494NVxpN8BEkGGLIRb0+kX+J6pclW
 9Y1A==
X-Gm-Message-State: AKGB3mL6jU8G2YbpgCRyyDeeIsudVxO1uIL8LJ5N1RJEia67GkvVyXjV
 684d6l1TE7YvgSVPVO5tvWq6v/UCBnKs+N2Zcj1Qkg==
X-Google-Smtp-Source: ACJfBovdGI8IY+NM1tjlJJgbdsQejxYF3bKeVGPoUCprfCSWl4ghCpKWrtjl61IYZ4bPQ5DW4qaRpqXHUkfwU1nBV30=
X-Received: by 10.176.23.24 with SMTP id j24mr10989352uaf.105.1513879636272;
 Thu, 21 Dec 2017 10:07:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.164.82 with HTTP; Thu, 21 Dec 2017 10:06:55 -0800 (PST)
In-Reply-To: <CAARXrtnyGwhmphWMLoXg03SuQFH9Jtxig3EC7h2E7X6U5YBpnw@mail.gmail.com>
References: <CAARXrtmgZs6yAUd4pqBa1ZOoyYqe-8CuTe24cRk1mcROd0=WDQ@mail.gmail.com>
 <CAO=notxQksVEAF6_G7UGxM53Hby71q7xGZXqSXFAYQGs-gmhQQ@mail.gmail.com>
 <CAARXrtnyGwhmphWMLoXg03SuQFH9Jtxig3EC7h2E7X6U5YBpnw@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 21 Dec 2017 10:06:55 -0800
Message-ID: <CAO=notxpV2jetJ2vK+TVt1PdNEyWKExXDEZaWMppAMAu6Tc+JA@mail.gmail.com>
Subject: Re: RFC: Support pwm in phosphor-hwmon as fan target
To: Lei YU <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, 
 Brad Bishop <bradleyb@fuzziesquirrel.com>, msbarth@us.ibm.com
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Dec 2017 18:07:22 -0000

On Wed, Dec 20, 2017 at 6:43 PM, Lei YU <mine260309@gmail.com> wrote:
> On Wed, Dec 20, 2017 at 11:49 PM, Patrick Venture <venture@google.com> wrote:
>> On Wed, Dec 20, 2017 at 6:09 AM, Lei YU <mine260309@gmail.com> wrote:
>>> The current phosphor-hwmon uses fanX_target for fan speed control. It expects
>>> the fan driver to have `fanX_target` sysfs attribute, e.g. Witherspoon's
>>> max31875 driver.
>>> For the fans with `fanX_target`, phosphor-hwmon creates "Target" property on
>>> the fan sensor Dbus object;
>>> Then phosphor-fan-presence/control sets the "Target" property to do the
>>> thermal control.
>>>
>>> Other systems like Romulus do not have this attribute, and it uses `pwmX` to
>>> control the fan speed instead. This is not supported in phosphor-hwmon yet.
>>>
>>> To support such case, the proposal is to let phosphor-hwmon to create "Target"
>>> property for the fans controlled by pwmX as well, via hwmon config file.
>>>
>>> E.g. for Romulus, fan9, fan11, fan13 are used, where fan9 and fan13 are
>>> controlled by pwm1, and fan11 is controlled by pwm2, then the config looks
>>> like:
>>> ```
>>> TARGET_fan9 = "pwm1"
>>> TARGET_fan11 = "pwm2"
>>> ```
>>
>> So we have a similar situation however, added a new interface to the
>> sensor.value for FanPwm control, and then just add that target, but we
>> were doing name matching identically to the fanspeed targets --
>> instead of a configuration file setting up the matches.  However, it's
>> a pretty trivial difference and easy to implement! :D  So, I like
>> this.
>
> Thanks for the comments!
> I saw the FanPwm interface, adding a new interface for FanPwm is reasonable,
> however, the current phosphor-fan-presence/control uses the interface
> "xyz.openbmc_project.Control.FanSpeed" already.
> If we have this new FanPwm interface, that part of code needs to be
> updated as well.

I haven't looked at the control code for that in a while, but
presumably it's output is a value of either RPM or PWM -- which could
be something determined by what dbus interface is available.

> Also I am not sure what happens if (in case) some fan object implements both
> "FanSpeed" and "FanPwm" interface?

In that case, you end up with two control interfaces for the fan.
Which is fine in terms of dbus and support.

>
>>
>>>
>>> * When phosphor-hwmon sees TARGET_fanX, it creates "Target" property for this
>>> fan, and use the related pwmX to control the fan speed;
>>> * For the fan control yaml configs, define the relted fan zone and control
>>> logic, where the fan
>>> * phosphor-fan-presence/control uses the same "Target" property to set the
>>> fan speed target, only that the value is range from 0~255.
>>>
>>> The phosphor-hwmon changes are submitted at
>>> https://gerrit.openbmc-project.xyz/#/c/8353/
>>
>> I reviewed your changes, and I'd actually like to merge our downstream
>> patch and yours -- since I think the better way is to not overload
>> fanspeed as something that can receive RPM or PWM, but rather have the
>> different interfaces.  This is an important change because then you're
>> not trying to interpret the value, or if someone wanted to add
>> fanspeed and control via some other mechanism, they could - - warning,
>> i haven't had caffeine yet so that might just be rambling.
>>
>
> Looking forward to your patches.
> I wonder how do you config which fan to implement which FanPwm?

So we've been lucky, where we just do it the same way the RPM target
works, where it's matched by number.  However, that's why I want to
merge our patches because I like your approach for matching them.

>
>>>
>>> Thanks
>>>
>>> --
>>> BRs,
>>> Lei YU
>>
>> I'm going to submit a couple patches that enable fanpwm partially to
>> show another approach that I think should be merged with this
>> approach. :D
