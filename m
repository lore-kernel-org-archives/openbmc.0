Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::241; helo=mail-oi0-x241.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="leieP4OW"; 
 dkim-atps=neutral
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41TYYh6DXyzF35s
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jul 2018 16:35:04 +1000 (AEST)
Received: by mail-oi0-x241.google.com with SMTP id i12-v6so72742202oik.2
 for <openbmc@lists.ozlabs.org>; Sun, 15 Jul 2018 23:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=j8ckDZ0MbQpiFKW50vd0kUBvSPevMKnQSfrXHkdrxe4=;
 b=leieP4OWK00iBWpq6BO7fw9QnZDK5O56Z5oNCohDew4HD18JZoNBNKOXnA0yiuSwMz
 rTBifA9F8WvKa2sS/Aw1BL3svM/kvmxspQnvXyhH3jLihMmcOfiKoMWqLvJM25a11CY9
 +/tdxe0cHAmg/tpOPJ4BOhVNtBTaP4nnEf0DaGTFwnHt4G2JyjNJV5NumLZVcvznam9M
 TZ0hXNJZE639ROYWGtRRd0kQKHsO6aywGJjVt7Vd5Zd5xnJ16or5Y0dpHhMEEYrQ35xW
 Qews1io43BIsLhRr0uf51+/S4bWSQMRj9TGehSBq7wRHxP28N1gNmK2u3b4w3BJkI8HO
 yajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=j8ckDZ0MbQpiFKW50vd0kUBvSPevMKnQSfrXHkdrxe4=;
 b=eyfpxS00DzPd/kFqsjMCg115y+s4BRiUgrYrIxFM7oazjNEGLFnvaiCUWvWdUyRc4c
 Y0sUb3KHbOWvmqhN6pgBj2uW5C5+wq7TBU+KWh/q9hbSXpybl52HFwjAG8sQv3Kwq6Ul
 3fDH3dpSL3R6aHsCmqrOx5HvJTgcfykEY1X6eCPFTsxKIfWae6AcrnB464XW4CckDd8g
 Fjmrw0ebMz2vuKd7jUlB1EY/Ou8pYOhlksF+sFp3tZPMlF/PejFl+MUuFoL3eA7RPSgm
 pwkSWPQ/Eq/3hTyQ+/OEi+cJ6vB1RHJ6sJMsM6m59IVwTtbLsudgHZ7GTXChKNdoj4/B
 GaWw==
X-Gm-Message-State: AOUpUlEBXiR5G4/EklNvoZP8D3L8nMM/ktkt3RWaprzp8/mFLWtRK/Mj
 /CMTQJqqS8zswKB2NuhfUnXxTBdMUHnMyqXBywE=
X-Google-Smtp-Source: AAOMgpcpjMD+BJYn15KiNXCOBme5oFPtt4m6EjVeB5HIfE5OLOT5GNr36rHirhbi/IfNPUvHPPR8Z/kBTfR420IBJYg=
X-Received: by 2002:aca:e6cd:: with SMTP id
 d196-v6mr16193568oih.94.1531722899913; 
 Sun, 15 Jul 2018 23:34:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:2c87:0:0:0:0:0 with HTTP; Sun, 15 Jul 2018 23:34:59
 -0700 (PDT)
From: AKASH G J <akashgj91@gmail.com>
Date: Mon, 16 Jul 2018 12:04:59 +0530
Message-ID: <CAE33tLHVuuMgcEQw1xkGP+H1h_Gxq1Vf0Re2SKjVbPhiAgkxNQ@mail.gmail.com>
Subject: KVM Support?
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000058008805711807fd"
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
X-List-Received-Date: Mon, 16 Jul 2018 06:35:06 -0000

--00000000000058008805711807fd
Content-Type: text/plain; charset="UTF-8"

Hi Team,

Please someone share whether Keyboard Video Mouse (KVM) over IP
implementation available in OpenBMC ?



Thanks and Regards,

Akash

--00000000000058008805711807fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Team,</div><div><br></div><div>Please someone shar=
e whether Keyboard Video Mouse (KVM) over IP implementation available in Op=
enBMC ?</div><div><br></div><div><br></div><div><br></div><div>Thanks and R=
egards,</div><div><br></div><div>Akash<br></div></div>

--00000000000058008805711807fd--
