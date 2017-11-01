Return-Path: <raltherr@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::231; helo=mail-vk0-x231.google.com;
 envelope-from=raltherr@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="rzMfqui4"; 
 dkim-atps=neutral
Received: from mail-vk0-x231.google.com (mail-vk0-x231.google.com
 [IPv6:2607:f8b0:400c:c05::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yRwCB47y6zDr4H
 for <openbmc@lists.ozlabs.org>; Thu,  2 Nov 2017 04:27:33 +1100 (AEDT)
Received: by mail-vk0-x231.google.com with SMTP id t184so1878747vka.6
 for <openbmc@lists.ozlabs.org>; Wed, 01 Nov 2017 10:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=mzY45OrBSNtJHmyWLaW0RxeHxQiqmjdRTX7xFancuOY=;
 b=rzMfqui4t6GP7eM2x3Oq80+3LZYQWIV1HWmlTCkHlUnmtaVijuMNX8g+cwU8L7oVD0
 CFXLlJentg2wLZ8Y5HT81GKygS00Zsp7gH9VFQn4IZMwsS1GrKHW5HX3pKZx8Gmb5YBu
 YXTSnf3cfdSTD/VbGTeu5I4yrLLdpaDf2kV71XIBRa1CHUqY+ZyVEx8bQkSt0srZNbZu
 TTOj4bAjOriuOT9gKSDhvXQMfv/4tMuDf+KzPV0eMPh91PVE3g7OyZQhAwKCSoT5Iy3z
 0m+OgvCMl0gRSXQBH/KVYeABsBVHpjQfqNXt+vTr2M/77bu7ZQdqyT+OaqNSbZIruM/6
 TceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=mzY45OrBSNtJHmyWLaW0RxeHxQiqmjdRTX7xFancuOY=;
 b=BaZzmB48tXTMjiGGAwpeCDectrY1NTLEEBgMXfsvnZaSTVGy3jcD0dJdRmAqXtnx2T
 YYMuxjYT1G05PJ38+IT0bfl3IeARxH/p8ECkHOd0U3Awt4tbSVZfh9PFbnPPrOWiy1KC
 f9NpXyR5UyDsbE3cWfMwSeKCuEQyF2W+ytw+g19P6ImnufLZtdAMFp89RosLc9Q9E44i
 rbcLzFqU8kGP5zF6FKmgHCYiYQ1iZA5R3k17hWTA1/4yp1XT+EztX2+1MvDTStEevcZl
 DR//46Q6xCI2YLpuDGYn/mYBl9+HSfoB55ESUw/dan/5HetmwHJwmVa8s8x3qNF48dk0
 wXpg==
X-Gm-Message-State: AMCzsaUSkZqdsNV3tu8f6ODgbxKZX4qm84V3si2KZeUuLqnNGTf/Qo8b
 /fdYwvoikiA6rJ2+AEylRc/Po9R7g33fRnb07hsDIA==
X-Google-Smtp-Source: ABhQp+Tm0GgTgrK9pHJF1TUUB3mkeBc8eYyeC0YscesPiIAUcM1mEfXVZZKj8inS/dbvgvj1vk8ZpnvOLvbYC/noTRU=
X-Received: by 10.31.235.3 with SMTP id j3mr494331vkh.66.1509557249093; Wed,
 01 Nov 2017 10:27:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.70.4 with HTTP; Wed, 1 Nov 2017 10:27:28 -0700 (PDT)
In-Reply-To: <000201d35330$e30fde80$a92f9b80$@linux.intel.com>
References: <001801d34c20$e670c150$b35243f0$@linux.intel.com>
 <29EB010F-5573-46E9-852B-60F084F50995@fuzziesquirrel.com>
 <000001d35265$080b01f0$182105d0$@linux.intel.com>
 <CAPLgG=kQwmnfc-HmWC-7zkN8L8o-xip6p3Kvmm4OWBozH37ppQ@mail.gmail.com>
 <000301d35292$42d1b9a0$c8752ce0$@linux.intel.com>
 <CAPLgG==RZi1hV_m-+aw5fo4Wq_3OQLbddtY=ySJj-a50WNgTwA@mail.gmail.com>
 <000201d35330$e30fde80$a92f9b80$@linux.intel.com>
From: Rick Altherr <raltherr@google.com>
Date: Wed, 1 Nov 2017 10:27:28 -0700
Message-ID: <CAPLgG=nCHPU6njdyuhRvmMnAuaF5tBkUuYScHn0mWECv9xtvmQ@mail.gmail.com>
Subject: Re: PECI API?
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, ed.tanous@linux.intel.com, 
 james.feist@linux.intel.com
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
X-List-Received-Date: Wed, 01 Nov 2017 17:27:35 -0000

On Wed, Nov 1, 2017 at 9:45 AM, Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>>>>> On Tue, Oct 31, 2017 at 9:26 AM, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>>>>>>> On Oct 23, 2017, at 1:03 PM, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>>>>>>>
>>>>>>> Hi Dave,
>>>>>>>
>>>>>>> I'm currently working on PECI kernel driver
>>>>>>
>>>>>> I'm curious about the high level structure.  I'm sure others are as well.
>>>>>> Anything you can share would be informative and appreciated!
>>>>>>
>>>>>> A couple questions that popped into my head:
>>>>>>
>>>>>>  - Would there be a new Linux bus type or core framework for this?
>>>>>>  - How many drivers would there be for a full stack.  Something like this?
>>>>>>      - client? (hwmon, for example)
>>>>>>      - core? (common code)
>>>>>>      - bmc specific implementation? (aspeed, nuvoton, emulated
>>>>>> differences)
>>>>>>  - Have you considered using DT bindings and/or how they would look?
>>>>>>
>>>>>> These questions are motivated by the recent upstreaming experience
>>>>>> with FSI (flexible support interface) where a similar structure was used.
>>>>>> FSI on POWER feels similar to PECI in terms of usage and features
>>>>>> so I thought I'd just throw this out there as a possible reference point to consider.
>>>>>
>>>>> PECI is using single-wired interface which is different from other
>>>>> popular interfaces such as I2C and MTD, and therefore it doesn't
>>>>> have any common core framework in kernel so I'm adding the PECI
>>>>> main contorl driver as an misc type and the other one into hwmon subsystem.
>>>>> The reason why I seperate the implementation into two drivers is,
>>>>> PECI can be used not only for temperature monitoring but also for
>>>>> platform manageability, processor diagnostics and failure analysis,
>>>>> so the misc control driver will be used as a common PECI driver for
>>>>> all those purposes flexibly and the hwmon subsystem driver will use
>>>>> the common PECI driver just for temperature monitoring. These
>>>>> drivers will be BMC specific implementation which support Aspeed
>>>>> shipset only. Support for Nuvoton chipset was not considered in my
>>>>> implementation because Nuvoton has different HW and register
>>>>> scheme, also Nuvoton already has its dedicated driver
>>>>> implementation in hwmon subsystem for their each chipset variant (nct6683.c  nct6775.c  nct7802.c).
>>>>>
>>>>
>>>> Nuvoton is starting to submit support for their Poleg BMC to
>>>> upstream (http://lists.infradead.org/pipermail/linux-arm-kernel/2017-October/538226.html).
>>>> This BMC includes a PECI controller similar to the Aspeed design but
>>>> with a different register layout.  At a minimum, the misc driver
>>>> needs to support multiple backend drivers to allow Nuvoton to
>>>> implement the same interface.  The chips you listed that are already
>>>> in hwmon are for Nuvoton's SuperIOs, not their BMCs.
>>>>
>>>
>>> Thanks for your pointing out of the current Poleg BMC upstreaming. I didn't know about that before.
>>> Ideally, it would be great if we support all BMC PECI controllers in a
>>> single device driver but we should consider some dependencies such as
>>> SCU register setting in bootloader, clock setting for the PECI controller HW block and etc that would vary on each BMC controller chipset.
>>> Usually, these dependencies should be covered by kernel config and device tree settings.
>>> My thought is, each BMC controller should have its own PECI misc
>>> driver then we could selectively enable one by kernel configuration.
>>>
>>
>> Are you expecting each BMC controller's PECI misc driver to re-implement the device ioctls?
>> If I assume the misc device and ioctl implementation are shared, I can't see how adding a subsystem would be significantly more work.
>> Doing so would clarify what the boundaries are between controller implementation and protocol behavior.
>>
>
> Okay, I agreed. That is reasonable concern. At least, if possible, we should provide compatible
> ioctl set. I'll check its feasibility after getting Nuvoton's datasheet and their SDK.
>
>>>>>>> and hwmon driver implementation. The kernel driver would provide these PECI commands as ioctls:
>>>>>>>
>>>>>>> - low-level PECI xfer command
>>>>>>
>>>>>> Would a separate 'dev' driver similar to i2c-dev make sense here?  Just thinking out loud.
>>>>>>
>>>>>
>>>>> Yes, drivers will be seperated into two but it's hard to say that this way is similar to i2c-dev.
>>>>> It would have a bit different shape.
>>>>>
>>>>
>>>> I'm not terribly familiar with the PECI protocol.  I'll see about getting a copy of the spec.
>>>> From what I can find via searches, it looks like individual nodes on the bus are addressed similar to I2C.
>>>> I'd expect that to be similar to how i2c-dev is structured: a
>>>> kobject per master and a kobject per address on the bus.  That way,
>>>> drivers can be bound to individual addresses. The misc driver would focus on exposing interacting with a specific address on the bus in a generic fashion.
>>>>
>>>
>>> As you said, it would be very useful if kernel has core bus framework
>>> like I2C, but current kernel doesn't have the core bus framework for
>>> PECI, and it would be a hugh project itself if we are going to implement one.
>>
>> Really?  IBM did so for FSI and it really helped with understanding the design.
>>
>
> Yes, IBM did really great work on FSI, Kudos to them.
>
>>> Generally, PECI bus topology is very simple unlike I2C. Usually in a
>>> single system, there is only one BMC controller and it has connections
>>> with CPUs, that's all. I don't see an advantage of using core bus framework on this simple interface.
>>>
>>
>> Ideally, an hwmon driver for PECI on an Intel CPU only needs to know how to issue PECI commands to that device.
>> What address it is at and how the bus delivers the command to the node are irrelevant details.
>> How do you plan to describe the PECI bus in a dts?
>> Can I use the same dt bindings for the Intel CPU's PECI interface for both Aspeed and Nuvoton?
>>
>
> HW dependent parameters will be added into dts. All SoCs has its own dt binding set so it couldn't
> be shared between Aspeed and Nuvoton.
>

Each PECI controller will have HW dependent parameters for sure.  I
was asking about PECI endpoints such as the CPUs themselves.  How can
I decouple the dts describing a Xeon 6152 on the PECI bus (and the
corresponding driver) from the controller details?

>>>>>>> - Ping()
>>>>>>> - GetDIB()
>>>>>>> - GetTemp()
>>>>>>> - RdPkgConfig()
>>>>>>> - WrPkgConfig()
>>>>>>> - RdIAMSR()
>>>>>>> - RdPCIConfigLocal()
>>>>>>> - WrPCIConfigLocal()
>>>>>>> - RdPCIConfig()
>>>>>>>
>>>>>>> Also, through the hwmon driver, these temperature monitoring features would be provided:
>>>>>>>
>>>>>>> - Core temperature
>>>>>>> - DTS thermal margin (hysteresis)
>>>>>>> - DDR DIMM temperature
>>>>>>> - etc.
>>>>>>
>>>>>> Sweet!
>>>>>>
>>>>>>>
>>>>>>> Patches will come in to upstream when it is ready.
>>>>>>>
>>>>>>> Cheers,
>>>>>>> Jae
>>>>>>
>>>>>> For completeness, a port of the Aspeed SDK PECI driver was proposed in 2016 but it didn't go anywhere:
>>>>>>
>>>>>> https://lists.ozlabs.org/pipermail/openbmc/2016-August/004381.html
>>>>>>
>>>>>> thx - brad
>>>>>>
>>>>>
>>>>> My implementation is also heavily based on the Aspeed SDK driver
>>>>> but modified a lot to provide more suitable functionality for openbmc project. Hopefully, it could be introduced soon.
>>>>>
>>>>> thx,
>>>>> Jae
>>>
>
