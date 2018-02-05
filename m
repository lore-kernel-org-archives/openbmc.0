Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c05::230; helo=mail-pg0-x230.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="sIGCocW6"; 
 dkim-atps=neutral
Received: from mail-pg0-x230.google.com (mail-pg0-x230.google.com
 [IPv6:2607:f8b0:400e:c05::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zb4KZ1fMgzF0vK
 for <openbmc@lists.ozlabs.org>; Tue,  6 Feb 2018 10:58:09 +1100 (AEDT)
Received: by mail-pg0-x230.google.com with SMTP id x25so123361pge.3
 for <openbmc@lists.ozlabs.org>; Mon, 05 Feb 2018 15:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=00cz//iOjBqL1Q39kKPcj4Wtgl4wyABRcrNieyxYImQ=;
 b=sIGCocW6zGojNmsqMmYVKP7b1znSeXlUiKo+Wm/w8UJqFCN1MmBScUyT+wAtDjRiGe
 Um7fGEz215uwf2iYifl6ac3hCnrSX7VBLevmKqQ+7QsKefGVv7sb0Uhc7v0Sy+/sxP8K
 uX1yRX5HW8COY3dX+lgSjMNFZRn0tNXO8BkjeDGU7YmkmJ0uJxxPZakVY0zN6UYcMqP2
 2QV83VR+5I5ZHOnQQizfsLaZsYts9eIytjN+YUFY4LJQESeow8sRrITBMDiU2FNLOwKF
 ZFaINhb+eq94q3xUeONk60o6m82VZ2ooZ71/x1wKPn+RR0Z8L1uvmaaFkj8WsOOIA5jt
 aC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=00cz//iOjBqL1Q39kKPcj4Wtgl4wyABRcrNieyxYImQ=;
 b=cDOc64pjrUf9DufYp5dzoWLUx34CnDN+eqixclDmXp7iqJuyJ9nSCJVvHl1JlcUPUm
 geqkXBC5+zy5ewdy2jbQKkeOiZskefv9SfTArPlZuNrNa4p+WcTwkKzhgsQlbUvuJOLp
 yAk9p8Ai5/CDmNmoGcfBbljL0bKwDIG84LOIAhr11UP4DEl5iROeEnOAoXnN8yDkksOB
 Jodhsc4GjnflgDXu20jJ6vyFCOX9LSJBWHVWn/0mnoVV7lc33LBIzbSFyOb5L5pvDNr7
 N2WD/alVb5/Ti581McVWHh9xe2MRTmfo7YSggSZfYnEZl4J1bdKX0l785h3CYBFxrC5Y
 Y8bQ==
X-Gm-Message-State: APf1xPBZMqwE4NYNQl7/GGkffGMiiQCN08k+8OKSMxZJvUacarlhi5PP
 88AQ6polor0Iz7u7YYezcvzkHg==
X-Google-Smtp-Source: AH8x2279Y/sbT4Uf0xsCjuSyRMb06yzl9TAoWolSXMNn3sO2fGQIFnm6aZHN2McpWpg06th/3SpPmQ==
X-Received: by 10.99.127.88 with SMTP id p24mr412328pgn.124.1517875085930;
 Mon, 05 Feb 2018 15:58:05 -0800 (PST)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id c1sm17803694pfa.119.2018.02.05.15.58.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 05 Feb 2018 15:58:04 -0800 (PST)
From: Brendan Higgins <brendanhiggins@google.com>
To: robh+dt@kernel.org, linux@armlinux.org.uk, mark.rutland@arm.com,
 tmaimon77@gmail.com, avifishman70@gmail.com, f.fainelli@gmail.com,
 julien.thierry@arm.com, pombredanne@nexb.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
Subject: [PATCH v9 0/3] arm: npcm: add basic support for Nuvoton BMCs
Date: Mon,  5 Feb 2018 15:57:54 -0800
Message-Id: <20180205235757.246758-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.16.0.rc1.238.g530d649a79-goog
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Feb 2018 23:58:10 -0000
X-List-Received-Date: Mon, 05 Feb 2018 23:58:10 -0000
X-List-Received-Date: Mon, 05 Feb 2018 23:58:10 -0000

Addressed comments from:
 - Philippe: https://www.spinics.net/lists/arm-kernel/msg621710.html

Summary of changes since previous update:
 - Now use SPDX ids instead of traditional license boilerplate. Top of file
   comments are now C++ style comments.
 - Changed reviewers listed in MAINTAINERS.
