Return-Path: <maxims@google.com>
Received: from mail-it0-x22b.google.com (mail-it0-x22b.google.com
 [IPv6:2607:f8b0:4001:c0b::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vC5x96sgNzDq5f
 for <openbmc@lists.ozlabs.org>; Tue, 31 Jan 2017 11:00:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="WogQyNAM"; 
 dkim-atps=neutral
Received: by mail-it0-x22b.google.com with SMTP id 203so206091234ith.0
 for <openbmc@lists.ozlabs.org>; Mon, 30 Jan 2017 16:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=W702DRZwce+12GCFVsuHoEW2GwvUZXnIWmyEZPT/Rqg=;
 b=WogQyNAM4idUAQbDvUQt1GXJ05zCEbiD3P6AKbjT5iB3Q2gWY57nLOnNHPvfJ0TLBy
 hu4nD4XJNGtXj5gpvqciSQZKeDtVHF39NA9Gm1pZOx2ybkiTJLRaFdzyl1YUPXakseed
 3cTdDz3lRVIiAoxOfjKW67NuQSpIJd5RqgLDMW8kLCEZi48A2LX3+MmmEyIyw4lEGX2T
 HTF2MmPNh0F3xdTxYcKXRoxcQcENaGsUKf2Kjz2hmxqOFnN9BOReLIANRr5MLGe/yWrS
 UJnS+mlPhEq+769susvTt1+5EW8/goP49e0a9UZ2bX11m6MGsb4/h6A19ZsrMxYLo8Gu
 cuWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=W702DRZwce+12GCFVsuHoEW2GwvUZXnIWmyEZPT/Rqg=;
 b=taMz3CjOn9OCAPYG/bwJk5kMdI/V4FwJF1MccjLvXkNqo9y9ltLvxMshrruJ6b0UyV
 BoYp2GK6UQBn9rCz/XIciXHLtFaJhsYsoXW1XSu+yiNjet7Lv1XI+W2+8YMOs87g5Jre
 kbvcLbugwnaGdShJMeY8XkJc4/jVgujrksC3GyCyEpDWV8dMUKXYZvh3sgCGKBemUcz+
 VkdVheXOQa94EgUjfo23nT+ETZ4VQzNJYYYLOxqxuvJvUwP7zSFaEhHKeyvL3fPc/9IE
 KOLXRzDqTPZ3+pPOcsgYJ6jkwktUzeeNeLBJQbpZAt+mD4MVbA/NY+4v13p4HakAidNV
 7qsA==
X-Gm-Message-State: AIkVDXLch4YQhe6GJdYl8i0PCd8rM2skqSftRKJm2mTMxwxV2rRUJzJ0XSuuwMW4jqe54EoZ6aevjomivC9rJsUi
X-Received: by 10.36.37.145 with SMTP id g139mr18653477itg.24.1485820811216;
 Mon, 30 Jan 2017 16:00:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.134.141 with HTTP; Mon, 30 Jan 2017 16:00:10 -0800 (PST)
From: Maxim Sloyko <maxims@google.com>
Date: Mon, 30 Jan 2017 16:00:10 -0800
Message-ID: <CAFR_W8qLw174HCxC4kmPuxZp30nA+n1Ug6FRkk1xSsYBUxZSpg@mail.gmail.com>
Subject: Support for Aspeed SoC in upstream U-Boot
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Tue, 31 Jan 2017 00:00:14 -0000

Hi all,

I'm happy to announce that the basic support for aspeed (ast2500 eval
board, to be specific) has been accepted into the upstream U-Boot and
will appear in 2017.03 release.

It's a bare minimum required to boot the board into U-Boot prompt, but
it already has WDT, Timer, Sysreset, Clock (very basic) and SDRAM MC
drivers, all implemented in C from scratch.

Of these drivers, WDT, Timer and Sysreset *should* be ast2400
compatible, but I haven't tested it,
since I don't have the hardware. Clock driver is not ast2400
compatible, but it should not be hard to make it such. SDRAM driver is
not compatible and my understanding that the controllers on ast2500
and ast2400 boards are different enough to require different drivers.

I plan to continue expanding this support, which basically means
adding more drivers :)

-- 
Maxim Sloyko
