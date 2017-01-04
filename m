Return-Path: <raltherr@google.com>
Received: from mail-yw0-x236.google.com (mail-yw0-x236.google.com
 [IPv6:2607:f8b0:4002:c05::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tv0Lg0ys1zDqFb
 for <openbmc@lists.ozlabs.org>; Thu,  5 Jan 2017 05:52:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="D8a5TEaQ"; 
 dkim-atps=neutral
Received: by mail-yw0-x236.google.com with SMTP id a10so322721186ywa.3
 for <openbmc@lists.ozlabs.org>; Wed, 04 Jan 2017 10:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=7ZRSBRMrceps2lrsx5l49i6WkZr2mdryftVmGmucJNo=;
 b=D8a5TEaQyv9u934AhChLkt8jus9d02KzfuUzz52nVOdSTvj2InFxxGJlQOLP4GaXTn
 2gP1sC59d311xHa5d5Hs7c9DjjZ2Mjl34ZuiaFQiKuU8pFJI+b0A6+Rep8ES2pMaWBXh
 TvcBCGd1BVWE1whG4PwnhoMHYb7Gd7v1SuJo8YLo1wGGgCZ4A+HFl5t6qq8WZxI5cMug
 V9vn2gr4q/yNzHrI1gXBCeNVXYiEpnBEJ+EBZwrjgOkRBWPViFLBBSUrf8L6mGnQ9oQI
 NAL5xMfsq+Hz266EAqQDfZSdMspfpVpg+opvXmmHiF3SoLMciS/sxMBHxYCMsuumuS7h
 uHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=7ZRSBRMrceps2lrsx5l49i6WkZr2mdryftVmGmucJNo=;
 b=gljbpA6Domy9wSJG/UCe130xM5BXzYHKHpylSPkUFBHtDpuqtTtPVkXP4pKLCGur+Y
 05fMOlLY1NSnn940TOMHbFdPGVmimk1jv2MyKYiE+bkE1ZbugEzqYIlEmuYT82lA7HYO
 J8831JiXhxRBrapCP/1mBSEi1r8zKZtLXZNnB/Ds/temMdYBWHS95dIq4CHnTLnaligK
 AO7ZRVzDewcXCZx4GFKrbnJte82r42iHKCnrEoO99WoUc+Fdw14GML1ZLw/CjMZSE1gR
 MIA/8H3nV6xadYSH7DlcfMcqGOlql/bkguSQQbcaKpIlq2Bh0b4/9cnLCiVzffMuyfZm
 N2Yw==
X-Gm-Message-State: AIkVDXK9ITBY2dcFCu9dDFTN3llPFAHbfAGqvzPFABemDXrMMOFH03FsHeSdbxt/QGecQzoEzXFdXouvbdNMBkAJ
X-Received: by 10.129.167.202 with SMTP id e193mr66370146ywh.112.1483555976538; 
 Wed, 04 Jan 2017 10:52:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.37.15.69 with HTTP; Wed, 4 Jan 2017 10:52:56 -0800 (PST)
From: Rick Altherr <raltherr@google.com>
Date: Wed, 4 Jan 2017 10:52:56 -0800
Message-ID: <CAPLgG=ny9UXaqtYAS8yzhSpvR_MuFy1Z02a2agnKxPGckW+VSQ@mail.gmail.com>
Subject: Need to update U-Boot for initrds built after c7248eb11c
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=94eb2c14664afcda190545494a90
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
X-List-Received-Date: Wed, 04 Jan 2017 18:52:59 -0000

--94eb2c14664afcda190545494a90
Content-Type: text/plain; charset=UTF-8

TL;DR
Update to a openbmc/u-boot built after 146ee0425f.

I recently changed how an initial ramdisk is relocated on Aspeed parts to
be more in-line with how upstream U-Boot and Yocto operates.  This required
changing both U-Boot (b0f357d2ca and 146ee0425f) and the Yocto recipes
(c7248eb11c).  Now that those changes are submitted, a newly built U-Boot
is _required_ for initrd's built after Yocto c7248eb11c.  The new U-Boot
will also load earlier initrds perfectly fine.

Rick

--94eb2c14664afcda190545494a90
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>TL;DR</div><div>Update to a openbmc/u-boot built afte=
r=C2=A0146ee0425f.</div><div><br></div>I recently changed how an initial ra=
mdisk is relocated on Aspeed parts to be more in-line with how upstream U-B=
oot and Yocto operates.=C2=A0 This required changing both U-Boot (b0f357d2c=
a and=C2=A0146ee0425f) and the Yocto recipes (c7248eb11c).=C2=A0 Now that t=
hose changes are submitted, a newly built U-Boot is _required_ for initrd&#=
39;s built after Yocto c7248eb11c.=C2=A0 The new U-Boot will also load earl=
ier initrds perfectly fine.<div><br></div><div>Rick</div></div>

--94eb2c14664afcda190545494a90--
