Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vDz2X3VF9zDq6X
 for <openbmc@lists.ozlabs.org>; Fri,  3 Feb 2017 11:56:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="iJiX9ihe"; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id x84so350954oix.2
 for <openbmc@lists.ozlabs.org>; Thu, 02 Feb 2017 16:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=9NtsDA+M0MxgcubYAVOUDFUX2+oxz6RaXfd0g7BBk3U=;
 b=iJiX9iheLhplsPBvha7lCGAejkVoP0DKK+zbIebUlZWhvaqZn6G5g1AJov2RZmiTTU
 yEbK2STsPO+buVMruc/6AzJ8tzSIPPaaQXmHFKSr9kgPqfc8ZJEz0rmoyRvExIOZPMLa
 CGNZvxjTy0+63bOgXiaZYWXdbWiSsGHMBEb+/1A+KVdKGuo7X9wR7+bHg0rv/SDMJAdQ
 VL0YKYthNG5yYIWi637JXgDmtUOf8lKgZyAMX+iJzxqNoSAlwK4L8ClgFtDQEGRc+w31
 +kr+wz2Ch8g3ksvAmnlb9XgCzJrrcBikNfSTdcus2wKty28trU3B2lxDNLWEE8lIhAqR
 gEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=9NtsDA+M0MxgcubYAVOUDFUX2+oxz6RaXfd0g7BBk3U=;
 b=WlNOZC5cqXLx468aMW6ctigcxbzimKwFvNxBNRANq3Y/xosaQyKHzudj7u8/ByduCU
 4yZa3vkRfqFNoCACmOmA6zBBiOvi8uOWw18BTyNU4GrsQ9/X7l4ks+xX51f+p6mWDcgy
 vAo7AQ8M2Bcx3Wuh42jgjWe0uSIr9MCRp44BuwrGnFpx4mYGn4Gln7qO6q9zLtt0j6aQ
 GhHgfUV8UKfbmlPZYKbaZOObD1lNc8T4t9gK9cFfFuZaAYOl6w7YoujLLvYkrfwqlexj
 ALjjZbsCS7nD6tGXTAwhby5EGJqFb+ACq6ByU3b6Z2X+G+3mqn45OSjQ/6oxEX1dtv2z
 gw7g==
X-Gm-Message-State: AIkVDXLo/7/O6oosvpNnUeX6btAjFAVeaW6t977qdyd0QKiquvhn+8NkOblMYOnXYNcKOAo3jypHcOEAC7ojbg==
X-Received: by 10.202.240.11 with SMTP id o11mr5277510oih.198.1486083378249;
 Thu, 02 Feb 2017 16:56:18 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.245.201 with HTTP; Thu, 2 Feb 2017 16:55:57 -0800 (PST)
In-Reply-To: <1486077964-11346-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1486077964-11346-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 3 Feb 2017 11:25:57 +1030
X-Google-Sender-Auth: FJxCadV8bCfuMeNczSoWmVXmqY0
Message-ID: <CACPK8XeAONcgX=y1fJueOkqXBiHeQDRf0zXp2XFJFXjU=wNgKw@mail.gmail.com>
Subject: Re: [PATCH linux v1 0/8] drivers: fsi: interrupt polling, i2c client
To: eajames@linux.vnet.ibm.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Alistair Popple <alistair@popple.id.au>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 "Edward A. James" <eajames@us.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Feb 2017 00:56:21 -0000

On Fri, Feb 3, 2017 at 9:55 AM,  <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> First, this series add interrupt polling support to the FSI bus driver.
> This implements a loop that constantly polls the FSI slave interrupt
> status register and triggers any registered client interrupt handlers upon
> detecting an interrupt.
>
> Secondly, this series adds the I2C client driver for FSI bus. This driver
> interacts with the IBM BOE engine on an FSI slave device.
>
> Christopher Bostic (3):
>   drivers/fsi: Add slave interrupt polling
>   drivers/fsi: Add Client IRQ Enable / Disable
>   drivers/fsi: Add sysfs file to adjust i-poll period
>
> Edward A. James (5):
>   drivers: fsi: Add i2c client driver
>   drivers: fsi: i2c: Add engine access wrappers
>   drivers: fsi: i2c: probe fsi device for i2c client
>   drivers: fsi: i2c: add driver file operations and bus locking
>   drivers: fsi: i2c: boe engine

This series was a bit of a mess. The second 5 patches all had trailing
whitespace. They didn't build cleanly. These patches had different
subject prefxies too. You can generate the subject line like this:

git format-patch --subject-prefix "PATCH linux dev-4.7" and it will
spit out patch files with the same subject prefix on all patches.

If you're doing v2, you can do:

git format-patch -v 2  --subject-prefix "PATCH linux dev-4.7" and it
will add the v2 or v3 or v100 to your subject line.

The full incarnation might look like this:

git format-patch -v 2  --subject-prefix "PATCH linux dev-4.7"
--to=joel@jms.id.au --cc=openbmc@lists.ozlabs.org origin/dev-4.7 -o
fsi-patches-v2

And then once you've edited the cover letter, I do this:

git send-email fsi-patches-v2/*

I fixed the mess this time, but please make sure you're sending
patches that cleanly apply and don't introduce warnings next time.

Cheers,

Joel

>
>  drivers/fsi/Kconfig           |    6 +
>  drivers/fsi/Makefile          |    1 +
>  drivers/fsi/fsi-core.c        |  170 +++
>  drivers/fsi/fsi-master-gpio.c |    1 +
>  drivers/fsi/fsi-master.h      |    2 +
>  drivers/fsi/i2c/Makefile      |    1 +
>  drivers/fsi/i2c/iic-boe.c     | 1597 +++++++++++++++++++++++++++++
>  drivers/fsi/i2c/iic-boe.h     |  180 ++++
>  drivers/fsi/i2c/iic-fsi.c     |  715 +++++++++++++
>  drivers/fsi/i2c/iic-int.h     |  395 +++++++
>  drivers/fsi/i2c/iic-lock.c    |  439 ++++++++
>  drivers/fsi/i2c/iic-mstr.c    | 2281 +++++++++++++++++++++++++++++++++++++++++
>  include/linux/fsi.h           |    5 +
>  include/uapi/linux/Kbuild     |    1 +
>  include/uapi/linux/i2cfsi.h   |  136 +++
>  15 files changed, 5930 insertions(+)
>  create mode 100644 drivers/fsi/i2c/Makefile
>  create mode 100644 drivers/fsi/i2c/iic-boe.c
>  create mode 100644 drivers/fsi/i2c/iic-boe.h
>  create mode 100644 drivers/fsi/i2c/iic-fsi.c
>  create mode 100644 drivers/fsi/i2c/iic-int.h
>  create mode 100644 drivers/fsi/i2c/iic-lock.c
>  create mode 100644 drivers/fsi/i2c/iic-mstr.c
>  create mode 100644 include/uapi/linux/i2cfsi.h
>
> --
> 1.8.3.1
>
