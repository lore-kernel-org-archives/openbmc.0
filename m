Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::235; helo=mail-vk0-x235.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Ku8gcF3W"; 
 dkim-atps=neutral
Received: from mail-vk0-x235.google.com (mail-vk0-x235.google.com
 [IPv6:2607:f8b0:400c:c05::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z1zjS4L0lzF1d2
 for <openbmc@lists.ozlabs.org>; Thu, 21 Dec 2017 02:49:32 +1100 (AEDT)
Received: by mail-vk0-x235.google.com with SMTP id p144so2871969vke.11
 for <openbmc@lists.ozlabs.org>; Wed, 20 Dec 2017 07:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=XROiG1x0t3eLpBezpFG7fSFsrhWCqmEhdUyqFYHNXWk=;
 b=Ku8gcF3WJ1/YjWQK0WDh/VHShsGWiAOKSEddu2ou5zsGRlsveIjE9B1Iln+ZVZA3z8
 936AM7eNq5ZjoaRbhTEAvBL4FJh9AGt+oIQk6vxofo4rBHDhGK0cv681MJU2981afeTH
 RYuaR1rYQf0qbKWOd/rVXn0I1R+MdN6Off1o4ANpvowrgEofyrguexEdO7KlQwXZYzqZ
 Hf0GtSvfT8YqGsHgo2hJIiAt3swHXs2QhBhJ8U7tbkpgmlByMRkQ9Xc4Gn4ClJWaGBL5
 PeyXoiO47XDgUHDlpFLrKT0mjMR5jozW56N1dOuUMbK5hf7D+hV3e2q1ZRJJaf7kbWPZ
 2DhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=XROiG1x0t3eLpBezpFG7fSFsrhWCqmEhdUyqFYHNXWk=;
 b=sv2OAz9aiCzXwGbx8Wpr3jU8gH+5CzY98lskYPzc70dGb2A7pZIRArKqBcT9Qpz2sy
 +bF+gICvGcCE/43eIFaJ4uRYmAwA5+NMKl30QWwgU4gBIwb4cmpD95ba3+q7xjGXHv1T
 hWb9Jw+mxZQ2z/SLkx5UF/uc4v9M8s6DACSEx2GpwbnY3tfS2j+ycDdZCXuuDilroRQN
 wRwRkWtwZIPUc+87J8rhb0LwrU54/M7hnFhAX95qrrJSaRNWV69VIPcVNf6M4CUXjWe1
 YLFefhI0ddigulhvPKVrz+dElXBv50PliRTYyQV/C0c8E2gXPEcdxooOYJUuyKcOAQUS
 f6YQ==
X-Gm-Message-State: AKGB3mIQqd5zTrvidW2gc+Q7uOWhzje2MY/6JMvyfh0aurddnxvCoHO8
 FfjCSip06JvrVSIeNuD1nnyJdAMgXs44LN8Lak0pdA==
X-Google-Smtp-Source: ACJfBouX4awmN7whuAuWLJwJiTeIMADQzOgIQaXQvg48xOjhkllihiaYvRwSzzqpMexFvQC4e7WXEJR1FXqUPtFAmCQ=
X-Received: by 10.31.93.134 with SMTP id r128mr6877864vkb.143.1513784969485;
 Wed, 20 Dec 2017 07:49:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.164.82 with HTTP; Wed, 20 Dec 2017 07:49:08 -0800 (PST)
In-Reply-To: <CAARXrtmgZs6yAUd4pqBa1ZOoyYqe-8CuTe24cRk1mcROd0=WDQ@mail.gmail.com>
References: <CAARXrtmgZs6yAUd4pqBa1ZOoyYqe-8CuTe24cRk1mcROd0=WDQ@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 20 Dec 2017 07:49:08 -0800
Message-ID: <CAO=notxQksVEAF6_G7UGxM53Hby71q7xGZXqSXFAYQGs-gmhQQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 20 Dec 2017 15:49:33 -0000

On Wed, Dec 20, 2017 at 6:09 AM, Lei YU <mine260309@gmail.com> wrote:
> The current phosphor-hwmon uses fanX_target for fan speed control. It expects
> the fan driver to have `fanX_target` sysfs attribute, e.g. Witherspoon's
> max31875 driver.
> For the fans with `fanX_target`, phosphor-hwmon creates "Target" property on
> the fan sensor Dbus object;
> Then phosphor-fan-presence/control sets the "Target" property to do the
> thermal control.
>
> Other systems like Romulus do not have this attribute, and it uses `pwmX` to
> control the fan speed instead. This is not supported in phosphor-hwmon yet.
>
> To support such case, the proposal is to let phosphor-hwmon to create "Target"
> property for the fans controlled by pwmX as well, via hwmon config file.
>
> E.g. for Romulus, fan9, fan11, fan13 are used, where fan9 and fan13 are
> controlled by pwm1, and fan11 is controlled by pwm2, then the config looks
> like:
> ```
> TARGET_fan9 = "pwm1"
> TARGET_fan11 = "pwm2"
> ```

So we have a similar situation however, added a new interface to the
sensor.value for FanPwm control, and then just add that target, but we
were doing name matching identically to the fanspeed targets --
instead of a configuration file setting up the matches.  However, it's
a pretty trivial difference and easy to implement! :D  So, I like
this.

>
> * When phosphor-hwmon sees TARGET_fanX, it creates "Target" property for this
> fan, and use the related pwmX to control the fan speed;
> * For the fan control yaml configs, define the relted fan zone and control
> logic, where the fan
> * phosphor-fan-presence/control uses the same "Target" property to set the
> fan speed target, only that the value is range from 0~255.
>
> The phosphor-hwmon changes are submitted at
> https://gerrit.openbmc-project.xyz/#/c/8353/

I reviewed your changes, and I'd actually like to merge our downstream
patch and yours -- since I think the better way is to not overload
fanspeed as something that can receive RPM or PWM, but rather have the
different interfaces.  This is an important change because then you're
not trying to interpret the value, or if someone wanted to add
fanspeed and control via some other mechanism, they could - - warning,
i haven't had caffeine yet so that might just be rambling.

>
> Thanks
>
> --
> BRs,
> Lei YU

I'm going to submit a couple patches that enable fanpwm partially to
show another approach that I think should be merged with this
approach. :D
