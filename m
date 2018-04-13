Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::233; helo=mail-vk0-x233.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="KwbJ/Vjn"; 
 dkim-atps=neutral
Received: from mail-vk0-x233.google.com (mail-vk0-x233.google.com
 [IPv6:2607:f8b0:400c:c05::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40N7SZ17GQzF1gW
 for <openbmc@lists.ozlabs.org>; Sat, 14 Apr 2018 05:41:33 +1000 (AEST)
Received: by mail-vk0-x233.google.com with SMTP id q198so6053594vke.3
 for <openbmc@lists.ozlabs.org>; Fri, 13 Apr 2018 12:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=iaXffHM9cVMi/1r73dwZ48Q+qHxI1umD7E7FmElb7lo=;
 b=KwbJ/Vjn2uFR5ReSJrsGmDp49mzFLjU73f9lat5QIs+MoQ2OCXuO5HhsbhwK5FQS+T
 ehlQf9kAoygVBtUNRIk0CcszhVSV+fq6i2vWupw3QWTqvAOqIuoybo1OMGSv7Sp322D5
 ggO1ozJAKrnhbL9rvpWqJvcXJePR3FTDlmKCbbTVfojbRNwmNFnXY4m7E5lwde5VX52m
 WO8HYjLgoGkdHgXSpCasPT4LXoGvy11DYRzE8yVBfYrTfagW4Oa7Dc8vWkCZm6EZjm6Y
 lXnsh9kd8L1IXuLtBY8dzXrP8n+6Wo5TEGyCY+/b0VDaZ+ZthKDKyLSX6C2WGvPJN9oy
 061w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=iaXffHM9cVMi/1r73dwZ48Q+qHxI1umD7E7FmElb7lo=;
 b=kcEpexrPthjtGhp+aiXRDB+Z+RSjejVhs1j8wDXn8W4+oICq+UIraYQW/ZGtZ+Wp6h
 i6+Je+S/Gb17r5Jyb6YXJVEdtGJam42JGDyqUDnXlEldyMoXkD1dYz87l4DdqMO3k9vc
 SkBAxOWIJAlekN1fIjorWHi38N4TGiyR4JKT0+MjT+EZB17vXZbqGAyQYUs+4Wpgxa1y
 y15wkRkeKkLi3zJsZG/mzYV8vbWPvUW+hZmPzIy6wcxZxR88/wX/b5yp5t7ha+M6IbNC
 m0xwLYqWt2k+uXM/JFq7Sk05OsMwd954kaqOohcMK8Hv72sFbzd+pJ6lw+B++BGVLxPz
 LgvQ==
X-Gm-Message-State: ALQs6tDqA7Z3ACj0Z7J35G+sH413HByKvRVtSEzQ1HdKgDu4Cok4ax+z
 rS2B97KtKfaPVHJKF/6J1+Ga70ehwBCs5cKIP0JrMGWM
X-Google-Smtp-Source: AIpwx4+qNoz+FLy514brAZBihaGyOp7YFpdByy54Prop2mCaQP3QzZfplyZPm2woZ7DSd1kMRAN2Tzl88t5tNCFAJRc=
X-Received: by 10.31.125.134 with SMTP id y128mr4715775vkc.109.1523648490545; 
 Fri, 13 Apr 2018 12:41:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.124.193 with HTTP; Fri, 13 Apr 2018 12:41:10 -0700 (PDT)
From: Patrick Venture <venture@google.com>
Date: Fri, 13 Apr 2018 12:41:10 -0700
Message-ID: <CAO=notyO-hhCvPY9t5Pa-FWPORkD8XWupPwhxMir+ZCEg6hLcQ@mail.gmail.com>
Subject: maintaining the quanta-q71l
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, Nancy Yuen <yuenn@google.com>
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
X-List-Received-Date: Fri, 13 Apr 2018 19:41:34 -0000

Hi OpenBMC,

Long-term I'm not able to support the quanta-q71l machine.  I have
some patches that'll make it build again, but beyond that I don't have
the cycles to keep it up-to-date as is really required for it to
continue to exist in the meta-openbmc-machines layer.

Are there any volunteers who are using the platform and have the time?

Patrick
