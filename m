Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::22e; helo=mail-oi0-x22e.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XnhcTK9c"; 
 dkim-atps=neutral
Received: from mail-oi0-x22e.google.com (mail-oi0-x22e.google.com
 [IPv6:2607:f8b0:4003:c06::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41fJCv4zfNzF0gv
 for <openbmc@lists.ozlabs.org>; Mon, 30 Jul 2018 22:04:58 +1000 (AEST)
Received: by mail-oi0-x22e.google.com with SMTP id w126-v6so20717415oie.7
 for <openbmc@lists.ozlabs.org>; Mon, 30 Jul 2018 05:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=BA5JVcbczlex7vRvT9kugqKLYmHHujvPj9hE5/R7NAU=;
 b=XnhcTK9cqT8wW9lSslVAcIt36udHaHoHhJ4y0MNjp5lqTf9QNdpKN8ABBol+Amsexa
 gdBJloD2cy4q88+cGfVROkgE9tDNnCRN7iXMcXINaX21qL3Esn+GTdDbxdLMTpkkOkAy
 fZ6RNJaVaZAChjRULZdsvORVwl1Z0W0IaT5qRHBfZTUUE1weeN5ZcXpLmzf+P9A1bPq9
 rQqzcpiqsBlbZbeFN7kLbfVgYKDbbfvBQNcant7zwQqaF6GpYNAWzN2G8ZbJOYiEtP/s
 RMnvT+Sg+Qu0HzvS7ib53nmWe9llGVaPsDkoMTrvfBECQJOQoaEyBuiDRMMHTAvLpklG
 cT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=BA5JVcbczlex7vRvT9kugqKLYmHHujvPj9hE5/R7NAU=;
 b=BNzYHNgaD6wfxY1KDUG3EoVVG3MeZ5/LG5TsAYVDU3iS9IDa88BaFW/iYO1bIHFa7s
 ECoVHvxT8Xh71eEObAQ7Cz4L3yUBz9/d1sUAF/p5pH6fyznSpsFPnHTfi+tK5eKwyQuK
 EWeTERRZGSGtWPDNRpaalzd6si4EnG24bKhDoVMDUaCIrie2WBjrhrXJM0QIxwVDK+FJ
 6kT1RUNDylV6FEWCFVusoUVPXuIlcM2N6ghLnWbqdT8a7wodXKB/mC9cQ6qUT9s4xca7
 GdK6lqZZwn7chrqeedDikz/GTy8AuvxVsmXG7qqJ1GvIsCdLa0NRh9hce2IHa4EuhOpw
 HWRw==
X-Gm-Message-State: AOUpUlGb9K0hHtVdhyj3ZJUU1UnHkKvEuDu08E4SivrpN4reAnEdPfYh
 26L6yyG8DmEGLlNu443QsfPZIF+8FMFRImDFX9dshFRiYp0=
X-Google-Smtp-Source: AAOMgpdMDEc4Mm78EdLrnC8FSPaMlR/ioEUYKTARWOtZP68kFyxaDsK3VAirgmxOL5539InWaQjgjBPP2CfX9AI71w4=
X-Received: by 2002:aca:d8d6:: with SMTP id
 p205-v6mr16215548oig.96.1532952296158; 
 Mon, 30 Jul 2018 05:04:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:2c87:0:0:0:0:0 with HTTP; Mon, 30 Jul 2018 05:04:55
 -0700 (PDT)
From: AKASH G J <akashgj91@gmail.com>
Date: Mon, 30 Jul 2018 17:34:55 +0530
Message-ID: <CAE33tLFQ6v2n2tBavZVJmHdYK1cFmFFhKRb9_8RG3xS4xzr6ug@mail.gmail.com>
Subject: Phosphor Web-ui: Server unreachable
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000011f8f1057236452b"
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
X-List-Received-Date: Mon, 30 Jul 2018 12:05:00 -0000

--00000000000011f8f1057236452b
Content-Type: text/plain; charset="UTF-8"

Hi Team,

I added phosphor-webui into the Linux image and set up client side of the
web interface. In the client side of web interface I could able to give the
IP address, username and password. After entering all those details, it is
showing "server unreachable". But I could able to ping the server board and
ssh into the system. Please someone help to resolve the problem.



Thanks and Regards,

Akash G J

--00000000000011f8f1057236452b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Team,</div><div><br></div><div>I added phosphor-we=
bui into the Linux image and set up client side of the web interface. In th=
e client side of web interface I could able to give the IP address, usernam=
e and password. After entering all those details, it is showing &quot;serve=
r unreachable&quot;. But I could able to ping the server board and ssh into=
 the system. Please someone help to resolve the problem.</div><div><br></di=
v><div><br></div><div><br></div><div>Thanks and Regards,</div><div><br></di=
v><div>Akash G J<br></div></div>

--00000000000011f8f1057236452b--
