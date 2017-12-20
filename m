Return-Path: <mine260309@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::233; helo=mail-it0-x233.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YcUIMS2g"; 
 dkim-atps=neutral
Received: from mail-it0-x233.google.com (mail-it0-x233.google.com
 [IPv6:2607:f8b0:4001:c0b::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z1xTr62S7zF08S
 for <openbmc@lists.ozlabs.org>; Thu, 21 Dec 2017 01:09:20 +1100 (AEDT)
Received: by mail-it0-x233.google.com with SMTP id 68so6965841ite.4
 for <openbmc@lists.ozlabs.org>; Wed, 20 Dec 2017 06:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=MXt9/BdTqeYKjwBvs6hS0IanWAIjuuV8M/ihv31YaLQ=;
 b=YcUIMS2gAgYxOKGGNAYGixQTu4FVwDdGIt78DGyLYtJT/JQerdPaWkTK8hAC/Dz9h/
 c08tFaKj5jjahfwS3qSpq0cLNK9CZcnJyBL4g4uDeZyGo0BuKRBb0Rol5S7C5YrfYVUK
 u45cHWI0Ml15VsXR2UBsqeBHeWpQXz9Zo8c6Q75MUJX+8RmZiNFWk9FVRFMts6F1eJkS
 yx9F5RXxTodyOyinDxSa7aArP/34QUY6vfOSQCvM2d4G8yb4uFx9+tiJxzTG3hGi95DS
 /ld2b/6dxJPCnh9QXSVoREB82vhZEDmbBJ8NSYWyykfZUKG5paAalCSX7bJ0tb3gcV5H
 UeBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=MXt9/BdTqeYKjwBvs6hS0IanWAIjuuV8M/ihv31YaLQ=;
 b=YM54Mb5iKuDmSZHQdejElD398iwRpuigBRZRKbMzdoAHm1f5XkDhqBLJiFA32afXIj
 M7oFB2wKfXfMtpbUv6vq8sDHoprxN80F115kh4wtmfdcwY5TNCrnjOZEIrgF3Yv/YAYq
 BxIatVi4mA5pR032byxz8OqxdITmeCjUQY6fGvqSvDYRpl4lqbWDgurSyEuMSS+JXCls
 SMIfGumfl5V5ylJnngIwNZG4M83Ad3NtzBFcF31hUaChANjJSIfdaF9F0mq8GAvpRBdu
 5jYDLGo45vTCLm9ovDaZVlP1LlFLMpBVMVb2TwCKQoME0mlHPWof2oCiG3U6u5qjmTqO
 A1Gg==
X-Gm-Message-State: AKGB3mKhAA3pX/ESVkXA54WnpGETX9LQORA8cBEiZ95YysBoTAvhPUDr
 QGMbsy8oxPDXzh8B5iNunJrSiB+9uGdsWXiioPqjsntX
X-Google-Smtp-Source: ACJfBotwIfktIavII8+PWtW/Rk/bhoecYRPLVaXNLzmkrTGD3uQbOnSoMY+sXMpPkBLJTtF3Xgc1NhxIADiDG1WzgLk=
X-Received: by 10.36.17.15 with SMTP id 15mr8251685itf.53.1513778957484; Wed,
 20 Dec 2017 06:09:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.228.137 with HTTP; Wed, 20 Dec 2017 06:09:16 -0800 (PST)
From: Lei YU <mine260309@gmail.com>
Date: Wed, 20 Dec 2017 22:09:16 +0800
Message-ID: <CAARXrtmgZs6yAUd4pqBa1ZOoyYqe-8CuTe24cRk1mcROd0=WDQ@mail.gmail.com>
Subject: RFC: Support pwm in phosphor-hwmon as fan target
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, msbarth@us.ibm.com, 
 Brad Bishop <bradleyb@fuzziesquirrel.com>
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
X-List-Received-Date: Wed, 20 Dec 2017 14:09:21 -0000

The current phosphor-hwmon uses fanX_target for fan speed control. It expects
the fan driver to have `fanX_target` sysfs attribute, e.g. Witherspoon's
max31875 driver.
For the fans with `fanX_target`, phosphor-hwmon creates "Target" property on
the fan sensor Dbus object;
Then phosphor-fan-presence/control sets the "Target" property to do the
thermal control.

Other systems like Romulus do not have this attribute, and it uses `pwmX` to
control the fan speed instead. This is not supported in phosphor-hwmon yet.

To support such case, the proposal is to let phosphor-hwmon to create "Target"
property for the fans controlled by pwmX as well, via hwmon config file.

E.g. for Romulus, fan9, fan11, fan13 are used, where fan9 and fan13 are
controlled by pwm1, and fan11 is controlled by pwm2, then the config looks
like:
```
TARGET_fan9 = "pwm1"
TARGET_fan11 = "pwm2"
```

* When phosphor-hwmon sees TARGET_fanX, it creates "Target" property for this
fan, and use the related pwmX to control the fan speed;
* For the fan control yaml configs, define the relted fan zone and control
logic, where the fan
* phosphor-fan-presence/control uses the same "Target" property to set the
fan speed target, only that the value is range from 0~255.

The phosphor-hwmon changes are submitted at
https://gerrit.openbmc-project.xyz/#/c/8353/

Thanks

--
BRs,
Lei YU
