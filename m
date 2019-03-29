Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="LUFzVUKr"; 
 dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44W59F1QCwzDqZF
 for <openbmc@lists.ozlabs.org>; Sat, 30 Mar 2019 02:23:28 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id b11so1186727plr.7
 for <openbmc@lists.ozlabs.org>; Fri, 29 Mar 2019 08:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LcAzDzz4L8mEYar44BauySW9byaHz7yXmnZChJ86UVI=;
 b=LUFzVUKr5kgpsRBbU0K3QeG1Wt6Vncbj3NqNjorDBzUQNYxn7+Os+8ztaAPabTCKER
 Qy/xFCrgabGXk7N36OqaZ7tK+PpgOIEIg3kQEx+aRfydc7C2nG0iQwY8rDl8MhWql0Ks
 7q7ZeIZTgwndVafBCT6v0TtEimWOIF3+xEFPGtDd6F1VyPfJBplfLgvkGsW/dULQ0YQv
 he5qfEhC7e8eNXDUoSsoWynU6HN/Cu23chvyqz2H/BXbSawnV0o+5yEdnknk7BowlleB
 reQNgwwXBU3fQBFdLkqxLooZKLzu1hmUr5V1PiuVJCUxqhffKuNLsAOZsFpDTEfK0FMZ
 M0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LcAzDzz4L8mEYar44BauySW9byaHz7yXmnZChJ86UVI=;
 b=VTUwlbGpvyA+kjS/ey2DSG+pVCk+SBeAmcfdsucVPnqJdadYUfC7GHK4cjiV0QvuBN
 deWj6DGXkC44AMFTuFZSerzCih9coEq0gu497b0rlkdoUhkw8Alg37UI852ugwOpv/7o
 kaSd8uZnHx8tOxzt8FRZDva/W5Soz2C6HzppPFnn/Z9KTRI1QlZW4n200IL9xFylxedo
 AJhdaiN0vMsBpcQp0XxwtMbpndeJJsRQUFeeud2bE7bpiMGdLvE/HoXvyginK+kERrQp
 X6SkWIOM7yiEhS1LQg7kPtsG4glgPTNg+x41lM/GlwXbRuguJ95vIs0ZhIQd7HUeT2eE
 NmUg==
X-Gm-Message-State: APjAAAVc7hcl3LnLIIUNEzhCQiZb7x+Q9NASoZjlNVLVsY2I/w57rRtI
 sexKt9zgZurH2L6wik9yIWJ09uhLnnXLn9RF9f4rb2kYW4c=
X-Google-Smtp-Source: APXvYqyZglUQaq34cL5Qa2RiQXKMjSNTvlimyCe+K5xtWfTKw6LTTMzO62Z94un6+OJMregdv8/9X4YKk/HnRZU0MsY=
X-Received: by 2002:a17:902:e701:: with SMTP id
 co1mr49748730plb.61.1553873005685; 
 Fri, 29 Mar 2019 08:23:25 -0700 (PDT)
MIME-Version: 1.0
References: <1f94cb30fe624740b2ad67438b643266@quantatw.com>
 <CAO=notwyQLfY2tEMfydPD9Ku7+e3GJuPguAro0rr_xMJcAmm7g@mail.gmail.com>
 <c2d3e4dee25a4c76803c6fec8b99dce4@quantatw.com>
In-Reply-To: <c2d3e4dee25a4c76803c6fec8b99dce4@quantatw.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 29 Mar 2019 08:23:14 -0700
Message-ID: <CAO=notzxT+p-zJYP0CvwehEL25exNQuxTEAsAB8t-jm2-A8R3w@mail.gmail.com>
Subject: Re: [phosphor-pid-control] scaling issue
To: =?UTF-8?B?SGFuayBMaW91ICjlionmmYnnv7Ap?= <Hank.Liou@quantatw.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
 =?UTF-8?B?RnJhbiBIc3UgKOW+kOiqjOismSk=?= <Fran.Hsu@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Mar 2019 15:23:30 -0000

