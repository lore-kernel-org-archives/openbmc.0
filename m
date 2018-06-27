Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ioxM4ToE"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="W9gDZ/Mc"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41FlFV6TNRzF1DM
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jun 2018 11:10:06 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id AE16E21E07;
 Tue, 26 Jun 2018 21:10:00 -0400 (EDT)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Tue, 26 Jun 2018 21:10:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=5I8EumWKwqgFn5AZ5Wi/SPtswg29D
 eG4irawiID9pW8=; b=ioxM4ToEaXoUYwb0DOhniVnqvKkeuyQv8dW/d+VyryE+9
 E3Dt/iMJx2eOzUYTo6qwNSS+Hb29jsP9h1I32VYNP4ysxZ7Dr1x5JWJ+F8py7Sro
 uhlDQB6X509Sg2NFAiMZf2Hcj5IUEyfRAfuOi8nyX37HcNMFeXN5L/jNmNyZhNrT
 6EEw8sxchyH0ACCZejqPgYDXApwEkk7zDkYVAZoqQOSn+WgLnubGX0gz0kXW+UR1
 LLhtut31PGLux1/mwvPkqhRoRBGEH35vjQK2vid/fq0yyDeTpkvXoIgVgqfDkWqX
 rydv2Js34k+yD2flT+UN7Y/XZD/nbCjTz68JtgDhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=5I8Eum
 WKwqgFn5AZ5Wi/SPtswg29DeG4irawiID9pW8=; b=W9gDZ/McV/mcDbzsVPXlwP
 Ut52dmpqh1cdQuxHj7peSt5V7FGSUpIqe2Ucr3G8uNF9LTBccHQMmFEbQuFTPy43
 1/c+D2ZE0zZoJ2bG5a9tJG+Y1f4vi8HbTkD75NiLHfGvCaMvAdcwg8Ug9NNqTdA+
 H/ygvuhEYWxOq0XJ4BOqJ5IiupivpbEdjVxm3ZXjmfCYRDJZzOZvGWt3uP8blAcI
 0HhrcPNPGnkf6W794cJOo/cbv9DT+PCL2CYjScn+CYIFsRd6aKy7ueMkuJvmAQCb
 zjfG5zVuV1+zL817LsGcH7cPcuEo1xfmn2Ffu773aJbGzqVwkRy2NAdgTY8xC1nw
 ==
X-ME-Proxy: <xmx:6OMyW40impza7KZKzZhngaw9KGALvguuwdjD2vUmBUMIndBusctR0A>
 <xmx:6OMyW_FhXylrtAsNXoW4BrT7fIDfmJQaIO-hJAU7WqsUXPt7ELOFEw>
 <xmx:6OMyWzGKihru9Yc-7rT-N9JxdClZfvkhZ3LL74zm2xDxUtUx9ONDTw>
 <xmx:6OMyWy69BNu9uWB2g8Xv7OWZFZZBUJCf5qJPpQ1XVoRqqCCdJb5uag>
 <xmx:6OMyW4y1gVTR1f0XjPuzUaIcALrf0yrT0RkDFPclmJ96SUjm5FcVYA>
 <xmx:6OMyW2ReXto-HTq4k-ERibhoF82z8eKeTHl9rV3ampo3jhak0jZD0Q>
X-ME-Sender: <xms:6OMyWw5mUmGvYX0eQR0x87GjZ9dGRN3lpA1H5X-mkXYFwuz0_ewydA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 58F10BA4CF; Tue, 26 Jun 2018 21:10:00 -0400 (EDT)
Message-Id: <1530061800.2502410.1421595168.7609B886@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-0d8ea36c
In-Reply-To: <CAO=notzW-7ffufai7uSQ8FtMvJrGT56F18TM5zm7L9+opFKb0Q@mail.gmail.com>
References: <CAO=notzW-7ffufai7uSQ8FtMvJrGT56F18TM5zm7L9+opFKb0Q@mail.gmail.com>
Date: Wed, 27 Jun 2018 10:40:00 +0930
Subject: Re: Merging up to OpenBMC v2.2 from v2.1 - boot problem,
 invalid ramdisk format
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
X-List-Received-Date: Wed, 27 Jun 2018 01:10:09 -0000

