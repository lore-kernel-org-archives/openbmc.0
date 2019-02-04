Return-Path: <susantjasinski@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com;
 envelope-from=susantjasinski@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tB6UbFxN"; 
 dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43tdS71608zDqKf
 for <openbmc@lists.ozlabs.org>; Tue,  5 Feb 2019 06:43:51 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id d72so369607pga.9
 for <openbmc@lists.ozlabs.org>; Mon, 04 Feb 2019 11:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=j20w6d/3XhIjSuGxTrzGEj2SMfoYhObF/nNYQJIp1WA=;
 b=tB6UbFxN1/yBa8cYE/k7hvqawcw1Dusql5xcRP/MoAxV9RAa/IstuZAtCeFwT6CAiM
 nbctd9YjCzLdxOGmKAWM7z/h0VQrKvkiDaO88F9bMXGBwy7RPBbUHFIDJSnr0GVkqCCi
 IyUvwljD/nXW/g9KyiRXwBHsAub6CWuQlUvxazF7gBwpmcxHX/Ytdm+cYYM88OWe3HPL
 YjoTwWuxgtiVzhp78e/5JD6GC9NteOEfq8dOp/HN8Oy1MEjssBRzkFJi9d7+lRvpWQlq
 xZISPAsJSqqqG5XlmlHx+unPLv/NJ2mSsnuwYb7ZwWtKJ6aXrQGTlHwHLoXq21IOvX5k
 XwqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=j20w6d/3XhIjSuGxTrzGEj2SMfoYhObF/nNYQJIp1WA=;
 b=orTuMoc40zqkBlpZG5vBqeKg4sAiuzsWVD/Ru2ZJnUAz7pZWkS8BIgc5COTPr22mo8
 cHts4c146DpFpyACx2E7xW9ID+hvP7iye4xo2rEBY6TtIWHmBVp8EK9/qmFyHOaSnaVD
 rOMxnx+3ML5m9j2Ro5qEI5Yq+QIbKQJOIfsfvWaA0w9a7CH6CqFVWpqtrgbuZLyObl3h
 KfuyMNfzkJrmxT8zbsHPDszM2RtMuLLROmH1AlTizVZoqAj/Vtc3xc+zRmB5gIuhK+DK
 Lf90+prNL6i+58QYJ/u9WoTCGsG09iNYnDS82iORx0Lf9kR95m1BFhRUJxuE4h9n1Aff
 1eqQ==
X-Gm-Message-State: AHQUAuZiKO9G3Km9V971wMlpuGan7iO5N4TVToKKtoMgJ4+nbAOSCavD
 74ObJlcYl0TctRo0Th/tUEnNEfG1Sqdm/RFdupQaf1kK
X-Google-Smtp-Source: AHgI3IYj++aoMqT/Cf8P2S43Gkij9e4T8+5a4lTcbHByvK27Ah0jlboL+tQX+POEHHefQMMty3IOyKDJdpo/4335eiw=
X-Received: by 2002:a63:d347:: with SMTP id u7mr910927pgi.383.1549309428837;
 Mon, 04 Feb 2019 11:43:48 -0800 (PST)
MIME-Version: 1.0
From: susan jasinski <susantjasinski@gmail.com>
Date: Mon, 4 Feb 2019 13:43:38 -0600
Message-ID: <CANT4NrLJN4N0Q=_PnDChbxyvAizDwZGJQRO60gROy8tOpsZvXg@mail.gmail.com>
Subject: GUI Design Workgroup Wed - 10:00am CT
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
X-List-Received-Date: Mon, 04 Feb 2019 19:43:52 -0000

We'll be reviewing the updated Network and LDAP panel designs.
