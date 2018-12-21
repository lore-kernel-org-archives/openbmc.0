Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32a; helo=mail-ot1-x32a.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ISuicjAO"; 
 dkim-atps=neutral
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Lc4w1DCRzDr5Z
 for <openbmc@lists.ozlabs.org>; Fri, 21 Dec 2018 16:05:03 +1100 (AEDT)
Received: by mail-ot1-x32a.google.com with SMTP id t5so4101918otk.1
 for <openbmc@lists.ozlabs.org>; Thu, 20 Dec 2018 21:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=LCrN3qQqj5WKUBK07YDaatiN3MqdUYl/tgz9OgLA4WY=;
 b=ISuicjAOnxpmvss7+WuG5JNK8ewGBb+Ly/gr+cY3b96kod9j1wxA+CU9OFNcATarms
 Oj37boMiE02u1cQtOf5dJKFaSZOty+Lotiu78hy0Nwl6BbugAVcMqVx6SaiRoape+v/a
 z2H2AzjQ0j426Vl5Z6kLJF2CbCpAJ3lIGscQXi6m6dh6FLZqkfgNTnaYG7anIcu4o70g
 8yjpnZToqpj/MtJ7vwWT33Yy+Tthb74WOcOmqwRYa42143abOHoUl2n1U1x6Sq4Ht8uC
 fY3FRfsn1yUIZ1JAaq7KRpKk316hNbvUOB1zkNGWvPYwNgG8v6I7FLGvmObvWT2QhTty
 1yMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=LCrN3qQqj5WKUBK07YDaatiN3MqdUYl/tgz9OgLA4WY=;
 b=JX+vZI5LomITgVU5T2j8ysxYtn3ag322SEauJ6NTRxuZ/OzrmJX9Uj56kRZk99uULO
 MY5KBBZ8qBcz0M/82fDV/cqED4uauRHgJ81Brddz0ZPnpGxJw67Bnl+5/xXS6KEoGQoM
 kLTN16ins6yIkN/8Pz9W7fWvAuytD9XuJwPbUHFPNrG9i2Jce1cGeW7p/ORWvcgugzLh
 ogO2iey7gOMZNJDyfguGXw2pnaiwLwPUtrB5FuPO8ReSKgx2mbZSxQN6ZoHAkX+aN7Gt
 4xwNx/eOhCNQ8ofp+ySDk3wBkYEdGS8Ba3TBEef1sH0vJIY/VYMdYwra5TFsaPlKO/8x
 6cgg==
X-Gm-Message-State: AJcUukfr6WOZxD1jb4yHGAA1oRqkfdfAyun8suvnjjt7a5xNl9zOfanQ
 LAAmNHcaRIdMIWdkjitkxQFiQcBJmpL3TNY0WJ4Lv7bO
X-Google-Smtp-Source: ALg8bN6Ff2vWo/mJjJsCQWzpF2GkXGs4sbguENL0DtaidiWHP4lOyAOGNmeoXZuGwX0zer1RE6mZKp/FVCXY58FgNFM=
X-Received: by 2002:a9d:3bc7:: with SMTP id k65mr667452otc.11.1545368701181;
 Thu, 20 Dec 2018 21:05:01 -0800 (PST)
MIME-Version: 1.0
From: AKASH G J <akashgj91@gmail.com>
Date: Fri, 21 Dec 2018 10:34:52 +0530
Message-ID: <CAE33tLHRzGa2_t3AMfAjf4txP7cu=uFBHMuUFAERBkZ9ZoOGCw@mail.gmail.com>
Subject: Sensors connected on I2C bus of chipset
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000007b2207057d813002"
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
X-List-Received-Date: Fri, 21 Dec 2018 05:05:05 -0000

--0000000000007b2207057d813002
Content-Type: text/plain; charset="UTF-8"

Hi All,

I built OpenBMC Linux using Zaius configuration and booted on BMC Aspeed
AST-2500. The board we are using have some temperature sensor (TMP75) and
voltage sensors (ADM1293) on I2C bus connected to chipset, not to BMC.

How I can monitor the readings using BMC ?


Thanks and Regards,

Akash

--0000000000007b2207057d813002
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi All,</div><div><br></div><div>I built OpenBMC Linu=
x using Zaius configuration and booted on BMC Aspeed AST-2500. The board we=
 are using have some <span class=3D"gmail-il">temperature</span> <span clas=
s=3D"gmail-il">sensor</span> (TMP75) and voltage sensors (ADM1293) on I2C b=
us connected to chipset, not to BMC.</div><div><br></div><div>How I can mon=
itor the readings using BMC ?</div><div><br></div><div><br></div><div>Thank=
s and Regards,</div><div><br></div><div>Akash<br></div></div>

--0000000000007b2207057d813002--
