Return-Path: <arndbergmann@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::241; helo=mail-oi0-x241.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kKjX9KU3"; 
 dkim-atps=neutral
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zHRQ405t6zF0c4
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jan 2018 00:22:51 +1100 (AEDT)
Received: by mail-oi0-x241.google.com with SMTP id n81so1597566oig.8
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 05:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=asvddUA5vp/X7WuuV3b9TCDTdeMkFzg2D9c9r1f8vl8=;
 b=kKjX9KU3Bl1nuPxO1i2uAx6LYLkqX46+hMxmje18jmre8Vvl3lJGZa8dmo/3E2mW8z
 SaIZDqPyqqdgP6heFgGQdD8lSZDa7OQqWa05iY/eLdEMZGs9ph+ggqIYACzimqh4MOvz
 EEXA2AuoHWwjPaJ1TtWt0kJvo3IV3RDj6tn1+WRjvYqoQQ7uLASKr2jbr2kgOzSmPENA
 RXxI7/MFmUBB3nF3mrKLc+woNPGcWBggBdKm4wBgSOObfUJlETDUA55yH+Z+h8Wrt/ey
 KP2gzECY4MhkhYw7rIZQkCsAEBf1wTQ+RLgeHkp9D5aprGLXtaNZrwst/bGHjwA+9y8M
 eauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=asvddUA5vp/X7WuuV3b9TCDTdeMkFzg2D9c9r1f8vl8=;
 b=FTrEKThI058+k6ci5lm20cvP+Ou2rNFTCXYt2XuH03JwQn1hUrUrnR+fcsybePhfK3
 N0zStY26BYETW7IYdphpXn+hUeHOw5nCp4KfyX4WBCt7QXF9dHFPR79IFWPHaqCBMqFu
 c9lBjIDQyNgo8oZRAUs4ZfYvRPkUKRpyUYoY/0XqHT9Ahy0GJi4k7wGWTk4BF1938PXq
 GZsyxD56ptcA4tHmc/qNS0iUy7iEMkSrOeC95AjwXjnT2SVUm2kC3XGQDscbyCbY6FIe
 qxrus+4tz9XZ8KH5ljKNi520SrOegYvjfWgy7TT4kr7rmo0+0u1Zz256PvzykpJHo2rq
 lz/g==
X-Gm-Message-State: AKGB3mIam3DfbCDXka27Ep6PKsrTysK6lpZC5LY8k/MURU7qKawA7NSX
 Q9digq43L2iRO4VH1Y11gJQltDwW39jADtky1KQ=
X-Google-Smtp-Source: ACJfBosiRQbAE8zj+VvSM+aYPzifXJBR0VOZBv0dIj6A6Z9dUcQSn8cnQ69VJMQNW4MORmyGScCzVczJfl+gzQ9qqS4=
X-Received: by 10.202.221.130 with SMTP id u124mr12234369oig.128.1515676969028; 
 Thu, 11 Jan 2018 05:22:49 -0800 (PST)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
Received: by 10.157.2.226 with HTTP; Thu, 11 Jan 2018 05:22:48 -0800 (PST)
In-Reply-To: <bdc0375d-c379-6c2e-b350-76741afe151d@linux.intel.com>
References: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com>
 <20180109223126.13093-7-jae.hyun.yoo@linux.intel.com>
 <CAK8P3a31+9HGQ=fQby5Zi1RZ671hKraZP_2ggLTMX3qvOiTx0w@mail.gmail.com>
 <bdc0375d-c379-6c2e-b350-76741afe151d@linux.intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 11 Jan 2018 14:22:48 +0100
X-Google-Sender-Auth: CCPY_O_hdmY59sdcIJdR1ttx6Zs
Message-ID: <CAK8P3a0xyQQeyDdj8UEMgdGK13jisvo5rOkGbi-wWYZA5QFSMQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 6/6] drivers/hwmon: Add a driver for a
 generic PECI hwmon
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 gregkh <gregkh@linuxfoundation.org>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-doc@vger.kernel.org, 
 DTML <devicetree@vger.kernel.org>, linux-hwmon@vger.kernel.org, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 11 Jan 2018 13:22:52 -0000

On Thu, Jan 11, 2018 at 12:45 AM, Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
> On 1/10/2018 4:29 AM, Arnd Bergmann wrote:
>>
>> On Tue, Jan 9, 2018 at 11:31 PM, Jae Hyun Yoo
>> <jae.hyun.yoo@linux.intel.com> wrote:
>>>
>>> This commit adds driver implementation for a generic PECI hwmon.
>>>
>>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>>
>>
>>> +static int xfer_peci_msg(int cmd, void *pmsg)
>>> +{
>>> +       int rc;
>>> +
>>> +       mutex_lock(&peci_hwmon_lock);
>>> +       rc = peci_ioctl(NULL, cmd, (unsigned long)pmsg);
>>> +       mutex_unlock(&peci_hwmon_lock);
>>> +
>>> +       return rc;
>>> +}
>>
>>
>> I said earlier that peci_ioctl() looked unused, that was obviously
>> wrong, but what you have here
>> is not a proper way to abstract a bus.
>>
>> Maybe this can be done more like an i2c bus: make the peci controller
>> a bus device
>> and register all known target/index pairs as devices with the peci bus
>> type, and have
>> them probed from DT. The driver can then bind to each of those
>> individually.
>> Not sure if that is getting to granular at that point, I'd have to
>> understand better
>> how it is expected to get used, and what the variances are between
>> implementations.
>>
>
> Thanks for sharing your opinion. In fact, this was also suggested by openbmc
> community so I should consider of redesigning it. I'm currently thinking
> about adding a new PECI device class as an abstract layer and any BMC
> chipset specific driver could be attached to the PECI class driver. Then,
> each CPU client could be registered as an individual device as you
> suggested. Will consider your suggestion.

Another idea might be to pretend that PECI was I2C. We already have a few
drivers for hardware that is not I2C but whose software interface looks
similar enough that it just works. No idea if that is the case for PECI, but
xfer_peci_msg might be close enough to i2c_xfer to make it work. If you
are able to do that, then the PECI controller would just register itself
as an i2c controller and it can be accessed using /dev/i2c from user space
or a high-level i2c_driver.

      Arnd
