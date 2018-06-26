Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::233; helo=mail-ua0-x233.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="hDngK922"; 
 dkim-atps=neutral
Received: from mail-ua0-x233.google.com (mail-ua0-x233.google.com
 [IPv6:2607:f8b0:400c:c08::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41FWTB4HjyzF1Gj
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jun 2018 02:19:25 +1000 (AEST)
Received: by mail-ua0-x233.google.com with SMTP id r10-v6so5451680uao.1
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jun 2018 09:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=IP7amA+wmAoLOen34F1d4E0fNxYVxgE3Byp9s7XR000=;
 b=hDngK922CNXYILeI9cYOV0EBZ9NE9HkWgzpmp2F2SI1cwe/eWiEho59mNec0+yvEVP
 MgKHip21YJiQvL2qmxM/pGFWxLZUiS1EsX0U8jKJyedq1A218WdpUMkeEq2LT/Mam3Vl
 qvcV97LYqzuiMglheEuEs1oWuR+ED1cX1RbzB4alpMYn/6MxCSJHUz25RCMnNxgOXYa1
 xyxxDVd2WWtpTBxeqOfkI8WWUdn7TCobNDEMHXH/GHNS18vPtWYcPKOxdJF/WcgIWmpG
 LKkTG6tQqurn3sMuW31zIsJoxJTt9hP/NwdpzRkHLrQf4uJErfDBeEzL1Wk/7dZyrgXM
 GCtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=IP7amA+wmAoLOen34F1d4E0fNxYVxgE3Byp9s7XR000=;
 b=AecIuKx2jbi7J/a9yjhBKT7ZRhGtvtpm/q59/7YiVlPTGWEEejIwA4Zo6e/wyoCcSE
 dKyNL6IYcuJ4UzCnwIL0UUR8Ju5ecqjVxYTPHoMIBkEj5nxHrMAQzesCch1qC9lRO0Mw
 3BTNFV8vaWrTIoQeRiPuNP4HPKC/ht7Rxt4nJgOSIr1r126SQPt05y1ejCJqLIMlFowJ
 c6jp1Vzvyi52uHCVBPYQReEYYG2BZotgKqet4t1i7AW5oK8hakx5qh38a3/e3gA1E5+F
 BnsNqSW+NeweB5UKz/X9yqxmSl5hypFumGC/GhqG4raWPFvgFcOzpKbs+wXdJiSa1pR9
 /OOw==
X-Gm-Message-State: APt69E3ZY8KMkwIZQzHsLWhHe+vkg1fQikVPa1GGAu8uNrs/GqQv//gR
 ELYaXPFZ5HTzCzDv0Va19CLEwF8ScJGP6zR7dkGkMI/88qQ=
X-Google-Smtp-Source: AAOMgpc5xnR8UvIt4N57BRTEbxXZoVIyw0BjLc/TMtXGZbw664LsuKDT1DqLAjhlWubPdFTyz/mB9LmO7I+81P8Z/iI=
X-Received: by 2002:ab0:1251:: with SMTP id
 s17-v6mr1326785uac.37.1530029962323; 
 Tue, 26 Jun 2018 09:19:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1f:9b90:0:0:0:0:0 with HTTP; Tue, 26 Jun 2018 09:19:01
 -0700 (PDT)
From: Patrick Venture <venture@google.com>
Date: Tue, 26 Jun 2018 09:19:01 -0700
Message-ID: <CAO=notzW-7ffufai7uSQ8FtMvJrGT56F18TM5zm7L9+opFKb0Q@mail.gmail.com>
Subject: Merging up to OpenBMC v2.2 from v2.1 - boot problem,
 invalid ramdisk format
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 26 Jun 2018 16:19:27 -0000

I assume this is just a recipe change such that I need to now specify
something -- with OpenBMC v2.1 I see:

"""
U-Boot 2016.07 (May 24 2018 - 12:55:55 -0700)

DRAM:  120 MiB
WARNING: Caches not enabled
Flash: 64 MiB
*** Warning - bad CRC, using default environment

In:    serial
Out:   serial
Err:   serial
Net:   aspeednic#0
Error: aspeednic#0 address not set.

Hit any key to stop autoboot:  0
## Loading kernel from FIT Image at 20080000 ...
   Using 'conf@1' configuration
   Trying 'kernel@1' kernel subimage
     Description:  Linux kernel
     Type:         Kernel Image
     Compression:  uncompressed
     Data Start:   0x20080128
     Data Size:    1721352 Bytes = 1.6 MiB
     Architecture: ARM
     OS:           Linux
     Load Address: 0x40008000
     Entry Point:  0x40008000
     Hash algo:    sha1
     Hash value:   de140d9d803c22f731c4d99a4250979489383a81
   Verifying Hash Integrity ... sha1+ OK
## Loading ramdisk from FIT Image at 20080000 ...
   Using 'conf@1' configuration
   Trying 'ramdisk@1' ramdisk subimage
     Description:  obmc-phosphor-initramfs
     Type:         RAMDisk Image
     Compression:  lzma compressed
     Data Start:   0x2022ad00
     Data Size:    1592362 Bytes = 1.5 MiB
     Architecture: ARM
     OS:           Linux
     Load Address: unavailable
     Entry Point:  unavailable
     Hash algo:    sha1
     Hash value:   9f6f2feb110e27e07f81bb60bb372b4083672f19
   Verifying Hash Integrity ... sha1+ OK
## Loading fdt from FIT Image at 20080000 ...
   Using 'conf@1' configuration
   Trying 'fdt@1' fdt subimage
     Description:  Flattened Device Tree blob
     Type:         Flat Device Tree
     Compression:  uncompressed
     Data Start:   0x20224624
     Data Size:    26139 Bytes = 25.5 KiB
     Architecture: ARM
     Hash algo:    sha1
     Hash value:   37864a4c4a608d5f4e370bbccf93ccbe3e77462d
   Verifying Hash Integrity ... sha1+ OK
   Booting using the fdt blob at 0x20224624
   Loading Kernel Image ... OK
   Loading Ramdisk to 47213000, end 47397c2a ... OK
   Loading Device Tree to 47209000, end 4721261a ... OK

Starting kernel ...
"""

With v2.2 I see:
"""
U-Boot 2016.07 (Jun 25 2018 - 10:07:57 -0700)

DRAM:  120 MiB
WARNING: Caches not enabled
Flash: 64 MiB
*** Warning - bad CRC, using default environment

In:    serial
Out:   serial
Err:   serial
Net:   aspeednic#0
Error: aspeednic#0 address not set.

Hit any key to stop autoboot:  0
libfdt fdt_path_offset() returned FDT_ERR_NOTFOUND
## Loading kernel from FIT Image at 20080000 ...
   Using 'conf@aspeed-bmc-quanta-q71l.dtb' configuration
   Trying 'kernel@1' kernel subimage
     Description:  Linux kernel
     Type:         Kernel Image
     Compression:  uncompressed
     Data Start:   0x20080124
     Data Size:    1723192 Bytes = 1.6 MiB
     Architecture: ARM
     OS:           Linux
     Load Address: 0x40008000
     Entry Point:  0x40008000
     Hash algo:    sha1
     Hash value:   95ed76c9361d9f6f991a6a859a06eb7626af80df
   Verifying Hash Integrity ... sha1+ OK
Wrong Ramdisk Image Format
Ramdisk image is corrupt or invalid
"""

I figured I'd reach out first as I'm sure this will be familiar to someone :D

Patrick
