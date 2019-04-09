Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="gQeGIty+"; 
 dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44dtFn0WGSzDqHF
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 02:35:56 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id a96so5040816pla.6
 for <openbmc@lists.ozlabs.org>; Tue, 09 Apr 2019 09:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=dy7wh7qJ4ltAcThiVd/I1vLsGeD17ApcVksjPKFF0rM=;
 b=gQeGIty+Fz9ONlWSICb0wgAIAcrkGJ1CGMhjMlvzx58z2PFWecX4ixSptqCtlVxLFI
 lxMWh5Am+azLXieZiVNXRybrjdi9RRM5FS++gpr2+Fjf1Ak2tzoqkEFONeya+hT2zBKb
 QZJffiS+ywjBcrtMU9pBTrcgmEa7gkiCP91BEk85qzx8YYKCXalk1rdiHkcrigaMiSAk
 Nsgj2A5YkZOQrDFMGW22dZU7ChHc3w+yFoZf7+PA7U3iT9hbhT+T6M5quA7xslmbvcJ1
 nf3sksS2OciBMzg9e/A8KRginwJp/RgxcpSbA7KmNTDL/co8QqG3y3tTCM+y6g4U+Odw
 HrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=dy7wh7qJ4ltAcThiVd/I1vLsGeD17ApcVksjPKFF0rM=;
 b=eDQOWW7/BddbG9M6hX8tbBgoRGtDqFZl3tDycmptMQnJ/m/ZFzG4tsDtOrmvwh78tg
 XsmYlW+8hIGSpHzeLKusAILvPR9mb0/kPEyFE4sOJ1olFBz5Gm1OVmXbpTFeoP9lcGh/
 OWl8vjYaG8Wq5jQh4ucpGjX7QL+31k/VjsbZWvz/MJqBsUZXGyJOOirmMN8v+/9HbmGp
 bd+Z9jRFZqlvmdwJqBJntIY+8e+t49d30XSwBFPMLtlRxXxYjgeUbqcffyrqcUVOSXhw
 n/c7etERZdPp6u3XbKvIhAmZvobam37o7U0v2iQDKv7tJ3zZmMPELiqB+zA25RC02qZ4
 YR8Q==
X-Gm-Message-State: APjAAAXuXVLOEpugapMttcOK7FhIP/f7XrD7PqyvMhnaA/UKhAU2Zo4L
 ZYFGq098eonne2+EazzmvhYYWLRgn5Upn/i7IBEzBz4KHRQpJQ==
X-Google-Smtp-Source: APXvYqyiGl5RtovEz80vSGAaX+nJ8qwVVcyJ6AfvS2mhET/iVNIVv5mfSueBi4IYoVGuk2wAVf3WYAE8FdT/qBDXK48=
X-Received: by 2002:a17:902:778a:: with SMTP id
 o10mr26557354pll.135.1554827752781; 
 Tue, 09 Apr 2019 09:35:52 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Tue, 9 Apr 2019 09:35:41 -0700
Message-ID: <CAO=notxhe24e8-1dTcspD_H7xTy49yEnnn-gJbUciekirzKC_w@mail.gmail.com>
Subject: transitioning from 4.17.18 to 5.0.6
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
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
X-List-Received-Date: Tue, 09 Apr 2019 16:35:58 -0000

HI, I ran into some weirdness when transitioning from 4.17.18 to 5.0.6
with the quanta-q71l board.  More specifically now my host can't talk
to the BMC via ipmi-bt.  All it returns is 0xd5.  on the BMC itself, I
can talk to ipmid file via dbus, and btbridge is running.

Has anyone else run into weirdness?

I am seeing:

[    4.645814] ipmi-bt-host 1e789140.ibt: Found bt bmc device
[    4.650341] ipmi-bt-host 1e789140.ibt: Using IRQ 32

The dts file I'm using is basically identical to the upstream one, and
my defconfig is also nearly identical to what's in meta-aspeed for the
ast2400.

Patrick
