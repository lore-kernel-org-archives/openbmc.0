Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::231; helo=mail-vk0-x231.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="lcCWpDm8"; 
 dkim-atps=neutral
Received: from mail-vk0-x231.google.com (mail-vk0-x231.google.com
 [IPv6:2607:f8b0:400c:c05::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yLK676yqLzDqhf
 for <openbmc@lists.ozlabs.org>; Tue, 24 Oct 2017 01:48:46 +1100 (AEDT)
Received: by mail-vk0-x231.google.com with SMTP id b7so7479387vkh.12
 for <openbmc@lists.ozlabs.org>; Mon, 23 Oct 2017 07:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=b97OYMukLXu+rso/dNU5lDm2oud84Z3hD9SMNt0NYCA=;
 b=lcCWpDm8sjlO/QTS2OjF1f7yNtgv4ZDmfbJdpzy1nReR5SB5tKIvouTMJb0GdiY3S5
 n8bQZrpESD2YkZuJMl8BT6vSKYkHsC5BZBQSNm8nAaceV+b4Cgu4Ji4gJI2/rLnXqmcb
 iFxJoqleDeChu3/Ut3qNKY8rA0S5m6U5h0IiGGQBx0RQc3fqMCrkTMSKPYszuae1HA02
 h/0i10b0M+0QRbixA2jNX2SMqFVzDufPyIRLHGEynVxakdiHdVTcwamXnxi+vFNysiDU
 tL9mu5zJ0NjoWv8AmGIMDQz4Xng21GbuaFGmqFWbbTK1MXjszB0WhLxUHtVRrnHSP77S
 S1ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=b97OYMukLXu+rso/dNU5lDm2oud84Z3hD9SMNt0NYCA=;
 b=BSWAELBX6eAtLe07jmQIEJt8GHQhu51k/ZHN1WNHpe3nLYcE2O0PIrQNQ/1axkda/L
 pQPtCzTocDPLMoKqT66dmhRaIFKAoGLLMaxPZ/WvGzKMoFIO+hItH3TjqrcJ9qT9EzFJ
 cPhuuxrwvpiIDC2jREOIeTA0ol82hl8J5TP5a/VWhQ186yLQLCgNh6ZKPh43N+w6E2n4
 J4G+ARrg/xBxOmjfr1MFMuBJnCKinaGttKgqcgWKgpAbS36Uy/azVxEtINQnz/6jChKS
 HEdDSx1hCBpYYsLNiqfI7R2zL26e79FChYcw+AGEYTEGL1qNWe5G5VgWZysZlLiP32En
 JDxw==
X-Gm-Message-State: AMCzsaW0i+FUsh1DdSAfRAP5229I5HuhljZjhNAcuOne/jrQgQ/yOlbs
 Pequ1nta6AD+CwV7p2TelyNCR81ffT+pUQKwaknza9cJGbI=
X-Google-Smtp-Source: ABhQp+Tv4zEj8WoUs7y8uiB7a2AVvtI2CgJpovOgQYAYuyKj4sWJjMB4gccm3rR25wjYuqQf3byUj4ZKluIeIOU1iks=
X-Received: by 10.31.81.6 with SMTP id f6mr8632006vkb.127.1508770123368; Mon,
 23 Oct 2017 07:48:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.163.73 with HTTP; Mon, 23 Oct 2017 07:48:22 -0700 (PDT)
From: Patrick Venture <venture@google.com>
Date: Mon, 23 Oct 2017 07:48:22 -0700
Message-ID: <CAO=notwM=vVT6FNahQJ-U5UxMa9KRptPawVeXQbiGyMpce44Bg@mail.gmail.com>
Subject: phoshor-network manager daemon + IPMI
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Oct 2017 14:48:48 -0000

I'm curious if anyone has experience using the phosphor-network
manager daemon. I've run into some oddities using it for instance, if
you don't configure anything it sets up both links as LinkLocal and
enables DHCP, etc -- and then even if DHCP fails, it doesn't update it
(although it's aware of the failure) -- and when I then go to set the
IP address over IPMI to a static IP, I run the two lan channel set
commands which work (because they just set the object contents) --
when i call "access on" over IPMI, it tries to delete all the dbus
objects for the network, which fail because of checks in the network
daemon that prevent this, which causes the network daemon to crash.

Ultimately I'm going to enable the host ipmi daemon to support
multiple channels -- the trick is then to map the channel to an
ethernet device...  Some patches will be send up today to reviewing
this type of change.

I'm going through the uses cases now trying to get it working, and
just curious what I should be doing to get it to work.

Also of note, when I set the MAC address -- which works :), it doesn't
update the configuration for the systemd network file with that
information  -- I'll be sending a patch for that today -- but I was
curious if that was deliberate, etc.

Thanks,
Patrick
