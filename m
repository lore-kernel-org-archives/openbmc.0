Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::22e; helo=mail-io0-x22e.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cUNcK0eg"; 
 dkim-atps=neutral
Received: from mail-io0-x22e.google.com (mail-io0-x22e.google.com
 [IPv6:2607:f8b0:4001:c06::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41hcGZ28zfzF2Dc
 for <openbmc@lists.ozlabs.org>; Fri,  3 Aug 2018 16:15:17 +1000 (AEST)
Received: by mail-io0-x22e.google.com with SMTP id g11-v6so4093736ioq.9
 for <openbmc@lists.ozlabs.org>; Thu, 02 Aug 2018 23:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=al/XI0QPfQ09ZMqFbgY5UPwji2LYL24SMv4fvX6CCWI=;
 b=cUNcK0egK2pang97+oC6UdkVVEsI5Gq5Lv/WYJFp7cY4PwGw7/GZVd5gbmFMADixwb
 tcet3npLENOBMWH3fVXVRsFrQfhRzo/1BibgXG+prAnFbC0mRSmD00UiCK55GM/a+TmC
 zhJfZMGSYwvUcmeoHK7Jy/HF0unD+0moQ4Lc8SBSecqn7Oc4fPyxmh63vpOe7ffjFNWU
 VeYCEVeKc+heSBljKskbuKagOdW+ie2Y/l0cjkgc4pJUFQXB4VD6Esu9sN9tKiK5rXne
 /2i2Kp28eY7QI6xdtBY7Qs6a3wUBJtyim1wZNtJI/CPI+ZXvnZAUIYSlUYyUsaHDtXem
 UOSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=al/XI0QPfQ09ZMqFbgY5UPwji2LYL24SMv4fvX6CCWI=;
 b=icL/jXKae2b2IKYnb/Z5gVrtKSErr+k5UwRx8+Hw6seD8Dly15udLz433tdrlVX0fz
 DdaqyFwMLZMFuXU/ZXTCB2RL2fNY7qZyRh6XjuQ8Hu5zicMHAie4jNtVuBRczsVq3MIa
 6G984oyc3dXODwJrntQ+edu2J0hopzxpVKnIiJxpprK++YbP5jWHzBDj6AB7SoLVzw2d
 Atyc1kIUqBTeHAA1jlBqBdwy/KZojJS5ljSXw+MO0jKwAEO7O6qWtFeAdfuOugKKqP9I
 ZjVD2YBJ+FcvAtEixdPEbXNsA4lW71VpkYlhSADq2Z7vInxNHVR4HlRrxFchQzJ0saYE
 vSUQ==
X-Gm-Message-State: AOUpUlEzipnLXQUn6HbgllxEljjJRJtu2F4fSV/UIy/c1madwS7YZumR
 xA9qM/6vDHSMPcvLmAhFCgAuv6eyL/CFQbdV4nqZC5lg
X-Google-Smtp-Source: AA+uWPxIhe4PMYTIRSOAPApn5M2zAFQ0BsJR6xhwCBHYEZfzeyqD42ZN1dlt+osUy7wQgC5pIPC+bQw8xzp8Oe++XuM=
X-Received: by 2002:a6b:889f:: with SMTP id
 s31-v6mr4869312ioi.156.1533276915328; 
 Thu, 02 Aug 2018 23:15:15 -0700 (PDT)
MIME-Version: 1.0
From: Lei YU <mine260309@gmail.com>
Date: Fri, 3 Aug 2018 14:14:54 +0800
Message-ID: <CAARXrtm64qpSkDD31+m9HGa-Bw4k0jkRizHiS9fc73JZHMfmXQ@mail.gmail.com>
Subject: What is the proper way to read RTC battery voltage
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Patrick Venture <venture@google.com>, spinler@us.ibm.com,
 Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Aug 2018 06:15:19 -0000

This email is to ask about a proper way to read RTC battery voltage.

Background:
* Usually RTC battery voltage could be read from an ADC channel.
* Usually there is a GPIO to enable/disable the connection between battery
   and ADC, e.g.
   * When GPIO is pulled low, the channel is disconnected and reading is 0.
   * When GPIO is pulled high, the channel is connected and the reading is OK.
* So to read the voltage, the GPIO shall be pulled high.
* When the GPIO is pulled high, it drains the battery.

The problem: How to properly read the voltage, without affecting the battery
life?

1. If the GPIO is simply hogged high in device tree, the ADC channel always get
   the correct reading, but it affects the battery life.
2. We could leave the GPIO for user space to control, e.g. let phosphor-hwmon
   to control the GPIO while reading a sensor, it resolves the problem.
   This is done by Google and the patch for phosphor-hwmon is at
   (https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-hwmon/+/11697/)
3. We could use gpio-mux and io-channel-mux driver, that let kernel to
   automatically pull the GPIO while reading the sensor. (See
   https://github.com/mine260309/linux/commit/8e60647389e5400a85c705685ca2f6b875856c99
   for example).
   However, it requires some delay between GPIO pulled high and reading the ADC
   channel, if the delay is too small, the ADC channel reading becomes
   incorrect, e.g. it gets 0 or a lower value than expected.

In the above 3 ways:
1 is not acceptable;
2 is OK, but it is not as clean as handle the GPIO in kernel;
3 is more preferred, but it requires a delay in kernel. To upstream this
   change, the delay shall be put in a proper place, e.g. in iio-mux driver,
   or in adc driver?
   I do not think either place is proper for the delay...

So my question is, which is the proper way to handle the case, or is there any
other way?

Thanks!
