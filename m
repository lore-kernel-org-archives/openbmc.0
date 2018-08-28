Return-Path: <henbinchang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::229; helo=mail-qk0-x229.google.com;
 envelope-from=henbinchang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DV9O/4N6"; 
 dkim-atps=neutral
Received: from mail-qk0-x229.google.com (mail-qk0-x229.google.com
 [IPv6:2607:f8b0:400d:c09::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41zsSp0Hj4zDrTP
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 12:02:01 +1000 (AEST)
Received: by mail-qk0-x229.google.com with SMTP id d131-v6so1085qke.11
 for <openbmc@lists.ozlabs.org>; Mon, 27 Aug 2018 19:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=uhJLRo5PS7vk7YXVpqu0/fy0tOE2HKsD8pPMNgjg+wI=;
 b=DV9O/4N6ettiJqtEPlD/j+J9YWvRTtp2h96uR1TxT9u0mkz1ur4WYGqUD0muekq/5u
 +NXR09DQB7XaLKZ9cI2jdu8p4tdk8hijDnwygNL2U+T6L7iwisCZr/cjOgwIKp7WhDWE
 h+oEuO6cIqa04I3dN96A3dovJa6ImO1brF3kr4n6+fvnlstLQy2gLT6hI3zcZkAY1eCa
 RZqOI1BSjas1eXevwGVRCsL39IyL/3uJSYd5boUKcYU2aukoQ55XCaDrk6WYYN2NcNNq
 izaPXW4Bx2UohuNj1ifUOHjxiV5J952V5Rmr0JVyRxsPDsfyqqtl+X35TcJO/kPvX1YN
 F+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=uhJLRo5PS7vk7YXVpqu0/fy0tOE2HKsD8pPMNgjg+wI=;
 b=HFKoVEPH+FDns6nDoH6Cr2abh58tvcY+3H1oxlVE+cGCvCtfIWgLDXTTQZCmjAJEDi
 tHPb6bt/2WT1mN+KfsYdWLOmtg5r59hJk1/3gGXBv6Tr+0cyt6kd7AWP1zHrs71dmmK/
 BlFXYXCVzetaxP16CkP8FpZSLoHwU6RBbngwSzTm+4N3vFLAkKetZQdsQnZvG8/Y39IW
 nWPjfkreWqXbNykRFum05RQtmuICxAPRpWg/LA2nak761uuZNXvQfsd44oyI/BzJR6+W
 O406L4dYgZ15Bt0soNGF0Cd1vnKIH8Oo0bCheq4A8fmgfZQh7T9OyCMg89snnPiQOvLJ
 +E6Q==
X-Gm-Message-State: APzg51CbzgFmEhHmQascXQ9TULBKyr7Y55H8pGwrAWp1DcQKCf+8TjAP
 P45UWbkXn13g65e6et6174bRwLvBwat+sWJCh3c=
X-Google-Smtp-Source: ANB0Vdbok2B3Tt2mM3fLaDhKSqyd3+fha+YkpbuB+2VDvZ2f1B65EsK5duGVIRssFDt7xbliPY4eilsES6QDr9T79Ws=
X-Received: by 2002:a37:31d5:: with SMTP id
 x204-v6mr6341705qkx.289.1535421718872; 
 Mon, 27 Aug 2018 19:01:58 -0700 (PDT)
MIME-Version: 1.0
From: Henbin Chang <henbinchang@gmail.com>
Date: Tue, 28 Aug 2018 10:01:47 +0800
Message-ID: <CAG9c7cDKzx7VpmsrbeBuTQdVfQ7z3AYzGagWP0dKhSib7QkaZg@mail.gmail.com>
Subject: [IPMBD] ipmbSend handling
To: "Tanous, Ed" <ed.tanous@intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000022499d0574753a36"
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
X-List-Received-Date: Tue, 28 Aug 2018 02:02:03 -0000

--00000000000022499d0574753a36
Content-Type: text/plain; charset="UTF-8"

Hi Ed,

I tried to build ipmbbridge but got the below error.

Could you please share where I should get 'linux/i2c-dev-user.h'?

|....
| ../ipmbbridged.cpp:24:10: fatal error: linux/i2c-dev-user.h: No such file
or directory
|  #include <linux/i2c-dev-user.h>
|           ^~~~~~~~~~~~~~~~~~~~~~
| compilation terminated.
| ...

Thanks.
BRs,
Henbin

--00000000000022499d0574753a36
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Ed,<div><br></div><div>I tried to build ipmbbridge but =
got the below error.</div><div><br></div><div>Could you please share where =
I should get &#39;linux/i2c-dev-user.h&#39;?</div><div><br></div><div>|....=
</div><div><div>| ../ipmbbridged.cpp:24:10: fatal error: linux/i2c-dev-user=
.h: No such file or directory</div><div>|=C2=A0 #include &lt;linux/i2c-dev-=
user.h&gt;</div><div>|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~=
~~~~~~~~~~</div><div>| compilation terminated.</div></div><div>| ...</div><=
div><br></div><div>Thanks.</div><div>BRs,</div><div>Henbin</div></div>

--00000000000022499d0574753a36--
