Return-Path: <osk@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=osk@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="R7nl2i2f"; 
 dkim-atps=neutral
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42xTZl5qxDzF3mx
 for <openbmc@lists.ozlabs.org>; Sat, 17 Nov 2018 06:59:04 +1100 (AEDT)
Received: by mail-wr1-x42a.google.com with SMTP id z13-v6so26063683wrs.3
 for <openbmc@lists.ozlabs.org>; Fri, 16 Nov 2018 11:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=TlGcDyxLYfcuOxNwy/hQCEkFIyTPGqIEmKv0fvgNN/U=;
 b=R7nl2i2fz9EVjMDqu0jDA4VXYcShNDoDtz2wlC369tZV1ko19uI0tYfjijGF2dx/DT
 g6I0jI0Y/DF2g7vo+wd6jk8hr5bJs0pGe44TgEsF9KLJBDxdHMGZ5loJE8GHsPx0fDem
 yVQt7za1a1Lt02j15kZmbvt0wcfoligFC5dFl4ZYoNfLt4ZT780oksTo8rFBleDWzndZ
 kZZmhK9n1uxJ3rIWdZ0+Qq6ybZUbpuqlXw3tQYe1FxI15VpdWHrh7xbdD6txA9HGAJML
 E1/VjFJ14hXjVpiA8Xm5F0IXJFUcqfa3U9+vPRA2y2BmaQVIDJzhy9SOJheUO+jTHK7r
 NZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=TlGcDyxLYfcuOxNwy/hQCEkFIyTPGqIEmKv0fvgNN/U=;
 b=CpiYl56+KqSmpqg3pkCJehEv58MKcOpH4zWBBDOUnZRxkrdZGWzH5HAQCzfa3W3zbh
 lCdZwt6g0rYDs+G1WQCB/LlieS69rhqb9bRLUnLfbBra3epof24icob5HEHBFm+bHDpe
 xW/kBCKQ6PmeJbJ467g6SwCv+0SFln+o67evbp6aKtQ9E5XxNYYuT0au9U8FvsrOTFce
 b/eaC4Do6UMDdrUlC8P/6lL13tqvDv26eD8+13BHTkUkMNkK/BEN7HSNPzrDRqcp9rB3
 FUSvWlLzlVJ0mq2332IpEF7Y6e4/WXhhtwI/9xsuN6AgPOPwQEcWvyw9uCif7Ukc1aaB
 Q8fg==
X-Gm-Message-State: AGRZ1gKrwmEP+jc9J0We2Q5OuVoR2lHcaHU5HkFza1Mivh1KPwI0gahR
 gp+PMeZd9bB+JvnUbPIotEIIBKefsHiCv6oNWqdTpSVAV/w=
X-Google-Smtp-Source: AJdET5fwGpKFZMEz3bBQcRyWZfIpOv3CVK2gRYv2B4INW0cznhjEqxGpPMRZjVaikXt+0v8ad/1BK3Ny1Oy0/w/fK/M=
X-Received: by 2002:adf:8043:: with SMTP id
 61-v6mr10219592wrk.23.1542398340287; 
 Fri, 16 Nov 2018 11:59:00 -0800 (PST)
MIME-Version: 1.0
From: Oskar Senft <osk@google.com>
Date: Fri, 16 Nov 2018 14:58:49 -0500
Message-ID: <CABoTLcSpcTKHJu5xwWx4TQr1_5FjLvb9QsOAYQhCfMaQwQ5qug@mail.gmail.com>
Subject: Submit board schematics to OpenBMC docs repo
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Nancy Yuen <yuenn@google.com>, bradleyb@fuzziesquirrel.com, 
 gmills@linux.vnet.ibm.com
Content-Type: multipart/alternative; boundary="0000000000002d58c0057acd99a5"
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
X-List-Received-Date: Fri, 16 Nov 2018 19:59:13 -0000

--0000000000002d58c0057acd99a5
Content-Type: text/plain; charset="UTF-8"

Hi

We are working with a mainboard vendor and systems integrator to enable
OpenBMC on one of their mainboards. They offered to post the relevant
schematics to OpenBMC so that we (and others) can officially use the
information to adapt OpenBMC.

Is there a good place in OpenBMC to post that? Maybe the docs repo? It's 4
PDF files with < 10 MiB in total. Having this information publicly posted
by them would make development much easier.

Thanks
Oskar.

--0000000000002d58c0057acd99a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi<div><br></div><div>We are working with a mainboard vend=
or and systems integrator to enable OpenBMC on one of their mainboards. The=
y offered to post the relevant schematics to OpenBMC so that we (and others=
) can officially use the information to adapt OpenBMC.</div><div><br></div>=
<div>Is there a good place in OpenBMC to post that? Maybe the docs repo? It=
&#39;s 4 PDF files with &lt; 10 MiB in total. Having this information publi=
cly posted by them would make development much easier.</div><div><br></div>=
<div>Thanks</div><div>Oskar.</div><div><br></div></div>

--0000000000002d58c0057acd99a5--
