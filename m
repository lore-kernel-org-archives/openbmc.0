Return-Path: <mine260309@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::22b; helo=mail-io0-x22b.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QDs2pKw5"; 
 dkim-atps=neutral
Received: from mail-io0-x22b.google.com (mail-io0-x22b.google.com
 [IPv6:2607:f8b0:4001:c06::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z2GDR2RKjzF07P
 for <openbmc@lists.ozlabs.org>; Thu, 21 Dec 2017 13:43:50 +1100 (AEDT)
Received: by mail-io0-x22b.google.com with SMTP id e204so19447083iof.12
 for <openbmc@lists.ozlabs.org>; Wed, 20 Dec 2017 18:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=kUXgAGJ7EStHRiXjPvn1HqlyvZkIC9iVdUEJfTAaAGA=;
 b=QDs2pKw5jk8KOUyqDVNL9wlN39aADK2+hcCdciGkxTU1zO8ZhWMxsqWfMRD0xi0dNN
 QpZf9Zo+uQwJJCFxo4/ZaWHb7hnjUxVPk3dKvfzRGZ7DY9y2zAhUIH6XuJuuJr4fiDh5
 LkwjQe3ihfRprUP/q5vaJmp8aN3yOo2t7GQTW+vwlAGdiwZWNlzk7NOFdvzOZJgWOnJE
 s24xffVOWLOlbpuHJKbZS0rsmZ8h/8+yZaSxOlFXHLSQGDR7mnFcDO9+YUBdYsY7q+kA
 VmxdVa3o74GnuluLMaJHKqICGVaF0Pik7R54JEanqOpl9YGF9jNzxILvYm8tld8xEFF0
 FG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=kUXgAGJ7EStHRiXjPvn1HqlyvZkIC9iVdUEJfTAaAGA=;
 b=jVDmzbm3/UoegXKnHKtHqWaI3VnSbR817yNA6+vFzZVwfxKmbuW3qij3vfc7jGbAYM
 z/7cfGaUx4kRUDpamo6Zz9EEp7eaMrSdrMI17/ayvHv/kv3GiFdce6Y0VN+lETxFgGJp
 RNYghppN3viqf9nHLYTwod9K8+U1c8o9dwVKIGZjk3+XhLoGiuPx8JjcgX6AQKsWqgSs
 eA9hNhlyd9Lvdjk+nfDDzoKA/CIsvnkSyT1AV7JlJVDWP8IaHoDd0rg39nQOlWf4b+hh
 qRRkreePwoOxK2PMfUrU27DZxvQXx7ZpDI/X61OduOx34s/PjaA73mwkgOV/THQjQ8ua
 4gQg==
X-Gm-Message-State: AKGB3mKewTULIhkEMcrtCrCFtYaorW5ZWzbl7PT9lR6gmfz010IN0eD8
 IbZPjQPD/cyYF57Eyyv0oRS2TilssBcUgy20FvY=
X-Google-Smtp-Source: ACJfBosOF55lSxpxVQ8bppZ/6885af1w8KgMRBquooylflHwkT97PPnH8M8Lm4pUI3txVzT4S8cCEO3cNj1DzEK32Us=
X-Received: by 10.107.70.8 with SMTP id t8mr10996863ioa.207.1513824228294;
 Wed, 20 Dec 2017 18:43:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.228.137 with HTTP; Wed, 20 Dec 2017 18:43:47 -0800 (PST)
In-Reply-To: <CAO=notxQksVEAF6_G7UGxM53Hby71q7xGZXqSXFAYQGs-gmhQQ@mail.gmail.com>
References: <CAARXrtmgZs6yAUd4pqBa1ZOoyYqe-8CuTe24cRk1mcROd0=WDQ@mail.gmail.com>
 <CAO=notxQksVEAF6_G7UGxM53Hby71q7xGZXqSXFAYQGs-gmhQQ@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Thu, 21 Dec 2017 10:43:47 +0800
Message-ID: <CAARXrtnyGwhmphWMLoXg03SuQFH9Jtxig3EC7h2E7X6U5YBpnw@mail.gmail.com>
Subject: Re: RFC: Support pwm in phosphor-hwmon as fan target
To: Patrick Venture <venture@google.com>
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
X-List-Received-Date: Thu, 21 Dec 2017 02:43:52 -0000

On Wed, Dec 20, 2017 at 11:49 PM, Patrick Venture <venture@google.com> wrote:
> On Wed, Dec 20, 2017 at 6:09 AM, Lei YU <mine260309@gmail.com> wrote:
>> The current phosphor-hwmon uses fanX_target for fan speed control. It expects
>> the fan driver to have `fanX_target` sysfs attribute, e.g. Witherspoon's
>> max31875 driver.
>> For the fans with `fanX_target`, phosphor-hwmon creates "Target" property on
>> the fan sensor Dbus object;
>> Then phosphor-fan-presence/control sets the "Target" property to do the
>> thermal control.
>>
>> Other systems like Romulus do not have this attribute, and it uses `pwmX` to
>> control the fan speed instead. This is not supported in phosphor-hwmon yet.
>>
>> To support such case, the proposal is to let phosphor-hwmon to create "Target"
>> property for the fans controlled by pwmX as well, via hwmon config file.
>>
>> E.g. for Romulus, fan9, fan11, fan13 are used, where fan9 and fan13 are
>> controlled by pwm1, and fan11 is controlled by pwm2, then the config looks
>> like:
>> ```
>> TARGET_fan9 = "pwm1"
>> TARGET_fan11 = "pwm2"
>> ```
>
> So we have a similar situation however, added a new interface to the
> sensor.value for FanPwm control, and then just add that target, but we
> were doing name matching identically to the fanspeed targets --
> instead of a configuration file setting up the matches.  However, it's
> a pretty trivial difference and easy to implement! :D  So, I like
> this.

Thanks for the comments!
I saw the FanPwm interface, adding a new interface for FanPwm is reasonable,
however, the current phosphor-fan-presence/control uses the interface
"xyz.openbmc_project.Control.FanSpeed" already.
If we have this new FanPwm interface, that part of code needs to be
updated as well.
Also I am not sure what happens if (in case) some fan object implements both
"FanSpeed" and "FanPwm" interface?

>
>>
>> * When phosphor-hwmon sees TARGET_fanX, it creates "Target" property for this
>> fan, and use the related pwmX to control the fan speed;
>> * For the fan control yaml configs, define the relted fan zone and control
>> logic, where the fan
>> * phosphor-fan-presence/control uses the same "Target" property to set the
>> fan speed target, only that the value is range from 0~255.
>>
>> The phosphor-hwmon changes are submitted at
>> https://gerrit.openbmc-project.xyz/#/c/8353/
>
> I reviewed your changes, and I'd actually like to merge our downstream
> patch and yours -- since I think the better way is to not overload
> fanspeed as something that can receive RPM or PWM, but rather have the
> different interfaces.  This is an important change because then you're
> not trying to interpret the value, or if someone wanted to add
> fanspeed and control via some other mechanism, they could - - warning,
> i haven't had caffeine yet so that might just be rambling.
>

Looking forward to your patches.
I wonder how do you config which fan to implement which FanPwm?

>>
>> Thanks
>>
>> --
>> BRs,
>> Lei YU
>
> I'm going to submit a couple patches that enable fanpwm partially to
> show another approach that I think should be merged with this
> approach. :D
