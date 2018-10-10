Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ftCzkoKl"; 
 dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42VkmQ1y4pzDqCB
 for <openbmc@lists.ozlabs.org>; Thu, 11 Oct 2018 06:33:41 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id f29-v6so3132322pff.5
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 12:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=VYrA4CvP2vRNvx1Xh3JvaE+WizasSa9dZC4USZT0Hho=;
 b=ftCzkoKlymHwMuy52qc+EJMsXyE1kn0YbPzrsq+yFxp7XzTLfzYrMpmvtyggI2LJ67
 NlVs/Ssk5hx1OVH1bXbw3GdhtwBmBBEjePrMCYaaj9NG3ys5mM7wHJmkYFFB6dE9Gq+x
 1s71SY4fG5nz1+5Oh18g6547CD9Fi65mYTeP4CKabTgDVa/q9+EhvLLvd7B/HzpsPsIo
 vW6ujsx1YHkAWuC/iTfWhaiJwCX7sq5/sr3orUXIGuEC930AfUi+CxAkDFVUdU0Zm+wj
 cYT02P+pFKq6LNbk4+0MjJTP3O2e0ZmTYBYysZDUe211oX7ySEnh1S5hLh0PyxgR/BBH
 ayQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=VYrA4CvP2vRNvx1Xh3JvaE+WizasSa9dZC4USZT0Hho=;
 b=e7iAEvJVtJ0O9VVEK3iMTjBdTf9Uwf6AxBv8qF+4E9Zml4vRz4/TXfMv1sNGBEZeGh
 JFTSvKWckKbVZRxb74y9BQo9/Ak/AceSgbEtz15wWIwbyMHiPlzZ9n3pGNzHf5bnsOkh
 +Fn8ezBuMXhG1X1QDD0OCHoEOJqtt+mkqY3sVuW52Ja3/tvCIjFQ+4Xu14czsQe/XeY/
 8fgXzbzsloAjaYw4nrBChcvm+kItVKtj+9v3yKlk1UI1B/kJWTcCGaZTiOKcL9XkkOxl
 3FnSsvhgZmSCXcatyq3eBtuiWnkgr54M2ZXHazrJ8ZTcND56xEyunMeQ8fH6dVMO9yoT
 3VpA==
X-Gm-Message-State: ABuFfoihdU22GSyf3xID/VqjRoZJMuD9x+QXCULG0PbhCZG0YcBwoA/i
 XhXVKAQAc+wT0XnbxgFt90LSR8O8wiqeO2wCvRFKvtyCVbc=
X-Google-Smtp-Source: ACcGV61QI186+oSUpbwfqg1deOTQ2IqSiauHEu7QD8nHU/vsSvxmYFTQWEMPoQMIe8AIkxu4XL8ihh97pOqwWAayTHw=
X-Received: by 2002:a63:e601:: with SMTP id
 g1-v6mr31125143pgh.290.1539200019429; 
 Wed, 10 Oct 2018 12:33:39 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Wed, 10 Oct 2018 12:33:27 -0700
Message-ID: <CAO=notxKDiY8d5WriLfB6-jNvHxJpJwSivYki0tjhmKwq_PDeg@mail.gmail.com>
Subject: Opt-Out vs Opt-In
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
X-List-Received-Date: Wed, 10 Oct 2018 19:33:43 -0000

I have rsyslog running on my image.  I have no remote logging servers
for this... I have no desire for this daemon to run or take up space.
In general, I turn off about a dozen IMAGE_FEATURES for my builds.
Stuff that I don't have set up, or just don't need.  Every time I
rebase I have to build and look for new things to remove.

Recently in the security group we've been discussing the opt-out vs
opt-in model for packages and configurations.

I want to take the community's temperature on this.

Patrick
