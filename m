Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::92a; helo=mail-ua1-x92a.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RCf8P6bW"; 
 dkim-atps=neutral
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com
 [IPv6:2607:f8b0:4864:20::92a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44dKgh2vSGzDqKN
 for <openbmc@lists.ozlabs.org>; Tue,  9 Apr 2019 05:07:59 +1000 (AEST)
Received: by mail-ua1-x92a.google.com with SMTP id d5so4693986uan.6
 for <openbmc@lists.ozlabs.org>; Mon, 08 Apr 2019 12:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=AqMAi4qdscTiZx0jk339CMiF7iFlydWixDs1ZBm3bHY=;
 b=RCf8P6bWDCWLmyCJwk9kV7utb7bVNAEdlzsHZ0tSIckJ1lwJurQxiZga6QnuF64JUE
 oKgtiM1g0PfSG4FhOqz2pvVaYl3tBQShkAFH6gfMji22sOlljO2thPyYt8ljuh3Reyqw
 5Es/WV09I8rqFfm1fKDt63PTMmxuYBk1+AwWhuLv5eCM+mHjvp/V1awC76LgzINe0COy
 R8KXzL1Q3wOn3TslUoRgJYTSA63sTuGinDl1gZNfLZ25RdP2hk6LZiRUXmHScj9Qh6Oc
 GE+UZubhfZV4lxRVDYo65JBAKaNXXRDAXWv0jRI9isritmZaLnIibzmGm+7mJDbWRcKW
 SdDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=AqMAi4qdscTiZx0jk339CMiF7iFlydWixDs1ZBm3bHY=;
 b=XK0zLB+KqnrIDVhpf66vh8Hyv5HIgbRXx8YdxxsDtZG9IMwdfK+H2u59MV90zM4Xzx
 Kos05CZgAy8cfMjIRodIG7RvIENtjFp6X32YLF+kMgkq9id29UyRLeMSYqncwPPCaPp4
 2XrrYKfgbdBhM4WVSMGfOytOQXZVKQW1m0seXO/hA24/40Lorgp3R6yssoh0uQH7YnjT
 j70vrgx+QvvpJaOE2NKksldRe8vr5Ru3ghldzqEpT6GBNOvMC/QoZwMXLIp/md1oMkYx
 ky/fvRG94hiQK5O0HEttn86M3y2OKG8VTSEHDlduE7TMnVkYPcrRoboyGRRUrrhthlWY
 +Elw==
X-Gm-Message-State: APjAAAUd2uGfe74OZGfTa0PfF7pwvPzg2AjHcq925lpX0uUrSddPnorL
 WvKc0swRP59NQ3oHwtpXdDiB4WYUw67yw8jvkmtqfw==
X-Google-Smtp-Source: APXvYqwUlNAvfbFK7bHp4T4jmrgyYcXjj+blC3EmXsIFP6c3LaB+i0Ugc8rMdeGbfx/mY4KJ5aUTfrkA6nRcmbWLGp0=
X-Received: by 2002:ab0:72c2:: with SMTP id g2mr16753024uap.112.1554750475915; 
 Mon, 08 Apr 2019 12:07:55 -0700 (PDT)
MIME-Version: 1.0
From: Kurt Taylor <kurt.r.taylor@gmail.com>
Date: Mon, 8 Apr 2019 14:07:44 -0500
Message-ID: <CAG5Oiwi4iEc3nv3S5eJL-WYP2NrMA1oYe5nA2XrU5LRWi88s-Q@mail.gmail.com>
Subject: OpenBMC website updates coming soon
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
X-List-Received-Date: Mon, 08 Apr 2019 19:08:01 -0000

I now have access to our openbmc.org wordpress account and have
already updated the broken link there. I plan on adding links to our
community project info. I'll also be adding news there about upcoming
events, releases and so on.

Let me know if you have anything that you would like to announce there
and I'll get it done.

Kurt Taylor (krtaylor)
