Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c01::229; helo=mail-pl0-x229.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="gKBQHtNA"; 
 dkim-atps=neutral
Received: from mail-pl0-x229.google.com (mail-pl0-x229.google.com
 [IPv6:2607:f8b0:400e:c01::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zgttr0RlZzDq8f
 for <openbmc@lists.ozlabs.org>; Wed, 14 Feb 2018 07:10:11 +1100 (AEDT)
Received: by mail-pl0-x229.google.com with SMTP id k8so7161120pli.8
 for <openbmc@lists.ozlabs.org>; Tue, 13 Feb 2018 12:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=bdVqPyW6snlBkpBxAOfE3Rrag6BbZ7E3y/1cUXWobG8=;
 b=gKBQHtNAza8lNo87R6RuX/fOIvk4PhzGOUCDfFbi/Fxiahks5IImpKq1K7L80w8/AL
 +ZwwQD7KjhFbuZ3tevIr2GYezUgxfAOdHRS0HuiFuGVh0Sn5BW9fLT4Hu3pEMg/mMabZ
 o5DCjExqvsjkQ03A+6j6U9HQtsYGCNi4Pq6pnaEZBL+HSSydAXl1XK47ZTp5HjK5e6lc
 EiXw6xsaeCk9gt3QaTUY7QkIB2fBPfnpsiHzHmC7HRqYHDVrnr/IDqmmC4oHhf19MKUI
 GfJeEK8bDiSy45ANsw6E6nFTy6nGKWmvKYCyuJi0F1vqtOE38J++jslOXqz72uKrCp2n
 nCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=bdVqPyW6snlBkpBxAOfE3Rrag6BbZ7E3y/1cUXWobG8=;
 b=cDedlqVc/qbAvs33sedghkTJkvquL5YB52myuoxfmLVJWcLUIY3B3h5JWwyHhIwFky
 d2P2QDlkoYDYgitb1Xes3lUIw01HR0gY4Aa0DFh0gCVBQbIcjHm7esOZVcEWv6y7TIzA
 SF9iVjFD65IAUpyjyjr4kgpb2chFwjNpgedBIooYR+nGVBMc+hi2AYIEyVskdm5sZ77p
 PAMbJe6mv6QqCEU9eEMVRkm9wfXkPFbwJMK18vRVjRKiAa+aYBpv++U7U+67Y8FVTWUS
 i/2xIhmRa7BXbm13fzA9OxHpkdPheaXckBmlNfXZH+ahDliz7kYSx0a2j9WmKiwbHiTV
 F/6A==
X-Gm-Message-State: APf1xPC2TNmJ1DyA2MPvxf7DIaHbqA5zWVsdxCwzwMzW85xEPCgPuUAP
 8CHXJK1lPbXM/4iCmQSubaaBlg==
X-Google-Smtp-Source: AH8x2266k2+2LRwpepMU2RctnRsZDZhSJrXQ750mT2j1HrXZwp6mktNSUlO5Uz4ffiD9JghOA8z4Bg==
X-Received: by 2002:a17:902:28c3:: with SMTP id
 f61-v6mr2213404plb.264.1518552608725; 
 Tue, 13 Feb 2018 12:10:08 -0800 (PST)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id y17sm35166894pfk.67.2018.02.13.12.10.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 13 Feb 2018 12:10:07 -0800 (PST)
From: Brendan Higgins <brendanhiggins@google.com>
To: robh+dt@kernel.org, linux@armlinux.org.uk, mark.rutland@arm.com,
 tmaimon77@gmail.com, avifishman70@gmail.com, f.fainelli@gmail.com,
 julien.thierry@arm.com, pombredanne@nexb.com, arnd@arndb.de
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
Subject: [PATCH v10 0/3] arm: npcm: add basic support for Nuvoton BMCs
Date: Tue, 13 Feb 2018 12:09:56 -0800
Message-Id: <20180213200959.160157-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.16.0.rc1.238.g530d649a79-goog
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Feb 2018 20:10:12 -0000
X-List-Received-Date: Tue, 13 Feb 2018 20:10:12 -0000
X-List-Received-Date: Tue, 13 Feb 2018 20:10:12 -0000
X-List-Received-Date: Tue, 13 Feb 2018 20:10:12 -0000

Addressed comments from:
 - Joel: https://www.spinics.net/lists/arm-kernel/msg634074.html
 - Arnd: https://www.spinics.net/lists/arm-kernel/msg634091.html

Summary of changes since previous update:
 - Replaced "nuvoton,npcm7xx-smp" compatibility string with
   "nuvoton,npcm750-smp".
 - Fixed some whitespace issues.
 - Added EVB DTS to Makefile.

All changes tested on Nuvoton NPCM750 EVB.
