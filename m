Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="azaJEP4j"; 
 dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Pjjr1C3kzF3Fs
 for <openbmc@lists.ozlabs.org>; Wed,  3 Oct 2018 01:29:03 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id az3-v6so1934414plb.4
 for <openbmc@lists.ozlabs.org>; Tue, 02 Oct 2018 08:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=craot1lKrUOY1Z7Ye7GTz4PXTYiGiVhTjP+G9fM03N4=;
 b=azaJEP4jlAhp9D2uGaBsSJae2ZFN3C33qiQ5ghw3BH6gyGn8Ub2JqH/zERPvhCVZG2
 peA961F560HVs20YNkbFi3PVugACd0bDk2jdpdIKdx63xopudI6I8hg9QYNlNDGwgwGa
 Q5gxhzTGx8fxTjlPKG9UqYjBsm2LlWL1jU2oUnI3hS9BN1ELE3xazNOVdiuOZEpClVqj
 wdaoUD1B4hFelXlAXZQ62HaA8IsyBVccnmvYDhTidOGbkSZ+9F3Rfsf53xU8Et+lT+cJ
 TL3e34YHT82abtHA6RO91AE0PXsERGtrduRxB783EVo7skj9kop7bMDPNFqbqHmu2dql
 OnZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=craot1lKrUOY1Z7Ye7GTz4PXTYiGiVhTjP+G9fM03N4=;
 b=UuhVMHAuSHxQUBkzt0GyB1umRIiLmWsaBuT2IF2vfMtJniiaBE8wQqXbA2hGQJ5dnk
 RqlxECGKJx0GgXX++XRdi/zOEFP1DE5z0bCoXGYfBBqzxjQGpPVW6l8mqn60RwBHA2Q0
 yl8oRdQrLrk71fadp5/7X/lVa9BjeGClvb2u4J4MGiGFPV5huNf4NYoQ3JR4F9bSjL4R
 RoyKyOxFAjjiWWJ93NcYcrbnM37yVhWYXMrqughXu65C+kDil38ni6sSE3JmFvK28Gjm
 0kl+0FDacc9+TEHJBJra9J1mhRn5cpeaT+CshN/zdrRL1RI8FWgNT8GuIK8CtL9rZD3+
 FjBQ==
X-Gm-Message-State: ABuFfohrYy/btKn8np1B7SViP1wjoZ0dvU5VKMhZE8i3yhtFfmhb1yC7
 Z6ZV+4/HoJCH5QSKjT9DwpRTUFhQzRT7H49TXCQcVbnWJcQ=
X-Google-Smtp-Source: ACcGV6041UR4oyOkZjRuNHr89TIA1uIsrbRiBqehkdlyHRGgAquIJpywZy4x4glmQiBDezPnk+KxgE7gS0VGxpTgxqQ=
X-Received: by 2002:a17:902:b712:: with SMTP id
 d18-v6mr17713687pls.53.1538494140436; 
 Tue, 02 Oct 2018 08:29:00 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Tue, 2 Oct 2018 08:28:49 -0700
Message-ID: <CAO=notyKtrecZeAypPcjY7qi6rBqj_cPwPosFRds=wYpeHW8wA@mail.gmail.com>
Subject: Recipe Renames, etc
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
X-List-Received-Date: Tue, 02 Oct 2018 15:29:05 -0000

I've sent a bunch of recipe renames, but I'm still updating each with
an individual tested footer.  I will try marking them all as WIP now

Patrick
