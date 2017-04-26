Return-Path: <xow@google.com>
Received: from mail-qt0-x233.google.com (mail-qt0-x233.google.com
 [IPv6:2607:f8b0:400d:c0d::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wCLZT5YyCzDq7Z
 for <openbmc@lists.ozlabs.org>; Wed, 26 Apr 2017 10:30:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="MfVeq8Or"; 
 dkim-atps=neutral
Received: by mail-qt0-x233.google.com with SMTP id y33so154299083qta.2
 for <openbmc@lists.ozlabs.org>; Tue, 25 Apr 2017 17:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=irBcPQmlBB5OMgJ6mD1p0DqBoLL8cSnnWC/sHFj1804=;
 b=MfVeq8Ord/WPvOjRYPId/4XrnFZ3QW0sfrC0AoNNImxJA4aKfU9cReX74VX+sA8TPm
 XkPNLxIZKqSUaeTGlHhw9o2uhZzibr2XvJvQbPiKGrn81LmCE1gZ4NEiiL0/oz+wqkTj
 4eRHzLqHShMe6uwgM5rZrPTvbNrXdQ6a1fjwpkVv5ZF01dd6X7mvh3U3nL455nTlXHPh
 ZUPvwjrjTGTdeMRDcwocJifseObPZQVfGd0FMV03GcSIiVZn9z+ZpJ9Fgdw+Ad25s1/y
 sk9V6LRn8zfMVOKeDr8pZFYB+H4DtBLesD1AN0xO/NkE41BUaxFgqCQ+Mar9nyf84jpj
 VXug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=irBcPQmlBB5OMgJ6mD1p0DqBoLL8cSnnWC/sHFj1804=;
 b=fiY1TFn9Bo3oBkDNxxDT4L2q6u5o6iCjhsLyu0c4g6bP09svwcjfixkUCHDWmjTmzo
 3jmu5qBL/R+3gmevFU8830PGfmmlZnn5xBzxEVbWZ46lnToiXt/zyXqUbPVUVbHDOwXv
 7wBdridAPk1n1gHviuk5FmRmR5WvlVoRd09+2xOKmQZr5GffmbcwRliv8XOok6LXvZFi
 q644I5mIaYLbs7Kc3SnlK5O6WTVUKX6xu05BJhPb+gXdox3WLD4Tx9enKYCx6KNtPkJ4
 INjpH/DhYCzwj9jAAlYRmLkM8b4F5xRxJ3IdxOWAnVQPWZegDCW0pdOYVxPY6S86V0yU
 KeoA==
X-Gm-Message-State: AN3rC/7qTKz2P6xlLNCQ+jUuYgzEBYWOG/nuOyqyDvHeomeLPM2Df8JM
 CfcEPE62Lry8MRX1ORJ4XiR+AFR6F72OXN60hA==
X-Received: by 10.237.36.151 with SMTP id t23mr35927734qtc.181.1493166606562; 
 Tue, 25 Apr 2017 17:30:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.73 with HTTP; Tue, 25 Apr 2017 17:30:04 -0700 (PDT)
In-Reply-To: <CAPH-5w6-2zVQn2iNVP28aOAS_r11rxGYCrioXCR-sX8Ln7_BZQ@mail.gmail.com>
References: <CACPK8XfFF7tNrLjroNA05-c3pMZWFbiKvHq+oFLjBDSkgqfjDw@mail.gmail.com>
 <CAPH-5w6-2zVQn2iNVP28aOAS_r11rxGYCrioXCR-sX8Ln7_BZQ@mail.gmail.com>
From: Xo Wang <xow@google.com>
Date: Tue, 25 Apr 2017 17:30:04 -0700
Message-ID: <CAPH-5w4OS_oT5MMu2kEOUwtOza_LO94vwSH9dZHpVMa_4OA38Q@mail.gmail.com>
Subject: Re: Switching to 4.10
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>, 
 Edward James <eajames@us.ibm.com>
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
X-List-Received-Date: Wed, 26 Apr 2017 00:30:10 -0000

On Tue, Apr 25, 2017 at 4:57 PM, Xo Wang <xow@google.com> wrote:
> Hi Joel,
>
> On Thu, Apr 20, 2017 at 7:30 PM, Joel Stanley <joel@jms.id.au> wrote:
>> Hello team,
>>
>> I want to make the 4.10 change happen. We don't have the resource to
>> be maintaining two trees, and the 4.10 tree has a whole heap of
>> shinyness - faster network, faster flash access, improved I2C.
>>
>> To this end I will stop merging patches in to 4.7. Please target the
>> 4.10 tree from here on.
>>
>> Use this thread to discuss concerns and coordinate the work that needs
>> to be done. Bits that I'm aware of
>>
>>  - Eddie is updating userspace to the new FSI APIs
>>  - I need to merge the upstream FSI patchset
>>  - Brednan needs to post the lastest version of the i2c patchset which
>> I will merge
>>  - I need to merge benh's ftgmac100 improvements
>
> We'll need to update the defconfig in the build system. Currently if I
> compile the kernel and generate a new defconfig (make savedefconfig),
> I see the following changes in the 4.10 generated defconfig:
>
> @@ -73,7 +73,6 @@
>  CONFIG_MTD_BLOCK=y
>  CONFIG_MTD_PARTITIONED_MASTER=y
>  CONFIG_MTD_SPI_NOR=y
> -CONFIG_ASPEED_FLASH_SPI=y
>  CONFIG_MTD_UBI=y
>  CONFIG_MTD_UBI_FASTMAP=y
>  CONFIG_MTD_UBI_BLOCK=y
> @@ -116,7 +115,6 @@
>  # CONFIG_SERIO is not set
>  # CONFIG_VT is not set
>  CONFIG_LEGACY_PTY_COUNT=4
> -# CONFIG_DEVKMEM is not set
>  CONFIG_SERIAL_8250=y
>  # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
>  CONFIG_SERIAL_8250_CONSOLE=y
> @@ -131,10 +129,8 @@
>  CONFIG_I2C=y
>  CONFIG_I2C_CHARDEV=y
>  CONFIG_I2C_ASPEED=y
> -CONFIG_SENSORS_MAX31785=y
>  CONFIG_SENSORS_LM75=y
>  CONFIG_SENSORS_NCT7904=y
> -CONFIG_SENSORS_POWER8_OCC_I2C=y
>  CONFIG_PMBUS=y
>  CONFIG_SENSORS_ADM1275=y
>  CONFIG_SENSORS_UCD9000=y
> @@ -143,21 +139,14 @@
>  # CONFIG_USB_SUPPORT is not set
>  CONFIG_NEW_LEDS=y
>  CONFIG_LEDS_CLASS=y
> -CONFIG_LEDS_GPIO=y
>  CONFIG_LEDS_TRIGGERS=y
>  CONFIG_LEDS_TRIGGER_TIMER=y
>  CONFIG_LEDS_TRIGGER_HEARTBEAT=y
> -CONFIG_LEDS_TRIGGER_GPIO=y
>  CONFIG_RTC_CLASS=y
>  CONFIG_RTC_DRV_DS1307=y
>  CONFIG_RTC_DRV_ASPEED=y
>  CONFIG_MAILBOX=y
> -CONFIG_ASPEED_MBOX=y
>  # CONFIG_IOMMU_SUPPORT is not set
> -CONFIG_FSI=y
> -CONFIG_FSI_MASTER_GPIO=y
> -CONFIG_FSI_SCOM=y
> -CONFIG_FSI_I2C=y
>  CONFIG_FIRMWARE_MEMMAP=y
>  CONFIG_FANOTIFY=y
>  CONFIG_AUTOFS4_FS=y
>
>>
>> Cheers,
>>
>> Joel
>
> I know that CONFIG_ASPEED_FLASH_SPI is now CONFIG_SPI_ASPEED_SMC, but
> I've yet to look at each of the other differences.
>
> cheers
> xo

OK, I guess it's not that much work to look at those configs. This
seems to work up to the limit of the missing FSI drivers as previously
mentioned:

--- a/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc/defconfig
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc/defconfig
@@ -73,7 +73,7 @@ CONFIG_MTD_CMDLINE_PARTS=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_PARTITIONED_MASTER=y
 CONFIG_MTD_SPI_NOR=y
-CONFIG_ASPEED_FLASH_SPI=y
+CONFIG_SPI_ASPEED_SMC=y
 CONFIG_MTD_UBI=y
 CONFIG_MTD_UBI_FASTMAP=y
 CONFIG_MTD_UBI_BLOCK=y
@@ -116,7 +116,6 @@ CONFIG_INPUT_EVDEV=y
 # CONFIG_SERIO is not set
 # CONFIG_VT is not set
 CONFIG_LEGACY_PTY_COUNT=4
-# CONFIG_DEVKMEM is not set
 CONFIG_SERIAL_8250=y
 # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
 CONFIG_SERIAL_8250_CONSOLE=y
@@ -131,10 +130,11 @@ CONFIG_ASPEED_BT_IPMI_BMC=y
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_ASPEED=y
-CONFIG_SENSORS_MAX31785=y
+CONFIG_GPIOLIB=y
+CONFIG_GPIO_SYSFS=y
+CONFIG_GPIO_ASPEED=y
 CONFIG_SENSORS_LM75=y
 CONFIG_SENSORS_NCT7904=y
-CONFIG_SENSORS_POWER8_OCC_I2C=y
 CONFIG_PMBUS=y
 CONFIG_SENSORS_ADM1275=y
 CONFIG_SENSORS_UCD9000=y
@@ -152,12 +152,8 @@ CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_DS1307=y
 CONFIG_RTC_DRV_ASPEED=y
 CONFIG_MAILBOX=y
-CONFIG_ASPEED_MBOX=y
+CONFIG_ASPEED_LPC_MBOX=y
 # CONFIG_IOMMU_SUPPORT is not set
-CONFIG_FSI=y
-CONFIG_FSI_MASTER_GPIO=y
-CONFIG_FSI_SCOM=y
-CONFIG_FSI_I2C=y
 CONFIG_FIRMWARE_MEMMAP=y
 CONFIG_FANOTIFY=y
 CONFIG_AUTOFS4_FS=y

cheers
xo
