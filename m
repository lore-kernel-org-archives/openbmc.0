Return-Path: <xow@google.com>
Received: from mail-qk0-x229.google.com (mail-qk0-x229.google.com
 [IPv6:2607:f8b0:400d:c09::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3svzY23FXvzDt1g
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 05:20:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=l1PlpKTM; 
 dkim-atps=neutral
Received: by mail-qk0-x229.google.com with SMTP id z190so106431205qkc.2
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 11:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:from:date:message-id:subject:to;
 bh=zMlhOpcgQbcjEjNDen7RS8mxxROLb3+vTc/T4xa6mzs=;
 b=l1PlpKTMznMpip/B1SCfiEqwBizduTTUf/IsCc8pbK4hMalTWlOrJz9ksZZiSCRzt+
 w/2l6WoIRoRcU5qgwIQB+QEUcZCsmmxDjfVoaVcMEq2HZSDmjk2YEb7flNhzWthGysOE
 YT4bSh9iHRxIKTO5oI12LG1h+xgDCJKZTAooONK17fViNztVjnNE6i33u57qidv15rXh
 r659vdS3Sv5zxX3XjNkEY5/iumgfBuXZ/iS+4yX9DfghT2VjIm0zSX+JtknBMOrU6X6l
 ddHdbgXzJB7Eu0Yg1nYvMtRml6tx0Ow5bo5GnDjtEQmgs4PERbsw4tN+bWAkpIugPvF4
 nGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=zMlhOpcgQbcjEjNDen7RS8mxxROLb3+vTc/T4xa6mzs=;
 b=B7gITEXqvYFA5dt0o1aPNJx4PyoUWnW0NXkseu+JpRPM3gpw8SifPeK0ubiNYumpJG
 xxXvwXmHifBbS5KF4OklVAdoc2Uy6JC0ic7u4dWBVv99A+gI/Ukc9057Eg2YH7ZlPKRQ
 i33xJu0E/khuPcxRQ1oNU5hwnTzOdi4e+62zKuTiP36g3yM2NQLkvDQgUZseBqICO0tf
 QFxbmgp9HT1IvEQ3J/RaC/uG7ohWe7A1S0GoqkvWZBwRbIOAaE5R6WAuU+fykoWkQGRd
 sCFjJdlcyU6PNk3bq6w4XgGQIsMrmugOwwPq0ulAxvTv7ObcA3toKIcnEJKHVC0/yNIL
 6rvw==
X-Gm-Message-State: AA6/9RlMP8OoeGTUiBdBNyxY93eMVTMOQpjaqVkJfbSI1Z8+ycsrl4qt3rdStR/F2Cun5kf4gezrGM30XCqmZ82V
X-Received: by 10.55.33.21 with SMTP id h21mr9123462qkh.297.1476382802585;
 Thu, 13 Oct 2016 11:20:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.58.194 with HTTP; Thu, 13 Oct 2016 11:20:02 -0700 (PDT)
From: Xo Wang <xow@google.com>
Date: Thu, 13 Oct 2016 11:20:02 -0700
Message-ID: <CAPH-5w6RE2j7ghR9vhX2ANUQAvBx4GuhquZ=v8r9_vYK6q+9OQ@mail.gmail.com>
Subject: Single device tree blob between linux and u-boot
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
X-List-Received-Date: Thu, 13 Oct 2016 18:20:07 -0000

Hi folks,

I saw Cedric had mentioned "...you can use the linux compiled [dtb]
and dd it at the end of the u-boot
partition..."

To provide the device tree to u-boot, should we do what Cedric said
and also pass the address of the DTB from U-Boot to Linux? According
to these slides:

https://events.linuxfoundation.org/sites/events/files/slides/petazzoni-device-tree-dummies.pdf

U-Boot can pass the DTB address to Linux in r2 (p. 6) with the right
bootm command parameters.

This means we can have U-Boot and Linux use the same DTB binary (I
prefer built in Linux) rather than each source tree building one.

Then we can remove the CONFIG_ARM_APPENDED_DTB option in our Linux
build that is described as a legacy "compatibility" mechanism. We also
avoid having an extra copy of the DTSs in U-Boot source and avoid
duplicate DTBs in our image.

Thoughts?

cheers
xo
