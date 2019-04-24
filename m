Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::22e; helo=mail-oi1-x22e.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DHylpO4l"; 
 dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44pybG1YbwzDqSB
 for <openbmc@lists.ozlabs.org>; Wed, 24 Apr 2019 21:22:30 +1000 (AEST)
Received: by mail-oi1-x22e.google.com with SMTP id l12so3016560oie.13
 for <openbmc@lists.ozlabs.org>; Wed, 24 Apr 2019 04:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=8VtlF5cA4Vx23MmcoFKQg1GoGA2lMUb+OHkcdCaNXOY=;
 b=DHylpO4lYJxVF78rZHSMVcvIfgA0r0ztuWkBqQHa/0oWhP9egtD7/VlXOmOjVTh5tt
 Vv3gq/CLPTMGMjGN7d7rGjy9f+ITEeea9qMDqgl0GTrBSvOoeECEzuOpJywGDG7grrFZ
 wdGZ+bYgo720wUe2iHEKgYwo0OBUa4WCRNTweM2knutIdqq7/6iXYdXPwx0n8Q3RVfMD
 Fi41PZawaA14bKKgX9X/N+xm2jxmLRdzqVmwu6UYidPmojqtMaSHFmJYYCtcpTi9XjFq
 oojy4bpl04ppXkDxpN5cTkuNR2dAALxQjIUq4iCjdStKnyBzRwNwkuEGl6wL4MVW/O6Q
 bWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=8VtlF5cA4Vx23MmcoFKQg1GoGA2lMUb+OHkcdCaNXOY=;
 b=mrYy3qJSb9Hb3gALeOx+dy3kTEtd6ETDqMi4sckH5NyYn7XYF8qqBhOApiJlSznTjm
 NYCW7ZyCJVt+IdPSMoWzZnQ5wFd2M2ih2egRj4Ngi6wONPIsEELMn1Zl0gZOyWGaI3vg
 bQOmgXenSNQhfsqNzhM3wZl62mf94YAmp1SUGIveJUvyKq3u8+wNqpquC2ar7niSLcY0
 st0V+oslJ32AtjSyv6QAKHFoubbxKlxxIVSTIlut8jUVqeBAHwM3FS+X1Az5mA5UJZxH
 f3oxYZ7ZnL67cRwq/eN/cAtjPWt9Z2tKozyvHbPNm5zPmBV8PYK5OrY91hB9OAxkoaxY
 cHPQ==
X-Gm-Message-State: APjAAAXhrRyiOuIWiShwuNBReMTyvuBTqw74D9hxz10kF9iXpSpoFSbg
 e5hK+c1WwVUf6z4GCy7MJT6ks9WYFKPJ20rpuTFDPg==
X-Google-Smtp-Source: APXvYqxsjEq1Txu2dw6ZkZOSWoaVmvPn/X+j09cFLg4wrxe27hfgD/sq+6Z0qsdC5y6UPKYSmjO18uq1zY4rFXnF/AU=
X-Received: by 2002:aca:3306:: with SMTP id z6mr5193661oiz.25.1556104947039;
 Wed, 24 Apr 2019 04:22:27 -0700 (PDT)
MIME-Version: 1.0
From: AKASH G J <akashgj91@gmail.com>
Date: Wed, 24 Apr 2019 16:51:24 +0530
Message-ID: <CAE33tLHQnthxB0oqq_inqBbyfq0Lfut0Bq6usjhB3=ZV6jiivw@mail.gmail.com>
Subject: Unable to store persistent changes.
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000009a0235058744ea6f"
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
X-List-Received-Date: Wed, 24 Apr 2019 11:22:35 -0000

--0000000000009a0235058744ea6f
Content-Type: text/plain; charset="UTF-8"

Hi All,

Using OpenBMC firmware, I created new users and changed the password of
existing user. After powered off the BMC and turned on, the changes made
was disappeared.

I think the file system is read-only. How to make it read/write mode ?


Thanks in advance.

--0000000000009a0235058744ea6f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi All,</div><div><br></div><div>Using OpenBMC firmwa=
re, I created new users and changed the password of existing user. After po=
wered off the BMC and turned on, the changes made was disappeared. <br></di=
v><div><br></div><div>I think the file system is read-only. How to make it =
read/write mode ?</div><div><br></div><div><br></div><div>Thanks in advance=
.<br></div></div>

--0000000000009a0235058744ea6f--
