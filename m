Return-Path: <sdliyong@gmail.com>
Received: from mail-pg0-x22f.google.com (mail-pg0-x22f.google.com
 [IPv6:2607:f8b0:400e:c05::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xSgKt4dTMzDqrx
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 17:50:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="th+VourY"; 
 dkim-atps=neutral
Received: by mail-pg0-x22f.google.com with SMTP id y129so38379360pgy.4
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 00:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=KGIQj02Vcvtqny6FtA6zqBqOhRAtcgVEjpYHXL8OqpA=;
 b=th+VourY876a0G2oZg+dG+cJGMJm5NiEySyAKeMIAtSgTcdfNd7os9y6ih1d3zKKNA
 u9RnQcRN+lp7N/A9QvOydgQKo3eY4Nbkb+IYUA1nJDJtKkvUVoLgVSecYXwQHJpyOlC+
 Gu+OeINt5KJNY0JFx8h76qDghQ7M93VSOA+DGryYk/LPzFjw5mW3C/zcn3D/3xCJ5XHr
 xZWB7x8aC4Z/u/9NXiW7TXMHkmt+S2UnDR0Z3eKbSTD5DfPLH3CV9cbErF2rOuch97qL
 dwVpmnsDdFXMHg3MhYJZ7wA6laQmCl/5uETasaHpccC8IuKWv0NM12OfAMh7URK+iQsT
 WthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=KGIQj02Vcvtqny6FtA6zqBqOhRAtcgVEjpYHXL8OqpA=;
 b=HKKOqCW2XcF6LumVcejBWsUabtHfp5bUa6drkgDkuPr4PZ5vbNI38oRHmYju+Np0BV
 lnzO+9g5QRT4NI+etvrD7yVTNazwsCCWLLy7sAAIgrSBVDM1j8OVqMOB/y2F7Seyr9dv
 2NcYotUnGKYUZ92Lnvc+MXfodIWZKJTDLsa2bHgt7SbceGgramirHlOFEpHlE3ol7R0w
 Y0mF7U9PgbspEetawMDvycPA6SaZOuZmEPDwIEE9pd8JcbD6hInOgCTBXJ2c2jovECsA
 dGduT+tV7pCA2J0ebYjLifQBKv1wQGgi7a9RFAUAinHH2I+WGu92l/natIqFVwI58vgN
 w55w==
X-Gm-Message-State: AHYfb5jEy1Foqd7CBkBdT3/OobV7JRzOxfAy/v2kpXti6ZqYp9mdlJPA
 e0t/Xuz0DLQsS67k5qWxX2s1SrKSadLc0fQ=
X-Received: by 10.84.143.36 with SMTP id 33mr12230368ply.79.1502351440278;
 Thu, 10 Aug 2017 00:50:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.170.77 with HTTP; Thu, 10 Aug 2017 00:50:19 -0700 (PDT)
From: Yong Li <sdliyong@gmail.com>
Date: Thu, 10 Aug 2017 15:50:19 +0800
Message-ID: <CADO9-pd_r73SxL8eHCYwzK_jhdyfrhFYLrJ0nXif3--Tj1Jc9w@mail.gmail.com>
Subject: AST SOC gpio pass-through support
To: openbmc@lists.ozlabs.org
Cc: YONG LI <sdliyong@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Aug 2017 07:50:43 -0000

Hi all,

AST SOC supports GPIOE pass-through function, I would like to know if
the kernel provides such API/interface to enable/disable pass-through?

If not, how to add such function? Using ioctl, or /sys/class/gpio?

Thanks,
Yong
