Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8Thw2z6DzDvPc
 for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2016 13:40:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=txhd57bg; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id 62so4205386oif.1
 for <openbmc@lists.ozlabs.org>; Wed, 02 Nov 2016 19:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:from:date:message-id:subject:to;
 bh=lcBavNO/AyaKoBgpeh5mD6sXGesRomk1HD70nXPDOog=;
 b=txhd57bg5VlKcPj/gxH7zNTpa8iS1/msesOqyQL7Z/QdxYFQim+KaKSd/MuNUnhD1i
 8iNfR2yt72iVS0O1YyVea38U0bZExZxjynH11Fd91m/X7LPcrMAX3pAFpo1mdDTYjXvl
 63IZrVvcjqk0bdOKonrE7DcYkHI8tQ535pDrt94dlUbzEKKrekYymDGP9NuvRRIBCYIb
 5UH/sQYjNcERDCuiqMBU3AtoYdC5MiSdq/cTz4xurn2UbE9XUcOPwUk9oWJlcBC50xau
 IYm7QMUK//pnn+W8XTV7Due223958k2iH4CrqVwMUaAnr3lxlvYy/igiuYh5rLWOwzuD
 xUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
 :to; bh=lcBavNO/AyaKoBgpeh5mD6sXGesRomk1HD70nXPDOog=;
 b=DPKgiCJhnxgodJwY1X1o9uGWG5rsH+P2r0dMXwUDPoMuvB9Ibj9YU2TsvOOynLJjYy
 OdEXqm+LG36ja1RnjJIpP8qZj9T2kond556ExH/8zwvErzPDVNlWUsAFDU/s1MAuASrS
 Ch+bTp0JRkXhZlQyxxi+kBdpHLoXECWisXqNjF9/WrF22xnbfoVpMFky5pq3tq2tclkK
 juICD/b3wdS72k/ICmEISzL9KgejOVlnVnYV2tJY746gGLzeXN7qqliQvRHhUzI/jsWv
 ltp6bRGzRuRqeICsugztAonCEK5jvXEU8hXYpEgWoEF8hUhbTlb3zl8lv+w4KAbFk2i8
 ImMA==
X-Gm-Message-State: ABUngvfUl0ofOIquAys1/EcIP9jeEhj+R+6W01X3fKGMi7TSlLFlhR50Yr3t/MsLjF5lP/oz0axRMoGO1Qy5Lw==
X-Received: by 10.202.252.133 with SMTP id a127mr5758542oii.124.1478140814205; 
 Wed, 02 Nov 2016 19:40:14 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.107.226 with HTTP; Wed, 2 Nov 2016 19:39:53 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 3 Nov 2016 13:09:53 +1030
X-Google-Sender-Auth: ZP-4X6gK8-y6DoqofnEDOidQRxg
Message-ID: <CACPK8Xcyic3BsnxTLx8c5p-=34xqrfDTZ4bFKa309hCSZPuhAw@mail.gmail.com>
Subject: op-flasher changes
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Thu, 03 Nov 2016 02:40:17 -0000

Hello All,

We recently switched op-flasher, the component of our system that
touches the SPI flash devices at update time, to use the kernel MTD
interface. Previously it was doing this via MMIO: directly programming
the FMC and SMC flash controllers through /dev/mem.

The current state of master has broken flash access as there were some
subtlities in the way flasher was implmeented. I have a series of
patches that should get us back into a working state:

 https://gerrit.openbmc-project.xyz/983 flasher: Remove unsued
blocklevel_get_info
 https://gerrit.openbmc-project.xyz/984 flasher: remove unused ffs_index
 https://gerrit.openbmc-project.xyz/985 flasher: Remove relocking of flash
 https://gerrit.openbmc-project.xyz/986 flasher: unify cleanup commands
 https://gerrit.openbmc-project.xyz/987 flasher: Use BMC_MTD to represent bmc
 https://gerrit.openbmc-project.xyz/988 flasher: Unify flash setup functions
 https://gerrit.openbmc-project.xyz/989 flasher: Remove flash tuned message
 https://gerrit.openbmc-project.xyz/990 flasher: BMC partition
addresses are relative to start of flash

Some of these changes are cleanups that make it easier to move to the
new libflash API, which we must do in order to update pflash to use
the mtd interface. That API change patch is here:

  https://gerrit.openbmc-project.xyz/991 flasher: Move to new libflash API

I propose we merge the first series of patches to ensure we have not
regressed, and then merge the second one along with the move to the
new libflash version, which would be this patch:

 https://gerrit.openbmc-project.xyz/#/c/907/

This requires some testing. I have a tree that updates the version of
skeleton we use to include the first set of patches here:

  https://github.com/shenki/openbmc/tree/flasher-cleanups

If you could test booting and performing updates to this on your
platform of choice that would be appreciated.

Once we have a few test results we can merge the changes, and repeat
the process with the API change.

Cheers,

Joel
