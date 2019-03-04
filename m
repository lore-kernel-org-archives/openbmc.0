Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="l9JFv1Ek"; 
 dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Cp610LRSzDqHP
 for <openbmc@lists.ozlabs.org>; Tue,  5 Mar 2019 05:12:40 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id n22so3590140pfa.3
 for <openbmc@lists.ozlabs.org>; Mon, 04 Mar 2019 10:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=FTJ+Bqsen9efTkONVu20yvQ62FZ0wc2MMN3Hq1VtEec=;
 b=l9JFv1Ek+8Ytwy1+ImBELAy0iNnm2pCCzCRDwn4Pp0uleHdPB+UGnJtPb9q7Y3+0if
 mNlfGb4KOpD8N1XnOfC4/h+XHleiW0TB9o2tM8db0HWAIba30zwSoNVD9FF0LQ4wgMuw
 gWG2GW+J7WlTb4FxNng3/iyB9+VBUXxJH2v83GjdxV/07TZ8eS16Fp9KwdSOXmATU9WV
 4PLumkcRSkV7vZl4gnQHm4W7Beak+kExmpbYdDhjTjIs8hCVqo+oiZkgMYmMEXFQfoXV
 7lxy47zhg+TRG6VEMWeZmj16GDIdHE7idtW3XSmVVkp4P12oOZjDuLp27W+YDz08fYZp
 wQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=FTJ+Bqsen9efTkONVu20yvQ62FZ0wc2MMN3Hq1VtEec=;
 b=V4BZwrRO9fe+EKdkfYB5DX4suoiaO8NaZ4BAgc8EsgudAaln/TRhgyIHxKj4x0BM6X
 xlX97ek/DMoj7S4DQLa45GGN1lLhh6dU/8kocaEQLqX/kWXj/c15wPrF+vfSvjgGriQs
 i9JmgPp8EdWpEGItovwGVhgYBgFf+msrxihW5Gm68haxZ1Mgpk6B0SdUIgg+1EuXoHAg
 NH5KIj9TcGpSACU/1Khi4YS66fR+5+D4YpQj63VBI7W0L2tAFYqzPeaLIqRBz9QXaXRC
 RwJgzCIRrYKjkv2cdcjY/V4+2Xp6LYBQtvYZtp54wJ/DR7ogn3pfWrfOzDT4Ix1jkyaP
 JCzw==
X-Gm-Message-State: AHQUAuZu/bTmP8IcH/GGM6OV/F/xQzAPJsE3aR7wNyQmt45ExS/T5z5d
 iT9ohIljuBQVBmcEh2IuaLPlbnBWV0lv6plW2QuodfYAbJU=
X-Google-Smtp-Source: AHgI3IZplMYIfgLZhTxuYGff8LynJZJZRDs+uOCKM4JE/cgvaoiUi/lRbfCkJzlhVL4IiaoNma/J9Zq0RDCxeszAvNg=
X-Received: by 2002:a62:8384:: with SMTP id
 h126mr20925568pfe.243.1551723157092; 
 Mon, 04 Mar 2019 10:12:37 -0800 (PST)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Mon, 4 Mar 2019 10:12:24 -0800
Message-ID: <CAO=notzgE0XdR_paQsbzbS7jfoshdT=pti3kMZ0wObb7q6hU0g@mail.gmail.com>
Subject: new repo request
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Kun Yi <kunyi731@gmail.com>, 
 Natarajan Gurumoorthy <natg@google.com>,
 Benjamin Fair <benjaminfair@google.com>
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
X-List-Received-Date: Mon, 04 Mar 2019 18:12:41 -0000

Brad,

Please create a repo: ipmi-blob-tool (or) phosphor-blob-tool (at your
discretion).

I'm going to write up the blob tool as a library and then a small
utility, and then use that in phosphor-ipmi-flash so that we can have
other blob tools more easily.  There are a few other use-cases we've
run into, and the core blob code for the tool currently lives in
phosphor-ipmi-flash, which is sub-ideal.

Patrick