On Thu, Mar 28, 2019 at 7:17 PM Hank Liou (=E5=8A=89=E6=99=89=E7=BF=B0) <Ha=
nk.Liou@quantatw.com> wrote:
>
> Hi Patrick,
>
>
> {
>     "sensors" : [
>         {
>             "name": "fan1",
>             "type": "fan",
>             "readPath": "/xyz/openbmc_project/sensors/fan_tach/fan1",
>             "writePath": "/sys/devices/platform/ahb/ahb:apb/1e786000.pwm-=
tacho-controller/hwmon/**/pwm1",
>             "min": 0,
>             "max": 255
>         },
>         {
>             "name": "temp1",
>             "type": "temp",
>             "readPath": "/xyz/openbmc_project/sensors/temperature/temp1",
>             "writePath": "",
>             "min": 0,
>             "max": 0
>         }
>     ],
>     "zones" : [
>         {
>             "id": 1,
>             "minThermalOutput": 3000.0,
^--- the minimum thermal output is higher than the maximum output for
the temperature PID loop.
>             "failsafePercent": 75.0,
>             "pids": [
>                 {
>                     "name": "fan1",
>                     "type": "fan",
>                     "inputs": ["fan1"],
>                     "setpoint": 90.0,
>                     "pid": {
>                         "samplePeriod": 0.1,
>                         "proportionalCoeff": -1.0,
>                         "integralCoeff": -0.2,

^--- you're setting the integral and proportional and the feedfwd.
feedfwd works separately if I understand PID loops properly

>                         "feedFwdOffsetCoeff": 0.0,
>                         "feedFwdGainCoeff": 0.010,
>                         "integralLimit_min": 0.0,
>                         "integralLimit_max": 0.0,
>                         "outLim_min": 30.0,
^--- this is setting the minimum to 30%
>                         "outLim_max": 100.0,
^--- this is setting the maximum to 30%
>                         "slewNeg": 0.0,
>                         "slewPos": 0.0
>                     }
>                 },
>                 {
>                     "name": "temp1",
>                     "type": "temp",
>                     "inputs": ["temp1"],
>                     "setpoint": 50.0,

^ --- this sets the goal temperature to be lower than or equal to 50.
50 of whatever temperature unit provided.  The value should be scaled
properly to be 50.000 by the code.

>                     "pid": {
>                         "samplePeriod": 0.1,
^-- so the mechanism for the PID loop only samples these at once per second
>                         "proportionalCoeff": -1.0,
>                         "integralCoeff": -0.2,
>                         "feedFwdOffsetCoeff": 0.0,
>                         "feedFwdGainCoeff": 0.010,
>                         "integralLimit_min": 0.0,
>                         "integralLimit_max": 0.0,
>                         "outLim_min": 500.0,
^--- this is setting the output minimum to 500rpm
>                         "outLim_max": 1500.0,
^--- this is setting the maximum to 1500rpm.
>                         "slewNeg": 0.0,
>                         "slewPos": 0.0
>                     }
>                 }
>             ]
>         }
>     ]
> }

I don't see any scaling issues given this configuration.  Because
you're not building from dbus configuration, but rather json.  Given
the numbers here, I would expect some wonky behavior -- however, that
just means we need more detailed documentation.

By the way, please don't top-post to email messages.  Inline replies
are easier to follow and the community standard.

>
> Sincerely,
>
>
> Hank Liou
>
>
> ________________________________
> From: Patrick Venture <venture@google.com>
> Sent: Thursday, March 28, 2019 10:33 PM
> To: Hank Liou (=E5=8A=89=E6=99=89=E7=BF=B0)
> Cc: openbmc@lists.ozlabs.org
> Subject: Re: [phosphor-pid-control] scaling issue
>
> On Thu, Mar 28, 2019 at 3:55 AM Hank Liou (=E5=8A=89=E6=99=89=E7=BF=B0) <=
Hank.Liou@quantatw.com> wrote:
> >
> > Hi All,
> >
> >
> > This issue is related to the repository phosphor-pid-control.
> >
> >
> > It is in commit dbuspassive: allow scaling that one added scaling mecha=
nism. However when it comes to pid.cpp, it may encounter scaling mismatch. =
That is to say, (in fan control stage) the pid takes the scaled values as i=
nputs, but it utilizes unscaled setpoints resulting wrong error terms. Or j=
ust change the setpoint value?
>
> Can you share your configuration?  That might simplify the conversation.
>
> >
> >
> > Thanks,
> >
> >
> > Hank Liou
> >
> > Quanta Computer Inc.
