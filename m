Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::82a; helo=mail-qt1-x82a.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="C6gdKJwf"; 
 dkim-atps=neutral
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44N47b3Y6qzDqDs
 for <openbmc@lists.ozlabs.org>; Mon, 18 Mar 2019 16:12:41 +1100 (AEDT)
Received: by mail-qt1-x82a.google.com with SMTP id w30so11229657qta.8
 for <openbmc@lists.ozlabs.org>; Sun, 17 Mar 2019 22:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=RheMa/iBJgbQMMsrFtl7MAGKgfTXqh9ghC/+hvEhZ9E=;
 b=C6gdKJwfXlL5VKLyG+zaTtxWVnz7bfsVVoIHHMwh7ErGHWrNXNfMC+iqocBVXCag5o
 R/EC5UiOaWxAhV+uh7pCyzhsedEfJsv5rcZlUyjm+Wr5fUAgtr+CGF3KovW47KC8p5hb
 Su45btsENUbtbzPg/2ghWdblTXuDdCHhlbdmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=RheMa/iBJgbQMMsrFtl7MAGKgfTXqh9ghC/+hvEhZ9E=;
 b=mywmztJwaGs5KQJxISOmrNrNPwiX3p0t1nzt2yAmisew8stKE+JypnBNAG/42HTioN
 ytYOUnI3jwTASecquH7r9s5DUMzkbOJ3TOYmI+R4+uI8EjnWGiQI/HRzCMhk3+pGbWHX
 xELZ7yqTY6owbSnHmNt3BlSNx1RftIyQ4BXKKuQivqxwEF5JLW/CHWWIU/F339lRrDx2
 F0IbOOpVk0OWRJU7fTbJG6aWFOnZtVUJy3N2M+70B4WVb6MCIY7lNdudGplvwkCGqK8X
 62uQBuLrVdrgCh53kE5Hl6IIuC2RPFvZbQ9Bn8ACSB/mAUcSA+yJBzY8H2hBCFs4TYyq
 XlkA==
X-Gm-Message-State: APjAAAXmBaK7rM8aWKl8A3X3PfVuqW4j2WHijWdlFKSNp0n78Gb9cn2I
 T4cG4NJiWLhXTTfdML6XiqVxY7bJLvjcydbl688=
X-Google-Smtp-Source: APXvYqzeiRzOssCTgOu/AOmfq41IauLpv/arz/Kz5m9B0vjscEvjh7tNOeyRf1g2yWW4NB7GlVMmtLx0D/9NHZzPHKw=
X-Received: by 2002:aed:32e3:: with SMTP id z90mr6623124qtd.266.1552885957737; 
 Sun, 17 Mar 2019 22:12:37 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 18 Mar 2019 05:12:26 +0000
Message-ID: <CACPK8Xcb0XUt7aJU0vHrvKUv5HtjLSEnHcfqggtDJzMFxfXMmQ@mail.gmail.com>
Subject: Legacy OCC numbering
To: Eddie James <eajames@linux.ibm.com>,
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
X-List-Received-Date: Mon, 18 Mar 2019 05:12:45 -0000

Hi Eddie,

I'm cleaning up the FSI device tree snippets that Ben wrote. There's a comment:

  /* Legacy OCC numbering (to get rid of when userspace is fixed) */
  &fsi_occ0 {
          reg = <1>;
  };

Do you know if these changes have been made to userspace?

Cheers,

Joel
