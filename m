Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::242; helo=mail-vk0-x242.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="LmosFSLa"; 
 dkim-atps=neutral
Received: from mail-vk0-x242.google.com (mail-vk0-x242.google.com
 [IPv6:2607:f8b0:400c:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41GJJF2gYFzF1Dg
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jun 2018 08:59:24 +1000 (AEST)
Received: by mail-vk0-x242.google.com with SMTP id o71-v6so2169481vke.7
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jun 2018 15:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UEEB3vthS8M65qEZmlHrgD1Mi7kqZ2T6Y9i85MKsMzM=;
 b=LmosFSLaKenakToG374tkkMdFWoiOQPYD1X6lgbmSEwdbDBw9Cs9sjlzm8suuRTcs4
 wTJ48qT9CxuYetDlVo3BhRHEZCHyOCVAHoT8gHFIF4tr3OPOCEgZUTAeY2Hd6xwrBceF
 LccDN6ZLtwySKI0m+JTjOd8hC3PSfnUHL5kr/tANbDasu5WyRcZ69UEswTS1lw/tz+IM
 J2M7NUOuGqxt7GrPm8DND+Zxvxi2Jx7KZ94mADouVNCanQZj24C+LT5QGii1xSLAFvNY
 2bNPdrDAM8p0KPy2ACrwNu9mTrQZU2UBwqgmvZmk3ofZY3AvE+uQ8m4cEDWpan7PwUgG
 JAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UEEB3vthS8M65qEZmlHrgD1Mi7kqZ2T6Y9i85MKsMzM=;
 b=nD0sajJJ3AU0DPu9tpACG67Ku3VDL8hXqQ+dBeOMUwetqM+tja5selZIprbagqj32W
 Bfqj7TNSSNhBSiE4UQNeyzlcnl0TX29vJGtoXQDqKbIzX+YBbfZ3VOD8vEoEX8ouoNh/
 aoNSmTchhU5ga/ZOhqn+cbSSgbH7+1KFMCq7cdvrX7Gb7uOtMXwaGW4yWTmMBFDoZcqt
 QBZDYu26PF+JYpX330GZnFdw6pYmd8jUFt9A+8gZ6HzG92JOurUcbzOvlrJwG1L94j3Q
 PAV+j4vK5YFFg26bbDnIwotFXkqAZfFxmGS0vsIm3FcG9QL8NegrZ/9f/0RLWPxesFDg
 gHLw==
X-Gm-Message-State: APt69E15mPsMZ1q9QLNjm7WPGayxwLSjbAOhUmIOxE5JgwowxANS0jjp
 gzwj9JQ3sv2I5xFydpKWrhDwfiu0QfkSBUm0AmyZzfNZ
X-Google-Smtp-Source: AAOMgpdEvDdR6s66EvJ1ScWdAAYRwRenD9/45PzsnWGhOUDnB2g+LRC1Bo8y/PVf4ug8mNxxoJ3ynwpI3eRF/ZINZfs=
X-Received: by 2002:a1f:9b16:: with SMTP id
 d22-v6mr4823141vke.164.1530140361380; 
 Wed, 27 Jun 2018 15:59:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1f:e183:0:0:0:0:0 with HTTP; Wed, 27 Jun 2018 15:58:59
 -0700 (PDT)
In-Reply-To: <CAO=notwFtf7PDCix-Yqwe2hT7MoruR4eA2EGwxke90QeaO0y7Q@mail.gmail.com>
References: <CAO=notzW-7ffufai7uSQ8FtMvJrGT56F18TM5zm7L9+opFKb0Q@mail.gmail.com>
 <1530061800.2502410.1421595168.7609B886@webmail.messagingengine.com>
 <CAO=notwv8DYt7aR=6rOVOFvyA_CkrGgT31XG4A+KrDqyF55shw@mail.gmail.com>
 <CAO=notz5Gjm2my0chpxmLbPGAJDftRB65VSYgQSRRaYbr8WRtg@mail.gmail.com>
 <CAO=notwFtf7PDCix-Yqwe2hT7MoruR4eA2EGwxke90QeaO0y7Q@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 27 Jun 2018 15:58:59 -0700
Message-ID: <CAO=notzpy-4kwpC_N=4e=AgfDJNOkz+129-t0N6ZBVZZDCPj0g@mail.gmail.com>
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
X-List-Received-Date: Wed, 27 Jun 2018 22:59:26 -0000

On Wed, Jun 27, 2018 at 2:17 PM, Patrick Venture <venture@google.com> wrote=
:
> On Wed, Jun 27, 2018 at 8:39 AM, Patrick Venture <venture@google.com> wro=
te:
>> On Wed, Jun 27, 2018 at 7:38 AM, Patrick Venture <venture@google.com> wr=
ote:
>>> On Tue, Jun 26, 2018 at 6:10 PM, Andrew Jeffery <andrew@aj.id.au> wrote=
:
>>>> On Wed, 27 Jun 2018, at 01:49, Patrick Venture wrote:
>>>>> I assume this is just a recipe change such that I need to now specify
>>>>> something -- with OpenBMC v2.1 I see:
>>>>>
>>>>> """
>>>>> U-Boot 2016.07 (May 24 2018 - 12:55:55 -0700)
>>>>>
>>>>> DRAM:  120 MiB
>>>>> WARNING: Caches not enabled
>>>>> Flash: 64 MiB
>>>>> *** Warning - bad CRC, using default environment
>>>>>
>>>>> In:    serial
>>>>> Out:   serial
>>>>> Err:   serial
>>>>> Net:   aspeednic#0
>>>>> Error: aspeednic#0 address not set.
>>>>>
>>>>> Hit any key to stop autoboot:  0
>>>>> ## Loading kernel from FIT Image at 20080000 ...
>>>>>    Using 'conf@1' configuration
>>>>>    Trying 'kernel@1' kernel subimage
>>>>>      Description:  Linux kernel
>>>>>      Type:         Kernel Image
>>>>>      Compression:  uncompressed
>>>>>      Data Start:   0x20080128
>>>>>      Data Size:    1721352 Bytes =3D 1.6 MiB
>>>>>      Architecture: ARM
>>>>>      OS:           Linux
>>>>>      Load Address: 0x40008000
>>>>>      Entry Point:  0x40008000
>>>>>      Hash algo:    sha1
>>>>>      Hash value:   de140d9d803c22f731c4d99a4250979489383a81
>>>>>    Verifying Hash Integrity ... sha1+ OK
>>>>> ## Loading ramdisk from FIT Image at 20080000 ...
>>>>>    Using 'conf@1' configuration
>>>>>    Trying 'ramdisk@1' ramdisk subimage
>>>>>      Description:  obmc-phosphor-initramfs
>>>>>      Type:         RAMDisk Image
>>>>>      Compression:  lzma compressed
>>>>>      Data Start:   0x2022ad00
>>>>>      Data Size:    1592362 Bytes =3D 1.5 MiB
>>>>>      Architecture: ARM
>>>>>      OS:           Linux
>>>>>      Load Address: unavailable
>>>>>      Entry Point:  unavailable
>>>>>      Hash algo:    sha1
>>>>>      Hash value:   9f6f2feb110e27e07f81bb60bb372b4083672f19
>>>>>    Verifying Hash Integrity ... sha1+ OK
>>>>> ## Loading fdt from FIT Image at 20080000 ...
>>>>>    Using 'conf@1' configuration
>>>>>    Trying 'fdt@1' fdt subimage
>>>>>      Description:  Flattened Device Tree blob
>>>>>      Type:         Flat Device Tree
>>>>>      Compression:  uncompressed
>>>>>      Data Start:   0x20224624
>>>>>      Data Size:    26139 Bytes =3D 25.5 KiB
>>>>>      Architecture: ARM
>>>>>      Hash algo:    sha1
>>>>>      Hash value:   37864a4c4a608d5f4e370bbccf93ccbe3e77462d
>>>>>    Verifying Hash Integrity ... sha1+ OK
>>>>>    Booting using the fdt blob at 0x20224624
>>>>>    Loading Kernel Image ... OK
>>>>>    Loading Ramdisk to 47213000, end 47397c2a ... OK
>>>>>    Loading Device Tree to 47209000, end 4721261a ... OK
>>>>>
>>>>> Starting kernel ...
>>>>> """
>>>>>
>>>>> With v2.2 I see:
>>>>> """
>>>>> U-Boot 2016.07 (Jun 25 2018 - 10:07:57 -0700)
>>>>>
>>>>> DRAM:  120 MiB
>>>>> WARNING: Caches not enabled
>>>>> Flash: 64 MiB
>>>>> *** Warning - bad CRC, using default environment
>>>>>
>>>>> In:    serial
>>>>> Out:   serial
>>>>> Err:   serial
>>>>> Net:   aspeednic#0
>>>>> Error: aspeednic#0 address not set.
>>>>>
>>>>> Hit any key to stop autoboot:  0
>>>>> libfdt fdt_path_offset() returned FDT_ERR_NOTFOUND
>>>>
>>>> From below it looks like u-boot finds the kernel in the FIT, but your =
ramdisk is "corrupt". The error above suggests something is missing from th=
e FIT. Can you check the initrd/ramdisk node in your FIT to make sure it is=
 present and uses all the correct options and paths with respect to the ini=
trd you intended to package?
>>>
>>> I'll take a look -- one thought I had last night is that now the
>>> kernel config bit above is using the dts -- and IIRC, there have been
>>> changes to the flash layout.  So, maybe my device tree being used here
>>> is out-of-date or doesn't match what it's expecting now.  I'm still on
>>> the 4.7.10 kernel as I haven't had a chance to get the host booted
>>> with 4.13 (although that's high on my todo list).
>>
>> My layout idea didn't pan out -- I'm going to try 4.13 kernel with
>> v2.2 openbmc -- I had tried 4.13 with v2.0 and it worked (other than
>> the host wouldn't boot).  So, I'm going to give that a quick try so
>> I"m at least failing on something up-to-date.
>
> The BMC is able to boot using the 4.13 kernel.  So the issue must be
> something incompatible or unhappy.  As a reason to force cycles to get
> to 4.13, this will do the trick.

I need to retract that statement. I'm testing 4.13 with v2.1 (forgot
to reapply associated patches).

>
>>
>>>
>>>>
>>>> Might also be helpful to provide the content of the .its file.
>>>>
>>>>> ## Loading kernel from FIT Image at 20080000 ...
>>>>>    Using 'conf@aspeed-bmc-quanta-q71l.dtb' configuration
>>>>>    Trying 'kernel@1' kernel subimage
>>>>>      Description:  Linux kernel
>>>>>      Type:         Kernel Image
>>>>>      Compression:  uncompressed
>>>>>      Data Start:   0x20080124
>>>>>      Data Size:    1723192 Bytes =3D 1.6 MiB
>>>>>      Architecture: ARM
>>>>>      OS:           Linux
>>>>>      Load Address: 0x40008000
>>>>>      Entry Point:  0x40008000
>>>>>      Hash algo:    sha1
>>>>>      Hash value:   95ed76c9361d9f6f991a6a859a06eb7626af80df
>>>>>    Verifying Hash Integrity ... sha1+ OK
>>>>> Wrong Ramdisk Image Format
>>>>> Ramdisk image is corrupt or invalid
>>>>> """
>>>>>
>>>>> I figured I'd reach out first as I'm sure this will be familiar to so=
meone :D
>>>>>
>>>>> Patrick
