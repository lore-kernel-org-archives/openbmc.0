Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::22f; helo=mail-it0-x22f.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="k/a4Yu/f"; 
 dkim-atps=neutral
Received: from mail-it0-x22f.google.com (mail-it0-x22f.google.com
 [IPv6:2607:f8b0:4001:c0b::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 418s7c5gwXzF0Tn
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jun 2018 12:18:04 +1000 (AEST)
Received: by mail-it0-x22f.google.com with SMTP id j135-v6so14989501itj.1
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jun 2018 19:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SB0e59Og3Z3wKQoE8flSmTi/7PNA+TJoYB5szEQ1P/w=;
 b=k/a4Yu/fp+s6ibmIQoBfWlEPbTTrjP07+t3J08jlR2Fu9uDuyhrx01xMg8rRlEcXnX
 H5UWAGYLg1ZT8LiRnsvX/ezENHLTfRXiaYoZjIod7+h/qbvdEQVzO10PWAxn0QPuBMQZ
 LlEgZTEZ6rw7EVa9Etch1onA2zuJR8d8oLHG3g5HOLonSnX/Q057Az4ahjXkWKBJ0ATM
 WV60AYQtnw8oQwSP6LNABQ+Gz/c0GcKmvXB6XafqeDXPzCJYPxRal5V2wbmkVzX5R3NR
 MjWV5FxwCVgat9Q3QkebZauUA4S1q/pcXlG/WfmSFJlDlFIprXt4NQUq5Fe7ZKahgooh
 WRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SB0e59Og3Z3wKQoE8flSmTi/7PNA+TJoYB5szEQ1P/w=;
 b=LaxvBxAtIPJSlDdetyajLP+58jjh4lGFr+ET5pk7gSXEQQ/N8+RAo7RGtnMWRHaMBJ
 AoLtYCGRGSWH/j5aD1YqvD0kLsSug9Z5A3S1MDe5EfpYLo3Y+8NdNE+UNGKLptjatpT3
 zR7h8PR8r5e13b6WK+uxH3h7yiaxZpQFvUjFgu2Epiuamz8DKZ84DapSyCdtaGBP5UO6
 Y7zpQZD5fXPhw5C1vqbHArehXnSH2V4YrfM0R/okP1Rzdmi3r5Vh92Vgew25vJ33q/iq
 jusmMlv2vorx/nhCExXLd15dxPaEpAoq01HQxwsVVu0bBhr9s2bL5hYHoT7qHy7JsvO1
 vP2A==
X-Gm-Message-State: APt69E2bYjufYKW7UCTmBOGNf86av3n0zSyv7sEZxXH9Z12sPBwrwnvj
 EnLV7kPmx8C22v3oyZ6ih9SNsBgjC+sN+YO3sgaskUSP
X-Google-Smtp-Source: ADUXVKKuR1y2PreK7ilPhTCYuNwziz6PuJz5OwcPnerZzVFzk//xUANcmfY2vxfNFZIZlJGaUfdSHqCJhDGY1GHONeo=
X-Received: by 2002:a02:5206:: with SMTP id
 d6-v6mr11987791jab.112.1529374682059; 
 Mon, 18 Jun 2018 19:18:02 -0700 (PDT)
MIME-Version: 1.0
References: <CABq4n+T4aZ+iPerYDOrh8KJ09rxyUC96h-Qhvvznjz0AQuQ7Rg@mail.gmail.com>
In-Reply-To: <CABq4n+T4aZ+iPerYDOrh8KJ09rxyUC96h-Qhvvznjz0AQuQ7Rg@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 19 Jun 2018 10:17:50 +0800
Message-ID: <CAARXrtmU-kfvyyWWbmM47AHoD5219bGnqgNTNY7O8JakvVt9XA@mail.gmail.com>
Subject: Re: Netboot full image loading AST2400
To: aaron_ppus@fmad.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 19 Jun 2018 02:18:05 -0000

> It seems like there would an easy way to do this for development/bringup, asking instead of hacking on the code for a change.
>
> Im bringing up a system by loading an image via u-boot across the network into the upper section of ram, then booting from there. It relocates itself to the reset vector and generally works well.

You could refer to
https://lists.ozlabs.org/pipermail/openbmc/2017-December/010264.html
for TFTP kernel + NFS rootfs boot.
