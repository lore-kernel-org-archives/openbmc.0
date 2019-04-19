Return-Path: <sampmisr@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=sampmisr@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gXg+ySXc"; 
 dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44llWq5hmRzDqT6
 for <openbmc@lists.ozlabs.org>; Fri, 19 Apr 2019 15:53:24 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id w23so3285649lfc.9
 for <openbmc@lists.ozlabs.org>; Thu, 18 Apr 2019 22:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=cTE2VxkHoB4kAVOfzVp5OL5AGEiXXJlftFk+BswQgiQ=;
 b=gXg+ySXczIHsQ44t2O1x3rA9gnG8A17nn7co6hBwQirHA09d24RHb/X4NIDBl42nBA
 YMmjHMLJMNVVP3MgRmk0t8B8MSLVhMlFVLfAQdIJX2lE6oCCafwUUk6j1Vb0A5itVV4n
 5iGZX5XmlH+rllfgUWzsvyaqFo6ZaQ6NSAtkiwNV/xv7tEWpHzO/xrM/6Tg1Yx/Rj25L
 gWRSLD8Fmuhdewod74bEJEtU5dtZA0PnNDqEAyH+PnIZUQwIY4aL9ejOFa+HdSORqJdm
 EJ03OyWOmSDqEaRIzFPPYANbgKZfQAm5aYcmT+KA+PK43AnzWfWLd+01lPzZE1Ky8Z8h
 FiGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=cTE2VxkHoB4kAVOfzVp5OL5AGEiXXJlftFk+BswQgiQ=;
 b=tiBEb4ta9KeLaJV0lJKU6oNBBOOqVOlpVmsZ2prDnTkgulI69nGb1q/On2A443vqch
 r0FKe0ydQDWSGOWpEYXT5wHTg1LXJBrPQTps1MtNWtHK12CIWUsizliQTks182ZDHOja
 C2nGSoHVbyih9ByoQqfYdSAImq8DYuKlqW4acgE+KwBgb/oQBnMJ2VKftPR9cXOeYdDX
 lDg5RzRjfQ20Lj80qopepUvtU8S8dJiL+7b7g/BaYShvJ6C53TXnBY9FURV98eDwMr0Z
 EhztMEaWl8OdNoc6u8lZ2aArk1KY4LouNmErgkNRUsfCqfUc1pgAvvbPAhWsKEDy+IpV
 Uv+g==
X-Gm-Message-State: APjAAAU3XlbLeQnESp+SJmfN3ABxeRVMzDneF1MLOO0EcFqqs0R/xsZq
 SG6kuDJvA+XAqQjMEGFnxXm7p8UHtJ4v8BbuLNFT5icx
X-Google-Smtp-Source: APXvYqwHbO5ygF6ukXuclzzHBBEOLZlwuyxtQvF3v5JtnVU1D4BqQjd0jN3D2fPQPAut1+ScKaxyffKTOPs6G6s31sQ=
X-Received: by 2002:a19:cc52:: with SMTP id c79mr1192665lfg.30.1555653198644; 
 Thu, 18 Apr 2019 22:53:18 -0700 (PDT)
MIME-Version: 1.0
From: Sampa Misra <sampmisr@gmail.com>
Date: Fri, 19 Apr 2019 11:23:06 +0530
Message-ID: <CAODBi=oD62gRZwMbvFfa-Mx38G4NuGZBAxPqLd=dX+OGNbwHPQ@mail.gmail.com>
Subject: DBus interface for Hypervisor State
To: openbmc@lists.ozlabs.org, geissonator@gmail.com, 
 bradleyb@fuzziesquirrel.com
Content-Type: multipart/alternative; boundary="0000000000004c8ae80586dbbcd4"
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
X-List-Received-Date: Fri, 19 Apr 2019 05:53:28 -0000

--0000000000004c8ae80586dbbcd4
Content-Type: text/plain; charset="UTF-8"

Hi,

We (IBM) have a requirement to maintain the state of hypervisor/virtual
machine monitor in the bmc for several reasons like
1. Representing the state at bmc for logging purpose
2. To be aware that communication to hypervisor from bmc is possible

The states are usually kind of standard states like hypervisor booting,
boot completed, partitions running etc. We are planning to write a dbus
interface for this one and wondering whether it can fit in the phosphor
layer or open power layer or be just an IBM interface. The decision would
be taken based on the interest of the community to use the interface.

Thanks
Sampa

--0000000000004c8ae80586dbbcd4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,<br><br>We (IBM) have a requirement to=
 maintain the state of hypervisor/virtual machine monitor in the bmc for se=
veral reasons like <br>1. Representing the state at bmc for logging purpose=
<br>2. To be aware that communication to hypervisor from bmc is possible<br=
><br>The states are usually kind of standard states like hypervisor booting=
, boot completed, partitions running etc. We are planning to write a dbus i=
nterface for this one and wondering whether it can fit in the phosphor laye=
r or open power layer or be just an IBM interface. The decision would be ta=
ken based on the interest of the community to use the interface.<br><br>Tha=
nks<br>Sampa<br><br></div></div>

--0000000000004c8ae80586dbbcd4--
