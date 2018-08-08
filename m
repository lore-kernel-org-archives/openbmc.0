Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c0b::22a; helo=mail-it0-x22a.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="rwugFioZ"; 
 dkim-atps=neutral
Received: from mail-it0-x22a.google.com (mail-it0-x22a.google.com
 [IPv6:2607:f8b0:4001:c0b::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41m0Dt0MmyzDqgZ
 for <openbmc@lists.ozlabs.org>; Thu,  9 Aug 2018 04:25:32 +1000 (AEST)
Received: by mail-it0-x22a.google.com with SMTP id g141-v6so4878110ita.4
 for <openbmc@lists.ozlabs.org>; Wed, 08 Aug 2018 11:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=cGK/PvE03bLbahTGmDhmWHiFyRIDvQoSKvvopc0OeV0=;
 b=rwugFioZwq9Phzvq/lzytoqBILPoN0cnVY1Ouoda5AMv8cq+JqEIzmUmtYlcvWkWra
 gXfYHdeb4hBHRC3hPdg+nEASTRdFaV+Y6UAHYuRIcxt4WvtVMUjCgHy6u/wpEwegMdLc
 LvcH7zeOZ+5ggGr4EEEQ3dbVaALTnszp+uUbnSHU4aKmGTcSqnZJib5mHVspulSa3fM3
 9Y3toON/7qtsmiXV5LynHzTogfBlS0DfibaA7tUI90dHQwSYT90UuqL4B4Zu1/wrhlRB
 n1mv3M6IXUXfUB7RSEWIUNRWhS5Md+tLftibU4IsrMN4TeVc34EuI2l23h+Gq8Jzo3QR
 PqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=cGK/PvE03bLbahTGmDhmWHiFyRIDvQoSKvvopc0OeV0=;
 b=CNzFloi0zIsTZglh5NUX2a/8Bz74H+VOCVwQcoNA3iKNVYClBaNN6ZybkfKPqj5vRF
 OCRVT6HnaMfShrfzRuKu7lr9EcJS7Q2Hptz7rkLFFmAw3+Ag4VycaNeF8oOIxXPKZtt6
 i1I1mzQis+hRGzCIsNZpWus0xTQ8GXvgqpiBHUnbyMPWCJk+QgwnQATheOn0Vim9e8JD
 qur48v2gjSOxuQiuZn7xrJ2lDXFAUbBZLcB0sb6Yq/E9v0fWfgSvLluTthLN4zWhgxHi
 rKBD2eLiF9ZZv3cVWmn/LZH+7uJKLvgRD0HRgNVFwGVbqGhZMw9KxHak2SHKyWnaRzsC
 LMCA==
X-Gm-Message-State: AOUpUlEs2eavDNnfiCr7up2z2mCSHJ+CmkDw8FXG2Kbgzy1j4OnS8Krj
 1zPAtTSXBdHkl/EEcmOD8FWd6mBbF1zDpnrlc/o5DfYkfV8=
X-Google-Smtp-Source: AA+uWPxzpApzsaO0c0Y2BqEQU2xjoWP88LZJztwm+PUewilGOMR2QWwqF4sT8/WTB+l34U8RpfoLrxgeYCHiWYci77M=
X-Received: by 2002:a02:9b54:: with SMTP id
 g20-v6mr3574040jal.33.1533752730380; 
 Wed, 08 Aug 2018 11:25:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:5c07:0:0:0:0:0 with HTTP;
 Wed, 8 Aug 2018 11:25:09 -0700 (PDT)
From: Patrick Venture <venture@google.com>
Date: Wed, 8 Aug 2018 11:25:09 -0700
Message-ID: <CAO=notxyH1+UcYhyhjDiw8vdnkU5SfQ6bmJKhBnWq4Gc5=ZTZw@mail.gmail.com>
Subject: clang-fromat-ignore
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Aug 2018 18:25:35 -0000

I haven't been able to find a good answer on this, but from reading
the man page, there's no built-in mechanism for having clang-format
skip some files.  I wanted to check on this before fixing the script
that calls clang-format in our CI.  I've added a submodule to a
project, and that project doesn't follow our style -- so ignoring the
folder lock, stock, is the right approach.

Patrick
