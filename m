Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c0f::231; helo=mail-ot0-x231.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nt8luowf"; 
 dkim-atps=neutral
Received: from mail-ot0-x231.google.com (mail-ot0-x231.google.com
 [IPv6:2607:f8b0:4003:c0f::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 418KHK17hczF0Pd
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jun 2018 15:22:51 +1000 (AEST)
Received: by mail-ot0-x231.google.com with SMTP id 92-v6so17100116otw.9
 for <openbmc@lists.ozlabs.org>; Sun, 17 Jun 2018 22:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=5KpW8KcInz7HkYv2szaF+MKPlIxaSF8doF79iNWoi5E=;
 b=nt8luowfqyDpnMn3/FTSKnje2E7WXXsW3Jul22QsDpddbz0OMstis4PrGbIx8V4ZuV
 8UpLJ4FicR4BiwNku0Rx+i1EqK0Ipfr3Vzr2Su9nyitvUqViACdcTawNr+GhStxNIiRV
 aqbzZb1FqOUpNABpraYRQnSrdeqmr7W+WpQMxk4NBVDCLzBCza92Ras8AiXDUBxK1dAW
 QZVZabIe20ABgDRdtP00QTsSbUAJnKJZOd0TtMhw54Md92rziTGOvh31LVb21etZZL3n
 1iy3sm8r64AHwBwNG13FPg27bpT0st7AicXeGjYnNBo0iJFLE/XTG+Pdq/lAfhyc+R9X
 B09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=5KpW8KcInz7HkYv2szaF+MKPlIxaSF8doF79iNWoi5E=;
 b=VGzL6VnfEBzvAcCyDVCqb44sEwUoV0NbvWILFBCQ2ZUo5AZpbRQmu/D2hQnfDfAu6W
 MQc1WtTC359swb8on/6c1s30A68JiG7PiMeCZPbpeiNWyHHJV+abXYWmgaRyZmNaEIX2
 2QRjgWi3bsG3aSpQ8Jn0EvgEaciEteMduWf+00FudcY0RIPGXXWKFmDv2NpVv3r7tDrv
 NaSzLyqlEZT/7oxomgkpZxxyje2Pyf7OmRKRg/hbwpCpxkv44+8PSdjuKWA8YXjKDCrx
 GnN9+Nc/PL3v7kACYQwfAiecMRwbJbpeKEddP5nk7UoxirkWcajDwGRasomCSB44Y7S1
 UHRQ==
X-Gm-Message-State: APt69E0BO8Cc3jvvFkvDL5jKYRX/gTbTiW1Z9jlZk+kT21mEZhgNx0Ok
 1QIWq3SeKyWusren6Ns+kISx2KKUsx6pu2hfFiMzRhaN
X-Google-Smtp-Source: ADUXVKLEBFkK4wIELD8BKNjKYBPWDR/4h799xUkmOczD2qI8D39uMFfSjtyK37Xr07hXFaluDrbszkXG0zMqE14RMAQ=
X-Received: by 2002:a9d:734:: with SMTP id 49-v6mr7414143ote.43.1529299369086; 
 Sun, 17 Jun 2018 22:22:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:b05:0:0:0:0:0 with HTTP;
 Sun, 17 Jun 2018 22:22:48 -0700 (PDT)
From: AKASH G J <akashgj91@gmail.com>
Date: Mon, 18 Jun 2018 10:52:48 +0530
Message-ID: <CAE33tLHWM53+r8D8g+q3Kc1odXgu6K+koR=oYwCi16tYXokoMw@mail.gmail.com>
Subject: Kernel panic - not syncing: VFS: Unable to mount root fs
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000a654bc056ee3c1aa"
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
X-List-Received-Date: Mon, 18 Jun 2018 05:22:53 -0000

--000000000000a654bc056ee3c1aa
Content-Type: text/plain; charset="UTF-8"

Hi Team,


I tried to boot the Linux image and root file system into a board
containing BMC Aspeed ast-2500. The booting process failed with following
errors.


*[ 6.186180] No filesystem could mount root, tried: [ 6.186186] squashfs*
*6.194822]* *Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(1,0)*


I think the problem with *squashfs* root file system image. How can I
create *cpio.lzma.u-boot* image for root file system using bitbake.


Thanks and Regards,

Akash

--000000000000a654bc056ee3c1aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Team,</div><div><br></div><div><br></div><div>I tr=
ied to boot the Linux image and root file system into a board=20
containing  BMC Aspeed ast-2500. The booting process failed with=20
following errors.</div><div><br></div><div><strong>[    6.186180] No filesy=
stem could mount root, tried:<br>
[    6.186186]  squashfs</strong></div><div>    <b>6.194822]</b> <strong>Ke=
rnel panic - not syncing: VFS: Unable to mount root fs on unknown-block(1,0=
)</strong></div><div><strong><br></strong></div><div><strong></strong><br><=
/div><div>I think the problem with <b>squashfs</b> root file system image. =
How can I create <b>cpio.lzma.u-boot</b> image for root file system using b=
itbake.</div><div><br></div><div><br></div><div>Thanks and Regards,</div><d=
iv><br></div><div>Akash<br></div><div><br></div><div><br></div></div>

--000000000000a654bc056ee3c1aa--
