Return-Path: <cyrilbur@gmail.com>
Received: from mail-ua0-x241.google.com (mail-ua0-x241.google.com
 [IPv6:2607:f8b0:400c:c08::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tvmBH1cgnzDqSW
 for <openbmc@lists.ozlabs.org>; Fri,  6 Jan 2017 11:48:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pulEtu6P"; 
 dkim-atps=neutral
Received: by mail-ua0-x241.google.com with SMTP id d5so34206064uag.0
 for <openbmc@lists.ozlabs.org>; Thu, 05 Jan 2017 16:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=GeC/rMQ/MyQnkrJ4NvYkDJTvKg6Mpu+tojop7IBIkv0=;
 b=pulEtu6PbDTMLUft4X8z5rgkG7qA/oa2AMbMo+frHF5pokTKt46RXOyoSeB29yiZw8
 qGKYiyxGZJiL1aQlDv2XsZ5RrFN++rakl4S3KRTE5ZHKc84RqF2sNgzB2wJIR5jW90TW
 vrSDNkejI5EnACdmtPxJcsXIpPp21wPxrEvjVZY3aETgFvNoYhfnbgLxXHaUPq3sJ36G
 Z0emdIPSByNobAjFpzQuYZdROsijgXULPFVTUeOFS3MxJwtDP0QjMFtY8P9u5+OPcW6I
 qjUct+TxfjLspYEn/khnxFjv8OJYSnXuLVZ5HSC5U+Fh3KlyAFiEPgwmHkmn0tTgZ6W4
 sYIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=GeC/rMQ/MyQnkrJ4NvYkDJTvKg6Mpu+tojop7IBIkv0=;
 b=HFzINT6vsS7xMml+pTL43UHryDJn+uIiHSZIPjpfF0biwzPmnK2N3XeQ9A5YmC7gtL
 j1Esh8rWoomRTcqEE7ks7VWILU2A2xfKrC9DsiPQM2rRBTUamwxMpiNY9RoKngsL8eOs
 ytF9gdSd1LynwzT6W5fB0x/EAGAP+UlZo3+RB0DWdgEfuAdhtDWSPw1qnfNXvRpQY/7a
 AsbYv0JPBJAu0Qtjj5oICZf2vw8N/q0X1h8uYpGPuXz1uqzRsG66E+ucgZ1S2Nrocr8F
 npyNbmuLmoudMuredzMlXC1KAyvcAs+nxUC1J9rSlj/xJtEMKp51NcJ8jkOVMEgO5kFF
 w70w==
X-Gm-Message-State: AIkVDXLRsdJaMc/V82ZVSUI4xX+d9pVgsS6ES4tscDeUsbHXoRdMbR3dTviKhKXjhpgI1jImeuHy1as1iFHb/g==
X-Received: by 10.176.6.167 with SMTP id g36mr53100206uag.97.1483663700639;
 Thu, 05 Jan 2017 16:48:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.10.210 with HTTP; Thu, 5 Jan 2017 16:47:50 -0800 (PST)
From: Cyril Bur <cyrilbur@gmail.com>
Date: Fri, 6 Jan 2017 11:47:50 +1100
Message-ID: <CAN-ccARFNcQdi1EgySu5EhgpWw_ekeE+tnLaBYTpJvJi4uTp7A@mail.gmail.com>
Subject: Mailbox daemon
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: patrick@stwcx.xyz, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Jack Miller <jack@codezen.org>
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
X-List-Received-Date: Fri, 06 Jan 2017 00:48:23 -0000

Hello,

I recently sent patches to linux to be able to use the mailbox drivers
on the BMC so we can avoid having the host LPC bus mapped directly to
the pnor.

Obviously there needs to be a userspace component. I've been using a
fairly simple daemon for testing: https://github.com/cyrilbur-ibm/mboxb
ridge. It will absolutely do for development. I'm hopeful to grow this
into something that isn't quite so static. Being able to tell it that
the flash is actually a file and not /dev/mtd would be great and at the
moment its quite dumb and is much slower than it could be.

Is it possible to get an openbmc repo for it? I'm happy to look after
it like I do for btbridge, hopefully we could do code review for it
through email.

Thanks,

Cyril
