Return-Path: <andresoportus@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c0b::230; helo=mail-it0-x230.google.com;
 envelope-from=andresoportus@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="HMaKMlmC"; 
 dkim-atps=neutral
Received: from mail-it0-x230.google.com (mail-it0-x230.google.com
 [IPv6:2607:f8b0:4001:c0b::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40l4nn3J6wzF3Yf
 for <openbmc@lists.ozlabs.org>; Tue, 15 May 2018 01:47:05 +1000 (AEST)
Received: by mail-it0-x230.google.com with SMTP id e185-v6so4038529ita.0
 for <openbmc@lists.ozlabs.org>; Mon, 14 May 2018 08:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=5UNm1dHfCmEE3ognSTXgZ023/gR7oHXET1lATR3kjE8=;
 b=HMaKMlmC6pNCTVtQiXUviZ1kixY5RutNRNJBO46v2fjM9Y9Wc3+LDP9jShilb6QyDz
 rcGi2f1De150ChZ2hdyyVEF4D5XMDoHEXIH3jAGkcbubYgoz2bs8xUnCEEysFDl3waGB
 jHxh6JAld6f8ga7xNHfwG22zYidNr2xGyc8IQkkfUnDKUfIYaLfMWw5Evbj6FDSkF11W
 G32gZqhrNzkBFCLRYvWxmJ9jOw5AXl0/aBxb1h7d5TfPjhC7X5tyyDOr6zMz3Us9KCW4
 jsOBeVbquDOrLGPWIqfdVWKALpXBAQckzRzNpg7EBteCBcwjPk7UJLjUe5QOjpqcM9+L
 1Pgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=5UNm1dHfCmEE3ognSTXgZ023/gR7oHXET1lATR3kjE8=;
 b=H44DhWUZYelAICUZk7Tak7an03GAKGkyPPW2kAFKmj9ouKy23yjHFUYi0RTh4/8wMx
 BX20Kc7dnURflRYIfmfhPZyysRF3g8sQUvVl9Df+KkURvqsjgnDubYyL177iOFdEQR8J
 YZ/0TCuv+SLxGcxGWcRrFxGMkNwM+gOWVfUCiDIjTCFanLnOVlR+7uhVeDNuEEtX8I3Y
 kIUUxQJLPAPSD4jyU3p3qwVSNW/rbV1jlxRJGv8rsTlXDgULnFWO8m0ttWeqMsNGh2z+
 vCJCx8BHCI9vo02vm7e8WOLQxdpTbW3WMsoxE+wsHoVw312hcMulf9swHoREUzQdJWxg
 ry3w==
X-Gm-Message-State: ALKqPwcMOxwc4QztXkak6HQKV/0NmLCZObYX3b2GhDX1INJw0xHPmdUT
 T95LqmJsyqUT1VMZU+TmUnsRHNobYwniHTbjAVmnyL2b
X-Google-Smtp-Source: AB8JxZqG6k7syGffjkVkYkACa/Y7bkPUlQRyLKNuNYpjH1FxolAmyI8noPjJymmwtQ+cjIFLDdtSNme8rI3UN3MzsVI=
X-Received: by 2002:a6b:590a:: with SMTP id
 n10-v6mr10882313iob.228.1526312822732; 
 Mon, 14 May 2018 08:47:02 -0700 (PDT)
MIME-Version: 1.0
From: Andres Oportus <andresoportus@google.com>
Date: Mon, 14 May 2018 08:46:26 -0700
Message-ID: <CAD5O4R24451=iRYh5M_Bokhj8wMAzPdGfj5XSzhU6CJ6cOqotA@mail.gmail.com>
Subject: Question on States monitoring
To: openbmc@lists.ozlabs.org
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
X-List-Received-Date: Mon, 14 May 2018 15:47:10 -0000

Are there any ongoing efforts on expanding States (say provided by GPIOs)
monitoring/management?  I see that phosphor-state-manager has
Chassis/Host/BMC states that are placed onto DBUS but not a more generic
mechanism.  On the GPIO specific side, I see that phosphor-gpio-monitor
allows for interrupt driven GPIO monitoring (seemly only used under a
gpio-keys driver with /dev/input for Power's checkstop monitoring?), but no
generic GPIO setting/getting for those not allowing interrupt type
monitoring (say output GPIOs).

Thanks,
Andres
