Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::230; helo=mail-oi0-x230.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jaXAaJQ7"; 
 dkim-atps=neutral
Received: from mail-oi0-x230.google.com (mail-oi0-x230.google.com
 [IPv6:2607:f8b0:4003:c06::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 414BdZ001NzF3dB
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jun 2018 22:09:21 +1000 (AEST)
Received: by mail-oi0-x230.google.com with SMTP id t133-v6so17613949oif.10
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jun 2018 05:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=mPw30rJOj+gg99FwWB2hfTIHfowTzR8sKQPw0+c/WI4=;
 b=jaXAaJQ7GvI4HePi1QKNlYLWNihWeGY2VnIv6wAbjrFmwKLELuJm8JKSEio1mwo2OM
 1yXCSO+L1mzStK2LzuWQ52COkjceXYABlBw0ZhNY1+oi77SMf5BLI8oc3eB6zUgRwBue
 igXW4aMZ3MLZOA+hp5jZJ2MsfM47xeKf7L2SbQl7r+aqFQoGIX5785EsS//w3cVLttWI
 zdXSuWbLY+E7n2mqvPzXHm3oa64o/86IKwzsi+W+auCq+KYnV8Tp1s2oSV5CdbM/FWEt
 3rySXEzZ3xY1MePD7rvjjZFRPZTHzMV4cK7ya7OXsdHhq9A+9rTQIWHHS60IA4KS1AwE
 7pdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=mPw30rJOj+gg99FwWB2hfTIHfowTzR8sKQPw0+c/WI4=;
 b=VezkSagI/q3BWCCCW91at1IF2VzTTLT8shhllV408kdGhwKJsqx6wZcUWtbmTuSqj4
 i7t14fFb9HRH0I8ud+hTHJrfTek1PBjAEV5XQXPSlCHWykOdK5yI16+w9I+S6WMFsOnM
 irPYCjZx6wVtcgzGmXi9gsjvzmcNJ7oXzUgwPJS/k6dboX2k+yGhGq8GxF2DZz70xtw8
 xjNZZ+ul317WDeqWKQXUEQb0SSI1SxBDkedlvrg7iCWoxLzViKzEzAkZYFWo7x+SBiLr
 CP3ZQpi7zYEOYsGm3cbkJLCT4L84OTlSePaV+yhv7rVnpIawZzrZup49xWA4/wjLjefC
 eOVg==
X-Gm-Message-State: APt69E2csg2EwCuye5c8j065X9+IeqIVWzYQCyV4lCFWoEh8bPh/UDFQ
 +K44/lZIe4cce8IJjPnI6hcH7ReXdyOK/2GHsjcDtw==
X-Google-Smtp-Source: ADUXVKISS+BvBQsa50WLXEQBK4hPcH4dYXN+gG0HMHeFN4uiLSCm4ylS1SL4B7zH+Ac4UZkwQd0uCbkjJQgObN+nlaI=
X-Received: by 2002:aca:c681:: with SMTP id
 w123-v6mr7802868oif.94.1528718958605; 
 Mon, 11 Jun 2018 05:09:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:b05:0:0:0:0:0 with HTTP;
 Mon, 11 Jun 2018 05:09:18 -0700 (PDT)
From: AKASH G J <akashgj91@gmail.com>
Date: Mon, 11 Jun 2018 17:39:18 +0530
Message-ID: <CAE33tLHUEXmDHgG8ohcs_aSZTmujXBhGc5WY2S9_khsxxF1Ucg@mail.gmail.com>
Subject: Flashing Linux image using u-boot TFTP failed.
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000007d3ac5056e5c9e30"
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
X-List-Received-Date: Mon, 11 Jun 2018 12:09:22 -0000

--0000000000007d3ac5056e5c9e30
Content-Type: text/plain; charset="UTF-8"

Hi Team,

I build the Linux image using the steps given in https://github.com/openbmc/
openbmc, target machine as *Zaius*. I flashed u-boot into the board
containing aspeed ast 2500 and got an 'runBMC' command prompt. But flashing
Linux image using u-boot TFTP failed. Please someone share how to burn
Linux image into the flash memory.

--0000000000007d3ac5056e5c9e30
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Team,</div><div><br></div><div>I build the Linux i=
mage using the steps given in <a href=3D"https://github.com/openbmc/openbmc=
" target=3D"_blank">https://github.com/openbmc/<wbr>openbmc</a>, target mac=
hine as <em>Zaius</em>.=C2=A0I flashed u-boot into the board containing asp=
eed ast 2500 and got an &#39;runBMC&#39; command prompt. But flashing Linux=
 image using u-boot TFTP failed. Please someone share how to burn Linux ima=
ge into the flash memory.<br></div></div>

--0000000000007d3ac5056e5c9e30--
