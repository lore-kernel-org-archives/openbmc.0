Return-Path: <jandraara@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LsM0kQGp"; 
 dkim-atps=neutral
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4457Pr6mlszDqSK
 for <openbmc@lists.ozlabs.org>; Fri, 22 Feb 2019 08:48:16 +1100 (AEDT)
Received: by mail-yb1-xb32.google.com with SMTP id f5so62479ybf.3
 for <openbmc@lists.ozlabs.org>; Thu, 21 Feb 2019 13:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=QFXOgC/gQgqUpTV9IwMt9Aq0GgNo/RxAwF08audBr5I=;
 b=LsM0kQGpArYzVuHZnyKzGQenFxR5PnLBbaUhrNwwOLOX7Ov0eh7vPZIdiObaBUEDGC
 Qa6F+U03KdTEHBtRkIe9A0UMK6RI0PB03KqlbSjYSWLPFYZHUpX63TJFGXF/upbUX4Nu
 T4EXCvvWPcU2W1aJyo8IjHNsKEUcSjEyQd6V0XUkJ5ki3K8JyB9SCHAmOvYIYVDvwJs/
 p2c9RNkwOaVbhXZfdR8CIQ7undOoEt1u2EJeB4lDyMbycKcZc2YX1TtvOVqRddY0zYl8
 jLKswCu7jKSX91ZjrqAQYHZQOSSPVrLx5hQzno0PlcOtwxa6NWMR9Ew/yHkC3RE+WY5p
 dshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=QFXOgC/gQgqUpTV9IwMt9Aq0GgNo/RxAwF08audBr5I=;
 b=T1mfYb8au2G+Ce8ZbbPOD0x3exLTX1ebOU2NjswQOr/tfEqLARIudjLhMvsRFzJXxp
 qHc60GcJDizrukmh0Bo26OKNq2iy0euUTywHlreEwJ84gvsqRye9D/a6cHHsc8iJbO5g
 idQ2Q5MT0lgs5dIDLLsy2PGtzpJQTqYJX/4TqqY2zYLfw0BdDbn73Dmdjmkd/5a/tcHC
 5BDXDc60lQvi083PiV2jenAKg354shLJ+qR6MASICquPm6nPtLX8MNjpB2GUruOGyq74
 XWILWpHiu3+dwK4hmqtpfdPqU6bXVQ1MQ2Q+Qt6lllpWlAJDnyJlKHTYXV2siKFHjk0l
 e2iw==
X-Gm-Message-State: AHQUAuYR+AC6KvyXBR2TBIJPKl0E6qcj8INDO50VdVMQze2u2SaC9QmH
 dugKtx2GCiirbwodadQXaKUjEyiBhBaNPFMF+8A5wy+q
X-Google-Smtp-Source: AHgI3IZtPUTVTPHt3F6MOqgxUe5daQmsBYY1Kn/HXQDLaULCzqhCIqs6/POnA8sF//7BPcUghkzK/zkeX4rwJQsSEGo=
X-Received: by 2002:a25:6e8b:: with SMTP id j133mr645741ybc.220.1550785693679; 
 Thu, 21 Feb 2019 13:48:13 -0800 (PST)
MIME-Version: 1.0
From: ja az <jandraara@gmail.com>
Date: Thu, 21 Feb 2019 15:48:02 -0600
Message-ID: <CAMTupoQWY3tcTi1K=gu72UwvWPdufksO7AgKcmofB_KjKS27HA@mail.gmail.com>
Subject: UI Feedback Session - Network Settings
To: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 21 Feb 2019 21:48:18 -0000

Team,

There was a desire to discuss the Network settings designs presented
yesterday during the demo. I have set a meeting for next week to
discuss that, and welcome you all to join. In the mean time, please
review the designs in InVision and make comments where you want to
provide feedback. That is the best and fastest way for the design team
to get and incorporate feedback into our designs.

Meeting info:
Tuesday Feb 26 at 7:00 AM CST
https://ibm.webex.com/meet/jandra.aranguren
United States of America Toll +1-669-234-1178  Access Code: 927 646 009

Network Settings:
https://ibm.invisionapp.com/share/RQNYHJ0VBDY#/319002386_V2_Networking_Mutliple_VLAN
- Is the relationship between VLAN and interfaces correct?
- Are adding a DNS server and adding an IP address separate actions
with a single intention or are they independent of each other?
- Is there a use case for combining static and dynamic IP Addresses /
DNS Servers?

github issue:
https://github.com/openbmc/phosphor-webui/issues/62

Best,
Jandra Aranguren
