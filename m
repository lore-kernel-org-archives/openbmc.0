Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::22d; helo=mail-oi1-x22d.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="A+THLeTX"; 
 dkim-atps=neutral
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44kj7T4x7pzDqM7
 for <openbmc@lists.ozlabs.org>; Wed, 17 Apr 2019 23:02:13 +1000 (AEST)
Received: by mail-oi1-x22d.google.com with SMTP id j132so19955601oib.2
 for <openbmc@lists.ozlabs.org>; Wed, 17 Apr 2019 06:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=HqSRUi1Q5aETq3rVr7V/u/pL2MyJlYLgzJF8/HB5yuc=;
 b=A+THLeTXGkLZlBkzHlAmyz/BAslXlMw+/oOj9pn+wthD0njQxgImbozGeJPMkmiwVX
 prG2/dL29LEtBivHC1cFVZ5U74hhPbnooYJe8rShWm9cd0LAxmVuqUloWJV6oPsGTReL
 KgD0f6maWsJWKF3C8Vk8dBgzRRL7uafFKN2nrv7ZX8ox5+4op4O6VIuFDDTexGcsow2E
 WqZ6mAxre4DQBPOUnBVzyALhQuhVUk5qzUzwIRPjIla0VrhzEhVYuoFmWX61mKFv6kNu
 qwwH8Ho4QCzRFMc6FQWzS/3546L3In6W//Pr2HxnU8pZ+SbOyJwTYpEY4+slKySbBc2a
 XMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=HqSRUi1Q5aETq3rVr7V/u/pL2MyJlYLgzJF8/HB5yuc=;
 b=mS32uRIzX4nmWUcxorpQDhEROqu29ddepLFjW5MyZ548aF2Z7B1sLAQ6MTCTZ1F0rl
 kRR3UcfwAoK2htUxDGnDrOhc1I21IlShDgmM5Ajw9cg55XSBdhv1bVTZkyJK2lCB4Y/K
 8YofxoyF7hU1bJ5sG6f2OQuZrFxifj2G62KQbwgQFUz773O7IkN9xA6ZjdrdDGfW4vvL
 F4ypJi70zFQfhBYE8PXlqMLFhbVxfturAnb3RYryAMmDPgu5s/imLXZ3p4yR3yKrsoj1
 wIH2S+uH5iM/LJ9OgI83IePGSodiJPOuEw0OHt6WYyZja010yu7u54tgKHTgX98hCqpj
 42+A==
X-Gm-Message-State: APjAAAWM9MdsKhlJiWpDT/sq+/sqev0m0PuBZPBBNihc+6hiF3ag6uLG
 Rocy/9xpaLPx7CyRPf9vOyBNT6NGH0XCnKDHGMpA/8qm
X-Google-Smtp-Source: APXvYqxFxAXGYPMOViqddrXiwzywdeLku8RjCpJnpkVrAgCE8VMD9twOv4jiRN0vAIql3vAcdBqPO1oKONr5ctpa1T8=
X-Received: by 2002:aca:310a:: with SMTP id x10mr28115364oix.161.1555506130900; 
 Wed, 17 Apr 2019 06:02:10 -0700 (PDT)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 17 Apr 2019 08:01:55 -0500
Message-ID: <CALLMt=rKjZJuRsZQe7R7kCDQ39FZ97C5mZ1Ngr_ymJgH0Rx1Eg@mail.gmail.com>
Subject: OpenBMC Infrastructure Workgroup - Cancelled today
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 17 Apr 2019 13:02:14 -0000

The agenda is pretty light so lets just get back together in a few weeks.
