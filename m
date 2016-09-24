Return-Path: <xow@google.com>
Received: from mail-qk0-x229.google.com (mail-qk0-x229.google.com
 [IPv6:2607:f8b0:400d:c09::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sgtHZ1Tz9zDsqS
 for <openbmc@lists.ozlabs.org>; Sat, 24 Sep 2016 11:41:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=KSHwqwun; 
 dkim-atps=neutral
Received: by mail-qk0-x229.google.com with SMTP id z190so121702053qkc.3
 for <openbmc@lists.ozlabs.org>; Fri, 23 Sep 2016 18:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=GqblIcQH0Z0tzn53qtMJHczKDo7b1v+nGEeJBLy+79A=;
 b=KSHwqwunMvDHXR/UMmtUpIHxX70S17M7DtRp4bw+UPuxHMUhf3vp2a1xw0lHvxicLa
 2DtfolfXIUl/Q9wsrhn6M9i2mjiEuINtKcVBqd49OhQwFWKY9O8+da3ZM+IUUFWxgq2K
 J4i9pz6TF8eUDK861IZhnrGEDWU4QfcRteXBp4bwoTw4iqSuUSy5MFEZK4fZQSriwpjo
 khbfN1qdEIsrQOOMJZGqLQa8Tb9LUPUNUDnCuZ2ywa2k1B8452M6KQLj+J9toKBwzUUQ
 FdONTONjoEslOE7kQ3WQY2aVQ6CAkMPkh5jRVMtl6Yn7PSfIq8zmd5CIQIB7D86q/AI5
 h5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=GqblIcQH0Z0tzn53qtMJHczKDo7b1v+nGEeJBLy+79A=;
 b=mteDpz9XZNvg2cLH2GF8RTmafLQ+ugE4bEenB4Nqzo/JBz30OOZgACG2qXVPTXWnfw
 GyO94UY825IjKcvQ5gI2fNDFyshxvO9/jimRNCwzYUfF7KaNhOi/d5ANDHmtOSuGmsAJ
 DC9Md7KgaUYXdebnchUFcKnGMg3FpeaUefKw2NZR9v0wZ/nePgfRkgubZ+hQ+vUGtvpR
 3p/Xk+4LImbjJSYeFCK2hpPz1MGeFbWWX85BFSC9dl2tizzC+ymFQsIZB0cgIgiJFkbN
 Z+gJ6j6gCj7m50L2jy5mlcdl98Hjs3IlR4UKPWzyLPlsxmJyysF6Fm1UNj0zLLxh9S7/
 Olzg==
X-Gm-Message-State: AA6/9RmIxKGGZZxGbwb2HenynIpT6gsKmvWBw4A1nUThHPWbQEhOsSKVUINvRSq4bW5vOoXfhcCJM879aJyp/eSX
X-Received: by 10.55.169.193 with SMTP id s184mr11344421qke.3.1474681287259;
 Fri, 23 Sep 2016 18:41:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.47.132 with HTTP; Fri, 23 Sep 2016 18:41:26 -0700 (PDT)
From: Xo Wang <xow@google.com>
Date: Fri, 23 Sep 2016 18:41:26 -0700
Message-ID: <CAPH-5w5H-qYmjq+94U+jP=Wf57jdahO-jMZ1m=2gB9b8m8kAtA@mail.gmail.com>
Subject: libflash questions mostly relating to P9 bringup
To: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Sat, 24 Sep 2016 01:41:30 -0000

Hi folks,

I'm under the impression for P9 bringup we're sticking with BMC-side
MMIO to set up host PNOR access (as in what the host is booting from
over LPC). I see=E2=80=94and agree=E2=80=94that we're not gonna have MTD wo=
rking by
the time we need to boot early machines:
https://github.com/openbmc/openbmc/issues/553

What does libflash-based PNOR control look like? I mean the hacky way
we're gonna use for the next month. This is how I *think* it works.

booting the host:
1) the SMC SPI flash master auto-detects (?) how to read like the FMC
2) Swiss Army aspeed.c do_x_setup() enables LPC/AHB bridge to the SPI
flash window
Is that it? Doesn't involve MTD or pflash at all and it just works?

updating PNOR from BMC:
1) org.openbmc.control.Flash's update method calls op-flasher
2) org.openbmc.control.Flasher invokes libflash erase and program
3) libflash arch_flash_arm_io.h (?) and friends
  a. know how to talk to the flash controller (BMC_DIRECT)
  b. map AHB, GPIO, and SMC window from /dev/mem
  c. know the size of the host PNOR? (it looks hardcoded)

updating PNOR from host:
1) whatever calls pflash on host
2) host libflash powerpc_io.c and friends poke BMC registers over LPC
  a. write whatever LPC stuff that turns on iLPC2AHB, then use that to
set GPIO and SMC window to LPC for host access
  b. powerpc_io.c also overwrites the LPC/AHB bridge mapping (previous
set by BMC kernel) with its own desired config

Can somebody review that I got all this right? I saw some conflicting
information in https://github.com/openbmc/linux/issues/51

Other questions:
- what's the plan for "booting the host" and "updating PNOR from BMC?"
- is it worth extending the current libflash to read BMC & PNOR size,
window, etc from device tree?
- what does arch_flash_powerpc.c do? It looks like a whole other
access method with a host-side MTD device.

thanks
xo
