Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::232; helo=mail-oi0-x232.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="aAZqOpoq"; 
 dkim-atps=neutral
Received: from mail-oi0-x232.google.com (mail-oi0-x232.google.com
 [IPv6:2607:f8b0:4003:c06::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41DkjL58KlzDrq6
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jun 2018 19:42:13 +1000 (AEST)
Received: by mail-oi0-x232.google.com with SMTP id e135-v6so4733476oib.5
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jun 2018 02:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=fDQxTiZlqsf38mU7ZlxgV2t4UlDTaDQwTRS64TApVBE=;
 b=aAZqOpoq9wqD3yi+pKT86JDb+n+7rJPDGzyaVvm/e+KiWmM9wdCkUuFwNYM2dO5R/l
 I1QjjY4iNmNDYekXV3+hocZwY0Zf69bai2jQKsUiOSeKXycjAxXBmLZXA71cD9PwIilW
 8tpzv4cnY90yaCXS4lHcs9fIbmCGN3fsfNfSPdaJGZYtUk1eh/b85fmzDdAuK+oq7Pv9
 if0vn+wOJE1aZgjOO2EnbBzpyKTdnbMYCv/iUoV1QBaX6bup+7KEjnzMTr8WDOJgshMZ
 2+CMigWb10fpHpuy0BvmfRrskMZ1dzZVwp5Q/Ns+sF+9cJR0uY2smX+gHy4ntgt4RrlN
 4mtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=fDQxTiZlqsf38mU7ZlxgV2t4UlDTaDQwTRS64TApVBE=;
 b=PMhdbyTcdOvcVrKkDomYtJZm2OH7Z0ALVAX0GZoq6Xjb5S6YRg+NshdxBBLb3op727
 0kDrg1ccqZVGARPcFqGVDCYBvfZREBHBS7oERC6pC7BmPLqIPmxd/QVwgfWpTX3d5jex
 XAIafLae2XaTT5Ak0xmp5C72NGQgfjBUI+iT7yIJ1TMP0QGhftwBxlL1/xlayWh7LofQ
 aKHaATmP0OcSmX3Dof81OLXCisymMI5QGX+Humegkb3sozznBdDDZu0qemwjWVjPV0h3
 rSktGqZoDsJsUXPMC0EQ8OFRrFXVrxe4ItgVEfteBQozISbnfvYGBYZCtqns/VquxUMH
 e0Ww==
X-Gm-Message-State: APt69E2B+aUFukF8E6LTqF0k0HkK15e/x6RoF78KO6rGNmz3YgeovS8Z
 rtq11BzyiWXEgGG/Vvg7TQ26PLZDTCvxVNn3IZbGvA==
X-Google-Smtp-Source: ADUXVKLWKIwkMffBRQNgTwqryjyjBz14McUHwr1tXHdHrP5RqvpmADZFgES5XFPbKZHJLdeEtEVxpRotkF4E0DqnSKc=
X-Received: by 2002:aca:dd83:: with SMTP id
 u125-v6mr6711517oig.39.1529919731528; 
 Mon, 25 Jun 2018 02:42:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:2c87:0:0:0:0:0 with HTTP; Mon, 25 Jun 2018 02:42:11
 -0700 (PDT)
From: AKASH G J <akashgj91@gmail.com>
Date: Mon, 25 Jun 2018 15:12:11 +0530
Message-ID: <CAE33tLG3Fju=pvA6na5z=4dFhjX+LzutcbY8=g=psik68FYWLg@mail.gmail.com>
Subject: Unknown command gpio in u-boot
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000021f844056f743218"
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
X-List-Received-Date: Mon, 25 Jun 2018 09:42:15 -0000

--00000000000021f844056f743218
Content-Type: text/plain; charset="UTF-8"

Hi Team,

I tried to reset one GPIO using 'gpio' command in u-boot 2016.07. But it is
showing error "unknown command gpio". Please someone help, how to control
GPIO through u-boot.



Thanks and Regards,

Akash G J

--00000000000021f844056f743218
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Team,</div><div><br></div><div>I tried to reset on=
e GPIO using &#39;gpio&#39; command in u-boot 2016.07. But it is showing er=
ror &quot;unknown command gpio&quot;. Please someone help, how to control G=
PIO through u-boot.</div><div><br></div><div><br></div><div><br></div><div>=
Thanks and Regards,</div><div><br></div><div>Akash G J<br></div></div>

--00000000000021f844056f743218--
