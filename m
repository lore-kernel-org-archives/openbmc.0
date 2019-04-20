Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="o22Yd/ZI"; 
 dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44mbzG3m6kzDqRb
 for <openbmc@lists.ozlabs.org>; Sun, 21 Apr 2019 01:16:39 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id e24so3757622pfi.12
 for <openbmc@lists.ozlabs.org>; Sat, 20 Apr 2019 08:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=8z3sa+vTwri47nIFDozeXzE93yb85/FTOkqZDZHcW9o=;
 b=o22Yd/ZIeRErEd+5moksDDEfhbAEp6USsid3OANfEfD9nAZKoHKJ/Nb82jALs5GpQV
 Mz/HyZp6NCv6GS1jVKAshzBOOWwDZ5TNoZuvdwN685Ds/HE5/dgh1qTGgIjtoE4hWQk1
 O66ugSC+ZrPVUnKbtLQ/j019ttIGbU9yDhtsYMI2b3nBrGtnYDlVBfgba9609AHgHmJN
 pq6bJ1TKIjr0DzsKSQwaE7peSo4h9GZssqY3VLn16SSFPJBlKv5pzIcChGhipgzNRDaW
 Pf4w6f0oy0v/LxCZopE10vZJ1hsAapeX5NS93VvE9bHLDHy26aoxvaFTTPMvK28lkaUe
 4T+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=8z3sa+vTwri47nIFDozeXzE93yb85/FTOkqZDZHcW9o=;
 b=KnyGlCF4XYx5lVV6rq+xRCawJThcj29Hc+jbJDCLin2u9aMRSwMfe/ok74TThG6EPQ
 Ny69a2ifyPIKCWXqeA/FxDln9Fl9RyT21D4D3716h3QYaZ0IjSNIOjCttqH1fJZfsqK0
 /ZQOkcMSISKyUXKPGYcCMYVAbkJo1zWfZxOzdh7oSB2e5m219wn8UwnueGe/II/MACgN
 oXMnadvvJsz/fL121ycZ43oruAreULSnQm290ozwe1Xwkj/XFVzcEuNpHpn+nHyeCxuZ
 mVRej0BFemb82FtE85o/moxDBEc3C8rgIyMn6lBfr1h8oEXyMQDq0WTR4B9667l2Gd7Z
 9DnQ==
X-Gm-Message-State: APjAAAWdr772T4BGT/IWuDVufEfOOwOAS29+Tj5TVxP4QWxsMqbW9AVY
 mrcGC9OJtJgo3IfuIkjRHy9PHjxmLD4345NYQmrEWg==
X-Google-Smtp-Source: APXvYqyD7fjfWA5I4mKDD3cq5FSaedyIufmZaPhtQT/G/RIavwCd6UJgGrjpxUt9AtDlnhQtNzMzlemK7jXAfz05BqY=
X-Received: by 2002:a65:654c:: with SMTP id a12mr9721819pgw.101.1555773394048; 
 Sat, 20 Apr 2019 08:16:34 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Sat, 20 Apr 2019 08:16:22 -0700
Message-ID: <CAO=notxPYxa8oxQXkSLKNhTy3mZV8TOWeYyX=8Cxecz8fpAQWg@mail.gmail.com>
Subject: inarp package
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Sat, 20 Apr 2019 15:16:43 -0000

The inarp packages isn't picked up currently by any meta layer and
doesn't build (it needs some gcc related updates missed by its
non-inclusion).  Brad, I see you're the maintainer, should we archive
this package or bring it up to date?

Patrick
