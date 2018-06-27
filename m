Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::243; helo=mail-ua0-x243.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="JuFX2kDW"; 
 dkim-atps=neutral
Received: from mail-ua0-x243.google.com (mail-ua0-x243.google.com
 [IPv6:2607:f8b0:400c:c08::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41G5CH15jKzDrbK
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jun 2018 00:39:22 +1000 (AEST)
Received: by mail-ua0-x243.google.com with SMTP id j17-v6so1409876uap.7
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jun 2018 07:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=SvU3Dls74qA9MVeaSHc2TEAwZLOIjtq1ScORSSfalWc=;
 b=JuFX2kDW/DQgz2vDFLef4nOLrKUrJA3YjgPyDDJq6CK4eQNMV4Q/t62WDOROT47MEU
 DoPr5vLNaPV0EOSxIu3w54UKlA5HpjQUP1QST/BFvE2tE0aEgkwM2Vx5qr8La8SvRTrN
 2PspN0X5mKqrYGCcjh1nsHkVsdPgN3f8n7kLExPUtcE6IbJZUXqDgWPkpOOsV/Ub4Cgj
 zA+DBiEzkVsfAD9szcbOowQ53nCU8QcEkxf4/YCKB18o9E9G0k7W9xMHUvjdDVTtPNLc
 qsGKgsTZMLL0LHNz1h8bCr5H4k20b5rX4fYecNwLMhpE5RZlNysWrZguZ9D7RKS0lSFT
 ybEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=SvU3Dls74qA9MVeaSHc2TEAwZLOIjtq1ScORSSfalWc=;
 b=cg5UMU2AoQSkg9ClPToox5KM/ox+/9RRlFhgivge5eiZBN5Mzck5K/VvHGyoJKh5rf
 yFiFSZdwyeDVqxnIe2hgBx19+t35JwGoiwGWLFhxdtGPGoOQmAOK5QeP1LQxxUhdoQVC
 OH9fX6Vkzc7EXHpLapXRjg1aJNST1T17QBBJCYoRxL6Yhtdnlg6qoBligVQmKgs5MgI/
 HAVLkZE6/6ndhC9VNHw6vfm6w8u27B59wWjC1fdq1Yzrr9GKl1eW7CR0QqM2/svHYh0y
 Z3AarFiWYrvoS0sHs0WYL1gTmk0SC6n6VSRnby/T/xIUzKvcQJlnUbMGxWCOyVb8yVsU
 EOJg==
X-Gm-Message-State: APt69E3t4qSX6z5rQ654EGRUPansdb7s8Z6qlREH2uBSNeu+bznvopb9
 qZXeonGbo0YdUhbNzWf4kfYaaKfzDxDNzVAqGjR9Hxf+
X-Google-Smtp-Source: AAOMgpfhIjFP57L1rCQwaITQN/9Hk8WNeQ1mxoR8D96DCJxlYhrAiJ+GoPwD6fwJlsMqtyis2+1dziUBQiKuPpl11To=
X-Received: by 2002:a9f:3a47:: with SMTP id
 r7-v6mr3904343uag.198.1530110360647; 
 Wed, 27 Jun 2018 07:39:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1f:9b90:0:0:0:0:0 with HTTP; Wed, 27 Jun 2018 07:39:00
 -0700 (PDT)
In-Reply-To: <CAGMNF6XczffusXaDCfYcC1MGh3HmHjabV8-MSWEMN0p6Fx_RXw@mail.gmail.com>
References: <CAO=notzW-7ffufai7uSQ8FtMvJrGT56F18TM5zm7L9+opFKb0Q@mail.gmail.com>
 <1530061800.2502410.1421595168.7609B886@webmail.messagingengine.com>
 <CAGMNF6XczffusXaDCfYcC1MGh3HmHjabV8-MSWEMN0p6Fx_RXw@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 27 Jun 2018 07:39:00 -0700
Message-ID: <CAO=notxUXrvkZ05g0kYHfSvDBKMkX5496oLZ3=kmNks1YWWD4A@mail.gmail.com>
Subject: Re: Merging up to OpenBMC v2.2 from v2.1 - boot problem, invalid
 ramdisk format
To: Kun Yi <kunyi@google.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 27 Jun 2018 14:39:23 -0000

On Tue, Jun 26, 2018 at 6:40 PM, Kun Yi <kunyi@google.com> wrote:
> libfdt fdt_path_offset() returned FDT_ERR_NOTFOUND
>
> Might be caused a config change in U-boot?

I'll check to see what changed in the u-boot config between v2.1 and
v2.2 (and if there were any changes in our aspeed.google branch).

>
> On Tue, Jun 26, 2018 at 6:10 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>>
>> On Wed, 27 Jun 2018, at 01:49, Patrick Venture wrote:
>> > I assume this is just a recipe change such that I need to now specify
>> > something -- with OpenBMC v2.1 I see:
>> >
>> > """
>> > U-Boot 2016.07 (May 24 2018 - 12:55:55 -0700)
>> >
>> > DRAM:  120 MiB
>> > WARNING: Caches not enabled
>> > Flash: 64 MiB
>> > *** Warning - bad CRC, using default environment
>> >
>> > In:    serial
>> > Out:   serial
>> > Err:   serial
>> > Net:   aspeednic#0
>> > Error: aspeednic#0 address not set.
>> >
>> > Hit any key to stop autoboot:  0
>> > ## Loading kernel from FIT Image at 20080000 ...
>> >    Using 'conf@1' configuration
>> >    Trying 'kernel@1' kernel subimage
>> >      Description:  Linux kernel
>> >      Type:         Kernel Image
>> >      Compression:  uncompressed
>> >      Data Start:   0x20080128
>> >      Data Size:    1721352 Bytes = 1.6 MiB
>> >      Architecture: ARM
>> >      OS:           Linux
>> >      Load Address: 0x40008000
>> >      Entry Point:  0x40008000
>> >      Hash algo:    sha1
>> >      Hash value:   de140d9d803c22f731c4d99a4250979489383a81
>> >    Verifying Hash Integrity ... sha1+ OK
>> > ## Loading ramdisk from FIT Image at 20080000 ...
>> >    Using 'conf@1' configuration
>> >    Trying 'ramdisk@1' ramdisk subimage
>> >      Description:  obmc-phosphor-initramfs
>> >      Type:         RAMDisk Image
>> >      Compression:  lzma compressed
>> >      Data Start:   0x2022ad00
>> >      Data Size:    1592362 Bytes = 1.5 MiB
>> >      Architecture: ARM
>> >      OS:           Linux
>> >      Load Address: unavailable
>> >      Entry Point:  unavailable
>> >      Hash algo:    sha1
>> >      Hash value:   9f6f2feb110e27e07f81bb60bb372b4083672f19
>> >    Verifying Hash Integrity ... sha1+ OK
>> > ## Loading fdt from FIT Image at 20080000 ...
>> >    Using 'conf@1' configuration
>> >    Trying 'fdt@1' fdt subimage
>> >      Description:  Flattened Device Tree blob
>> >      Type:         Flat Device Tree
>> >      Compression:  uncompressed
>> >      Data Start:   0x20224624
>> >      Data Size:    26139 Bytes = 25.5 KiB
>> >      Architecture: ARM
>> >      Hash algo:    sha1
>> >      Hash value:   37864a4c4a608d5f4e370bbccf93ccbe3e77462d
>> >    Verifying Hash Integrity ... sha1+ OK
>> >    Booting using the fdt blob at 0x20224624
>> >    Loading Kernel Image ... OK
>> >    Loading Ramdisk to 47213000, end 47397c2a ... OK
>> >    Loading Device Tree to 47209000, end 4721261a ... OK
>> >
>> > Starting kernel ...
>> > """
>> >
>> > With v2.2 I see:
>> > """
>> > U-Boot 2016.07 (Jun 25 2018 - 10:07:57 -0700)
>> >
>> > DRAM:  120 MiB
>> > WARNING: Caches not enabled
>> > Flash: 64 MiB
>> > *** Warning - bad CRC, using default environment
>> >
>> > In:    serial
>> > Out:   serial
>> > Err:   serial
>> > Net:   aspeednic#0
>> > Error: aspeednic#0 address not set.
>> >
>> > Hit any key to stop autoboot:  0
>> > libfdt fdt_path_offset() returned FDT_ERR_NOTFOUND
>>
>> From below it looks like u-boot finds the kernel in the FIT, but your
>> ramdisk is "corrupt". The error above suggests something is missing from the
>> FIT. Can you check the initrd/ramdisk node in your FIT to make sure it is
>> present and uses all the correct options and paths with respect to the
>> initrd you intended to package?
>>
>> Might also be helpful to provide the content of the .its file.
>>
>> > ## Loading kernel from FIT Image at 20080000 ...
>> >    Using 'conf@aspeed-bmc-quanta-q71l.dtb' configuration
>> >    Trying 'kernel@1' kernel subimage
>> >      Description:  Linux kernel
>> >      Type:         Kernel Image
>> >      Compression:  uncompressed
>> >      Data Start:   0x20080124
>> >      Data Size:    1723192 Bytes = 1.6 MiB
>> >      Architecture: ARM
>> >      OS:           Linux
>> >      Load Address: 0x40008000
>> >      Entry Point:  0x40008000
>> >      Hash algo:    sha1
>> >      Hash value:   95ed76c9361d9f6f991a6a859a06eb7626af80df
>> >    Verifying Hash Integrity ... sha1+ OK
>> > Wrong Ramdisk Image Format
>> > Ramdisk image is corrupt or invalid
>> > """
>> >
>> > I figured I'd reach out first as I'm sure this will be familiar to
>> > someone :D
>> >
>> > Patrick
>
>
>
> --
> Regards,
> Kun
