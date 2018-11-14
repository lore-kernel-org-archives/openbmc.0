Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="JRtaWreb"; 
 dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42wD7d3S9nzF3SY
 for <openbmc@lists.ozlabs.org>; Thu, 15 Nov 2018 05:49:48 +1100 (AEDT)
Received: by mail-pg1-x52e.google.com with SMTP id w3-v6so7745485pgs.11
 for <openbmc@lists.ozlabs.org>; Wed, 14 Nov 2018 10:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=UYfCxnQNvlgrRrFjVjzZDDfXyZmDUFIMwPnlen/cUrI=;
 b=JRtaWrebndou86t7D0+xOFYSwg3hmQkCoDmbpqWhAia7zzRuLUXfUiMYzVdvoLSvwz
 MeXSAPN+ZvdyaUYdTUd3UMX7eCavU+96IaGt7gq4DGkW8IXZcZ6w/k6FkoadvGqBkdJd
 omSkCsicoAgtSA7nEy6zOI+CUJ5ROSbUhnMkqd8fORwIif4R44+9kZlmBs6avSan1+c4
 Gc18hI9noPICDSCKvyoHLfyrtUJlzIk2wAmWJYDGXVqPNxQHx9tKaSAmDeZ1Hn2BV0Dn
 AvwEuHD0/vmZWuROdtif2pm8MdHSFJl2TlCNMysbzdd3TToICEfrkhrEXhKXUBnL3dJN
 QXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=UYfCxnQNvlgrRrFjVjzZDDfXyZmDUFIMwPnlen/cUrI=;
 b=rnzfwuTXXJzyvuQeznP3bIjJLRj8O/dISLbm9RqSB4CbeCwHeQ0Sa1CT1FHVa32ITu
 xwSc+AmSh3ouUTkT77ICbOtVFsJKELRL796+ZzdvXsdiTbGl0pskKlDNnPl7MPupIz0P
 6t2qrCIeqNRlDm9Iw6/p9gDdlfwgARuLKUm2d8r0xppLNsySPZpk7/IBAtkSaPBZOOjv
 WdbOYnR4Es2dQ/P+gMZYWLEG6Z9Q6uUahRf852PtzpLL6/an5M6TWuN9gYD5x2NxkLYg
 NyMvwHTAu6WO2d3g7F1e+i0r7r+a60StQztBAfpPbvx8dWibJ6RVgskwKrCtv5RSh+C4
 9EAQ==
X-Gm-Message-State: AGRZ1gK7o8Omy+Notykw2omcHZHFlLCauBk/YfvR39rAQJY/GtWBrZvA
 BgC2DW4c5QT7pO5sNDSlO6S33Mm4iw7JMUyWEzEuoQ==
X-Google-Smtp-Source: AJdET5eibMoyKchvQZ1/QnhzVV0WJ7q9CAO5pg5MfoyKRlsWySSt6XRHP/9FVWx1UrT3ybtHzNACfRsghlkHLNJ1zjQ=
X-Received: by 2002:a63:4044:: with SMTP id n65mr2767647pga.90.1542221386069; 
 Wed, 14 Nov 2018 10:49:46 -0800 (PST)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Wed, 14 Nov 2018 10:49:34 -0800
Message-ID: <CAO=notys2w6Jgv2E7mpM3O7swoZatHODDwu8yL865K-sq6GBeA@mail.gmail.com>
Subject: hosting of doxygen from projects
To: Andrew Geissler <geissonator@gmail.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 14 Nov 2018 18:49:50 -0000

We use doxygen documentation for all our code, but do nothing with the
possibly generated output from this.  I suggest we start hosting that
information somewhere, built via a script, possibly under the github
io.

Each codebase could host it, however, I think there's value in having
it all in the same place.

Patrick
