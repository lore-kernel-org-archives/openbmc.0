Return-Path: <sjitindarsingh@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::22c; helo=mail-pg0-x22c.google.com;
 envelope-from=sjitindarsingh@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gSIHTyK0"; 
 dkim-atps=neutral
Received: from mail-pg0-x22c.google.com (mail-pg0-x22c.google.com
 [IPv6:2607:f8b0:400e:c05::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xnsC82P6nzDrWC;
 Thu,  7 Sep 2017 17:14:27 +1000 (AEST)
Received: by mail-pg0-x22c.google.com with SMTP id 188so16184517pgb.2;
 Thu, 07 Sep 2017 00:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=HIDB6WXhOrTk9CFCLwK5Qab5FyVDsyLGVX2dTyHw4o0=;
 b=gSIHTyK0Cj/nayoGSZ66Ul/npTbQHCMo2JSgJamLzy2KT32190SHP9jWDrUZwwQbIX
 IM6bE0da3Mv5vyt4zorGBrupRGpu6BrFpotxXy/ZPZcsyzu/7hXrxmgT1tFfuNKjgGDh
 YN82Vb9psstW3ezDbEd10VOn+tTc0c/W4Pb+IyxtRL1pm25ixwhRs1Q9AcT4ZZwcP2s/
 RxEQux2qahcHbM2HyijSIEwbe7MjdKe1UnMcC/yR81BpMLKY3yCey4ZUHVNefylJcX0d
 ggF3Z0/pTZ4+O9Set9F/TtkQzWEgjr+7hv/eX7jyuMXXYbJXpC3CdbcYJmm3+CuNU1eD
 dxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=HIDB6WXhOrTk9CFCLwK5Qab5FyVDsyLGVX2dTyHw4o0=;
 b=nOJPl5+EDMK06154i0cZhqDXKaCy/yyalJcN/JZD/AXDruYCTyBDcOZ4phX21yuqTn
 VOLgXx6L2pFo60Pu828scoAqyHhbGTceYltmOUUzfqRoxcdpTKuK2kNdS4dGRzkk/G9l
 MyeUdv3T4WKeGh30O8KIKENW3pCbRHso3C8QGgx/ESt1XnnPwqMyEfL5Hj3TRqxJtgHk
 vE1LOAM478DxxKM2BKzwFx1mSUVMP99rtCHywjs/qLxlM+9luz5jhzcXkv11XTvVrSq5
 MCkYI8jhgCwGGRqSQxwMCYJzslttQRPeYYmpQWbVsd4NU8BxccCCzAg9Vwes/elIRz32
 wm2Q==
X-Gm-Message-State: AHPjjUjbBskcBl9NsHEgfKygAJ0e93K0HZ30P/GWIFQcQAkn2ICuUQKN
 InoiINlVN300Obf6
X-Google-Smtp-Source: ADKCNb4FtQgy1qeE69+SyyeIuqhnOFtHaLhcV26cfFj5oFkXNFNwJPGY+Fe6H1UJB93Hs3b5iNHjnA==
X-Received: by 10.84.217.14 with SMTP id o14mr2025200pli.20.1504768465368;
 Thu, 07 Sep 2017 00:14:25 -0700 (PDT)
Received: from surajjs1.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id z1sm2276402pge.45.2017.09.07.00.14.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 Sep 2017 00:14:24 -0700 (PDT)
From: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
To: skiboot@lists.ozlabs.org,
	openbmc@lists.ozlabs.org
Cc: wak@google.com, cyrilbur@gmail.comm, sjitindarsingh@gmail.com,
 stewart@linux.vnet.ibm.com, andrew@aj.id.au, joel@jms.id.au
Subject: [RFC] Proposed Protocol Changes for MBOX V3
Date: Thu,  7 Sep 2017 17:14:08 +1000
Message-Id: <20170907071409.7163-1-sjitindarsingh@gmail.com>
X-Mailer: git-send-email 2.9.4
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
X-List-Received-Date: Thu, 07 Sep 2017 07:14:29 -0000

The patch that follows contains proposed changes for a mbox version 3 protocol
definition.

This is the combination of changes proposed by myself and William A. Kennington
III <wak@google.com>.

These changes are being posted to both the skiboot and openbmc lists for
discussion.

Suraj Jitindar Singh (1):
  docs: Specify V3 of the mbox protocol

 Documentation/mbox_protocol.md | 127 ++++++++++++++++++++++++++++++-----------
 1 file changed, 93 insertions(+), 34 deletions(-)

-- 
2.9.4
