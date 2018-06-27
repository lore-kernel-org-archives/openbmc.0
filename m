Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::241; helo=mail-ua0-x241.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="f5j8XujG"; 
 dkim-atps=neutral
Received: from mail-ua0-x241.google.com (mail-ua0-x241.google.com
 [IPv6:2607:f8b0:400c:c08::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41GG2l2HbVzF1Dg
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jun 2018 07:17:34 +1000 (AEST)
Received: by mail-ua0-x241.google.com with SMTP id v15-v6so2182335ual.11
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jun 2018 14:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=H7yO915jIISVgzTkKUub9PvKTH51naOMvCwq17EX1cg=;
 b=f5j8XujG6DlkIHKTE/CxZYyZp8/27t4xRSsXiQaE70btT/PSdzRQ0uvRUVkj9OoXES
 RgI9PV/yVExCXZ0JBuSbGrdZrKy0RWdCHcaO7HktmQiHv9jHpyYFDiV4Ep22arbQotl7
 GKo/4Pj5pHTO3XNK4tObMDhjimw2XyoVpRHsQYyLgjiQbxI1KIWfMok98rzSxuEUDq1+
 YTG7AXx/NAE1Y18C7rAfpuOTZYswgnBoM3sOBJ61JIxJrJ4cUFSLxONfRUU0IE4LsR9h
 GmmUuKX6H9WZ0sIF1uK56kqcvuZ7ezR9cyDe+10osJnI1VlN1X5KFDN1XtCM8s0w3x64
 SbJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=H7yO915jIISVgzTkKUub9PvKTH51naOMvCwq17EX1cg=;
 b=m7eXHVf1xoZwysOVDqr4LPidHVGbw+ggLmefwmTf7lLJ3ODrPEVBIqRSRvvxTt5PGD
 7sLwjQeoB/0gO1KUhQ4ZplA4xETrJVP6w7UkryX736fCLhy5IVCeepkL6dU491eqE0jh
 zGNPMsjALguQhLmNPUU5r63C01QPgxOC/c0kTcRqFTkUkNjeeCQxvklLTaOCJVgPZUXH
 KBq02MYb8wGgEG4Qs3qVks96OOkG7Xh263S4IVwqhdR0XU9psadlSqK7MYAxxogU5Bvr
 drJOEhflcoY4ee9t4Ygx4HMwA9/+u+AyTHyGSCOQrWKREhVqxXiNtAoObli2ca3cJEN5
 WqrA==
X-Gm-Message-State: APt69E0I8RlO14PXzAhonIzh1abmHbMz1yBBQ25mlvLDNqoYXeasL+FX
 W8OjA8R7k+8YIp50wqnP2ovfzDatxSxKXg6eLZlGAQ==
X-Google-Smtp-Source: AAOMgpdgiy4a6mYhm5xpMSuFcD83DLmI28GtP1401IdeoTQb5zAhfdbKnmg362jZVKzpwkOCF1WHp1a8/Z7tiTeXxEU=
X-Received: by 2002:ab0:1251:: with SMTP id
 s17-v6mr4565819uac.37.1530134247258; 
 Wed, 27 Jun 2018 14:17:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1f:9b90:0:0:0:0:0 with HTTP; Wed, 27 Jun 2018 14:17:06
 -0700 (PDT)
In-Reply-To: <CAO=notz5Gjm2my0chpxmLbPGAJDftRB65VSYgQSRRaYbr8WRtg@mail.gmail.com>
References: <CAO=notzW-7ffufai7uSQ8FtMvJrGT56F18TM5zm7L9+opFKb0Q@mail.gmail.com>
 <1530061800.2502410.1421595168.7609B886@webmail.messagingengine.com>
 <CAO=notwv8DYt7aR=6rOVOFvyA_CkrGgT31XG4A+KrDqyF55shw@mail.gmail.com>
 <CAO=notz5Gjm2my0chpxmLbPGAJDftRB65VSYgQSRRaYbr8WRtg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 27 Jun 2018 14:17:06 -0700
Message-ID: <CAO=notwFtf7PDCix-Yqwe2hT7MoruR4eA2EGwxke90QeaO0y7Q@mail.gmail.com>
Subject: Re: Merging up to OpenBMC v2.2 from v2.1 - boot problem, invalid
 ramdisk format
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jun 2018 21:17:36 -0000

On Wed, Jun 27, 2018 at 8:39 AM, Patrick Venture <venture@google.com> wrote=
:
> On Wed, Jun 27, 2018 at 7:38 AM, Patrick Venture <venture@google.com> wro=
te:
>> On Tue, Jun 26, 2018 at 6:10 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>>> On Wed, 27 Jun 2018, at 01:49, Patrick Venture wrote:
>>>> I assume this is just a recipe change such that I need to now specify
>>>> something -- with OpenBMC v2.1 I see:
>>>>
>>>> """
>>>> U-Boot 2016.07 (May 24 2018 - 12:55:55 -0700)
>>>>
>>>> DRAM:  120 MiB
>>>> WARNING: Caches not enabled
>>>> Flash: 64 MiB
>>>> *** Warning - bad CRC, using default environment
>>>>
>>>> In:    serial
>>>> Out:   serial
>>>> Err:   serial
>>>> Net:   aspeednic#0
>>>> Error: aspeednic#0 address not set.
>>>>
>>>> Hit any key to stop autoboot:  0
>>>> ## Loading kernel from FIT Image at 20080000 ...
>>>>    Using 'conf@1' configuration
>>>>    Trying 'kernel@1' kernel subimage
>>>>      Description:  Linux kernel
>>>>      Type:         Kernel Image
>>>>      Compression:  uncompressed
>>>>      Data Start:   0x20080128
>>>>      Data Size:    1721352 Bytes =3D 1.6 MiB
>>>>      Architecture: ARM
>>>>      OS:           Linux
>>>>      Load Address: 0x40008000
>>>>      Entry Point:  0x40008000
>>>>      Hash algo:    sha1
>>>>      Hash value:   de140d9d803c22f731c4d99a4250979489383a81
>>>>    Verifying Hash Integrity ... sha1+ OK
>>>> ## Loading ramdisk from FIT Image at 20080000 ...
>>>>    Using 'conf@1' configuration
>>>>    Trying 'ramdisk@1' ramdisk subimage
>>>>      Description:  obmc-phosphor-initramfs
>>>>      Type:         RAMDisk Image
>>>>      Compression:  lzma compressed
>>>>      Data Start:   0x2022ad00
>>>>      Data Size:    1592362 Bytes =3D 1.5 MiB
>>>>      Architecture: ARM
>>>>      OS:           Linux
>>>>      Load Address: unavailable
>>>>      Entry Point:  unavailable
>>>>      Hash algo:    sha1
>>>>      Hash value:   9f6f2feb110e27e07f81bb60bb372b4083672f19
>>>>    Verifying Hash Integrity ... sha1+ OK
>>>> ## Loading fdt from FIT Image at 20080000 ...
>>>>    Using 'conf@1' configuration
>>>>    Trying 'fdt@1' fdt subimage
>>>>      Description:  Flattened Device Tree blob
>>>>      Type:         Flat Device Tree
>>>>      Compression:  uncompressed
>>>>      Data Start:   0x20224624
>>>>      Data Size:    26139 Bytes =3D 25.5 KiB
>>>>      Architecture: ARM
>>>>      Hash algo:    sha1
>>>>      Hash value:   37864a4c4a608d5f4e370bbccf93ccbe3e77462d
>>>>    Verifying Hash Integrity ... sha1+ OK
>>>>    Booting using the fdt blob at 0x20224624
>>>>    Loading Kernel Image ... OK
>>>>    Loading Ramdisk to 47213000, end 47397c2a ... OK
>>>>    Loading Device Tree to 47209000, end 4721261a ... OK
>>>>
>>>> Starting kernel ...
>>>> """
>>>>
>>>> With v2.2 I see:
>>>> """
>>>> U-Boot 2016.07 (Jun 25 2018 - 10:07:57 -0700)
>>>>
>>>> DRAM:  120 MiB
>>>> WARNING: Caches not enabled
>>>> Flash: 64 MiB
>>>> *** Warning - bad CRC, using default environment
>>>>
>>>> In:    serial
>>>> Out:   serial
>>>> Err:   serial
>>>> Net:   aspeednic#0
>>>> Error: aspeednic#0 address not set.
>>>>
>>>> Hit any key to stop autoboot:  0
>>>> libfdt fdt_path_offset() returned FDT_ERR_NOTFOUND
>>>
>>> From below it looks like u-boot finds the kernel in the FIT, but your r=
amdisk is "corrupt". The error above suggests something is missing from the=
 FIT. Can you check the initrd/ramdisk node in your FIT to make sure it is =
present and uses all the correct options and paths with respect to the init=
rd you intended to package?
>>
>> I'll take a look -- one thought I had last night is that now the
>> kernel config bit above is using the dts -- and IIRC, there have been
>> changes to the flash layout.  So, maybe my device tree being used here
>> is out-of-date or doesn't match what it's expecting now.  I'm still on
>> the 4.7.10 kernel as I haven't had a chance to get the host booted
>> with 4.13 (although that's high on my todo list).
>
> My layout idea didn't pan out -- I'm going to try 4.13 kernel with
> v2.2 openbmc -- I had tried 4.13 with v2.0 and it worked (other than
> the host wouldn't boot).  So, I'm going to give that a quick try so
> I"m at least failing on something up-to-date.

The BMC is able to boot using the 4.13 kernel.  So the issue must be
something incompatible or unhappy.  As a reason to force cycles to get
to 4.13, this will do the trick.

>
>>
>>>
>>> Might also be helpful to provide the content of the .its file.
>>>
>>>> ## Loading kernel from FIT Image at 20080000 ...
>>>>    Using 'conf@aspeed-bmc-quanta-q71l.dtb' configuration
>>>>    Trying 'kernel@1' kernel subimage
>>>>      Description:  Linux kernel
>>>>      Type:         Kernel Image
>>>>      Compression:  uncompressed
>>>>      Data Start:   0x20080124
>>>>      Data Size:    1723192 Bytes =3D 1.6 MiB
>>>>      Architecture: ARM
>>>>      OS:           Linux
>>>>      Load Address: 0x40008000
>>>>      Entry Point:  0x40008000
>>>>      Hash algo:    sha1
>>>>      Hash value:   95ed76c9361d9f6f991a6a859a06eb7626af80df
>>>>    Verifying Hash Integrity ... sha1+ OK
>>>> Wrong Ramdisk Image Format
>>>> Ramdisk image is corrupt or invalid
>>>> """
>>>>
>>>> I figured I'd reach out first as I'm sure this will be familiar to som=
eone :D
>>>>
>>>> Patrick
