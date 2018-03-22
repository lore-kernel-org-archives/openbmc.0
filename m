Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::22f; helo=mail-ua0-x22f.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Xk3cgWQv"; 
 dkim-atps=neutral
Received: from mail-ua0-x22f.google.com (mail-ua0-x22f.google.com
 [IPv6:2607:f8b0:400c:c08::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 406bSt4s1NzF20R
 for <openbmc@lists.ozlabs.org>; Fri, 23 Mar 2018 05:54:53 +1100 (AEDT)
Received: by mail-ua0-x22f.google.com with SMTP id i21so6258799uak.8
 for <openbmc@lists.ozlabs.org>; Thu, 22 Mar 2018 11:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=aeASgDY/uBIa4noA8SX683qai/AuXE2so+8X5sSI3Ak=;
 b=Xk3cgWQvZYWj7BarJF3RyJevffE2BYiZPE8+S4FaZ1nd7E09XtgcTlSwvQIdqw52QH
 +1HHDkDlySZSoS/VAmKH7EYUY4jdVm6IvG5Af/mx7Lyvmw9s8K5e7dQ6tgt4JlYbZOtr
 GLQUxjyHKnKWOUDu7RMoezvV/dpVYQQL3vU8+aum8d+Oye9yIGknXgni5a8udZ0iFxev
 tOdsvZKifBm8P9U7PG5+vrEvOE/tAL+WV31o2nhccvZ/I/G8kjl0iw1A5dDQrAWIE73U
 QqA5Xzoa626pzj6B4TsPyG1lHGeM7nqDK5x2tOC1+E8/3PcnvD7ZoRXiFzCpCd8tVGGV
 bJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=aeASgDY/uBIa4noA8SX683qai/AuXE2so+8X5sSI3Ak=;
 b=NJxaVVenzJpAPwJzTtIL60K71fr58N8CJPRVXUddBmx5bHsX2/dTjaaBbkc8qjeBbr
 FBgJSccN5XkKaVEx851YpNofRnygT/8srEjhAGKzPTvWZP1dTf/ANvX44Va0d9eIRQ/A
 q72sB0D4qTgXrRg3F0oG3duONMbprbtXhDoqqY7lR6EmT/+ru3txHlqseScXpknRurS3
 o8VShz6wXOx/uhsMgrFVchgjoyz7KLjaeMgJxOCqpCuntYr2Te4Y+gl1wx+MKTsw8u4t
 t9BKgtoQK6Sino7xVZWndSIHfZqFVtzp42RK/42mNVpy6JSceg8nZHtv7ISgPdoZGBlj
 PWog==
X-Gm-Message-State: AElRT7E4v93D2A237wbWammjBfBUH9f3Pq7RuZF+hPtnQIHzelhk/C4x
 gWzPJ00aOuVS9EclJpTHykqXoBBazhBZWrdXc77E5cN2
X-Google-Smtp-Source: AG47ELsbcXIyi8dddUbvlxb+kSEY4ijtp0Zz8FCya/NLiQtzKngEtr96TYp7bNj8tFud7Qqb+ZrW/4LPrMuuQIwArkg=
X-Received: by 10.176.4.118 with SMTP id 109mr15282620uav.198.1521744890180;
 Thu, 22 Mar 2018 11:54:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.124.193 with HTTP; Thu, 22 Mar 2018 11:54:29 -0700 (PDT)
From: Patrick Venture <venture@google.com>
Date: Thu, 22 Mar 2018 11:54:29 -0700
Message-ID: <CAO=notxQAUtUvOcJeTznwp72uXn_STHqtggV8sdexhE-BfuxFg@mail.gmail.com>
Subject: BMC Health
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Nancy Yuen <yuenn@google.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 22 Mar 2018 18:54:56 -0000

The Facebook presentation yesterday talked about BMC health, free
memory, etc.  I didn't see anything in the IPMI spec about this
information, and beyond my general drive for metrics, just system
health would be great.

Things I care about:
up-time
free memory
... other things?

Patrick
