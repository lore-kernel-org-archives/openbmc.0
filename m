Return-Path: <wak@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="cQuYkegX"; 
 dkim-atps=neutral
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41qgN8650TzF15Q
 for <openbmc@lists.ozlabs.org>; Wed, 15 Aug 2018 03:59:30 +1000 (AEST)
Received: by mail-lj1-x22c.google.com with SMTP id w16-v6so16065613ljh.12
 for <openbmc@lists.ozlabs.org>; Tue, 14 Aug 2018 10:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Q0aEBM5LBDm+uvBrkq2T4dd/J6bym1U86HCZ9KlnsCw=;
 b=cQuYkegXjtsEJDh4F1MxtTAML2N1bsYEiB7h7HjW6cGDVsRoVvxL7Rr+u6FERJUu0W
 TokXimC9jbMCydPjZHQagZ2WcCnw53E4guTPfb7AIQKBvgmb2n3H4YcpYydlmdtrjV38
 CkrnRIdS2h9C0MWgjQ/V2uR8M84f2bCgMeA42bMA94JFwoH7xxXy+FOdI03tLX7X+l7/
 gWVyBoMazEiVpN7zjAal8DXnkXSIRmmf4METnUnEfYJ8kb0xJJxIqWUlFqkWmVSlwlzx
 RRQVaATDlCYsSfQp51FkejwxJO8XttAA7rEdXz0e3XavdV4328BAGrAl0yGEdzXd4Qr5
 qpIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Q0aEBM5LBDm+uvBrkq2T4dd/J6bym1U86HCZ9KlnsCw=;
 b=aCKJPj2nCZdfj9gjO8wuK2uFMm6ca5HYlJBYkI1KRxVlI2VIkz9QjAIAPX/1ppVwEE
 BNuagk+f4AnwY3LfQ4fMWIQRLq1mDc0ommuooRi3FBzNSZmvYTQ35ApLOOvw83Cbe58A
 RPXiW4Esugex+Un4ckFXZN5ClTJLJqkpYRIzUaFtjNPMe3C/njWAT++LrN6qIh8FTSB+
 H6yej2rdgTkXJ9kdLcK82pzfkFIDbPtA5FPTgWRMGCvfWTSgqKUrMldUVk+WatGaNVm4
 4mayVVXMfuaIi5jkYoxI0RS4uoCRH8D7z59Y6dw0x79SM0yEgYlLWXyTj1Zyn6esCY1g
 mqDA==
X-Gm-Message-State: AOUpUlGpB7FCoVH30oWMiuX5COQHiZlHmM4J9bVjFjoaIe2YfCCzWgDJ
 ZSP9WBYTqxxqPvu3F6WUn/+D2grcAFKrZkp6AyE4yILLGQM=
X-Google-Smtp-Source: AA+uWPw4xIDB6hVO1a0Xtkux6octhjgQRVKlr0cxbOhDHJgiALfxlHvhTDCTwOCgFEQn9FMn6Ua5sgq9dAwexhTjNgQ=
X-Received: by 2002:a2e:944:: with SMTP id 65-v6mr2393369ljj.30.1534269565411; 
 Tue, 14 Aug 2018 10:59:25 -0700 (PDT)
MIME-Version: 1.0
From: William Kennington <wak@google.com>
Date: Tue, 14 Aug 2018 10:59:13 -0700
Message-ID: <CAPnigK=89ih9zLRcMCyGq9c+TgD40ZAyFmyG15YCp24_cV9Ndw@mail.gmail.com>
Subject: Announcing sdeventplus
To: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Aug 2018 17:59:38 -0000

I'd like to make available a wrapper around the sd_event libsystemd
infrastructure to all of the openbmc based projects. This project is
intended to closely resemble the sdbusplus project and provide only
minimal wrapping of the systemd constructs, mostly related to handle
ownership and error handling. Currently this is lacking a proper
tutorial but it should be fairly straightforward to map any c-based
sd_event tutorial to sdeventplus. There are 2 example programs which
use some of the functionality. Otherwise this should be a complete
wrapper around sd_svent as of systemd v233. There are some newer
functions added in v237+ which can be optionally added at a later
time.

Please let me know what you think of the project which currently
resides at https://github.com/wak-google/sdeventplus. This should find
a new home at https://github.com/openbmc/sdeventplus if it receives
good feedback.

Thanks,
William
