Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x241.google.com (mail-yb0-x241.google.com
 [IPv6:2607:f8b0:4002:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wD7wh2DXRzDqCL
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 17:33:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BCcEP2lE"; 
 dkim-atps=neutral
Received: by mail-yb0-x241.google.com with SMTP id d72so1038416ybh.0
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 00:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=xkiqju+c+lqQfBTHnW0s1dDIzQmM6irtcOmtLQ9WttA=;
 b=BCcEP2lEHELGnxeJFpvYH6Hoi0eRYHZ7vjhLlOufGpW6bXEixdzWVS0xrdUMW125T4
 S6R5hxn5IWGAMsTdcE+TjykvcUx5NTpwsCp9yQ4mPkh1VJ44XgRAqRyICL20NzSpkTOJ
 7nBR3g0QbZSG8gAz+WJFRhbUGja/1yLFJJBfcNx3MGERU0Fdjeo9hAggWOH+ZzFfI0Og
 wYz6ZIx/KZgFvPMkrB2ogmb/g16U1NINKx+QcVxjdgCZOjA9PYmC61/82SvQd625IRGl
 nybY46XjOB12wCXyXdu9IxvVOWHc1QboDDscQmJ8vSDrHnEoaJmWaWr3fJM2UTbkk4BH
 QnpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=xkiqju+c+lqQfBTHnW0s1dDIzQmM6irtcOmtLQ9WttA=;
 b=Lt1zNXMnBR6HN+sd/pH0J+FhEy+ulao8NLXhS2lzBnGo6zgTk7/qhHgGwh5ZMCE+Wa
 lPRzCOdlGGX5L/6Lqgp9iJ0zUCifZ1dP4zQCWDpNkf0STxpzn3KWJM6gKROUTOO5/dIF
 fE6ajJH1NSlzolmNFGaa1jp0FOXMRcUC2QNreZD7zzYhstvwghF5EkDd0xOv2mM83/5s
 LXGtHa1BK7R+cBREHWJyCPsAHxQnHY1mpIhcAbHrFLeNJarZ79quICBLkfc8nFeCka+H
 heRPNe9wN/ilz3XMC/Qr7ZbSnEWFFmNbzA6IpIgb0Bz/rjZpLOPORIBGwhI1cPsR79+U
 /4DA==
X-Gm-Message-State: AN3rC/4Cf67jOAJm3vW6/QWIZksjMUs24a1jwGefhWdiMOOOaPuVAhip
 hfhZXuYIBK2cdg4RBU2suGjYQZq1NQ==
X-Received: by 10.37.33.193 with SMTP id h184mr3339772ybh.57.1493278417595;
 Thu, 27 Apr 2017 00:33:37 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.171.70 with HTTP; Thu, 27 Apr 2017 00:33:17 -0700 (PDT)
In-Reply-To: <CAPLgG=nuU5befF4AfheWAbnU7tYPCpZSnj+-Zk8MDkvaKek+uw@mail.gmail.com>
References: <CACPK8XfFF7tNrLjroNA05-c3pMZWFbiKvHq+oFLjBDSkgqfjDw@mail.gmail.com>
 <CAPH-5w6-2zVQn2iNVP28aOAS_r11rxGYCrioXCR-sX8Ln7_BZQ@mail.gmail.com>
 <CAPH-5w4OS_oT5MMu2kEOUwtOza_LO94vwSH9dZHpVMa_4OA38Q@mail.gmail.com>
 <CAPLgG=nuU5befF4AfheWAbnU7tYPCpZSnj+-Zk8MDkvaKek+uw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 27 Apr 2017 17:03:17 +0930
X-Google-Sender-Auth: OVtNA-Vjw4x7lDtkI48wYMd-Qk4
Message-ID: <CACPK8XdLpPYitsvg9Eaw+g4jRX0Ki=9oBCtgtd9fx=_XevdfhA@mail.gmail.com>
Subject: Re: Switching to 4.10
To: Rick Altherr <raltherr@google.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 msbarth <msbarth@linux.vnet.ibm.com>, Edward James <eajames@us.ibm.com>
Cc: Xo Wang <xow@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Brendan Higgins <brendanhiggins@google.com>
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
X-List-Received-Date: Thu, 27 Apr 2017 07:33:41 -0000

On Thu, Apr 27, 2017 at 3:00 AM, Rick Altherr <raltherr@google.com> wrote:
> I saw Joel started https://gerrit.openbmc-project.xyz/#/c/2846/ which has a
> defconfig for ast2400.  If you have one for ast2500, please upload a new
> patch set to that change.

I have defconfigs in the tree that are ready to go. I will upload them
to Gerrit when I get the chance.

I've pulled in:

 - Ben's ftgmac100 patches from the net-next tree
 - Brendan's i2c patches, v7
 - Andrew's GPIO and Pinconf patches from the gpio and pinconf trees
 - Chris Bostic's FSI series, v6

These are going through a test cycle on the ast2500evb and Plametto
tonight. Once I have an ack for the i2c device tree, I will add that
to the tree and push to github.

Eddie, can you let me know which version of your OCC hwmon patches you
want included. Same goes for the CFAM I2C patches. If you want to wait
for review then please ping your reviewers and we can see if we can
get the patches reviewed before we include them.

Brad, can you point me to the SBE FIFO work that you want included. If
you would prefer to wait for review that is okay.

Matt, I think do you want to merge the MAX31785 hwmon driver as-is for now?

Cheers,

JOel

>
> On Tue, Apr 25, 2017 at 5:30 PM, Xo Wang <xow@google.com> wrote:
>>
>> On Tue, Apr 25, 2017 at 4:57 PM, Xo Wang <xow@google.com> wrote:
>> > Hi Joel,
>> >
>> > On Thu, Apr 20, 2017 at 7:30 PM, Joel Stanley <joel@jms.id.au> wrote:
>> >> Hello team,
>> >>
>> >> I want to make the 4.10 change happen. We don't have the resource to
>> >> be maintaining two trees, and the 4.10 tree has a whole heap of
>> >> shinyness - faster network, faster flash access, improved I2C.
>> >>
>> >> To this end I will stop merging patches in to 4.7. Please target the
>> >> 4.10 tree from here on.
>> >>
>> >> Use this thread to discuss concerns and coordinate the work that needs
>> >> to be done. Bits that I'm aware of
>> >>
>> >>  - Eddie is updating userspace to the new FSI APIs
>> >>  - I need to merge the upstream FSI patchset
>> >>  - Brednan needs to post the lastest version of the i2c patchset which
>> >> I will merge
>> >>  - I need to merge benh's ftgmac100 improvements
>> >
>> > We'll need to update the defconfig in the build system. Currently if I
>> > compile the kernel and generate a new defconfig (make savedefconfig),
>> > I see the following changes in the 4.10 generated defconfig:
>> >
>> > @@ -73,7 +73,6 @@
>> >  CONFIG_MTD_BLOCK=y
>> >  CONFIG_MTD_PARTITIONED_MASTER=y
>> >  CONFIG_MTD_SPI_NOR=y
>> > -CONFIG_ASPEED_FLASH_SPI=y
>> >  CONFIG_MTD_UBI=y
>> >  CONFIG_MTD_UBI_FASTMAP=y
>> >  CONFIG_MTD_UBI_BLOCK=y
>> > @@ -116,7 +115,6 @@
>> >  # CONFIG_SERIO is not set
>> >  # CONFIG_VT is not set
>> >  CONFIG_LEGACY_PTY_COUNT=4
>> > -# CONFIG_DEVKMEM is not set
>> >  CONFIG_SERIAL_8250=y
>> >  # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
>> >  CONFIG_SERIAL_8250_CONSOLE=y
>> > @@ -131,10 +129,8 @@
>> >  CONFIG_I2C=y
>> >  CONFIG_I2C_CHARDEV=y
>> >  CONFIG_I2C_ASPEED=y
>> > -CONFIG_SENSORS_MAX31785=y
>> >  CONFIG_SENSORS_LM75=y
>> >  CONFIG_SENSORS_NCT7904=y
>> > -CONFIG_SENSORS_POWER8_OCC_I2C=y
>> >  CONFIG_PMBUS=y
>> >  CONFIG_SENSORS_ADM1275=y
>> >  CONFIG_SENSORS_UCD9000=y
>> > @@ -143,21 +139,14 @@
>> >  # CONFIG_USB_SUPPORT is not set
>> >  CONFIG_NEW_LEDS=y
>> >  CONFIG_LEDS_CLASS=y
>> > -CONFIG_LEDS_GPIO=y
>> >  CONFIG_LEDS_TRIGGERS=y
>> >  CONFIG_LEDS_TRIGGER_TIMER=y
>> >  CONFIG_LEDS_TRIGGER_HEARTBEAT=y
>> > -CONFIG_LEDS_TRIGGER_GPIO=y
>> >  CONFIG_RTC_CLASS=y
>> >  CONFIG_RTC_DRV_DS1307=y
>> >  CONFIG_RTC_DRV_ASPEED=y
>> >  CONFIG_MAILBOX=y
>> > -CONFIG_ASPEED_MBOX=y
>> >  # CONFIG_IOMMU_SUPPORT is not set
>> > -CONFIG_FSI=y
>> > -CONFIG_FSI_MASTER_GPIO=y
>> > -CONFIG_FSI_SCOM=y
>> > -CONFIG_FSI_I2C=y
>> >  CONFIG_FIRMWARE_MEMMAP=y
>> >  CONFIG_FANOTIFY=y
>> >  CONFIG_AUTOFS4_FS=y
>> >
>> >>
>> >> Cheers,
>> >>
>> >> Joel
>> >
>> > I know that CONFIG_ASPEED_FLASH_SPI is now CONFIG_SPI_ASPEED_SMC, but
>> > I've yet to look at each of the other differences.
>> >
>> > cheers
>> > xo
>>
>> OK, I guess it's not that much work to look at those configs. This
>> seems to work up to the limit of the missing FSI drivers as previously
>> mentioned:
>>
>> ---
>> a/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc/defconfig
>> +++
>> b/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc/defconfig
>> @@ -73,7 +73,7 @@ CONFIG_MTD_CMDLINE_PARTS=y
>>  CONFIG_MTD_BLOCK=y
>>  CONFIG_MTD_PARTITIONED_MASTER=y
>>  CONFIG_MTD_SPI_NOR=y
>> -CONFIG_ASPEED_FLASH_SPI=y
>> +CONFIG_SPI_ASPEED_SMC=y
>>  CONFIG_MTD_UBI=y
>>  CONFIG_MTD_UBI_FASTMAP=y
>>  CONFIG_MTD_UBI_BLOCK=y
>> @@ -116,7 +116,6 @@ CONFIG_INPUT_EVDEV=y
>>  # CONFIG_SERIO is not set
>>  # CONFIG_VT is not set
>>  CONFIG_LEGACY_PTY_COUNT=4
>> -# CONFIG_DEVKMEM is not set
>>  CONFIG_SERIAL_8250=y
>>  # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
>>  CONFIG_SERIAL_8250_CONSOLE=y
>> @@ -131,10 +130,11 @@ CONFIG_ASPEED_BT_IPMI_BMC=y
>>  CONFIG_I2C=y
>>  CONFIG_I2C_CHARDEV=y
>>  CONFIG_I2C_ASPEED=y
>> -CONFIG_SENSORS_MAX31785=y
>> +CONFIG_GPIOLIB=y
>> +CONFIG_GPIO_SYSFS=y
>> +CONFIG_GPIO_ASPEED=y
>>  CONFIG_SENSORS_LM75=y
>>  CONFIG_SENSORS_NCT7904=y
>> -CONFIG_SENSORS_POWER8_OCC_I2C=y
>>  CONFIG_PMBUS=y
>>  CONFIG_SENSORS_ADM1275=y
>>  CONFIG_SENSORS_UCD9000=y
>> @@ -152,12 +152,8 @@ CONFIG_RTC_CLASS=y
>>  CONFIG_RTC_DRV_DS1307=y
>>  CONFIG_RTC_DRV_ASPEED=y
>>  CONFIG_MAILBOX=y
>> -CONFIG_ASPEED_MBOX=y
>> +CONFIG_ASPEED_LPC_MBOX=y
>>  # CONFIG_IOMMU_SUPPORT is not set
>> -CONFIG_FSI=y
>> -CONFIG_FSI_MASTER_GPIO=y
>> -CONFIG_FSI_SCOM=y
>> -CONFIG_FSI_I2C=y
>>  CONFIG_FIRMWARE_MEMMAP=y
>>  CONFIG_FANOTIFY=y
>>  CONFIG_AUTOFS4_FS=y
>>
>> cheers
>> xo
>
>
