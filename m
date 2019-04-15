Return-Path: <henbinchang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::830; helo=mail-qt1-x830.google.com;
 envelope-from=henbinchang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jmcckb77"; 
 dkim-atps=neutral
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44jHwc6wFkzDqJP
 for <openbmc@lists.ozlabs.org>; Mon, 15 Apr 2019 16:02:56 +1000 (AEST)
Received: by mail-qt1-x830.google.com with SMTP id k14so17869333qtb.0
 for <openbmc@lists.ozlabs.org>; Sun, 14 Apr 2019 23:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=3AMx5GxJCqoHwBURW7bXRxT02Vu6f/207l3/KbP48+Q=;
 b=jmcckb77vlP1lHFNsQBoZ2x6Wf4IhRvMfEfsT+fptazHogHDDeXMh0oYyEdlGaLHWR
 EbmqneVWYRcgkkXbyrDUvQScUyet+XeSxN0347xSWfmzY2FJSvsxTj3o4W9ROn+jOI2O
 rC3jrW6Kytp+ACX/Rt870TECGHQsqUmQtIJQaBQ45TNgbm3ZN6HHZN1IZCFN7gGP57Oh
 VHzWPHJZvjmpgMu+YhZkuFrnyYfq9SYJ8An8M2lHFiKtlI3tvmGBct8Uy9ZmY1Pcz2Kp
 MEaOUo4qzFLH4tPw/ztJFxWQ5cp8yd2WSLH0Z0OPmKPowwyD+FOmujLI/UnkU6dhqtuV
 r30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3AMx5GxJCqoHwBURW7bXRxT02Vu6f/207l3/KbP48+Q=;
 b=MwOyg5PyqbkoQGNFPGD7GXcZmRN9v7CSzdKTk/J4rnfSCYxnUN88Y6pAyanrnIMKDL
 QqBQmFSwtIbpiqRb+JmFhIW9EM+OFw63Gh/A53PofjINaLXyDB/JnL4uiXmeRz9AwVkh
 2+D9lDZjpmG9modcXMxBNJtZ1wVWkBjr0HWCBfU3rWK1JvfbULfmXNwdgQgZkwiAnqsM
 lDTK63sMN31XqFTgP5L6YSypioZDkzq/naMi1mLHhWStqL+dLbIkDAkHfNIc5c63qIs3
 Vymyjx1sDNsMkXjsOA/8XYLCCJV+jQhDmSJDBLomrFfYqe8jWl1UOPVFoYF58K4QVa8+
 NZFA==
X-Gm-Message-State: APjAAAWxN32jETnUoqs6yjM/XE79GHk+OjGlfAO5JQekOoN5Iu1XiVCj
 pgnJw2XHImn0iukN8sUvdu452hvCz2rH4L0O5lnigfRG
X-Google-Smtp-Source: APXvYqyKCxA109uuiuTPC1pXszKVblc1Kp/ogDBfr8yUHS+yZ/jvbd+1aISkwRMvcebfyKUJrC2y14Q7lSREGlh/ZVw=
X-Received: by 2002:aed:3ee7:: with SMTP id o36mr60189844qtf.355.1555308171068; 
 Sun, 14 Apr 2019 23:02:51 -0700 (PDT)
MIME-Version: 1.0
From: Henbin Chang <henbinchang@gmail.com>
Date: Mon, 15 Apr 2019 14:02:40 +0800
Message-ID: <CAG9c7cDzNFK-g-SsDu+QLsryMAHQaS4Lhc68+0F4=yVzD8njAg@mail.gmail.com>
Subject: The Firmware Revision of 'ipmitool mc info'
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000000d883405868b6773"
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
X-List-Received-Date: Mon, 15 Apr 2019 06:02:58 -0000

--0000000000000d883405868b6773
Content-Type: text/plain; charset="UTF-8"

Hi All,

As I know, the Firmware Revision of 'ipmitool mc info' is determined by the
OpenBMC release tag's name.

According to the comment in the apphandler.cpp (phosphor-ipmi-host), only
the vx.x-x-[-x] and v1.x.x-x-[-x] formats are support currently.

But the latest release tag is named by the different format. As below,
2.6.0
2.6.0-rc1
2.6.0.rc1
2.7.0-dev

Can anyone give the suggestion?

Thanks.

--0000000000000d883405868b6773
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr">Hi All,<div><br></div><div>As I know, the Firmware Revision of &#=
39;ipmitool mc info&#39; is determined by the OpenBMC release tag&#39;s nam=
e.<br></div><div><br></div><div>According to the comment in the apphandler.=
cpp (phosphor-ipmi-host), only the vx.x-x-[-x] and v1.x.x-x-[-x] formats ar=
e support currently.</div><div><br></div><div>But the latest=C2=A0release t=
ag is named by the different format. As below,</div><div><div>2.6.0</div><d=
iv>2.6.0-rc1</div><div>2.6.0.rc1</div><div>2.7.0-dev</div></div><div><br></=
div><div>Can anyone give the suggestion?</div><div><br></div><div>Thanks.</=
div><div><br></div></div></div></div></div></div>

--0000000000000d883405868b6773--
