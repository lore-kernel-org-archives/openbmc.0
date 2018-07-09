Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::229; helo=mail-oi0-x229.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="O2kWGcF2"; 
 dkim-atps=neutral
Received: from mail-oi0-x229.google.com (mail-oi0-x229.google.com
 [IPv6:2607:f8b0:4003:c06::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41PVMd5gHFzDr2J
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jul 2018 01:57:16 +1000 (AEST)
Received: by mail-oi0-x229.google.com with SMTP id w126-v6so36797784oie.7
 for <openbmc@lists.ozlabs.org>; Mon, 09 Jul 2018 08:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=8nV1f182rmPf337e6r+Emmzr9WEmvGvm+4W+ZOb3pGk=;
 b=O2kWGcF2Ybb6z3G+FJmtOG7WEvAH6KQwA+ZLr2nG03ZEyecVsjhlmP71eS4L2yf2j2
 0tXtO7TB2uVKHHZLUJ9fQ8AP4Cnedcn0qV84h24czR4O4QU/VITY6ze0ZbEfd/8bMc2M
 lwpmtwKDOo1HCIc3MZq+qP9Iqrkv/IloBWo8gL0S9Rd7YE2HS4GyJejX/lRwgMBNTRyk
 DextxX35CcejioN4vIwEZ3Ku+yGK7SeOniK0JMf8J4y/QN6H+Pn9gw0hm4jlqQw/KyqL
 rhIeSGXc4VZYAWleJPr0jEJqXOsE28tYQrQnBvEmhgJ7X82qvfxjygVsEQL0GrN9oq5S
 tbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=8nV1f182rmPf337e6r+Emmzr9WEmvGvm+4W+ZOb3pGk=;
 b=EAhF6TCSjkb3EbeBCl31ZXaMfkogNMVq8VobgIpt44iv/de8e24zRsWOHYmSAOtSA2
 TLp27MLoiYroU21iTAQRUIpaavGxTFiuSRAGSCV1xspYtj5hmvwHBppvzUgAKG3hwtCe
 wVGAq6mdvstbm4tbNS9NKzPlah15+HKQo+uh1p8M5VLaZonekSCq53wO+NHCKRfhZhTk
 JWSCijhSNmAbZmDPuJY0Gkl03s4Pby0QeFz925Cj2zrId2bLe5vWQr7Ukvmdm+oL9mkq
 hBmmbgAWiB/FKk+wkW1j69U6hWGxxRpBVCbbpyJiigodichC0mjLIEYBSmip2bx515dT
 J29g==
X-Gm-Message-State: APt69E0TVotRHAASI4sQRBdFKwy7EcQjKCpIWiJwR+cSTnAEAtdJswZG
 BgyBc/pYbBsTdZJh+V3WMi9ovjiNE5vvXzdVGuI=
X-Google-Smtp-Source: AAOMgpd90boFEVgmoYkqGAB80i9Qasq3IKpQS4fu1IkOdki4N3oMEBnxRTaougEYfWMWxSyrO6jwubJq+aegUdFBiW8=
X-Received: by 2002:aca:401:: with SMTP id 1-v6mr1886169oie.28.1531151834489; 
 Mon, 09 Jul 2018 08:57:14 -0700 (PDT)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 9 Jul 2018 10:57:03 -0500
Message-ID: <CALLMt=qhN6eF8_+MdM9Mkvvq8FN1c9qTC2vikQe8iUO+K2-_AQ@mail.gmail.com>
Subject: v2.3 tag end of week - 7/13
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Jul 2018 15:57:19 -0000

Per community call, we've got a lot of cool new function in since our
last tag so we'd like to get a 2.3 out at the end of this week.

Our tags still don't mean a whole lot other then a snapshot in time
where things were "fairly" stable.

Please get whatever you'd like in by this Wednesday, we'll lock down
merges into openbmc/openbmc Thursday/Friday for the tag.

Please also do regression testing on your systems and report any
issues via github issues and IRC.

Thanks,
Andrew
