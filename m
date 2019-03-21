Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mq555RbD"; 
 dkim-atps=neutral
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44PyQm0jsDzDqQg
 for <openbmc@lists.ozlabs.org>; Thu, 21 Mar 2019 18:02:23 +1100 (AEDT)
Received: by mail-io1-xd2c.google.com with SMTP id b9so4358709iot.13
 for <openbmc@lists.ozlabs.org>; Thu, 21 Mar 2019 00:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QMndZFCV9p6tpO7O5LVdcCuMoteaowChLqs46taFDgw=;
 b=mq555RbDkOCkHM/Aa2P4ypaf9fYAz850i5oggr5EqdOrv/uR18pWEOja/IHc+yF5Qx
 ahDuewftmuF0TccNTfCmjk2cv+QfKPPL+B+kiT6q7wQYVJYkcpAUM0qnC7B5BJQSk9GD
 QT4ywWJY5X3HqvVc8LCljJmhLOHGfnB2NHpGGve0bWaDZzh5fOlmfFuywdnvVriugdjd
 V5O6Q49qMs5C/7A2WvwxMPIO2RfCpNEee0rEe5vSF0TynG0BlzKF1fch/fwoHR7s9n2f
 pSuXAbckQKqAOwnI6iyOkh5tlBIkLBxAuAo4nJCKQg5cyB/YmtX0NqMfbfaRoBRCOVqs
 zhvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QMndZFCV9p6tpO7O5LVdcCuMoteaowChLqs46taFDgw=;
 b=CLDsYhAzaRNTSXqWNKXQPo0gMDCKbLuDxoZJ9gOOe++uH73NOotxPPtWQlA/7OdUfj
 Z6w88puFQ/UmTKmsXfHEMnAf6ayuqy1LVwvCc89jPboe9yCcPPOEaKUth4BhFJSQDTo6
 0j/IhQVz68wSfw9tqbJnrfzjmOYbK7IYZHfcbtpmd0NkSsV9Jx8B6/gj20gVCwM56OWT
 v+FnrR6F4qJKf8bEz/rCZ2/MpB15Fr5/ysns8W9t4lFj0meRaznv3r3mfH/6U/Sa6Nd7
 zJAAFi7D2h59OpbABxwQqdMduMoORpTS9CGiEB0iw0aYFRS4UxnvDJ8ED3ibf0RwRxx/
 s+qw==
X-Gm-Message-State: APjAAAWeKE1iO8k8wJmRcwY3opjkK+m7269iV5zVJnyLJtC1qKWtvd9t
 WF55+4wV8fgJgtuLhMI1BGf9vkO04fZ76s3/jsw=
X-Google-Smtp-Source: APXvYqyd09nPOtWHlvcXGsxi57rB5Q7+8yMCZfNUojRpXXJR3jtjfFJnvyP4+u8BC9WBxi9/CgxiWgmtNxIfAYLVMc8=
X-Received: by 2002:a6b:ef12:: with SMTP id k18mr1568704ioh.171.1553151739871; 
 Thu, 21 Mar 2019 00:02:19 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_2EF1C4452C43ADF74A37DF04@qq.com>
 <fa618273-b2e8-3d53-9c28-91f01fd83c05@linux.intel.com>
 <tencent_77BC148C0E378EFD5F488CE6@qq.com>
 <fa79e3d3-cc85-ba90-42b7-2e6ef69f6653@linux.intel.com>
 <CAARXrtn+ghtcdPLBDVMrMtX31==ZufsuPDCKm11dd92zQwm22A@mail.gmail.com>
 <fb4ea162-ae50-5c02-eea6-3adb200e6ed8@linux.intel.com>
 <e592f504-b7b4-ff40-543c-84e99502e1d1@linux.intel.com>
 <CAARXrt=wgz7zqDWpx3inzBnMJJdxQ=b5ebLrna1H8A5kXc4r5w@mail.gmail.com>
 <2d44c252-94b6-6441-d3e8-a8200d89aaa5@linux.intel.com>
 <CAARXrtkkmxHcgvkp1Mi8esY0onqdHxRzaymcf8NaBZSM9uVYRQ@mail.gmail.com>
 <CAH2KKeajTT96Y6rOdKGct+EBLdbFxGo97SEfWzMrcu0hqRh_Hw@mail.gmail.com>
 <77cb1f2b-96c5-bd14-eab7-0da527343ce1@linux.intel.com>
In-Reply-To: <77cb1f2b-96c5-bd14-eab7-0da527343ce1@linux.intel.com>
From: Lei YU <mine260309@gmail.com>
Date: Thu, 21 Mar 2019 15:02:01 +0800
Message-ID: <CAARXrtnAURfEDzTHZLHgOojRuD9T4DbUmuQLwvwsS4hvW-Sk_Q@mail.gmail.com>
Subject: Re: Does obmc-ikvm work with bmcweb?
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Thaju <tajudheenk@gmail.com>, xiuzhi <1450335857@qq.com>,
 ed <ed@tanous.net>, 
 openbmc <openbmc@lists.ozlabs.org>, Eddie James <eajames@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Mar 2019 07:02:24 -0000

> Check journal (journalctl -f) while you're testing KVM if there is any
> suspicious error. In normal opration, you should see logs like below:

I see the same logs as Thaj, only below logs show when the issue occurs.

Mar 21 05:26:02 romulus env[1564]: 21/03/2019 05:26:02 Unable to
establish connection with systemd socket
Mar 21 05:26:02 romulus env[1564]: 21/03/2019 05:26:02 Listening for
VNC connections on TCP port 5900
Mar 21 05:26:02 romulus env[1564]: 21/03/2019 05:26:02 Listening for
VNC connections on TCP6 port 5900
Mar 21 05:26:06 romulus env[1564]: 21/03/2019 05:26:06 Got connection
from client 127.0.0.1
Mar 21 05:26:06 romulus env[1564]: 21/03/2019 05:26:06   other clients:
Mar 21 05:26:06 romulus env[1564]: 21/03/2019 05:26:06 Normal socket connection

And sometimes it works, then I see logs like:

Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Normal socket connection
Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Client Protocol
Version 3.8
Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Protocol
version sent 3.8, using 3.8
Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12
rfbProcessClientSecurityType: executing handler for type 1
Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12
rfbProcessClientSecurityType: returning securityResult for client rfb
version >= 3.8
Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Pixel format
for client 192.168.10.11:
Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12   32 bpp, depth
24, little endian
Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12   true colour:
max r 255 g 255 b 255, shift r 16 g 8 b 0
Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Using
compression level 1 for client 192.168.10.11
Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Using image
quality level 6 for client 192.168.10.11
Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Using JPEG
subsampling 0, Q79 for client 192.168.10.11
Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Enabling
X-style cursor updates for client 192.168.10.11
Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Enabling
full-color cursor updates for client 192.168.10.11
Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Enabling cursor
position updates for client 192.168.10.11
Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Enabling
LastRect protocol extension for client 192.168.10.11
Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Using tight
encoding for client 192.168.10.11

It's found that the VNC server may work when the screen is changed, e.g.
reboot the OS, or enter the OS.
When OS is in idle, usually it will not work.

> Also, try these two patches. I added one more patch.
> https://gerrit.openbmc-project.xyz/c/openbmc/obmc-ikvm/+/19392
> https://gerrit.openbmc-project.xyz/c/openbmc/obmc-ikvm/+/19433

Tried the patches, still the same issue as above.
