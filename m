Return-Path: <joel.stan@gmail.com>
Received: from mail-ob0-x236.google.com (mail-ob0-x236.google.com
 [IPv6:2607:f8b0:4003:c01::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 009E41A04C1
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2015 17:53:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=SABJC89i; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=D/9Gs+ZJ; 
 dkim-atps=neutral
Received: by obdgf3 with SMTP id gf3so26630149obd.3
 for <openbmc@lists.ozlabs.org>; Tue, 17 Nov 2015 22:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:from:date:message-id:subject:to:cc:content-type;
 bh=PzrNH4f/E7UTQD32K/V2pInU9FhsmhyFQpVcVEN9Q9A=;
 b=SABJC89iE+ovHPpVrjR2Kq8dLr8svlscpeEfgFAxlAaDuRxgMI7SKMtkmj/IElWbrU
 VU84B1O+Zp0tOLvPxAipmjJYsT4zUENXhOoAs7ZItSXrRmrq/1DSChJacCJrGeaUHMuA
 j7JJNFtBXp3hRYsJ9FtDDvMpWuTsq71dBPgno2FvIYVS2TxpQxv5+bCEnGPsXFDdj2sh
 llV7G9zxY9dJLBeTpEHqrlaB9pLilHdDMl1soUwbwM7UfbOA3B2qavFh7G7RgNmP78Xz
 U6c3i0SIEHwaIPsG/JDnQ6ks5cncAZymO52g2YZyOEuU9umSxvg/GSML5Patw1d5VWvM
 8Kfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:from:date:message-id:subject:to:cc:content-type;
 bh=PzrNH4f/E7UTQD32K/V2pInU9FhsmhyFQpVcVEN9Q9A=;
 b=D/9Gs+ZJRyhX2r8rbpCgz42zlcDeB2GOL189VfC5AEjkwzWNZw9empAAtGWmGaR7Js
 D99JmoCj/2D2WilULd5GKIIBfjJ/FVZIIWzjaJAgmBnAGQBVV+tUOrhyFwyYMZPx0uml
 Pnfj2oGDbYzvDoqr2ijaAPiloKDEzgN/F/4WM=
X-Received: by 10.60.116.101 with SMTP id jv5mr30246201oeb.24.1447829634905;
 Tue, 17 Nov 2015 22:53:54 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.202.226.10 with HTTP; Tue, 17 Nov 2015 22:53:35 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 18 Nov 2015 17:23:35 +1030
X-Google-Sender-Auth: U4jzENDyg6wq441VVgChJZ512TE
Message-ID: <CACPK8XcNRfAxQbNg3=J9v1frgP5UBgRuOtLHzxn=wOwO3GHS-w@mail.gmail.com>
Subject: Supporting new flash in pflash
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Nov 2015 06:53:59 -0000

Hi Ben,

On the barreleye BMC we have a 32MB flash. I can pflash -i the system
pnor, but when I attempt to look at the BMC flash, It errors out.

u-boot indicated that it's a 0x20ba19, so I added this to the flash_info table.

+       { 0x20ba19, 0x02000000, FL_ERASE_4K  | FL_ERASE_64K | FL_CAN_4B |
+                                FL_ERASE_BULK | FL_MICRON_BUGS,
+                                                          "Micron
N25Q256A"    },

However this fails:

root@barreleye:~# ./pflash -i -b
LIBFLASH: Failed to set controller 4b mode
LIBFLASH: Flash configuration failed
Failed to open flash chip

Do you have any ideas?

Cheers,

Joel
