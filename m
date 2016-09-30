Return-Path: <maxims@google.com>
Received: from mail-yb0-x22c.google.com (mail-yb0-x22c.google.com
 [IPv6:2607:f8b0:4002:c09::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3slzwY2M6szDrVJ
 for <openbmc@lists.ozlabs.org>; Sat,  1 Oct 2016 04:09:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=KH2Y0fYw; 
 dkim-atps=neutral
Received: by mail-yb0-x22c.google.com with SMTP id z8so30974986ybh.3
 for <openbmc@lists.ozlabs.org>; Fri, 30 Sep 2016 11:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:from:date:message-id:subject:to;
 bh=yIvNkBsRzTmsEt2SzxRJH54ln4xi345tNCfQPi1Uu1M=;
 b=KH2Y0fYwRr76Ozh0N433RlXFnYajEn/G62R7lVUqBFx8x3cZNNnFdaCbTXDsXNO1r/
 hcTYg2y41JieIMN43lpj6Y3qMn1wbpbsiL5LljE4f/oWrch/TnBdFCFXWD5B+QiwOAhr
 YVSFTkNDJHSVuQyPMgXsjns/ROoijigPRlsd+0fZI1fDubuflERQTJPpPyeeRzCiQx80
 RYEFPW8h63m5QoMljL4cb3pBLqd5XiFH+tI9HhKJ1KlzJ4leDdAeCmDAhFIvmiftcTXb
 soYDEQQfI2FTSwUiGtq4NsP2v4QzeOa0KX0j8TUtWPMUPf0bwryxwM1OFyeWChsnqoUf
 cm7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=yIvNkBsRzTmsEt2SzxRJH54ln4xi345tNCfQPi1Uu1M=;
 b=LH0QlGcVUNG1LZUlkZr+GnlWj7SgodiECnu0zOPr0JLpeMJj2KOypS5ExK0YvDd4fD
 0+xX0Y0uUHZTJf7KYYnMKn66KEz0QQJyNQ8buEbhVO1M8Q82yFf70+MUZdS/8jQkUmiH
 iXDek1R/kATlHxGTz2B8Pjf6WQPdCWdjrRm5pPkxH9P0K6SPNVq/5esYJ4mFWaOWzZCb
 lIwaNwaG6a5+59w3hmP67H66y63MyIlj2Qp/a+abnv764z+W9nbuDDYJikGEcJQES7fx
 p4+h3qMfXPPOs3YvkWdOkkkxweLstGX+6OQ4k2wXQkjVnHAjGOk3WyWwxncejdHfp/iL
 0z7w==
X-Gm-Message-State: AA6/9Rmn/kCynJO+q+uhQVHtgJOrHtR6nu7XFfOQprH16y9Aq2YsVSHk4iPgfVEXPMiD7iKUrKMQ5Todf7kKIx3T
X-Received: by 10.37.59.85 with SMTP id i82mr5638694yba.73.1475258952944; Fri,
 30 Sep 2016 11:09:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.38.80 with HTTP; Fri, 30 Sep 2016 11:09:10 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
Date: Fri, 30 Sep 2016 11:09:10 -0700
Message-ID: <CAFR_W8oXug8fKap4Eh-3T7qxXXoemG07-CAFxzXhJwwRW4Cz+w@mail.gmail.com>
Subject: U-Boot ethXaddr environment variables are not propagating to Linux
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a114f4c6ad8264f053dbd7d56
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
X-List-Received-Date: Fri, 30 Sep 2016 18:09:18 -0000

--001a114f4c6ad8264f053dbd7d56
Content-Type: text/plain; charset=UTF-8

Hi all,

This worked before, when I first tried it ~2 months ago on the eval board:
set ethaddr & eth1addr in U-Boot, boot Linux and it will use the same MAC
addresses. I tried it again yesterday and it does not work any more.

I tried it with openbmc/u-boot, to make sure my changes do not interfere. I
verified, by reading MAC08 MAC0C registers, that MAC addresses are properly
configured by U-Boot from env. However, when I booted Linux, it still
generated random MAC address, rather then reusing whatever was passed up
from U-Boot.

Any ideas on what change might have affected this?

-- 
*M*axim *S*loyko

--001a114f4c6ad8264f053dbd7d56
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>This worked before, when I firs=
t tried it ~2 months ago on the eval board: set ethaddr &amp; eth1addr in U=
-Boot, boot Linux and it will use the same MAC addresses. I tried it again =
yesterday and it does not work any more.</div><div><br></div><div>I tried i=
t with openbmc/u-boot, to make sure my changes do not interfere. I verified=
, by reading MAC08 MAC0C registers, that MAC addresses are properly configu=
red by U-Boot from env. However, when I booted Linux, it still generated ra=
ndom MAC address, rather then reusing whatever was passed up from U-Boot.</=
div><div><br></div><div>Any ideas on what change might have affected this?<=
br clear=3D"all"><div><br></div>-- <br><div class=3D"gmail_signature" data-=
smartmail=3D"gmail_signature"><div><b>M</b>axim <b>S</b>loyko</div></div>
</div></div>

--001a114f4c6ad8264f053dbd7d56--
