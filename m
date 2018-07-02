Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::229; helo=mail-vk0-x229.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="f4l7Gz1R"; 
 dkim-atps=neutral
Received: from mail-vk0-x229.google.com (mail-vk0-x229.google.com
 [IPv6:2607:f8b0:400c:c05::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41KF3P2jMlzF1LR
 for <openbmc@lists.ozlabs.org>; Tue,  3 Jul 2018 03:43:29 +1000 (AEST)
Received: by mail-vk0-x229.google.com with SMTP id v16-v6so6527273vkd.6
 for <openbmc@lists.ozlabs.org>; Mon, 02 Jul 2018 10:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=YjRtSvqQQ2M1QuOcLHLYQLaR0m+JrjhZHms9kE0HSEs=;
 b=f4l7Gz1Rjfy12Tq4Yvqd+EC65CBoQSTVh6YBYO8uaQ8U5d0nC9eR4aPyWxBWF+o6dh
 2SNsZIyzwes56AwSNj6mWBOnRf6Tj2HIzurVs50Nr74xLTSFSGAzKlWbvYLJS8lvKDgz
 NH9CwE1vDyAcgTeByFwyO8vvVNAAdvzopD8Vjb1JTYu/z4b1JZs+niJ0AePCjKtezg/5
 V8RNKXGmbKTmXvo77eq0yIT5Kc4f7xZW/8LeLSZ/9syU7Xva511tX+OU4mI24/vgKL0z
 NUZnybAvmsR5k2kbCM0IRpHbKWG1UtCjOHddRlM3/beGJqXLObcLbHwBI1n0zCKZhKiX
 JUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=YjRtSvqQQ2M1QuOcLHLYQLaR0m+JrjhZHms9kE0HSEs=;
 b=cRIGEwFLvTqDzHJk56hNJ2+KdHe9m4NlG8/Dee15B0B5Ic6QndK9SI6tsopciO0Z0S
 oJdzYU6m7IorS0729+i5U/NIdp0Pwk/Oqac8pmtVCFiWPFiQmkDQYvPYrgo77EYPZCS8
 RUMuysPb5849qUdk2HZfzEv+RuqY0ZUElhx+tAJ5n9dKnxjSbxgHlAVtj1zSdEZinwTm
 CDLPoQd0tDpgQrVhf/hgUZBbfcShGjquighznXhkR+i+oieqMpP06+youvviuQcQEyEx
 JpJ29cQ5oOkkwQtZCX7kNnQe3IzFn4orm7op2GShqDzwvTnW6DVob+sm7uVatvGZE4CC
 sdIg==
X-Gm-Message-State: APt69E0uqq7K75OcoPLSnbDc6Wyv3HANOy4Eaxbyb4vwVu7IF7MBp5fj
 Wbjb4pP3xYmh/SAJkx7o07iHVCMPIz5b2kKXrVpdbQ==
X-Google-Smtp-Source: AAOMgpdJq2MIKmbsWdvkppnm+bTzAfHgy1osylhlSQRxgFD25xzYvEkL9FnQc0L8MNOGSHMG+ctEAlhLpcfVr88K6Sc=
X-Received: by 2002:a1f:41d4:: with SMTP id
 o203-v6mr15354542vka.149.1530553406482; 
 Mon, 02 Jul 2018 10:43:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1f:9b90:0:0:0:0:0 with HTTP;
 Mon, 2 Jul 2018 10:43:05 -0700 (PDT)
In-Reply-To: <CAO=notwqK=XXFgrzLqhPph2M8gddRnPeR5aL-b-iE7SiVN8L_Q@mail.gmail.com>
References: <CAO=notzW-7ffufai7uSQ8FtMvJrGT56F18TM5zm7L9+opFKb0Q@mail.gmail.com>
 <CACPK8XfhTdg8NCpvBbgGev1o9oa0f7+RYhYvXzSs5Mr_b7=AsA@mail.gmail.com>
 <CAO=notyxfpzqQ0W2QOGWdtgoyC+Q3jQFA1=0sGmax43x-DQ--g@mail.gmail.com>
 <CAO=notzyNqcWhTcYtqJje6erO3vx3_taS3DJHryTkqVQPRbt+g@mail.gmail.com>
 <CAO=notytH5apNSzwkbdSffWrn6heubeZBVJrw75M4fz4gXKjgQ@mail.gmail.com>
 <CAO=notwqK=XXFgrzLqhPph2M8gddRnPeR5aL-b-iE7SiVN8L_Q@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 2 Jul 2018 10:43:05 -0700
Message-ID: <CAO=notx7qEr=zKW39zCj_1g8u6cXuFp6ptW17iQ4ONmApNCiAA@mail.gmail.com>
Subject: Re: Merging up to OpenBMC v2.2 from v2.1 - boot problem, invalid
 ramdisk format
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 02 Jul 2018 17:43:30 -0000

https://github.com/openbmc/u-boot/commit/e4c85cd4de96bfdff7b614731a044db11815ff0c

Looks like this is the patch we need in our downstream u-boot! :D

On Mon, Jul 2, 2018 at 10:39 AM, Patrick Venture <venture@google.com> wrote:
> On Mon, Jul 2, 2018 at 10:14 AM, Patrick Venture <venture@google.com> wrote:
>> On Mon, Jul 2, 2018 at 10:13 AM, Patrick Venture <venture@google.com> wrote:
>>> On Thu, Jun 28, 2018 at 7:33 AM, Patrick Venture <venture@google.com> wrote:
>>>> On Wed, Jun 27, 2018 at 6:30 PM, Joel Stanley <joel@jms.id.au> wrote:
>>>>> On 27 June 2018 at 01:49, Patrick Venture <venture@google.com> wrote:
>>>>>
>>>>>> Hit any key to stop autoboot:  0
>>>>>> libfdt fdt_path_offset() returned FDT_ERR_NOTFOUND
>>>>>> ## Loading kernel from FIT Image at 20080000 ...
>>>>>>    Using 'conf@aspeed-bmc-quanta-q71l.dtb' configuration
>>>>>>    Trying 'kernel@1' kernel subimage
>>>>>>      Description:  Linux kernel
>>>>>>      Type:         Kernel Image
>>>>>>      Compression:  uncompressed
>>>>>>      Data Start:   0x20080124
>>>>>>      Data Size:    1723192 Bytes = 1.6 MiB
>>>>>>      Architecture: ARM
>>>>>>      OS:           Linux
>>>>>>      Load Address: 0x40008000
>>>>>>      Entry Point:  0x40008000
>>>>>>      Hash algo:    sha1
>>>>>>      Hash value:   95ed76c9361d9f6f991a6a859a06eb7626af80df
>>>>>>    Verifying Hash Integrity ... sha1+ OK
>>>>>> Wrong Ramdisk Image Format
>>>>>> Ramdisk image is corrupt or invalid
>>>>>> """
>>>>>>
>>>>>> I figured I'd reach out first as I'm sure this will be familiar to someone :D
>>>>>
>>>>> This is due to a change Brad made to the u-boot setup. If you change
>>>>> your bootcmd to simply be 'bootm 20080000' you might be fine.
>>>>
>>>> Thanks, I'll give that a try tomorrow morning!
>>>
>>> Joel, that worked.  Running "bootm 20080000" from the ast uboot
>>> command line got it to boot.
>>
>>  ast# fdt print /configurations/conf@1
>>  libfdt fdt_path_offset() returned FDT_ERR_NOTFOUND
>>
>>  ast# fdt list
>>  / {
>>          timestamp = <0x5b3a5087>;
>>          description = "U-Boot fitImage for gBMC (OpenBMC + Google
>>  customizations)/4.13.16+gitAUTOINC+d5c7e19b10+.quanta-4.13-testing.+/quanta";
>>          #address-cells = <0x00000001>;
>>          images {
>>          };
>>          configurations {
>>          };
>>  };
>>
>> I checked our u-boot patches and didn't see anything that was
>> different -- Brad, presumably this is something you can speak to?
>> At first glance, I can just write a u-boot patch that changes the
>> CONFIG_BOOTCOMMAND, but I imagine it's not creating the configuration
>> or it's not writing it where it should and that's the real issue.
>
> When I built from openbmc v2.2 pure:
>
> ast# print env
> ## Error: "env" not defined
> ast# printenv
> baudrate=115200
> bootargs=console=ttyS4,115200n8 root=/dev/ram rw
> bootcmd=bootm 20080000
> bootdelay=2
> ethact=aspeednic#0
> spi_dma=yes
> stderr=serial
> stdin=serial
> stdout=serial
> verify=yes
>
> Environment size: 204/65531 bytes
>
> ast# fdt addr 20080000
> ast# fdt list
> / {
> timestamp = <0x5b3a5f75>;
> description = "U-Boot fitImage for Phosphor OpenBMC (Phosphor OpenBMC
> Project Reference Distro)/4.13.16+gitAUTOINC+158c8e15d5/quanta-q71l";
> #address-cells = <0x00000001>;
> images {
> };
> configurations {
> };
> };
> ast# fdt print /configurations/conf@1
> libfdt fdt_path_offset() returned FDT_ERR_NOTFOUND
>
>>
>>>>
>>>>>
>>>>> Cheers,
>>>>>
>>>>> Joel
