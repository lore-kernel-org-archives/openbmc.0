Return-Path: <artemsen@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com;
 envelope-from=artemsen@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SKnPKOzd"; 
 dkim-atps=neutral
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44SXRZ161gzDqFw
 for <openbmc@lists.ozlabs.org>; Mon, 25 Mar 2019 22:42:01 +1100 (AEDT)
Received: by mail-lj1-x231.google.com with SMTP id r24so6435247ljg.3
 for <openbmc@lists.ozlabs.org>; Mon, 25 Mar 2019 04:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=Pa1CT1OwOem+kV7GnnlY8PnDnLX6Pq4WHpex4pTYvY0=;
 b=SKnPKOzdbaf3OBuDfw54ZoP+LP8BpSJzhke49+piqqfyWNry2hWMgPZDdUv/hGK4vU
 Rwm0IX+AyXUl59yK5SgFDmfZFfjOzaIxGE7G/YB7gkJdWyZdPcON7iKzcW+8PfbeXi9P
 obBF+8Xvtayp/OH3o6vD1Xsq951cwn+pHx5DMHvqo57eVPa7eoTh3tSANxhmiuWij/tJ
 mZ3KYa+9PjTRwWcosVeRrBXInqnBYMTcBX+0gnN6XFIKBlPfgQYoLZtrWH0NAUD9IbkR
 r1F2amPhhYCwqACtWJPKziieShaNuubsEJrTlbjPfGYAor39l6/Pc9LJV+jxB+xpSv3L
 n3aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=Pa1CT1OwOem+kV7GnnlY8PnDnLX6Pq4WHpex4pTYvY0=;
 b=S0TumHkWnf3ozY1YSY9wDpVXnvMuGGkhZ28hVYND81/JwWTWWF037vqBXmHwrTgiTg
 ohaO975xNq+r8OCQJO3yrQQbncYsUWZhgx8DTXWptFx8fxBJyzI1NXCj619xZyjaOlgr
 qLdSXPFYlhLWaasg0yqSrAR+kXHCtNsf5kC+WlSZ4T6Q56ayWr0Sa2LVc2KBktOuBytV
 eRMUGEmMwYxAA2ue/VbY+3raMP/FE0heaMh8j/e5eyM8231Kpq+K6UEEtLWvx0o+xyrN
 iG09+eyblBdONiPoED//WwqpLzTOl1YpQae6VjTNJLsbgdz9nFkvFN+9T9XdB+fGdYIy
 FUMw==
X-Gm-Message-State: APjAAAX/YRp0IhSNj2xhdkeegFASlHpkGNlUMOruse8b3QmArTiEb8Rv
 tuQm9GYr8Ya1EWiZzbQjCw8JhkZF
X-Google-Smtp-Source: APXvYqzhvoZ5wU6MoBOGkm0i/s3mBB0xOffmAWV36BJsI2UpEciL1jyQXvZbOPUHNbK5d/M0/Zo32Q==
X-Received: by 2002:a2e:894e:: with SMTP id b14mr3853726ljk.158.1553514116813; 
 Mon, 25 Mar 2019 04:41:56 -0700 (PDT)
Received: from gmail.com ([89.207.88.249])
 by smtp.gmail.com with ESMTPSA id z83sm3422096ljb.48.2019.03.25.04.41.55
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 25 Mar 2019 04:41:55 -0700 (PDT)
Date: Mon, 25 Mar 2019 14:41:55 +0300
From: Artem Senichev <artemsen@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: OpenPOWER eSEL registration
Message-ID: <20190325114155.d7l3pogbq4b4pt56@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20180716
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
X-List-Received-Date: Mon, 25 Mar 2019 11:42:02 -0000

Hi All,

I noticed that several months ago OpenBMC had stopped handle
eSEL messages from OpenPOWER.

In fact, eSEL message is sent, recieved by IPMI daemon and written to
/tmp/esel file, but phoshor log contains only one empty event:
org.open_power.Host.Boot.Error.Checkstop
There is no any entries with eSEL dump.

System logs contains these messages:
Mar 25 10:38:52 vesnin checkstop_app[1192]: Host checkstop condition detected
Mar 25 10:38:52 vesnin phosphor-log-manager[920]: Failed to find metadata
Mar 25 10:38:52 vesnin phosphor-fru-fault-monitor[1008]: /xyz/openbmc_project/logging/entry/5 created

File with eSEL dump:
vesnin:~ # ls -l /tmp/e*
-rw-r--r--    1 root     root          1960 Mar 25 10:39 /tmp/esel

OpenBMC version: 2.7.0-dev-156-g2ef13c18a

Is there a bug in DBus interfaces or something else?
Which project is intended to handle and register eSEL?
Is it openpower-host-ipmi-oem or phosphor-host-ipmid?

-- 
Regards,
Artem Senichev
Software Engineer, YADRO.
