Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wDbl86dwrzDqG3
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 11:27:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FrBo46aA"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id j9so3968279ywj.3
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 18:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=4Riaf7KNduNHv9EKIw8YKsIykUFTZVml7wuUDzy2riM=;
 b=FrBo46aA/vjXH1VuCmt2sq9B0DJkuHuWONnLbHCMuSl+1JJ1Vpn4L8uy1e/llp32Io
 ZQY2gOalFBH4W+gMowukJjJCv1Zq5ekWbOT1uYCgDvGjrIEAnRpdD8FNKUAuuyiAKZ7Y
 m5f6O4/86C6q9o98i5cjOYqT3qc+unfLuEEJu4FMzzBKzjYgB6Xw8+H0+/bz+aNEeEJ8
 FW749a33jS6jxkf2LXpEFauXgzun0CxFpgVGU71gVG0OULC5jWXKNYsecGbdQyQGaOPy
 gb6zWHw4CTZCnN5uWWIZ9YIkmVUz4HAFnTRe1+IwLvjb/i2TGqONRwPLLDrU8IE+Wndk
 QYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=4Riaf7KNduNHv9EKIw8YKsIykUFTZVml7wuUDzy2riM=;
 b=a57oQQ8BYtZ5wFy3lDMcSUEmUHAT8DeyxxmC6oMKKejhSygv6B+L7MXU31qQ6SVc2s
 nPc5lVcePIzwFA0kVIaCbOP21dT7HWQrFghC637uqv2NRA4S/hL7j81CSXr63c7WZehB
 uhGeRzBO3aV+x65ud2dPZH4j8Rn913yT6M15ilYHDdY1SeT7vj4Qi+j1jVRGi9Yrev3L
 cjsRpAaRoZ0xqFJUUOMu5vnUWw7pEraZnqKWmKBPgZcubnJ3KtY9cePyL3Hdwn8Fo+mN
 8sirqJsnyirhDjimcEWEwmt0An84DqDFbgu1eDmZEkHdksgMthuCTgwcmCMFe/KpLWtI
 uWNQ==
X-Gm-Message-State: AN3rC/7mnM+3vqY/JOoGDCqqzZqWVxTQk3w8r5NLM8GPT+YU2T5eRGCS
 AlZzEQjveYZOcs2sPqhIdWg9oXYiIg==
X-Received: by 10.129.81.3 with SMTP id f3mr7141739ywb.308.1493342818769; Thu,
 27 Apr 2017 18:26:58 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.171.70 with HTTP; Thu, 27 Apr 2017 18:26:38 -0700 (PDT)
In-Reply-To: <OF1B45F0C6.795DC987-ON0025810F.0077B627-0025810F.007862FD@notes.na.collabserv.com>
References: <CACPK8XfFF7tNrLjroNA05-c3pMZWFbiKvHq+oFLjBDSkgqfjDw@mail.gmail.com>
 <CAPH-5w6-2zVQn2iNVP28aOAS_r11rxGYCrioXCR-sX8Ln7_BZQ@mail.gmail.com>
 <CAPH-5w4OS_oT5MMu2kEOUwtOza_LO94vwSH9dZHpVMa_4OA38Q@mail.gmail.com>
 <CAPLgG=nuU5befF4AfheWAbnU7tYPCpZSnj+-Zk8MDkvaKek+uw@mail.gmail.com>
 <CACPK8XdLpPYitsvg9Eaw+g4jRX0Ki=9oBCtgtd9fx=_XevdfhA@mail.gmail.com>
 <OF1B45F0C6.795DC987-ON0025810F.0077B627-0025810F.007862FD@notes.na.collabserv.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 28 Apr 2017 10:56:38 +0930
X-Google-Sender-Auth: tiHt-momIvZZ3qubGyrCDOnPCe8
Message-ID: <CACPK8Xf93mEfdmd2AswAeS5ZHJyujSfsFbn93P0Q7niyyPq4Uw@mail.gmail.com>
Subject: Re: Switching to 4.10
To: Edward James <eajames@us.ibm.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 Brendan Higgins <brendanhiggins@google.com>,
 msbarth <msbarth@linux.vnet.ibm.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Rick Altherr <raltherr@google.com>,
 Xo Wang <xow@google.com>
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
X-List-Received-Date: Fri, 28 Apr 2017 01:27:01 -0000

On Fri, Apr 28, 2017 at 7:24 AM, Edward James <eajames@us.ibm.com> wrote:
> Hey Joel,
>
> I don't think we can pull in the occ-hwmon driver yet, because there will
> some moderate restructuring due to the way the SBEFIFO and OCC driver
> interact for P9, which I didn't anticipate in how I wrote the P8 side of
> things. Haven't gotten to that yet.

Thanks for the update. Keep me in the loop.

> For the I2C driver, I have the new kernel I2C FSI client driver on the obmc
> mailing list, but need some feedback on the dt bindings. The old FSP-based
> I2C driver can be put in, but needs some work for the endianness changes,
> which I'm hoping to get done tomorrow/monday.

