Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::243; helo=mail-ua0-x243.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="dBATN2W/"; 
 dkim-atps=neutral
Received: from mail-ua0-x243.google.com (mail-ua0-x243.google.com
 [IPv6:2607:f8b0:400c:c08::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41G6Yb2QhyzDrbK
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jun 2018 01:40:17 +1000 (AEST)
Received: by mail-ua0-x243.google.com with SMTP id u21-v6so1559301uao.0
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jun 2018 08:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=farX09D1/09KyVF/FNFLIm8f3ih99g4lUzQzc/GbqFs=;
 b=dBATN2W/yuOGlVjE2HEAmvYN+NNNFa9VEpGqh/nLB8dr3o10dslDFKRL0QBSbb+e1D
 aWWDpgTsc/BFu2nzOQiit6bRcvzXrEg4+pLyMvjvlMYerWQsWeNN9tkDk9ZJp7tlfn95
 xumwaz897o91HXSp1uUNjnU6RKy5QKL+PID66CTyomfbzJFRIn0efcc/+XpDOMjb6OAu
 vyjlKsaCgiRQP/GNq6EOYp/kWu5FxQeoiz+O66qnbOJX71h7UjvlVR5b3Kd5ExoPkIJP
 U95DmwX0Ko54WeSNIjrErljvQnmi82YxV7j/++uSr5B685AWW7rnpZliqr7PJS2ZbVV1
 VeaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=farX09D1/09KyVF/FNFLIm8f3ih99g4lUzQzc/GbqFs=;
 b=ex12r2KgKgC329Epvf5Fdbs9HSFaswoc5AroBTf44T0v6E5pa4TErVE2z+x8x2ZOaj
 4kqCaXAi3kstoLmia2CGfdTU0GeRlr7J7dtA3S4ZQf+kjQ4FUI4fsuQvCRv+uQ5isWrn
 6gkpbt6kGxszMvrIVLVnijZGCW0RrxlFZL9Mbt1N4/qwAyz7js4q8/qtjKpPIJ7844VU
 F2QDXdz8bQzeMjQ4ZfHcaqHbGapPOlO7mXhhnvs8EPjlE5GnVJgcl7eLGfJv4/mf8Pl/
 x2y6aWP5uxUZ+1x5FkKncNpc6kXEV7exgI4Bc+SiDgPn7+knp6A33K+dSn8xfG8umn1E
 OhSw==
X-Gm-Message-State: APt69E3N4V4goMny7g8Izimg+C7zW3eEg9xVA908nnF347ouxiVTn1K0
 enM1jIVl1khf6o/gEDyVQvA22ZGnnaGMdNwv0NzLJP8v
X-Google-Smtp-Source: AAOMgpeCQQP/+3SV/A0INk/tvKRl9aUVFKYT76YC+j3O307Rb0YxZESJu6cX9DTcD6DlP0Tb3NnVzi3y7G3NrqoXiic=
X-Received: by 2002:a9f:3806:: with SMTP id p6-v6mr3786618uad.15.1530114015592; 
 Wed, 27 Jun 2018 08:40:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1f:9b90:0:0:0:0:0 with HTTP; Wed, 27 Jun 2018 08:39:55
 -0700 (PDT)
In-Reply-To: <CAO=notwv8DYt7aR=6rOVOFvyA_CkrGgT31XG4A+KrDqyF55shw@mail.gmail.com>
References: <CAO=notzW-7ffufai7uSQ8FtMvJrGT56F18TM5zm7L9+opFKb0Q@mail.gmail.com>
 <1530061800.2502410.1421595168.7609B886@webmail.messagingengine.com>
 <CAO=notwv8DYt7aR=6rOVOFvyA_CkrGgT31XG4A+KrDqyF55shw@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 27 Jun 2018 08:39:55 -0700
Message-ID: <CAO=notz5Gjm2my0chpxmLbPGAJDftRB65VSYgQSRRaYbr8WRtg@mail.gmail.com>
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
X-List-Received-Date: Wed, 27 Jun 2018 15:40:20 -0000

On Wed, Jun 27, 2018 at 7:38 AM, Patrick Venture <venture@google.com> wrote=
:
> On Tue, Jun 26, 2018 at 6:10 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>> On Wed, 27 Jun 2018, at 01:49, Patrick Venture wrote:
>>> I assume this is just a recipe change such that I need to now specify
>>> something -- with OpenBMC v2.1 I see:
>>>
>>> """
>>> U-Boot 2016.07 (May 24 2018 - 12:55:55 -0700)
>>>
>>> DRAM:  120 MiB
>>> WARNING: Caches not enabled
>>> Flash: 64 MiB
>>> *** Warning - bad CRC, using default environment
>>>
>>> In:    serial
>>> Out:   serial
>>> Err:   serial
>>> Net:   aspeednic#0
>>> Error: aspeednic#0 address not set.
>>>
>>> Hit any key to stop autoboot:  0
>>> ## Loading kernel from FIT Image at 20080000 ...
>>>    Using 'conf@1' configuration
>>>    Trying 'kernel@1' kernel subimage
>>>      Description:  Linux kernel
>>>      Type:         Kernel Image
>>>      Compression:  uncompressed
>>>      Data Start:   0x20080128
>>>      Data Size:    1721352 Bytes =3D 1.6 MiB
>>>      Architecture: ARM
>>>      OS:           Linux
>>>      Load Address: 0x40008000
>>>      Entry Point:  0x40008000
>>>      Hash algo:    sha1
>>>      Hash value:   de140d9d803c22f731c4d99a4250979489383a81
>>>    Verifying Hash Integrity ... sha1+ OK
>>> ## Loading ramdisk from FIT Image at 20080000 ...
>>>    Using 'conf@1' configuration
>>>    Trying 'ramdisk@1' ramdisk subimage
>>>      Description:  obmc-phosphor-initramfs
>>>      Type:         RAMDisk Image
>>>      Compression:  lzma compressed
>>>      Data Start:   0x2022ad00
>>>      Data Size:    1592362 Bytes =3D 1.5 MiB
>>>      Architecture: ARM
>>>      OS:           Linux
>>>      Load Address: unavailable
>>>      Entry Point:  unavailable
>>>      Hash algo:    sha1
>>>      Hash value:   9f6f2feb110e27e07f81bb60bb372b4083672f19
>>>    Verifying Hash Integrity ... sha1+ OK
>>> ## Loading fdt from FIT Image at 20080000 ...
>>>    Using 'conf@1' configuration
>>>    Trying 'fdt@1' fdt subimage
>>>      Description:  Flattened Device Tree blob
>>>      Type:         Flat Device Tree
>>>      Compression:  uncompressed
>>>      Data Start:   0x20224624
>>>      Data Size:    26139 Bytes =3D 25.5 KiB
>>>      Architecture: ARM
>>>      Hash algo:    sha1
>>>      Hash value:   37864a4c4a608d5f4e370bbccf93ccbe3e77462d
>>>    Verifying Hash Integrity ... sha1+ OK
>>>    Booting using the fdt blob at 0x20224624
>>>    Loading Kernel Image ... OK
>>>    Loading Ramdisk to 47213000, end 47397c2a ... OK
>>>    Loading Device Tree to 47209000, end 4721261a ... OK
>>>
>>> Starting kernel ...
>>> """
>>>
>>> With v2.2 I see:
>>> """
>>> U-Boot 2016.07 (Jun 25 2018 - 10:07:57 -0700)
>>>
>>> DRAM:  120 MiB
>>> WARNING: Caches not enabled
>>> Flash: 64 MiB
>>> *** Warning - bad CRC, using default environment
>>>
>>> In:    serial
>>> Out:   serial
>>> Err:   serial
>>> Net:   aspeednic#0
>>> Error: aspeednic#0 address not set.
>>>
>>> Hit any key to stop autoboot:  0
>>> libfdt fdt_path_offset() returned FDT_ERR_NOTFOUND
>>
>> From below it looks like u-boot finds the kernel in the FIT, but your ra=
mdisk is "corrupt". The error above suggests something is missing from the =
FIT. Can you check the initrd/ramdisk node in your FIT to make sure it is p=
resent and uses all the correct options and paths with respect to the initr=
d you intended to package?
>
> I'll take a look -- one thought I had last night is that now the
> kernel config bit above is using the dts -- and IIRC, there have been
> changes to the flash layout.  So, maybe my device tree being used here
> is out-of-date or doesn't match what it's expecting now.  I'm still on
> the 4.7.10 kernel as I haven't had a chance to get the host booted
> with 4.13 (although that's high on my todo list).

My layout idea didn't pan out -- I'm going to try 4.13 kernel with
v2.2 openbmc -- I had tried 4.13 with v2.0 and it worked (other than
the host wouldn't boot).  So, I'm going to give that a quick try so
I"m at least failing on something up-to-date.

>
>>
>> Might also be helpful to provide the content of the .its file.
>>
>>> ## Loading kernel from FIT Image at 20080000 ...
>>>    Using 'conf@aspeed-bmc-quanta-q71l.dtb' configuration
>>>    Trying 'kernel@1' kernel subimage
>>>      Description:  Linux kernel
>>>      Type:         Kernel Image
>>>      Compression:  uncompressed
>>>      Data Start:   0x20080124
>>>      Data Size:    1723192 Bytes =3D 1.6 MiB
>>>      Architecture: ARM
>>>      OS:           Linux
>>>      Load Address: 0x40008000
>>>      Entry Point:  0x40008000
>>>      Hash algo:    sha1
>>>      Hash value:   95ed76c9361d9f6f991a6a859a06eb7626af80df
>>>    Verifying Hash Integrity ... sha1+ OK
>>> Wrong Ramdisk Image Format
>>> Ramdisk image is corrupt or invalid
>>> """
>>>
>>> I figured I'd reach out first as I'm sure this will be familiar to some=
one :D
>>>
>>> Patrick
