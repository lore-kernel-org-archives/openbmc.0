Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::233; helo=mail-ua0-x233.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="aurcMbk+"; 
 dkim-atps=neutral
Received: from mail-ua0-x233.google.com (mail-ua0-x233.google.com
 [IPv6:2607:f8b0:400c:c08::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41PTXs4CpDzDr0r
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jul 2018 01:20:12 +1000 (AEST)
Received: by mail-ua0-x233.google.com with SMTP id r10-v6so11950355uao.1
 for <openbmc@lists.ozlabs.org>; Mon, 09 Jul 2018 08:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=e2JdCo91ixMbkSkZStPx/zeu+lcT34BYX4XY+cezWII=;
 b=aurcMbk+c3ere+RZDNtk585jAV2de614TQII10T/MZNZPO+trGdJrnIqP3rsrzbvB/
 tE79Ii4nBOMKLLVh9d7hj3fNttrG22Q/X/YwrwU7knRdoPryvKemwurlW0uKWZC2GR8S
 xp0iKCgVXqMXrIbHHP29i2u0LXMfFrocQzcRF13P1WRiGXEBBXYpNT+5WAVcf8b+8/gq
 MzJJ46l7hc+4zxhPTp2TitGoeAnT64cvmBfPLE8mowiFsq9tIUGD7uT+z+hMYS6IF3v6
 4JKIgdiDk91LD4N+xlF7V6HG+uc+M3cFLtOcdt3367C+FOY6QHYYs/lnGBMYTxYucIhf
 OY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=e2JdCo91ixMbkSkZStPx/zeu+lcT34BYX4XY+cezWII=;
 b=ZSLCPCxaUkcMSPYMbno1deK+i88ZWeq84if9ss1ZvAf5CzdMEvVS9AbrgSCXj729rr
 JP33lor6tpZKMh07xb2C67mWESeSvUsGFziOKV52ofEYBts5NMB9Rwl32HnjRlxnKhY1
 oqAXFzha17hFVYLcJE9S3H17a5T1o/uNegfOKypArByKKJZDnAnTmoyUMe60y+Bu8nzB
 qgmVhXRyBb/fasw0uKNLpMkPhb+IXfmIRCTKBYhbK9MTc8etq4U9SZQWz6uxoFLKmu+W
 +WCnDm9zj0UyGKeh5GgRxBxw7wejHXfen4LQTb3QJJ/hD1SAlmnQjk4Bs+m+rBQVNTtd
 UA8g==
X-Gm-Message-State: APt69E22CF4KFDV9pwmVmagrfUgS6S/uXtqSdKmGYcwcFZkvKzcLiR6f
 L3t5XiVXu3kPMJ8CUPvCtzpEwQyiB/mRMDelXPnx0pNW
X-Google-Smtp-Source: AAOMgpfFpIhpxZM1xcQE9OqsH26Zz7jD6a+8ZlTqII6CCf9DYnM1u+MLtdPmY0NU3qvld7blY0GbeDmrLUjxKmYdMB4=
X-Received: by 2002:ab0:1c1a:: with SMTP id
 a26-v6mr13060203uaj.142.1531149609997; 
 Mon, 09 Jul 2018 08:20:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1f:5c01:0:0:0:0:0 with HTTP;
 Mon, 9 Jul 2018 08:19:49 -0700 (PDT)
From: Patrick Venture <venture@google.com>
Date: Mon, 9 Jul 2018 08:19:49 -0700
Message-ID: <CAO=notwagKYN0XT4F3TU8EZntYUiQ0Z+wNzvhV9C6NnqSsDO2w@mail.gmail.com>
Subject: inband bmc firmware upload
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 09 Jul 2018 15:20:15 -0000

I'm going to restage the IPMI OEM handler for review for only using
the IPMI Block transfer interface, and try to get our internal tool
compiling in the open world for only that interface.  Then once it's
reviewed, etc, I can push out the PCI and LPC interfaces.

Sounds reasonable?

Patrick
