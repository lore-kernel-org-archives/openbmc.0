Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::22a; helo=mail-it0-x22a.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JLCHqzog"; 
 dkim-atps=neutral
Received: from mail-it0-x22a.google.com (mail-it0-x22a.google.com
 [IPv6:2607:f8b0:4001:c0b::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 429GdT4FFNzF37m
 for <openbmc@lists.ozlabs.org>; Wed, 12 Sep 2018 19:27:08 +1000 (AEST)
Received: by mail-it0-x22a.google.com with SMTP id e14-v6so2093896itf.1
 for <openbmc@lists.ozlabs.org>; Wed, 12 Sep 2018 02:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=S5OFl/J8MgYisJjD+7/h9q97OjFnQ/fBa/5/uqZ+eCg=;
 b=JLCHqzogxQsfGtyzeUK+/iXGFyU7bSY+Fg7ySHdF1Uyt19erdrkFWpUf1FhHkfdsru
 ABPoYCcIg12GEgYtRUpAQJm5QjzLCh9mTtlZA9rRSwtRjQ27ifrzwfU04WkW4zgfqycJ
 u0oQxAdh3s0VZbv2UL1sbpEXbPF+uBg+nYdt+cjWNU7bQrJuKCpeHuiYboSx0nxQstFa
 qPnRe2WPbuuKE8QYUNOxXmsWTIF1VK5iGrIvrTnVKtlEiJN2gu6n9AKZ/w3psUYd6o6J
 GvQRL7HKYszXCrl6uBWuBDjwuWo1m+csIZ9oh1oYPQ+guHZBv7JzixGhmrdavatUOWik
 guKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=S5OFl/J8MgYisJjD+7/h9q97OjFnQ/fBa/5/uqZ+eCg=;
 b=Xxe49xPodjcD9qBDrARBRJ7mpH0ESKif3UhGpyJp6Z34C9o52FXVQAWNCPRUokFlDu
 k8rjG46ZS0reKiTjd7gv0d9Qm0O1y08x0DXKzqWILnTrlxW3quFRVceT+0IbzuSwEJNd
 gX9V/O+Tkq+Wam75R1+YvOtIMStc0gNz/zbeT3EDvk9VHGwlTUXNFUd+QPH4eorphyDq
 aLIYT5ckZuvDC4m5eTjt4k5vKq72aEJiijFag7tfn4gECv8Vo2DI6i/kHUC4kJysGZAT
 UBjK625YI52XcClYy211hgGzdUyjTLF29CNd8vhFaNobvUwE3uv1fh/bRPV+/EqCDhQX
 SuXA==
X-Gm-Message-State: APzg51BDMZrzmAbIdooQNXPBcY1CfQ5iYDn3XYYuQeeMBRp++gA15olo
 YzU83P1p6kcg2nB+GqVxvL5YSQd8qOuSIbyolAlsdExu
X-Google-Smtp-Source: ANB0VdbputZmDkqJlhOnl+6Cw2nlchSMIj96Z3frgml/h+nMSBVYdwhtiu3SPOR0FOaVVZptagr3pjEhFazOuJ3jRo0=
X-Received: by 2002:a24:85c6:: with SMTP id
 r189-v6mr1113960itd.83.1536744426170; 
 Wed, 12 Sep 2018 02:27:06 -0700 (PDT)
MIME-Version: 1.0
From: Lei YU <mine260309@gmail.com>
Date: Wed, 12 Sep 2018 17:26:38 +0800
Message-ID: <CAARXrt=u1NYt4BLy0M5jiBVSWE9LwQ6ytuygXChVNbqApcPf3Q@mail.gmail.com>
Subject: Problem on static libraries enabled with LinkTimeOptimization
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 12 Sep 2018 09:27:10 -0000

This email is to describe a problem about static libraries enabled with
LinkTimeOptimization (-flto), and asking for suggestions how to fix the
problem.

## Background

When a repo enables lto, and if the repo builds a static library, it gets
build error, e.g. for [phosphor-fan-presence#11][1]

    arm-openbmc-linux-gnueabi-ar: .libs/libfan_la-utility.o: plugin
needed to handle lto object
    arm-openbmc-linux-gnueabi-ar: .libs/libfan_la-timer.o: plugin
needed to handle lto object
    arm-openbmc-linux-gnueabi-libtool: link:
arm-openbmc-linux-gnueabi-ranlib .libs/libfan.a
    arm-openbmc-linux-gnueabi-ranlib:
.libs/libfan.a(libfan_la-utility.o): plugin needed to handle lto
object
    arm-openbmc-linux-gnueabi-ranlib:
.libs/libfan.a(libfan_la-timer.o): plugin needed to handle lto object

And eventually it causes undefined references during linking.
The same for phosphor-time-manager.


## Root Cause

ar needs to load liblto_plugin to handle lto objects, and our build
environment does not tell ar to load the plugin.

According to https://gcc.gnu.org/wiki/LinkTimeOptimizationFAQ:
> In order to handle archives of these objects you have to use the gcc
> wrappers: gcc-ar, gcc-nm and gcc-ranlib.

So the simplest way to load the plugin is to use gcc-ar instead of ar.


## Question

Most of phosphor repos in OpenBMC uses autotool to configure, and it depends
on environment variables to configure the repo.
By default, AR is defined as `${TARGET_PREFIX}ar`, I do not find a way to
change it.

So my question is, how to handle this case? E.g. how to specify gcc-ar in
autoconf?


## References

* I have an *ugly* workaround to override AR by define it in `EXTRA_OECONF`,
   see https://gerrit.openbmc-project.xyz/#/c/openbmc/openbmc/+/12721/ for
   details.
* bmcweb uses CMake and it specifies gcc-ar in [CMakefiles][2].

[1]: https://github.com/openbmc/phosphor-fan-presence/issues/11
[2]: https://github.com/openbmc/bmcweb/blob/master/CMakeLists.txt#L70
