Return-Path: <wangzqbj@inspur.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inspur.com
 (client-ip=210.51.61.248; helo=ssh248.corpemail.net;
 envelope-from=wangzqbj@inspur.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inspur.com
Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43LC3K39mMzDqmf
 for <openbmc@lists.ozlabs.org>; Fri, 21 Dec 2018 00:17:13 +1100 (AEDT)
Received: from ([218.57.135.44])
 by ssh248.corpemail.net (Antispam) with ASMTP (SSL) id KZL47802
 for <openbmc@lists.ozlabs.org>; Thu, 20 Dec 2018 21:17:02 +0800
Received: from mail-lf1-f42.google.com (172.30.26.1) by
 jtjncas04.home.langchao.com (172.30.26.23) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 20 Dec 2018 21:17:00 +0800
Received: by mail-lf1-f42.google.com with SMTP id l10so1315563lfh.9 for
 <openbmc@lists.ozlabs.org>; Thu, 20 Dec 2018 05:17:00 -0800 (PST)
X-Gm-Message-State: AA+aEWZiukM21UcyJM0CevPcXdLnxNa+9qo2ICWASuPgcG+QbAQQMLX7
 V/Ahb3qehMksPlpgmzjR9OgKu3Iu51JngJ5hHGc=
X-Google-Smtp-Source: AFSGD/U5ULlgqsWbdwd3yK0oNHZsdWFRB13g61QqlaGCRSpW3sE8FlWzw0Uf7gh85Y8vZsvefZiFInBWCNQungNhYhg=
X-Received: by 2002:a19:d145:: with SMTP id i66mr15716813lfg.97.1545311817066; 
 Thu, 20 Dec 2018 05:16:57 -0800 (PST)
MIME-Version: 1.0
From: John Wang <wangzqbj@inspur.com>
Date: Thu, 20 Dec 2018 21:16:45 +0800
X-Gmail-Original-Message-ID: <CAHkHK0_yZxnX4sY5-ZN=tLXtUkqZJnHyXXUtb-C6Zn4gkGNniQ@mail.gmail.com>
Message-ID: <CAHkHK0_yZxnX4sY5-ZN=tLXtUkqZJnHyXXUtb-C6Zn4gkGNniQ@mail.gmail.com>
Subject: openbmc code auto-completion
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [172.30.26.1]
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
X-List-Received-Date: Thu, 20 Dec 2018 13:17:19 -0000

Hi,All

I am a vimer. There is a ycm_extra_conf file for ycm(auto-completion)
for openbmc-cpp-project,I want to share.I don't know where this file
should be uploaded,just put it here
https://github.com/inspur-bmc/common-dotfiles/blob/master/ycm_extra_conf.py.

How to use it:
devtool modify phosphor-led-sysfs
cd workspace/sources/phosphor-led-sysfs/
cp ycm_extra_conf.py  ./.ycm_extra_conf.py

vim xxx.cpp

As a c++ beginner,I feel that auto-completion can make me write code
more happily.This ycm_extra_conf file is simple ,if someone can tell
me a better way for yocto(openbmc) auto-completion,I would be
grateful.

Thanks

-John
