Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tyK4b4BzVzDqN3
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 15:37:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tW5nX8cq"; 
 dkim-atps=neutral
Received: by mail-pf0-x242.google.com with SMTP id b22so10464560pfd.3
 for <openbmc@lists.ozlabs.org>; Mon, 09 Jan 2017 20:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JCPrQivFbYGu8ymMu+cuM7dtB3hGE2gP86ZRY8Luc9Y=;
 b=tW5nX8cqo9W2Rvi5UsMBsDkxoTSOsUDYDp4gmzOjivyT7vhlqkFsjFepkbMUCHOc5V
 5Qp9VfiwAR70CAAtX4nbf4fVIXSlZQhx8OXVdmZqs2V18xLWqFrjhKELXIoJ2ofWIV+o
 Hv3gy27MD68pQIXJ92jDVHZ95b4zqQkCPYzThLJvRi5sAGM8FfXH5qV3Z/tASKneA5RV
 k2DYzl5aI+NTF1QrjBkyka86LP9KCF0UQIt3lMs1H1vw6uVCL2GrawQ1G6GvceOhVlmI
 lbYa8bBsrMZEF2+JPZ3E1OrmxYaWgQKSKIRWq+OEBi2fxiMDezdI12r81Q2bV6O5ut+u
 Pvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JCPrQivFbYGu8ymMu+cuM7dtB3hGE2gP86ZRY8Luc9Y=;
 b=tMiDzVrAu6KV2Jd2Tu+fe1nznmUt8Q6FRuxGmKG8imUNBHr/AK49zyxI8MwFVsXN4b
 NQacX/TPFSpyXxp4ASjaPXP6VxRKrCKNkbJzNFr0xqxjhBCf4i697KcpNDZ22FTcir4l
 1kEI65hJy1nSidUndujvnWOSIpLBX+zck26Xp8awqxB2bQtEUC541Wa4C0jxFEmensQl
 sRDkibx5C0GnnQHvugpKhJ8/QteCjVzlPIjzeXXxH29H+gtphelkiVkN6bCQ1GJ6ho29
 pnLO8MyUicBzL7t41mp0/1LQC5pGB36jO/5lUZqGSoAriovD9oFkwRsF70mA7STZw+Jy
 AwNA==
X-Gm-Message-State: AIkVDXJB0G8ivSdNiWSzmFR+mqDqSuY4Uod6qC+vMB38qdFE7B2tqoekBmC5O0vaTSeEEQ==
X-Received: by 10.98.47.68 with SMTP id v65mr1510152pfv.115.1484023037445;
 Mon, 09 Jan 2017 20:37:17 -0800 (PST)
Received: from camb691.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id h185sm1080691pfg.90.2017.01.09.20.37.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Jan 2017 20:37:16 -0800 (PST)
Message-ID: <1484022993.6236.12.camel@gmail.com>
Subject: Re: [PATCH v2 4/5] drivers/mailbox: Add aspeed ast2400/ast2500 mbox
 driver
From: Cyril Bur <cyrilbur@gmail.com>
To: benh@au1.ibm.com, Andrew Jeffery <andrew@aj.id.au>, 
 openbmc@lists.ozlabs.org
Cc: millerjo@linux.vnet.ibm.com
Date: Tue, 10 Jan 2017 15:36:33 +1100
In-Reply-To: <1484022504.21117.7.camel@au1.ibm.com>
References: <20161222060610.29695-1-cyrilbur@gmail.com>
 <20161222060610.29695-5-cyrilbur@gmail.com>
 <1482460941.3419.26.camel@aj.id.au> <1482479795.14044.5.camel@gmail.com>
 <1483406661.7801.1.camel@aj.id.au> <1483911906.15843.61.camel@au1.ibm.com>
 <1483999740.6236.2.camel@gmail.com> <1484002504.12800.1.camel@aj.id.au>
 <1484022504.21117.7.camel@au1.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.3 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Tue, 10 Jan 2017 04:37:20 -0000

On Mon, 2017-01-09 at 22:28 -0600, Benjamin Herrenschmidt wrote:
> On Tue, 2017-01-10 at 09:25 +1030, Andrew Jeffery wrote:
> > I'm in favour of removing the ioctl. So the logic would be:
> > 
> > 1. If lpos is zero, assume a MBOX_NUM_DATA_REGS-sized write as we do
> > currently
> > 2. If lpos is non-zero, assume a single byte write
> > 
> > On that, should we be testing the assumptions about buffer sizes?
> > Currently we don't (we use the MBOX_NUM_DATA_REGS rather than count).
> 
> I would enforce the lpos is some specific magic value such as 0x1000
> for the special write bcs we might want to support partial writes
> inside the 16 bytes area...

So, its basically no more work (I think...) to just have partial
writes, which... satisfy this requirement no?

Just so we're on the same page - theres nothing 'special' about the
write it's just that he other end has mapped that 'data' register to
trigger an interrupt... the kernel doesn't know that nor does it need
to, the write is like any other, the interrupt gets triggered by
hardware.

> 
> Cheers,
> Ben.
> 