I would like to avoid pulling in the FSP i2c driver. Can you chat with
Jk and Brad to get the bindings sorted, and we can use that one
instead?

Cheers,

Joel

>
> Thanks,
> Eddie
>
>
> ----- Original message -----
> From: Joel Stanley <joel@jms.id.au>
> Sent by: joel.stan@gmail.com
> To: Rick Altherr <raltherr@google.com>, Brad Bishop
> <bradleyb@fuzziesquirrel.com>, msbarth <msbarth@linux.vnet.ibm.com>, Edward
> James <eajames@us.ibm.com>
> Cc: Xo Wang <xow@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
> Brendan Higgins <brendanhiggins@google.com>
> Subject: Re: Switching to 4.10
> Date: Thu, Apr 27, 2017 2:33 AM
>
> On Thu, Apr 27, 2017 at 3:00 AM, Rick Altherr <raltherr@google.com> wrote:
>> I saw Joel started https://gerrit.openbmc-project.xyz/#/c/2846/ which has
>> a
>> defconfig for ast2400.  If you have one for ast2500, please upload a new
>> patch set to that change.
>
> I have defconfigs in the tree that are ready to go. I will upload them
> to Gerrit when I get the chance.
>
> I've pulled in:
>
>  - Ben's ftgmac100 patches from the net-next tree
>  - Brendan's i2c patches, v7
>  - Andrew's GPIO and Pinconf patches from the gpio and pinconf trees
>  - Chris Bostic's FSI series, v6
>
> These are going through a test cycle on the ast2500evb and Plametto
> tonight. Once I have an ack for the i2c device tree, I will add that
> to the tree and push to github.
>
> Eddie, can you let me know which version of your OCC hwmon patches you
> want included. Same goes for the CFAM I2C patches. If you want to wait
> for review then please ping your reviewers and we can see if we can
> get the patches reviewed before we include them.
>
> Brad, can you point me to the SBE FIFO work that you want included. If
> you would prefer to wait for review that is okay.
>
> Matt, I think do you want to merge the MAX31785 hwmon driver as-is for now?
>
> Cheers,
>
> JOel
>
>>
>> On Tue, Apr 25, 2017 at 5:30 PM, Xo Wang <xow@google.com> wrote:
>>>
>>> On Tue, Apr 25, 2017 at 4:57 PM, Xo Wang <xow@google.com> wrote:
>>> > Hi Joel,
>>> >
>>> > On Thu, Apr 20, 2017 at 7:30 PM, Joel Stanley <joel@jms.id.au> wrote:
>>> >> Hello team,
>>> >>
>>> >> I want to make the 4.10 change happen. We don't have the resource to
>>> >> be maintaining two trees, and the 4.10 tree has a whole heap of
>>> >> shinyness - faster network, faster flash access, improved I2C.
>>> >>
>>> >> To this end I will stop merging patches in to 4.7. Please target the
>>> >> 4.10 tree from here on.
>>> >>
>>> >> Use this thread to discuss concerns and coordinate the work that needs
>>> >> to be done. Bits that I'm aware of
>>> >>
>>> >>  - Eddie is updating userspace to the new FSI APIs
>>> >>  - I need to merge the upstream FSI patchset
>>> >>  - Brednan needs to post the lastest version of the i2c patchset which
>>> >> I will merge
>>> >>  - I need to merge benh's ftgmac100 improvements
>>> >
>>> > We'll need to update the defconfig in the build system. Currently if I
>>> > compile the kernel and generate a new defconfig (make savedefconfig),
>>> > I see the following changes in the 4.10 generated defconfig:
>>> >
>>> > @@ -73,7 +73,6 @@
>>> >  CONFIG_MTD_BLOCK=y
>>> >  CONFIG_MTD_PARTITIONED_MASTER=y
>>> >  CONFIG_MTD_SPI_NOR=y
>>> > -CONFIG_ASPEED_FLASH_SPI=y
>>> >  CONFIG_MTD_UBI=y
>>> >  CONFIG_MTD_UBI_FASTMAP=y
>>> >  CONFIG_MTD_UBI_BLOCK=y
>>> > @@ -116,7 +115,6 @@
>>> >  # CONFIG_SERIO is not set
>>> >  # CONFIG_VT is not set
>>> >  CONFIG_LEGACY_PTY_COUNT=4
>>> > -# CONFIG_DEVKMEM is not set
>>> >  CONFIG_SERIAL_8250=y
>>> >  # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
>>> >  CONFIG_SERIAL_8250_CONSOLE=y
>>> > @@ -131,10 +129,8 @@
>>> >  CONFIG_I2C=y
>>> >  CONFIG_I2C_CHARDEV=y
>>> >  CONFIG_I2C_ASPEED=y
>>> > -CONFIG_SENSORS_MAX31785=y
>>> >  CONFIG_SENSORS_LM75=y
>>> >  CONFIG_SENSORS_NCT7904=y
>>> > -CONFIG_SENSORS_POWER8_OCC_I2C=y
>>> >  CONFIG_PMBUS=y
>>> >  CONFIG_SENSORS_ADM1275=y
>>> >  CONFIG_SENSORS_UCD9000=y
>>> > @@ -143,21 +139,14 @@
>>> >  # CONFIG_USB_SUPPORT is not set
>>> >  CONFIG_NEW_LEDS=y
>>> >  CONFIG_LEDS_CLASS=y
>>> > -CONFIG_LEDS_GPIO=y
>>> >  CONFIG_LEDS_TRIGGERS=y
>>> >  CONFIG_LEDS_TRIGGER_TIMER=y
>>> >  CONFIG_LEDS_TRIGGER_HEARTBEAT=y
>>> > -CONFIG_LEDS_TRIGGER_GPIO=y
>>> >  CONFIG_RTC_CLASS=y
>>> >  CONFIG_RTC_DRV_DS1307=y
>>> >  CONFIG_RTC_DRV_ASPEED=y
>>> >  CONFIG_MAILBOX=y
>>> > -CONFIG_ASPEED_MBOX=y
>>> >  # CONFIG_IOMMU_SUPPORT is not set
>>> > -CONFIG_FSI=y
>>> > -CONFIG_FSI_MASTER_GPIO=y
>>> > -CONFIG_FSI_SCOM=y
>>> > -CONFIG_FSI_I2C=y
>>> >  CONFIG_FIRMWARE_MEMMAP=y
>>> >  CONFIG_FANOTIFY=y
>>> >  CONFIG_AUTOFS4_FS=y
>>> >
>>> >>
>>> >> Cheers,
>>> >>
>>> >> Joel
>>> >
>>> > I know that CONFIG_ASPEED_FLASH_SPI is now CONFIG_SPI_ASPEED_SMC, but
>>> > I've yet to look at each of the other differences.
>>> >
>>> > cheers
>>> > xo
>>>
>>> OK, I guess it's not that much work to look at those configs. This
>>> seems to work up to the limit of the missing FSI drivers as previously
>>> mentioned:
>>>
>>> ---
>>>
>>> a/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc/defconfig
>>> +++
>>>
>>> b/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc/defconfig
>>> @@ -73,7 +73,7 @@ CONFIG_MTD_CMDLINE_PARTS=y
>>>  CONFIG_MTD_BLOCK=y
>>>  CONFIG_MTD_PARTITIONED_MASTER=y
>>>  CONFIG_MTD_SPI_NOR=y
>>> -CONFIG_ASPEED_FLASH_SPI=y
>>> +CONFIG_SPI_ASPEED_SMC=y
>>>  CONFIG_MTD_UBI=y
>>>  CONFIG_MTD_UBI_FASTMAP=y
>>>  CONFIG_MTD_UBI_BLOCK=y
>>> @@ -116,7 +116,6 @@ CONFIG_INPUT_EVDEV=y
>>>  # CONFIG_SERIO is not set
>>>  # CONFIG_VT is not set
>>>  CONFIG_LEGACY_PTY_COUNT=4
>>> -# CONFIG_DEVKMEM is not set
>>>  CONFIG_SERIAL_8250=y
>>>  # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
>>>  CONFIG_SERIAL_8250_CONSOLE=y
>>> @@ -131,10 +130,11 @@ CONFIG_ASPEED_BT_IPMI_BMC=y
>>>  CONFIG_I2C=y
>>>  CONFIG_I2C_CHARDEV=y
>>>  CONFIG_I2C_ASPEED=y
>>> -CONFIG_SENSORS_MAX31785=y
>>> +CONFIG_GPIOLIB=y
>>> +CONFIG_GPIO_SYSFS=y
>>> +CONFIG_GPIO_ASPEED=y
>>>  CONFIG_SENSORS_LM75=y
>>>  CONFIG_SENSORS_NCT7904=y
>>> -CONFIG_SENSORS_POWER8_OCC_I2C=y
>>>  CONFIG_PMBUS=y
>>>  CONFIG_SENSORS_ADM1275=y
>>>  CONFIG_SENSORS_UCD9000=y
>>> @@ -152,12 +152,8 @@ CONFIG_RTC_CLASS=y
>>>  CONFIG_RTC_DRV_DS1307=y
>>>  CONFIG_RTC_DRV_ASPEED=y
>>>  CONFIG_MAILBOX=y
>>> -CONFIG_ASPEED_MBOX=y
>>> +CONFIG_ASPEED_LPC_MBOX=y
>>>  # CONFIG_IOMMU_SUPPORT is not set
>>> -CONFIG_FSI=y
>>> -CONFIG_FSI_MASTER_GPIO=y
>>> -CONFIG_FSI_SCOM=y
>>> -CONFIG_FSI_I2C=y
>>>  CONFIG_FIRMWARE_MEMMAP=y
>>>  CONFIG_FANOTIFY=y
>>>  CONFIG_AUTOFS4_FS=y
>>>
>>> cheers
>>> xo
>>
>>
>
>
>
>
