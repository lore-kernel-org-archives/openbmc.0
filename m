Return-Path: <jaghu@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=209.85.218.45; helo=mail-oi0-f45.google.com;
 envelope-from=jaghu@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="VxShUN+R"; 
 dkim-atps=neutral
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 425sVk58j0zF3QX
 for <openbmc@lists.ozlabs.org>; Fri,  7 Sep 2018 06:24:30 +1000 (AEST)
Received: by mail-oi0-f45.google.com with SMTP id v198-v6so5388809oif.9
 for <openbmc@lists.ozlabs.org>; Thu, 06 Sep 2018 13:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=F7ypoq0I7+b8KO2iEQCyHhsNjQdG3wgjdA2zHUXQK8k=;
 b=VxShUN+RDO57qnX5Cqe1gYPQ566zCZdIU4VOXgxfSqOjHcdfDaOXBz2uWOlArs2SJf
 rISfXfTSugYdGWnLvoIBhzdWO36FblIU4uxR2fUBXyBj0OP4WAa+tniz1QrNF9ebEW54
 2GBFEzZbmSPL90P5QrNJ9lGVAOhqeaAqhXcMGak71yO5fmV6n8YyUmwb1U8akz3tM3UR
 a0cN0Vz2jxHWHv4EBFsW9d9R9y8gDHkFcOUVNCY1cvbGJiKU5R9Mc43vOJeMt5ADsVFY
 XWeqiV9dOGARAKu4KuHqGu3gave1g9HQxmkmbGWM/bRYHMZDSCS7WQUuHKbcB3V+clQV
 iLjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=F7ypoq0I7+b8KO2iEQCyHhsNjQdG3wgjdA2zHUXQK8k=;
 b=PCIK+YzhBm0GV5AWwQGnNQmLeAK1Pgukl+J8S0Jit13R2WGm8Zwn3SsPTb7glTaPAG
 Tx4ZhqBIRxKgj4gQxA+xAtlmUQrtYb39wC038QQqMaDF3CnGg5Ck2PVdlDqYINZd3Wtr
 fYeqdBSh5JpEPy7VuoIkxKB2k5s9vVcGCe0yLRovSNIhnT73xLwj4xEGWF5jlhswqy4b
 spKlJvnsjiXK85zfZzCUsyJS8em31qr3Tc63wifOs7sFInZ9pT48tQGTok2l1oI8jV2D
 F4aP7pUM8t61FXvmiR9XO6qf1DNmrAv42ciQVh+blsqyUWUj3UwQKsVE7yY/gWKfuHqH
 vGbA==
X-Gm-Message-State: APzg51BqakCUMKbuW4U6xkpwl+tG9ipoQGy7G6CqzlOMeu/tvapzZg92
 cGqDqnowEnjR61FaAX+f2e1VAcZqrGP/9SJ3zrl4jscD93U=
X-Google-Smtp-Source: ANB0Vda0FgRg37zKsMiFJrLJVWx+6w1IrltrIOKkk/dTkoepmqT1itSbuWxmh90P1sxjXzliX2aqxHUxcsep/Jjp9eo=
X-Received: by 2002:aca:32d5:: with SMTP id
 y204-v6mr4730257oiy.85.1536265467341; 
 Thu, 06 Sep 2018 13:24:27 -0700 (PDT)
MIME-Version: 1.0
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Date: Thu, 6 Sep 2018 13:24:16 -0700
Message-ID: <CANsWYUW201zq0+2p_PdAePL9d7UwWOyAEB+rWSwtgQUnfMCCMg@mail.gmail.com>
Subject: Question about IPMI SEL
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000076fcfa057539add8"
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
X-List-Received-Date: Thu, 06 Sep 2018 20:24:32 -0000

--00000000000076fcfa057539add8
Content-Type: text/plain; charset="UTF-8"

I understand that in OpenBMC, dbus logging entries are converted to SEL
entries. As per IPMI spec there are only maximum of 512 entries in the SEL
repository; But in OpenBMC SEL, is there a maximum limit of SEL entries
enforced ?

Also in current OpenBMC code, I did not see support for IPMI Get Aux Log
Status command.
Would it be feasible to have OpenBMC to return some response for 'IPMI Get
Aux Log Status' like to return 0 entries or some error?

--00000000000076fcfa057539add8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I understand that in OpenBMC, dbus logging entries are con=
verted to SEL entries. As per IPMI spec there are only maximum of 512 entri=
es in the SEL repository; But in OpenBMC SEL, is there a maximum limit of S=
EL entries enforced ?<br><br>Also in current OpenBMC code, I did not see su=
pport for IPMI Get Aux Log Status command.<br>Would it be feasible to have =
OpenBMC to return some response for &#39;IPMI Get Aux Log Status&#39; like =
to return 0 entries or some error?<div><br></div></div>

--00000000000076fcfa057539add8--
