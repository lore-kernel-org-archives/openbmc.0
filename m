Return-Path: <mine260309@gmail.com>
Received: from mail-qk0-x235.google.com (mail-qk0-x235.google.com
 [IPv6:2607:f8b0:400d:c09::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vWxKP2DCPzDqC0
 for <openbmc@lists.ozlabs.org>; Mon, 27 Feb 2017 20:31:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="V76OxN/Y"; 
 dkim-atps=neutral
Received: by mail-qk0-x235.google.com with SMTP id n127so88252288qkf.0
 for <openbmc@lists.ozlabs.org>; Mon, 27 Feb 2017 01:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=z6F85ZCWXstiFnraPSDJgcsFKw0R/K+8/6JUpFpkgUQ=;
 b=V76OxN/YmQ9EfewuXnsuct3dOyvWgsmPIAps3cc/4Ry7Qq6p+B0O47fS2paROmOZeU
 HWqqEvxDPjgevD3mgUYd4/YEoJhKf2C1q2WDqZLD/a1vmtyBRD019mNZGkcIGLP0uB9I
 Fuh7EAfIINs/DTHRtOm0T9zEzb9TdnILUREvv1YuACKImaPjTLpsc5GbSASVjCeELZuN
 eQpUJbJjDCnwbbYCuXWtblFwl1k/bOKKI0MAvFRynh2dZNDV6xXUnHhL+D4HSO+tronl
 6H5aAhha84pBPcDdzalTfwJP0XHQabkt1rA24d0yzTF7cTG8osumLkXiCqBTcEVWk8X+
 +1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=z6F85ZCWXstiFnraPSDJgcsFKw0R/K+8/6JUpFpkgUQ=;
 b=iy0pWWF9pGTGryPdHBW7PJw854Do788aqUvkgTy999M8FWLi0pLBYO8wl476RqQnyr
 9bSEg+34j3xhJaTDMwyhXysYFIutovfoavmkgpeEO7ZeTucl/0EDtYrs5WKKn9riTxfc
 jCXJtwCWxEKBgKgSOLzD7LLRg4u848NXcpcH16ydf65bee8DG0/4iyvNzNX5GrA0NCXP
 Lg6qKvYL4zhhDxMp9TjruQBIznmu5WZQw1PSE+JCw+Vi8Do3kvY9BTmPm1kIqEF0hwSX
 9JD+UeMkN8islWp5JI346iNXOeWqTiBkd7CdAPfzXgK/pL5CkzpPLhxbhPQwCqiPRZHz
 47ag==
X-Gm-Message-State: AMke39nRNlodqJ30VsJPpctu2NXEZUIabS6O1t+g+FNIo4bQ8cZSv63INEZdYz6nIsH3Gr3A62sIZ+LFS7uFTw==
X-Received: by 10.55.180.5 with SMTP id d5mr14132133qkf.266.1488187862534;
 Mon, 27 Feb 2017 01:31:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.137.9 with HTTP; Mon, 27 Feb 2017 01:31:02 -0800 (PST)
From: Lei YU <mine260309@gmail.com>
Date: Mon, 27 Feb 2017 17:31:02 +0800
Message-ID: <CAARXrtm8E4z0zBjVhLTExfei+6grmZ2e39nx5=F6BAk0FZUUaQ@mail.gmail.com>
Subject: RFC: Propose to make a common utils repo for OpenBMC (or phosphor-xxx)
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
X-List-Received-Date: Mon, 27 Feb 2017 09:31:06 -0000

Hi All,

This email is to propose to make a new separated repo of common code for
OpenBMC, or at least for phohphor-xxx repos.

During the code review, we can see several duplicated code in different repos.
E.g.
1. Both phosphor-watchdog and phosphor-host-ipmid uses timer related functions.
   They both have similar code using `sd_event_source_set_enabled()` and
   `sd_event_source_set_time()`
2. phosphor-time-mamanger, phosphor-watchdog, and phosphor-host-ipmid all have
   similar code to retrieve the current system time.
3. I believe there are similar code in many repos about operations on
   `std::string`, e.g. find sub string, convert from/to other types, etc.

Is it a good idea to have a repo that collecting the common code and make it a
library for other repos to use?
E.g. if we have `phosphor-common-utils` and built in SDK, we can provide a
consistent interfaces of util functions that will make other apps' code more
clean and less errors.

Feedback are welcome!
Thanks!

--
BRs,
Lei YU
