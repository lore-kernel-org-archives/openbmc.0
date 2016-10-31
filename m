Return-Path: <jaghu@google.com>
Received: from mail-pf0-x234.google.com (mail-pf0-x234.google.com
 [IPv6:2607:f8b0:400e:c00::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t7B0c1l5lzDvNL
 for <openbmc@lists.ozlabs.org>; Tue,  1 Nov 2016 10:49:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=Z96MIaQp; 
 dkim-atps=neutral
Received: by mail-pf0-x234.google.com with SMTP id 189so30972302pfz.3
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 16:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=8T3AjhqRxIWDPeZSzptbUMh1hzWri7wBxXcMcet6RvM=;
 b=Z96MIaQpjPK+t/G5eiZR4B4QB9lmZYVhZ/c324b8xcdpUuHgObrlLSqHGd/XIK7MfY
 RT8CuW5rdbB6JD1upIxw6HuMPukqMc8aM9QP0L9Txbym2j/9YC4M9bxrLs3zcx4dVn/q
 hKBeCDMpAI9oHsleiJBnX8KR/6t9wMY1IEiJMuqUh/aS2yr/ZLUdSBjzLteRsiKoesLM
 qSaDEUnrZU9ea+fCAZggjWEVxXZOuS6ZQ8LFyQ7L4PGRCd2nzU+XA3WG7lHTPdPPyjv6
 m8MpQ7+JNvmrCeggBfqoUDyqdR3N/OAD7LN7/8OzrbhDoaRTwk1dVjI14nieMchzOPIn
 WgMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=8T3AjhqRxIWDPeZSzptbUMh1hzWri7wBxXcMcet6RvM=;
 b=ZzxpgzJKsSA4Mqaqt0ey5YtBYZcbEIkSdZrm22XgdD8KkcngrPXW4juFabvTESy/c4
 bFtqhcg5rdGoWF+m8Q3nDZCjkgRVRcStab0wYwmGACwrt1s2wwOUwOcZc60CN7t6eF1m
 /nFJIbcwhH/KWxfO/n3eZBW0fBCPvLBkt9rnL1mrbftebj2DtZpAqv6lCD1KgynQ15oS
 Ce57q0RGR5xCk7uWfTUkJyCG2SHSLCXa3d8rhKv5lI14/te/2UFEBCu0PqOUhXV+8Q67
 jliaOrzUYXCn09G6p4bBlDm/wGTMLZf6J59vIDcvMR4ljXCQV3VoPuzJGflwYSnnVgFN
 v02A==
X-Gm-Message-State: ABUngveGdy0pCMqHw8f9N3UN+msTu7YPTjixyG1SdThiO1yRr8mAy7qUzbotYOgkjrvQWfKS
X-Received: by 10.98.205.207 with SMTP id o198mr53433030pfg.114.1477957757495; 
 Mon, 31 Oct 2016 16:49:17 -0700 (PDT)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id v84sm37824374pfd.91.2016.10.31.16.49.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 31 Oct 2016 16:49:15 -0700 (PDT)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
Subject: Support for seven segment display 
Date: Mon, 31 Oct 2016 16:49:09 -0700
Message-Id: <1477957752-4831-1-git-send-email-jaghu@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
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
X-List-Received-Date: Mon, 31 Oct 2016 23:49:20 -0000

The are 3 patches included:

The first patch is a character device driver which implements the user-space 
API for letting a user write to the display including any conversion methods
necessary to map the user input to a 7-segment display.

The second patch is a platform device driver which provides an API for
displaying on a 7-segment display, and implements the required bit-banging.
The hardware assumed is 74HC164 wired to two 7-segment displays.

The third patch adds clock, data and clear signal lines to control 
seven segment display on zaius platform

Please provide feedback.

Thanks,
Jagha
