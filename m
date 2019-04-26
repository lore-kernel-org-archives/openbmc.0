Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="cfTwCSuG"; 
 dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rHM30tjFzDqVD
 for <openbmc@lists.ozlabs.org>; Sat, 27 Apr 2019 01:01:34 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id o7so1690125pll.13
 for <openbmc@lists.ozlabs.org>; Fri, 26 Apr 2019 08:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=lVeNDiZJkMZVaiB7Kym0HgCUJQ+k/xT3Z0krP0QpZDA=;
 b=cfTwCSuGWprQJg9BgKpB1pbuRt3nr/hA0SEqh2dN6zf5Fa/d0pPzk3y4o1CpI8CTiB
 aHCF5jAq3amLucsEDNIdz+tYohJbb61yPkooQiCukUGfh7av7oLp867qwXTg/JON8l26
 zoARPgn9gBn1innHxxF9ZRGlZxupXXHpb52d6tlm/HnHIsHVDGDHZJ/4Tw+aDYbn7kxs
 Q9IAokGf3n38YFJSN2jGb/1LRetoZTgMqLKeM6VsHOGZpIlmB0fvzSoHXkKJRc0EuYyR
 1oc7hZ71HXcqJ5HwxS8kgfGf3kGHphYeF4eDbr6F+Rr9zX/gFfimetsGFOqdhjAsRGUv
 KlhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=lVeNDiZJkMZVaiB7Kym0HgCUJQ+k/xT3Z0krP0QpZDA=;
 b=PAOn/t1+0tkaW4p2NAegIGgMEPmqVz866LgZhCxxxD+Zk6yBub3xfOCDEUT6BDN4Cg
 G6qzqTgau9xaFs22qC/XuQFLsAB/v/TjIWYyGMuPn862mIuLt+s9lTK2+vgl2kH1JrJt
 GcQf+gY8wfJ1TrM1gU6EZojRk91sJYIXuERm+fkYNM2f9wgm97yUSZV1znkCgqArwCrn
 r1mXd2WZV7uUOjxfL402hS37HBTjQ4BuKwXzvO2Lx026uVMTMNgalWjonP0vkUu5UMjT
 iolXxCS7tr/006xgRsJ20zTHa2LIUaan5aMQ8ns1GkuKhOI1u1VK1uXL0qeYGvys01TM
 YDfg==
X-Gm-Message-State: APjAAAWMel9ViBWUyMVqUPmxKAJZSx80idyWQ7lWnrLptFatIYEcRt0/
 cNKL6OIcgFGVwxhiA3rRz7SGTt6ztP0FaJMFGtECgD9ZQKc=
X-Google-Smtp-Source: APXvYqzzHg0Lc2L02mVrbEz89xjuhRSbk0b6HanMeNYic1wi2nEY2uoiPT7X6dTzHVMT4/ppAO2P/RdJqxjDAdGvtT8=
X-Received: by 2002:a17:902:864b:: with SMTP id
 y11mr43808747plt.1.1556290890466; 
 Fri, 26 Apr 2019 08:01:30 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Fri, 26 Apr 2019 08:01:19 -0700
Message-ID: <CAO=notxyVAx=LY+5tCUWaezZP67JKy7z3NT3SAUcKR64W8Pk_w@mail.gmail.com>
Subject: linux kernel compiler warnings ignored
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
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
X-List-Received-Date: Fri, 26 Apr 2019 15:01:36 -0000

I'm getting feedback from a patchset I sent upstream that there are
compiler warnings.  Which surprised me because my OpenBMC builds with
those patches don't complain.  I imagine therefore we have them
silenced and was curious where we silence them.

Patrick
