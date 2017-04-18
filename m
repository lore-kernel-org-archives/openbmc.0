Return-Path: <maxims@google.com>
Received: from mail-io0-x230.google.com (mail-io0-x230.google.com
 [IPv6:2607:f8b0:4001:c06::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w6QsB6cvyzDqJv
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 10:25:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="dFJF2N70"; 
 dkim-atps=neutral
Received: by mail-io0-x230.google.com with SMTP id k87so148379132ioi.0
 for <openbmc@lists.ozlabs.org>; Mon, 17 Apr 2017 17:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=vDRhvGF/INWqUA7SgvJRBVRq5SxxW2nzWPDtT0RNQc0=;
 b=dFJF2N701VBL7csVQVwN2v3qdLBi3h9GP0Q/Ip/qRVhekmC4wwspM4Zztujp+9cnAJ
 FRDD4WE73OG2lxj+uZ34hvY8cj5B09g9jAPZ9rX1Tk1aNztxvyF200roMvGTBfVY1Kx5
 U46rt0Re9yLxj1Oir1GYxGOQI2fZ156xmSIJ4cpSHX7LUG3J3ox6Bvxu0QeIDb8GF8Ow
 2BXnpLvx10uuQx1Y46jUGN6qf+7H2V9iVt6VYUWrFI5fbBnRAyMybXUq/QVgkj4tpQ9h
 698zk6UPPi0iQ8E7lnH4dlCcItnTPCnsnsdlJNp4vDkg2alsT3mluerbRVLRrf/ajmvQ
 V+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=vDRhvGF/INWqUA7SgvJRBVRq5SxxW2nzWPDtT0RNQc0=;
 b=qU1NIbX9HVLUUrWOM0skAqMivcLE1TA3G+S0pC+cvBaNhCWcFG6hgya3JlMABu82c2
 s3Mb5CAATwKmGXgWQHXYXce7555ME4Mv2jVPDpeSXy3M3IzCnMZ0zBsbnStlm8LGOHwu
 27qwwEDk8iZXVAJpwMZrisO5PD2zjErkHgWDqSRXMJIsy7K0i0dsNuCw4GSBYlFRzWSb
 R3zsnRxZS66KeAmQVVwfNb/fhLhmQTMlUzA+iVo2XHaXRg+QfYJE2mzU6QjRSieB6qOm
 54ROATJaSu9mCpD9/sWacCH+SpmDRcyil2DTiajS95MHszdvTuMYsqRSh9TM46tgtbrA
 JJQQ==
X-Gm-Message-State: AN3rC/6Xd2L0L5vgGJQTJ3poy4NVIaiPZYRl5oYcs586meIqHlaGvGDI
 mzLW2LZH4ZiJ3/ryZw7yNkGbezQ6BO/XX1y80g==
X-Received: by 10.36.173.91 with SMTP id a27mr12951825itj.60.1492475148657;
 Mon, 17 Apr 2017 17:25:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.185.7 with HTTP; Mon, 17 Apr 2017 17:25:48 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
Date: Mon, 17 Apr 2017 17:25:48 -0700
Message-ID: <CAFR_W8rbMN1uSC8o+cF94D40KwSdJT1oOGYLMS90PWHHuAVsaQ@mail.gmail.com>
Subject: Running OpenBMC in qemu
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
X-List-Received-Date: Tue, 18 Apr 2017 00:25:51 -0000

Hi all!

I've ran into troubles when I was trying to run OpenBMC image in qemu.
It has been a while since I've done this, so I'm wondering if I'm
missing something.

I build it with:

export TEMPLATECONF=meta-phosphor/conf
source openbmc-env
MACHINE=qemuarm bitbase obmc-phosphor-image

With v1.0-stable openbmc/openbmc branch I get this output:
http://pastebin.ca/3798183

With the most recent version (master), I get very similar output,
except that the error is now:

VNC server running on ::1:5900
vpb_sic_write: Bad register offset 0x2c


In both cases the terminal I run this from basically just hangs.

Am I missing something here?

Thanks!

-- 
Maxim Sloyko
