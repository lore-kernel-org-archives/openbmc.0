Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dsgPNLnQ"; 
 dkim-atps=neutral
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44JJ7K3Xd3zDqDP
 for <openbmc@lists.ozlabs.org>; Tue, 12 Mar 2019 12:59:25 +1100 (AEDT)
Received: by mail-io1-xd32.google.com with SMTP id c4so662329ioh.9
 for <openbmc@lists.ozlabs.org>; Mon, 11 Mar 2019 18:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vpObQVWK1fLii0fy1TOCd1pBGaUIy+VrPy7qgdSYwPQ=;
 b=dsgPNLnQz/a5UgXCXVfNHyTuIIWnk/u07Fo0HdI6l9kDw8plSwKphARytTKlnKk7YZ
 B8YQqmixHOp+ILTFlvqPT0/riZetNhbtGTqaIH31Zsk7xy1orB0/HO/VSmSw3zI+5lpT
 0UE8pv+WhqKzm5n+f8/t8yvj+4pLZ9T96ZlpH7egVgMgO/YnaCxYHbnHL8qV8PYnzFAB
 7TYQcZCYoZPGz1+AnUuv0uzk/OhRrtmElOMy7nOqBIcat6x9va0xZrFLXs1/IhGaXLQP
 /L5/ABVspM6ANB86x0gXH7NuN0nd95kaqZnK0VXX4B5kiLOEbqQFts7Nnb2Fk7Lq/9Vv
 VQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vpObQVWK1fLii0fy1TOCd1pBGaUIy+VrPy7qgdSYwPQ=;
 b=Db9/7aK20Yzl9CxMJpL4Aup4fuZsD0l904lH6jfFW0t/AYVtt+GmS6OT8/ITRH80y7
 VcrJBW7hlVVAJoBbnDvszQp6F6pJ7x4OTN7inDjKh0S5iLu81bwdzoXde7P4Ey70Nh9Z
 fKzmQJzvAthj1hN2tGuuZJhZPbc5HUd6XfAHhgfdU9sPLyoPwzZTNZgcSJAzENNNjsRH
 WTnO06L+QFpOliHb6JJrIln+B2Z9iPZLYdMLD/FnHYab37/4BHC4fXXy/Ir1SHEt7Y5N
 weoa9AgolRVxlJcoF+Z7tbkhApcDoOkyDRH26iTOybmM1gRja5sC10xsTahNtiICAKmc
 d3Hg==
X-Gm-Message-State: APjAAAXQuXGRgtVr16zKwHR5zEPalJWjfYXwDNeJIy2zBO3Dufdj6l2g
 gRbAFSaCHf34oTOvqAYRC3C3F6rqnLpyMMp4maxUSdtAcKo=
X-Google-Smtp-Source: APXvYqz8tcyb7JNgHw4z8jDWE53Hp+EfCNHy1k1WkOuQ1fRqANjI4D10gRlT+CKPDmKx+dafNqnVbZ6j/ENpelFdAuM=
X-Received: by 2002:a6b:ef12:: with SMTP id k18mr11611620ioh.171.1552355961755; 
 Mon, 11 Mar 2019 18:59:21 -0700 (PDT)
MIME-Version: 1.0
References: <CALLMt=rz5Mvohzhavhm+D3Q8g=EZGVyubi+rsMZ3CFV_PHUfPg@mail.gmail.com>
In-Reply-To: <CALLMt=rz5Mvohzhavhm+D3Q8g=EZGVyubi+rsMZ3CFV_PHUfPg@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 12 Mar 2019 09:59:08 +0800
Message-ID: <CAARXrtmFGBc1dLHSuFY71E=J2RwepmG0Ko=qFTBHT5W0Gv23sQ@mail.gmail.com>
Subject: Re: New Gerrit Upgrade Coming - 2.16.6
To: Andrew Geissler <geissonator@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 12 Mar 2019 01:59:26 -0000

> Gerrit 2.16 has moved to the new polygerrit based view by default. It
> has some neat new features, although does take a little time to get used
> to.

It looks modern, and has better notification, that when I login to the new
gerrit, it gives me below message.

   You have draft comments on closed changes. (view all)

It helps me to find that I have some comments drafted, but forgot to send.
This is really good!