On Wed, 27 Jun 2018, at 01:49, Patrick Venture wrote:
> I assume this is just a recipe change such that I need to now specify
> something -- with OpenBMC v2.1 I see:
> 
> """
> U-Boot 2016.07 (May 24 2018 - 12:55:55 -0700)
> 
> DRAM:  120 MiB
> WARNING: Caches not enabled
> Flash: 64 MiB
> *** Warning - bad CRC, using default environment
> 
> In:    serial
> Out:   serial
> Err:   serial
> Net:   aspeednic#0
> Error: aspeednic#0 address not set.
> 
> Hit any key to stop autoboot:  0
> ## Loading kernel from FIT Image at 20080000 ...
>    Using 'conf@1' configuration
>    Trying 'kernel@1' kernel subimage
>      Description:  Linux kernel
>      Type:         Kernel Image
>      Compression:  uncompressed
>      Data Start:   0x20080128
>      Data Size:    1721352 Bytes = 1.6 MiB
>      Architecture: ARM
>      OS:           Linux
>      Load Address: 0x40008000
>      Entry Point:  0x40008000
>      Hash algo:    sha1
>      Hash value:   de140d9d803c22f731c4d99a4250979489383a81
>    Verifying Hash Integrity ... sha1+ OK
> ## Loading ramdisk from FIT Image at 20080000 ...
>    Using 'conf@1' configuration
>    Trying 'ramdisk@1' ramdisk subimage
>      Description:  obmc-phosphor-initramfs
>      Type:         RAMDisk Image
>      Compression:  lzma compressed
>      Data Start:   0x2022ad00
>      Data Size:    1592362 Bytes = 1.5 MiB
>      Architecture: ARM
>      OS:           Linux
>      Load Address: unavailable
>      Entry Point:  unavailable
>      Hash algo:    sha1
>      Hash value:   9f6f2feb110e27e07f81bb60bb372b4083672f19
>    Verifying Hash Integrity ... sha1+ OK
> ## Loading fdt from FIT Image at 20080000 ...
>    Using 'conf@1' configuration
>    Trying 'fdt@1' fdt subimage
>      Description:  Flattened Device Tree blob
>      Type:         Flat Device Tree
>      Compression:  uncompressed
>      Data Start:   0x20224624
>      Data Size:    26139 Bytes = 25.5 KiB
>      Architecture: ARM
>      Hash algo:    sha1
>      Hash value:   37864a4c4a608d5f4e370bbccf93ccbe3e77462d
>    Verifying Hash Integrity ... sha1+ OK
>    Booting using the fdt blob at 0x20224624
>    Loading Kernel Image ... OK
>    Loading Ramdisk to 47213000, end 47397c2a ... OK
>    Loading Device Tree to 47209000, end 4721261a ... OK
> 
> Starting kernel ...
> """
> 
> With v2.2 I see:
> """
> U-Boot 2016.07 (Jun 25 2018 - 10:07:57 -0700)
> 
> DRAM:  120 MiB
> WARNING: Caches not enabled
> Flash: 64 MiB
> *** Warning - bad CRC, using default environment
> 
> In:    serial
> Out:   serial
> Err:   serial
> Net:   aspeednic#0
> Error: aspeednic#0 address not set.
> 
> Hit any key to stop autoboot:  0
> libfdt fdt_path_offset() returned FDT_ERR_NOTFOUND

From below it looks like u-boot finds the kernel in the FIT, but your ramdisk is "corrupt". The error above suggests something is missing from the FIT. Can you check the initrd/ramdisk node in your FIT to make sure it is present and uses all the correct options and paths with respect to the initrd you intended to package?

Might also be helpful to provide the content of the .its file.

> ## Loading kernel from FIT Image at 20080000 ...
>    Using 'conf@aspeed-bmc-quanta-q71l.dtb' configuration
>    Trying 'kernel@1' kernel subimage
>      Description:  Linux kernel
>      Type:         Kernel Image
>      Compression:  uncompressed
>      Data Start:   0x20080124
>      Data Size:    1723192 Bytes = 1.6 MiB
>      Architecture: ARM
>      OS:           Linux
>      Load Address: 0x40008000
>      Entry Point:  0x40008000
>      Hash algo:    sha1
>      Hash value:   95ed76c9361d9f6f991a6a859a06eb7626af80df
>    Verifying Hash Integrity ... sha1+ OK
> Wrong Ramdisk Image Format
> Ramdisk image is corrupt or invalid
> """
> 
> I figured I'd reach out first as I'm sure this will be familiar to someone :D
> 
> Patrick
