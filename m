Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::744; helo=mail-qk1-x744.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="P506Kk7z"; 
 dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ZY5f5PGnzDqKK
 for <openbmc@lists.ozlabs.org>; Thu,  4 Apr 2019 17:32:22 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id y5so945646qkc.11
 for <openbmc@lists.ozlabs.org>; Wed, 03 Apr 2019 23:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4B5lU86aRateq0ShL87vJxEFe/oY+uu4krkVlyVbH1Y=;
 b=P506Kk7zZB0oyYjcqz/SxFi2auKFkzmu+DG/QRgCkWCchCc2Jbqq5i2mJj1oXCl5VV
 ytTVOYsO8hwP0J/ddhJkkd0JMDXAHD5Le1Ow/68Hwsm87Qu+96rR/m5Z6DU90dQCfSRR
 HcJLiWyFsOcjoRztwj7/J8DNUz68M4TWm+iWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4B5lU86aRateq0ShL87vJxEFe/oY+uu4krkVlyVbH1Y=;
 b=jUR5NUPbpHYBmC5KbgfKN9c/XQCoCaW6SfEtwXGZX2Y2iFYyFjUxjJcnPveapgkyaW
 YuV+BesphWdjSytZ6TQptu/ntIDpjDAKso5CyHxHnOiPJeHZH178bnjvXI+pY0//aoWL
 uBblboISBLURkHsPxtQAgb1iFSYURX6szjt5gCRV8gVnO7TRw7JpaWAUGcW1yNEMdir4
 ERLNm9Ti7bOc2ucx9W5eBtogoowqdbyyaauIpeWTALyGxdB4XD7SG4bQmbk3hjwqTlDh
 pcj37D42Iw7FjUw4trjnvlRW+7mFF/zJwbT83ttFHmoguN5v44+e+/XC+Ia7oCIytOsV
 8E0g==
X-Gm-Message-State: APjAAAU6eep/eouM5QZ+O0fEgxTzh4k1fUznOLzlyeegnst6qqYuD4O3
 oEVQbfks7RS5obvpr1xHnOfq3DYv5aJhUl3p6AU=
X-Google-Smtp-Source: APXvYqwYHonIkS1K0a2TK/XJo+T2En+DcBH49NY3C9qJxlGyi7ADlT6nIQ1A/6W+xSD6QnmkbIz1XNWTzi5omYEPfWE=
X-Received: by 2002:a37:9fc6:: with SMTP id i189mr3766731qke.246.1554359540556; 
 Wed, 03 Apr 2019 23:32:20 -0700 (PDT)
MIME-Version: 1.0
References: <e78f778a53ac5a2bf13d463e12de0d6fd08f4138.1553018953.git.dthompson@mellanox.com>
 <88b92943-0fe7-467e-ba61-17dff19018d9@www.fastmail.com>
 <AM0PR0502MB3858CB6B38FF885D0CDEE245DD570@AM0PR0502MB3858.eurprd05.prod.outlook.com>
In-Reply-To: <AM0PR0502MB3858CB6B38FF885D0CDEE245DD570@AM0PR0502MB3858.eurprd05.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 4 Apr 2019 06:32:08 +0000
Message-ID: <CACPK8XcGE9_sn+2LDp0xrrrtcK-7vQr9ebGv_g6c1ppUwQqzxg@mail.gmail.com>
Subject: Re: [Patch U-Boot v2] aspeed/ast-scu.c: add ast_get_m_pll_clk() for
 AST_SOC_G5
To: David Thompson <dthompson@mellanox.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Andrew Jeffery <andrew@aj.id.au>
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
X-List-Received-Date: Thu, 04 Apr 2019 06:32:23 -0000

Hi David,

On Wed, 3 Apr 2019 at 22:35, David Thompson <dthompson@mellanox.com> wrote:
>
> Hello Andrew and Joel,
>
> I'm just following up on this patch.  What are the next steps?

I have applied the patch to our tree.

In the future, ensure the subject is generated with git format-patch
with the targetted branch in the subject:

git format-patch --subject-prefix="PATCH u-boot
v2016.07-aspeed-openbmc" -v 2 --to=openbmc@lists.ozlabs.org -1

Cheers,

Joel
