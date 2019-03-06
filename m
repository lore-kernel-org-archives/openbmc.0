Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cbiLxmll"; 
 dkim-atps=neutral
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44F0yb0g45zDq6q
 for <openbmc@lists.ozlabs.org>; Thu,  7 Mar 2019 04:25:26 +1100 (AEDT)
Received: by mail-ot1-x32c.google.com with SMTP id m1so11460472otf.5
 for <openbmc@lists.ozlabs.org>; Wed, 06 Mar 2019 09:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=BLv37nVsvEGxVSJf2w6r6gCLcQ6sjFF7uYQ6nqteVHE=;
 b=cbiLxmllZIz40bj3/5xuEDc4uoCXTYNLNq5q2ZSYPlReRborJa7Co9GtM8iKLYNqKw
 p8QccopBLcwGfzd5gmXSX5hOjpG+38JEWfG/k131Iz+oS48iqaJ1PMrcwUm7tdDk+Jcs
 B6kv4W/4vqv84z0Xku2VQEOrpcjiiZNml6qJ777ZuPAkxgDqmhiuZgVKDKlncelJZ2pi
 TXW2zI7TkulND5uDUmtEcX/ckytbNy5l9rGYQ9kGeJZQNetreh9Ug8lYUojwvAkGUx5L
 vP2lWNh0UzqpInXolNAZpPOi+xkycTsNdcZDQP3r3XIG433zzo0KXX0m9KBgx8qN9KkE
 gb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=BLv37nVsvEGxVSJf2w6r6gCLcQ6sjFF7uYQ6nqteVHE=;
 b=Q2uAu8rhkA3XroM9ifHi1alIv9jWht+7dTJ8xBqhoQ/9RMsGJLLy0etOJ3qmqbDS8a
 9u/jf7ArlyzobW4B8ZEZlHx+lgDUzxwIOBxMD/yPXhfC+x37/Le99whkuR2f9uyKH9sq
 7kBhoCQBZm0AkyyBZ9n2vlBkhneRHCTtCALeOmr0lXgjO/7bUcGTS1Q4XrMdlcKNfAKN
 zWKEZqFf0TKk7msyoeAP3PWRHkRg50msVjZ5BQbZNb7klv+y2yW9hNf5J0+VrOalWdWb
 fSAaC8sJMkfqJykfqcUO2LmAFMdimjC6i5XqNKV2zdDyotgjTJT0aI0MnttcoDczq2kb
 U3LA==
X-Gm-Message-State: APjAAAW+eMhoxX+r11/EqzvRT2YWQght/ybL7EQsfcbRVj2qgvE4oeP6
 6I8XyDNOTVsUNvVD4E+ZEvKXa5WLcTUqs9SruC5r3T2r
X-Google-Smtp-Source: APXvYqzfY16tSFWyGdxQS3nUUKm740auqXHUPi5A44XnwohYFNou5dVDtylRdDoCCVycn/f7tMs0sKEGweILeOpfA5o=
X-Received: by 2002:a05:6830:16d3:: with SMTP id
 l19mr5169573otr.123.1551893122627; 
 Wed, 06 Mar 2019 09:25:22 -0800 (PST)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 6 Mar 2019 11:25:06 -0600
Message-ID: <CALLMt=rieRX4EHHLceZxXciRbvW+CG-YS-Kud5H5XDi_vJNXLg@mail.gmail.com>
Subject: Infrastructure Workgroup Today - 3:00pm CT
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
X-List-Received-Date: Wed, 06 Mar 2019 17:25:28 -0000

Among other things, we'll be discussing upgrades to the gerrit server
and whether we go to the latest 2.15.X or move up to 2.16

https://github.com/openbmc/openbmc/wiki/OpenBMC-Infrastructure-Workgroup

Andrew
