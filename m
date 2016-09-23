Return-Path: <xow@google.com>
Received: from mail-qk0-x22e.google.com (mail-qk0-x22e.google.com
 [IPv6:2607:f8b0:400d:c09::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sgFNT2kQwzDskk
 for <openbmc@lists.ozlabs.org>; Fri, 23 Sep 2016 10:58:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=AYFwOONY; 
 dkim-atps=neutral
Received: by mail-qk0-x22e.google.com with SMTP id t7so93018037qkh.2
 for <openbmc@lists.ozlabs.org>; Thu, 22 Sep 2016 17:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:from:date:message-id:subject:to;
 bh=6ReUbCivcjkhF/JRMA2kmZDMpLPztQ68Wgeyd7CptLM=;
 b=AYFwOONYoHhq6ZGmK+kUYFLlO16RqNmno4TQUK8BEN9HI89i+Dh2Ubjrt505Ns20E8
 kBURvsbcoDlOgEcZTHIyItfHsGw4+miwaA807VYON8NPeGKxJ/iyJ9SQ/IRtVNqZ+ifx
 86HuEO2b8YEwOffIU9FRt7b2QeaGXDrU5NnHj9DNKFKKw/lh36e0Y2iLxx+CWWqvuShX
 Qk1uz+vxOuUX3IDF2UJpuy0ndgmyGpP0qUudIk/p/tzBcQA3T+z5HVujLO2j5Dy3zJ0R
 PATqRk61f0OXtCsqDfsTFhd4nc72aBLRh7pGNoB8ulfNXbPWYsZNjrsYTRKwIn3WWLqY
 8m8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=6ReUbCivcjkhF/JRMA2kmZDMpLPztQ68Wgeyd7CptLM=;
 b=UMjclkYTbob9iKANJAePlwg9oTJeWpqVXRgsokpZ+F73hO8i2SZ3g4vQF9nLXJ8bsc
 TnHmtcQbvzv2jtokclASKtCYy+OmS730DusKJ8r/UEYFEl8zZOOLVcgIXYgoyRowwNbJ
 2i7Gmbyn5Oc1hI4Fv6JahoQ97iJWLJKu1G1A6BxOHn8RQ9yOTjQ1kQmN5s7J/UKmgeYa
 YyZAyr/tKKNDGPwZTMSvAAXD6e5H2O8JBCqdK5xDjuCP6W0gN+ZL1DNgXKbK6fGQhjpX
 tM9KCCGtjLmD7GIrejlaDoV11PfjHYrDcTo+NJFOoH0EPwOKyNIHqGkrocwqDfT3A50L
 9wfg==
X-Gm-Message-State: AA6/9RlDWJYjXBb+1Jmu8Rk7Wqq9inhzfbOng7Q6PxRMOOiYj2Ap9Aa3wjHgw0CqH8hQp06noJ0oZoDgviTZuODQ
X-Received: by 10.55.214.220 with SMTP id p89mr4825782qkl.162.1474592310592;
 Thu, 22 Sep 2016 17:58:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.47.132 with HTTP; Thu, 22 Sep 2016 17:58:30 -0700 (PDT)
From: Xo Wang <xow@google.com>
Date: Thu, 22 Sep 2016 17:58:30 -0700
Message-ID: <CAPH-5w4jbigkRRKvOs9hT_kvCyGSMG8bL=j5=z6cyDND52mdYw@mail.gmail.com>
Subject: Skeleton power control machine configuration
To: openbmc@lists.ozlabs.org
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
X-List-Received-Date: Fri, 23 Sep 2016 00:58:34 -0000

Hi folks,

I was adding power sequencing and buttons for our P9 machine and I
noticed that Firestone, Garrison, and Witherspoon had patches to
op-pwrctl that replaced the net names on the power pins, added more
reset complexes, etc.

https://github.com/openbmc/openbmc/blob/master/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-phosphor/skeleton/skeleton/0001-Set-witherspoon-power-pin-and-pgood-nets.patch
https://github.com/openbmc/openbmc/blob/ced4c34ee252d0036b714425eecb0ed8bb528750/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton/0001-Add-power-control-support-for-the-Garrison-system.patch

I didn't want to do the same for our machine. I propose moving machine
specific options to the Python configuration so we can eliminate the
skeleton patches.

I mailed my prototype to the Gerrit that adds a dbus call to
system_manager, C bindings, and power control logic to handle the
abstraction. Please take a look.

https://gerrit.openbmc-project.xyz/#/c/605/
https://gerrit.openbmc-project.xyz/#/c/606/
https://gerrit.openbmc-project.xyz/#/c/607/
https://gerrit.openbmc-project.xyz/#/c/608/

I'm planning to also extend the GPIO/net name abstraction to reset and
power buttons, since they're also using net names directly in their
sources.

cheers
xo
