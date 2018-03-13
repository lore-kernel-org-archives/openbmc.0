Return-Path: <arndbergmann@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::22c; helo=mail-qk0-x22c.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CRs8q5dy"; 
 dkim-atps=neutral
Received: from mail-qk0-x22c.google.com (mail-qk0-x22c.google.com
 [IPv6:2607:f8b0:400d:c09::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4010XB2mG4zDrLf
 for <openbmc@lists.ozlabs.org>; Wed, 14 Mar 2018 03:23:21 +1100 (AEDT)
Received: by mail-qk0-x22c.google.com with SMTP id o25so198474qkl.7
 for <openbmc@lists.ozlabs.org>; Tue, 13 Mar 2018 09:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Zi91P4GHTuGX8flA9CpJw6BLLbq0ZeEOZ1ncXgfJqnQ=;
 b=CRs8q5dyogucKJj0yVngHE5R96VqKVAuM7vI2RJ+BKldoffV7FVqiJm/StKMxMOaOe
 Vi6VSd26TTdgelLmoqTyLtoJW6iH0RJM7vX+teM+W+M6u9Zhe5IBtZQOaaW70z4yOEEl
 fQZjQw9fd1DQtq1fKO4LfGBFR76UV5vTiDh1hqjx+g6l9j+r2qXDjqX/m8jzXcbDnbw2
 E6N7HdtXgJ5BaF4DUbN9r/cHtuUfRzZPr/TtFQDFinGVi7Uz2monKml5uUh8vX1Tpb6x
 /YVrmThe7d05Tzex4jahBGK/lOl2EP7AWMIkIznTUdJWvjrNWBoSWX/b9DD/wNIYjYVr
 rWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Zi91P4GHTuGX8flA9CpJw6BLLbq0ZeEOZ1ncXgfJqnQ=;
 b=QDlObU0VOWVBNIfXFuWuDGQl852/WKjkUCOLCIo+5KMbzUs/DRBs48VlfIOKLbGUY3
 p4vppiyNBgu/nJh10cyWcapRxbEh2hQGRUaFQKbWos9RZLoEa+2LZGP80Mx7h3b9qFFt
 dreRqcObhWt8IeyfwA5Z41xBiXuPAYZfDfLpj0CF1vc7Bwe81M/BHhEkJLqDQTEuTNfC
 NBBrnEMTyHiwSwdBn2MjydM0fAv+J3yNoJIR7RcNQwrYBYhoFykubhQqMQzuFiPxW86M
 16HhgJxlwN4JA3tSC5eL27laElyQCCN3gV5EoEOE2/x38DXgv9k/xBpkI7sAXidqtEzO
 8PHw==
X-Gm-Message-State: AElRT7ER9nD1WS5YimwhfOB3NbLzUY3Td99kiEnYETRc6Yz7rFY2R43p
 E6lkX5VoypH1AAmRGuPByQAB0rDuR+3oUQWgEsI=
X-Google-Smtp-Source: AG47ELvemPaEOBDhFaow6EZ4+pFayLWYrhlf4ytBu41jEND1ZgPHZQ96+Zn0JZfJI1F5IeYN60QcSCeTJDIhnH3kV58=
X-Received: by 10.55.195.148 with SMTP id r20mr1738642qkl.173.1520958199195;
 Tue, 13 Mar 2018 09:23:19 -0700 (PDT)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
Received: by 10.12.185.46 with HTTP; Tue, 13 Mar 2018 09:23:18 -0700 (PDT)
In-Reply-To: <CAP6Zq1h+6GGrnUEcjZWtBPBKDGxL+6+OG0itJD_FHD1MAcYmsQ@mail.gmail.com>
References: <20180307162430.2664523-1-arnd@arndb.de>
 <CAFd5g45h3wAZtx-4oJb_uLbtDTzSsD6eLM5G0VF=3BBHNmW8YQ@mail.gmail.com>
 <CAP6Zq1jEAg2OrmnHzJdk9UBjPkDctu5oGHYyJ+QLBzN+E31sPw@mail.gmail.com>
 <CAK8P3a2=0ZUqyhmKVa4u_VvOg4rtd6vUWdpRojfsoP3OSvGyeQ@mail.gmail.com>
 <CAP6Zq1iOxFTuUvp02qOtgpmfH7HA-1eZ9KG6AtU0zn6CpPCrzw@mail.gmail.com>
 <CAP6Zq1h+6GGrnUEcjZWtBPBKDGxL+6+OG0itJD_FHD1MAcYmsQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 13 Mar 2018 17:23:18 +0100
X-Google-Sender-Auth: s9nnEqTBXBzd226Sz8uJ--8_pcs
Message-ID: <CAK8P3a3jfUf9by9SxR8JQQjUuOFydR_uHTfKH=_eYPrsW7AFTA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: npcm: add CONFIG_ARCH_MULTI_V7 dependency
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 Avi Fishman <avifishman70@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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
X-List-Received-Date: Tue, 13 Mar 2018 16:23:23 -0000

On Tue, Mar 13, 2018 at 2:35 PM, Tomer Maimon <tmaimon77@gmail.com> wrote:
> Hi Arnd,
>
> I sent now Full patch for the NPCM BMC's V12,
>
> Is it O.K.? or do you want me to send the same patch to ARM: npcm:
> drop extraneous 'select' statements as well?

The patch series you just sent contains a new version of the patches
I already applied. What I need instead is a patch series that
does the changes on top, since I don't rebase the my next/* branches.

      Arnd
