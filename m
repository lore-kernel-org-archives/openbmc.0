Return-Path: <xow@google.com>
Received: from mail-qk0-x22c.google.com (mail-qk0-x22c.google.com
 [IPv6:2607:f8b0:400d:c09::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wCKs32BfCzDq7Z
 for <openbmc@lists.ozlabs.org>; Wed, 26 Apr 2017 09:57:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="JsvyKAIs"; 
 dkim-atps=neutral
Received: by mail-qk0-x22c.google.com with SMTP id y63so129760348qkd.1
 for <openbmc@lists.ozlabs.org>; Tue, 25 Apr 2017 16:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=eYp7ZJ3ZVAvQxrUCS2KvxeH3cVUtU06x4WGS7TlPxXg=;
 b=JsvyKAIsuZIcsW+w0Ibh0m/5AnoA1ez+3IrRQL4r28ZFQiQfgf/efZBosgToBZHWrY
 N4Rzd4rIwSomcwuLc359FSetpOfsc/LrY9V+I6rk52jbHdkmHiRFoPuJahOfjx1V6dcO
 XKIDJ1iU1r4A10da+WzEULvFiqi3as+PfYVJ9eGRRefosA+efcMYTkbpMOlb9Xt+/hy9
 AJ5oXlxKTrazbeztmSucOlDZhMfb8nww3g3ShQsMkIBtjP4RAdJaPZMKNkkIEauD4XV2
 MePMYZftVfirh8gcnpC/GK/I5dxAo+0cSjspr0jrSlZyq8otVxAH/5J5jjmul3cCgN5o
 TxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=eYp7ZJ3ZVAvQxrUCS2KvxeH3cVUtU06x4WGS7TlPxXg=;
 b=PAkMjZbSiDqFfncuLfq8GqDBZt0G2vcc4kEwAbAkWRAzIsBcxslb8IX/aJkRQbVFtQ
 ftUOYLWimDIxYEGraL8rvuvUWbAYXlD+YHsWjxnmBBzu1+2/zMvmwaJP1VuSBZG+qqSQ
 plETqHqZmvXkbeTE66Nr1ric03yuKUsELxC0kH1UAbovdPZKAc1YARzxtgYWbKMbxBr7
 j8K7tVKcjvVrt3OLByApymoQGDVje65vCvynBvQi0fUfjuDRpd0XMfvY6rg1F/NqotFe
 sy09D4GKeOiQ6ZufI5Tap5V/FNZtdv2COnGOPaepl2z88e2EJ2VjTk8Q0JEwUHeNFACV
 dltw==
X-Gm-Message-State: AN3rC/5vMJwY5ZCWbcmPGgJhy70DuVsaT1JLvoUxpiHgKkFU9xLIiw78
 V3+BbhBl6Zw6NzGPeXBXAz9+1hCLFOHF
X-Received: by 10.55.3.13 with SMTP id 13mr9900332qkd.300.1493164660343; Tue,
 25 Apr 2017 16:57:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.73 with HTTP; Tue, 25 Apr 2017 16:57:39 -0700 (PDT)
In-Reply-To: <CACPK8XfFF7tNrLjroNA05-c3pMZWFbiKvHq+oFLjBDSkgqfjDw@mail.gmail.com>
References: <CACPK8XfFF7tNrLjroNA05-c3pMZWFbiKvHq+oFLjBDSkgqfjDw@mail.gmail.com>
From: Xo Wang <xow@google.com>
Date: Tue, 25 Apr 2017 16:57:39 -0700
Message-ID: <CAPH-5w6-2zVQn2iNVP28aOAS_r11rxGYCrioXCR-sX8Ln7_BZQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 25 Apr 2017 23:57:44 -0000

Hi Joel,

On Thu, Apr 20, 2017 at 7:30 PM, Joel Stanley <joel@jms.id.au> wrote:
> Hello team,
>
> I want to make the 4.10 change happen. We don't have the resource to
> be maintaining two trees, and the 4.10 tree has a whole heap of
> shinyness - faster network, faster flash access, improved I2C.
>
> To this end I will stop merging patches in to 4.7. Please target the
> 4.10 tree from here on.
>
> Use this thread to discuss concerns and coordinate the work that needs
> to be done. Bits that I'm aware of
>
>  - Eddie is updating userspace to the new FSI APIs
>  - I need to merge the upstream FSI patchset
>  - Brednan needs to post the lastest version of the i2c patchset which
> I will merge
>  - I need to merge benh's ftgmac100 improvements

We'll need to update the defconfig in the build system. Currently if I
compile the kernel and generate a new defconfig (make savedefconfig),
I see the following changes in the 4.10 generated defconfig:

@@ -73,7 +73,6 @@
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_PARTITIONED_MASTER=y
 CONFIG_MTD_SPI_NOR=y
-CONFIG_ASPEED_FLASH_SPI=y
 CONFIG_MTD_UBI=y
 CONFIG_MTD_UBI_FASTMAP=y
 CONFIG_MTD_UBI_BLOCK=y
@@ -116,7 +115,6 @@
 # CONFIG_SERIO is not set
 # CONFIG_VT is not set
 CONFIG_LEGACY_PTY_COUNT=4
-# CONFIG_DEVKMEM is not set
 CONFIG_SERIAL_8250=y
 # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
 CONFIG_SERIAL_8250_CONSOLE=y
@@ -131,10 +129,8 @@
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_ASPEED=y
-CONFIG_SENSORS_MAX31785=y
 CONFIG_SENSORS_LM75=y
 CONFIG_SENSORS_NCT7904=y
-CONFIG_SENSORS_POWER8_OCC_I2C=y
 CONFIG_PMBUS=y
 CONFIG_SENSORS_ADM1275=y
 CONFIG_SENSORS_UCD9000=y
@@ -143,21 +139,14 @@
 # CONFIG_USB_SUPPORT is not set
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
-CONFIG_LEDS_GPIO=y
 CONFIG_LEDS_TRIGGERS=y
 CONFIG_LEDS_TRIGGER_TIMER=y
 CONFIG_LEDS_TRIGGER_HEARTBEAT=y
-CONFIG_LEDS_TRIGGER_GPIO=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_DS1307=y
 CONFIG_RTC_DRV_ASPEED=y
 CONFIG_MAILBOX=y
-CONFIG_ASPEED_MBOX=y
 # CONFIG_IOMMU_SUPPORT is not set
-CONFIG_FSI=y
-CONFIG_FSI_MASTER_GPIO=y
-CONFIG_FSI_SCOM=y
-CONFIG_FSI_I2C=y
 CONFIG_FIRMWARE_MEMMAP=y
 CONFIG_FANOTIFY=y
 CONFIG_AUTOFS4_FS=y

>
> Cheers,
>
> Joel

I know that CONFIG_ASPEED_FLASH_SPI is now CONFIG_SPI_ASPEED_SMC, but
I've yet to look at each of the other differences.

cheers
xo
