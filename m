Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::231; helo=mail-qt0-x231.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nsC/N+ID"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="THEjZ+8U"; 
 dkim-atps=neutral
Received: from mail-qt0-x231.google.com (mail-qt0-x231.google.com
 [IPv6:2607:f8b0:400d:c0d::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 418wc24n83zF0Tn
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jun 2018 14:54:26 +1000 (AEST)
Received: by mail-qt0-x231.google.com with SMTP id y20-v6so2283711qto.8
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jun 2018 21:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:from:date:message-id:subject:to;
 bh=MDk9ssJTAZJEW3mzQHWjliSlD4mLG0awKEsbYSoT1qA=;
 b=nsC/N+IDrjcR2bptUpIZIQt/rDtjlSkyXeAD834OpicVwdbyZYQE97tpB+35rkUrHd
 0bz6C+HUN6D03UgPZ+073ViI8Bo4qD2Z4k2aZV2tffQhlIYc4IIz+yBIl3DmnfREGVFl
 0FypCsCXF/YB1o+ruJKKyKnSUGfnR8yR/3sW8LFXGGP6wF5N604nbzA19LN4I8r6QpIX
 H1Eg0Xj4n3VGikzinkDhHp/yyfsL4gqAMs4wecBgZ9TKuVyxAseGcAh6QfTowUe7SHRC
 9hW7FACaHEVh7vrQ/KiRu0Y31lATHzhR0TY2q7QiHhfG8jm17UjxcU0iDpuxZRGTLl/R
 Klmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:from:date:message-id:subject:to;
 bh=MDk9ssJTAZJEW3mzQHWjliSlD4mLG0awKEsbYSoT1qA=;
 b=THEjZ+8UvSnDTu67EhUi1RyklfIM1W5tp5OVe8A8ODh8ffDTwfB6QcbM0hn1HC3ImE
 M+V/W3I/jSTJg0lfwgMosknVQgL+YnMmi7AiLR6pgZc3vIvtBMW2J9aFDgBGAmQjdImR
 x5GuxLM56E+xcHKCyv9g138Rg9EVDTk7X4ooA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
 :to; bh=MDk9ssJTAZJEW3mzQHWjliSlD4mLG0awKEsbYSoT1qA=;
 b=fnnI7FKZ3fEpXviXvrjk5qQkRr5qC5aDiKVjbSMZarnnURGEt/nNQO+7VnHcuBzIja
 L/6b6fbMZ+tIfPAiAHpKeq+HD5yRmjqhmfHgkWOuYuzQZaC2f2rOcddrNprXl/u4ZVnm
 drc8R2ojnFogO2bJPilko01qGGFWB+CrqEmjPIPJBnAR4r+1EF3BjPcmh2qWlqpdVke0
 EQFqTZrP1A3gyZnhEu19sedHZsm7ZZXNswEOFNnt/AqCJOqhINIYkgJig8op8wyWPprD
 +8GPQqdW17hC89UBEoexNGkENERCSIxR3U0FR0TX84xUdCbDXB3VS7IIsUm/guZcAA85
 i0Zg==
X-Gm-Message-State: APt69E107pjcAfCQjzT/j2vabJEP3DkmpzI+/Hk8T33n39hGmZRR4za2
 fIxeYnXb1c03xuzxKBGnUgRvPlU8Ep7UUzdqnOXBtYqs
X-Google-Smtp-Source: ADUXVKIdgAn/Mcpbwp4tjUrMxKNm1TcWaGvQta4D63rCbDL1zUBJqw7EsEjP9YxAyEabR18Uhk4Xs1Ldxaj3X9KxGjU=
X-Received: by 2002:ac8:65d1:: with SMTP id
 t17-v6mr13920131qto.347.1529384063654; 
 Mon, 18 Jun 2018 21:54:23 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 2002:ac8:184d:0:0:0:0:0 with HTTP; Mon, 18 Jun 2018 21:54:03
 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 19 Jun 2018 14:24:03 +0930
X-Google-Sender-Auth: tS9q1LQ2WRdDxKsYrLLAk5tJ5kU
Message-ID: <CACPK8Xd_cV+u880CSWEOXHicWEM5xsusjq=5ngsxwY7XLZiaNQ@mail.gmail.com>
Subject: 4.17 kernel published
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 19 Jun 2018 04:54:28 -0000

The 4.17 based kernel has been pushed to the openbmc Linux repository.
From gerrit:

    kernel: Move to 4.17

    This brings the dev-4.13 development cycle to a close. By the end of the
    cycle the 4.13 tree contained 236 patches.

    This moves all of the 4.13 based functionality on top of a 4.17 base. We
    currently have 97 patches in the tree. The reduction of 139 is mostly
    due to code landing in Linus' tree, with a handful of fixes being merged
    into the base patch.

    The configuration is updated with newly landed drivers. In addition new
    upstream security features are enabled, and legacy ATAG DTB support and
    /dev/mem are removed.

Please address future patches to the dev-4.17 branch.

Cheers,

Joel
