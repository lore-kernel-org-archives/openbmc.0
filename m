Return-Path: <benjaminfair@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400d:c0d::22d; helo=mail-qt0-x22d.google.com;
 envelope-from=benjaminfair@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="KYZ9SnMF"; 
 dkim-atps=neutral
Received: from mail-qt0-x22d.google.com (mail-qt0-x22d.google.com
 [IPv6:2607:f8b0:400d:c0d::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41vPcQ2y7nzF0gv
 for <openbmc@lists.ozlabs.org>; Tue, 21 Aug 2018 05:53:03 +1000 (AEST)
Received: by mail-qt0-x22d.google.com with SMTP id r21-v6so17618922qtm.2
 for <openbmc@lists.ozlabs.org>; Mon, 20 Aug 2018 12:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=pnnXNch4GwZkWBWyOrIUDfszVD8ZEmR4rORVLL3ivCc=;
 b=KYZ9SnMFIeBCIyVr4++MT8WJMlZueuXydPKLFxdeam2J3KMFt6e43LYaAIVaqnulQE
 cVWaTZ57L31r1iIsm5vTP7IYfyT5aD30n1J7hDxJrTys/vuGU+10Fd8V8wTgCYdp300F
 +T5PHdpAT2EPqcPLa/EGJD8ulQnxK5VW1TTt6NiKGPdNVeD8UyYVCoGZxD5yBrOeyZ3r
 MVoOkuKU9zR8ca+2mit8zpRaX0Wy2Gm1MKQHCOLHtLGcMNvCUFQIo6nnlT2679G1iOLi
 s0if0x0eScb6NRKH8cbMVWNbPjAJqAB100vO31t0jeDcZ4fOmRiDhuORIasDp1Sb/Onj
 /KFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=pnnXNch4GwZkWBWyOrIUDfszVD8ZEmR4rORVLL3ivCc=;
 b=NCGkEd75Q4dlvnMPZKSKheTDQ41tBR8ilNc2u1ks0p7ReZehkaPNkRQ8cJ9ERqzlUd
 GeaP1WsWoH78Pxc1xyQfaNVsv3UZraLw/xup9FaE1W60jWZAmojv1XwbAvDNL9KQrFWI
 uKkuiiuLOqOdsyLsu9qll8sCgIcrbcZK0ICw72ZXjH/c4RRONlA8qGWwBHv6Q0jESRFA
 V2d+JjBFBuvEr/wTYMDa9GLBJH+z03v6KbjRcYiSIbiwc2iw44qna5WXxttxFOxj/d1e
 k3MKmcCw4CG0wbeJ/88L9RB7KoyrzR8JMV3nqtkp4HJiinX1H3oiT8vRl87RGdfit9ox
 p+7Q==
X-Gm-Message-State: APzg51AJHbNq3dyeuRHc9STREM8Z7xmVPxgqRnoxvFNPS0MxvxfFEiAg
 a9Cco1vVhxKwHrGR82ca4gBrfw8JXztdMKKhPjyTK7zv
X-Google-Smtp-Source: ANB0VdYAjeY0vrBLHTvf7CImsLigXPFLNtBmAqzGQM8URdcrGnrTI1VcPFB9FUp/bFEwOLItESjIlmoEEErK06gsV6o=
X-Received: by 2002:a0c:d4d3:: with SMTP id
 y19-v6mr10431123qvh.234.1534794780652; 
 Mon, 20 Aug 2018 12:53:00 -0700 (PDT)
MIME-Version: 1.0
From: Benjamin Fair <benjaminfair@google.com>
Date: Mon, 20 Aug 2018 12:52:24 -0700
Message-ID: <CADKL2t4bP5VKSZ3x9wiq4c+O-6JM=nFQgQjtTTBL_2i0e7zfzw@mail.gmail.com>
Subject: Sensor alarm logging in IPMI SEL
To: openbmc@lists.ozlabs.org
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
X-List-Received-Date: Mon, 20 Aug 2018 19:53:11 -0000

Hi all,

We are looking for a way to log and report sensor events such as
over-temperature alarms and voltage regulator failures using the BMC.
The IPMI SEL seems like a good approach, as it matches industry
standards. There is already existing infrastructure for SEL in
OpenBMC, so implementing this seems like it would only require
modifying a daemon like sensord from the lm-sensors project to report
alarms over dbus.

Does this sound reasonable? Has anyone else already started working on
something similar?

Thanks,
Benjamin
