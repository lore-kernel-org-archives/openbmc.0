Return-Path: <wak@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com;
 envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ZdoYNFnV"; 
 dkim-atps=neutral
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42YsR13qv2zF3LW
 for <openbmc@lists.ozlabs.org>; Tue, 16 Oct 2018 08:44:29 +1100 (AEDT)
Received: by mail-lf1-x134.google.com with SMTP id s10-v6so15232463lfc.9
 for <openbmc@lists.ozlabs.org>; Mon, 15 Oct 2018 14:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=DkAfSlHw2ypNcFa9W+9DzGcq8Rz6pLJMNL8h/BzTppQ=;
 b=ZdoYNFnVWGjjCYELYBXbRbzI86lDBuxszb/Bu0md0WaXOkGlZU4+z3KRyxwshhGbmO
 1EzwWX5ylzCar1lE9LGleArEaPMEy/OLQRSTrf3uT81o1VQf6738ZCt85yf1VLB+3tVa
 OhGOLcAniXxWOhYlueOQY6H8Og4fwkeiXQUrf2kmViqjcRznW+fqZVyn2h6ngw02/Dq+
 RSE4CHC8ZSbUduWNJTq+CBAjvpWMEj37PWw/suDQEl+b6MZYMuNhtT9bxHtSNZpQUkyf
 AH5WB3RimGpE4CEVf6z+Km8liWhM/O9Q/3yzZgau4/tWsiiDfrZuvdKH5vH4pGCZBzyr
 YX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=DkAfSlHw2ypNcFa9W+9DzGcq8Rz6pLJMNL8h/BzTppQ=;
 b=AkD3lZ1B1FrtB6hEblUJKNUrOxa1DIb1rZB42++JuCwB1rgajrJzroDeyfXTPwDQ+y
 KmPoJ7jrRvIbJhZTqB8CTegC3alWEmyLFzm4byE4QHzoKUGj0ufP9rjjwwbtdFnog7S+
 d3h93epdW6MIw2cS9spN2Sn93NnNgIqyjojT4Ajlx8P6ESgRv7vnJ4wQpkCMhsjDKjqb
 Z6QvBhf3VO1RMGS0YjinrRH2B+XVADAj1hZUK6SYFzPgmrI/8mYl1ISQLglFy1+y1zOk
 n3h8J5HOv0UgAPSlRYuvQl3K02D29S9yU4X2DVnuEDrm8mM8owacuaNC9gzDJVqy9XQ4
 rUYQ==
X-Gm-Message-State: ABuFfojHrVd0Lfe40EXoAY8t33xkesm0PTzZ32KU25Eg53zoYd94Kajy
 VAd0mwLpF8jjk4z3ojx2WYKhyZUzK5GMUcLLol1hxmi14WlJnw==
X-Google-Smtp-Source: ACcGV619ykOCv7Ujmlhie45X7yX8D2xljnL5mymb4fMnX2bGXPf+G8puVidAAw0nQ83Fz7zrt9OexztxZRaPUEHfbQM=
X-Received: by 2002:a19:c650:: with SMTP id
 w77-v6mr11678940lff.108.1539639865020; 
 Mon, 15 Oct 2018 14:44:25 -0700 (PDT)
MIME-Version: 1.0
From: William Kennington <wak@google.com>
Date: Mon, 15 Oct 2018 14:44:13 -0700
Message-ID: <CAPnigKmeLGgam=qk8Cq4mgnGC2re=Ci6xzJcpA20u15vnR4+MA@mail.gmail.com>
Subject: New repo request "stdplus"
To: openbmc@lists.ozlabs.org
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
X-List-Received-Date: Mon, 15 Oct 2018 21:44:30 -0000

I'd like to request a new repo be created where we can put universally
used c++ functions and classes that any of our projects could inherit
from. This would not be allowed to have any runtime dependencies
outside of the typical built-in ones (libstdc++, libc, and the kernel
syscall interface).

Right now I've got a smart file descriptor and signal blocking
function which I'd like to include. It would look something like
(although I actually want to break this down into a uniquefd and
dupablefd for the purposes of stdplus):
https://github.com/openbmc/gpioplus/blob/1d97c45aa75957e9e8965e33f1f28985cf88d22d/src/gpioplus/internal/fd.hpp

Let me know what you think,
William
