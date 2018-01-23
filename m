Return-Path: <mine260309@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::229; helo=mail-it0-x229.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="sgnkfj7U"; 
 dkim-atps=neutral
Received: from mail-it0-x229.google.com (mail-it0-x229.google.com
 [IPv6:2607:f8b0:4001:c0b::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zQjrj5xmVzDrH2
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jan 2018 20:37:41 +1100 (AEDT)
Received: by mail-it0-x229.google.com with SMTP id e1so289000ita.0
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jan 2018 01:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=dSXOOPU+HUGbKvaVUUDKtC9BbMVM1Ox1rtgV0ioAsLM=;
 b=sgnkfj7U4zvQbKCYWKu6pnzFa+6gWqD08jXKIcb/jFUUHEyEim2cNBo4YEjo44pFxz
 BsxCe2J4Vw38uDUW7TWCvIcA3HicGAHYzAx4u6OdXXrJH6Iuzmb8afMPslMFXyyO8hi0
 43xJiNtJzkyGxGOo0n8PQ1/IbKtREWL8e3U7rkpOgBSBJw6itj37u8yLB6s3VoQFOoVQ
 Xc4uiDMg67a7Hls6CIhcV0hMW/bqtqzrd/Ir6Gk01EaHzuqYxecR7vZfO0wP4FORD7nP
 SyYUbD97rjTrgucMflJq8uOwIIQ+9mzkPnQ34G6EVwt8ruxD5tTR3R75Pb7jb7M9KWny
 nrVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=dSXOOPU+HUGbKvaVUUDKtC9BbMVM1Ox1rtgV0ioAsLM=;
 b=OSmcQzaVewmir0pwd6mWtF6L/d8JgoI3w8idddkYbMYk6eSDiz9/yZJpF/3tgIKeq+
 3J/lLe0Jfr+Ft1VaCDJODnp+pNnz4v3jtVS4w4jXjwhiTyP3SFTccLdSW80dqDdISwSL
 T5jiu/SMuxKGPT1Mf9Nr1evZ8MSCM258+aPK60DDeeqCLVI4sUfTNJEbW4a7JTn8nunL
 xvR3mi35r704t1fYdWH2rA0yhWR0E08bEC5VRgYKfAhwWBorE/PJyYOk6FjMc8MNIdPz
 N3olWUecPakqKjq+SyKEkRr8idWHTw158NSkYJlxmWZ6uHkHI2rBXRhnr1ZqrKfE3nZB
 O19w==
X-Gm-Message-State: AKwxytcRA1RQP8zLCu5rEtzjaeFgbk+bOmUQ38ShIbuVFGogTczqMVrQ
 r4tvbcxHQIEJGPcOjD/Ocz5O6nc1Qbe9ZYM5vX/JU8FT
X-Google-Smtp-Source: AH8x2271ORvjB66iPcqbbU/bGPFMxptL1QbY5MG+MqKTvkyOAyVI/TXdzh7nqC7G6P4uhkiPdkoGmU71hzTXGOfE2iQ=
X-Received: by 10.36.228.79 with SMTP id o76mr2827032ith.85.1516700258847;
 Tue, 23 Jan 2018 01:37:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.159.68 with HTTP; Tue, 23 Jan 2018 01:37:38 -0800 (PST)
From: Lei YU <mine260309@gmail.com>
Date: Tue, 23 Jan 2018 17:37:38 +0800
Message-ID: <CAARXrtm-yxJ4cVi_RjMUZVbNT9aSKqp5dPzeanW+kMb=JugW+w@mail.gmail.com>
Subject: RFC: calculating RPM from PWM for fan monitor
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 23 Jan 2018 09:37:42 -0000

phospohr-fan-monitor compares fan speed with target and determine if the fan
is functional:
https://github.com/openbmc/phosphor-fan-presence/blob/master/monitor/fan.cpp#L182-L185

However, for systems using pwm as target, the logic does not work, because the
fan speed is RPM but the target the PWM.

So we probably need to have a conversion from PWM target to fan speed RPM.

On Romulus, the observation is:

| PWM | RPM  |
| --- | ---- |
| 64  | 3000 |
| 96  | 3700 |
| 128 | 4300 |
| 160 | 4900 |
| 192 | 5600 |
| 224 | 6300 |
| 255 | 7000 |

And the linear fit becomes [RPM = 20.7147 * PWM + 1660.04][1]

So how do we make fan-monitor to support this?

My proposal is to define the parameters, e.g. slope, intercept in the config
yaml, and add this support in phosphor-fan-monitor.
E.g.
    sensors:
      - name: fan0
        has_target: true
        slope: 21
intercept: 1600

If the yaml config does not define slope/intercept, then the default value
is set to 1 and 0 which matches the fan speed target.

My question (and concern) is, the fan RPM can not be queried correctly when
PWM is set to a low value, e.g. 32, and it means the fit function may not be
linear fit.

What do you think?

[1]: http://m.wolframalpha.com/input/?i=linear+fit+%7B64%2C+3000%7D%2C%7B96%2C+3700%7D%2C%7B128%2C+4300%7D%2C%7B160%2C+4900%7D%2C%7B192%2C+5600%7D%2C%7B224%2C6300%7D%2C%7B255%2C7000%7D
