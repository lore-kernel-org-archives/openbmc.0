Return-Path: <kitsok@yandex-team.ru>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yandex-team.ru
 (client-ip=2a02:6b8:0:1465::fd; helo=forwardcorp1g.cmail.yandex.net;
 envelope-from=kitsok@yandex-team.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=yandex-team.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.b="mRsN6bT7"; dkim-atps=neutral
X-Greylist: delayed 315 seconds by postgrey-1.36 at bilbo;
 Thu, 24 Jan 2019 03:01:32 AEDT
Received: from forwardcorp1g.cmail.yandex.net (forwardcorp1g.cmail.yandex.net
 [IPv6:2a02:6b8:0:1465::fd])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43l958052dzDq9L
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jan 2019 03:01:31 +1100 (AEDT)
Received: from mxbackcorp2j.mail.yandex.net (mxbackcorp2j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::119])
 by forwardcorp1g.cmail.yandex.net (Yandex) with ESMTP id 7427320C00
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jan 2019 18:56:06 +0300 (MSK)
Received: from localhost (localhost [::1])
 by mxbackcorp2j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
 agq4AKrIbZ-u6XmEihM; Wed, 23 Jan 2019 18:56:06 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1548258966; bh=suZ8tB4rsqc3iVVpplHU1he4SvHTDw0nLePAunSevHU=;
 h=From:To:Subject:Date:Message-Id;
 b=mRsN6bT73h0Qyk0nZPhcmBvgzA+yA8A8+Zd124ultnFoO5xuR+3dGMpzrMFspIzAQ
 ME/vEmBfPa/frkazWZ6ltfAGH9qDzLSR1ZoUfg1GlTjj+IGoaie9Ve1ktX0yRE1f3H
 E7H4rUNuUIemP8ZX03fU9BQr/STBQjkN/JygI8iI=
Authentication-Results: mxbackcorp2j.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000049860
Received: by sas1-fc7737ec834f.qloud-c.yandex.net with HTTP;
 Wed, 23 Jan 2019 18:56:06 +0300
From: Konstantin Klubnichkin <kitsok@yandex-team.ru>
To: openbmc@lists.ozlabs.org
Subject: New motherboard to port OpenBMC to
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Wed, 23 Jan 2019 18:56:06 +0300
Message-Id: <3817431548258966@sas1-fc7737ec834f.qloud-c.yandex.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
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
X-List-Received-Date: Wed, 23 Jan 2019 16:01:35 -0000

Hi all! 

I have the custom-made motherboards for Grantley CPU with Avocent-based BMC, and my goal is to switch to OpenBMC. 

I've read HOWTOs in the OpenBMC documentation, but usually the documentation is usually a bit behind the development, so are there any newer howtos or guides?

Now I took Quanta MB as a reference and going to at least boot up the system and get the network. But it's pretty unclear for me how to add sensors, how to get CPUs temperatures, etc

Could you please advise what to read to get into details?

Thanks!
-- 
Best regards,
Konstantin Klubnichkin,
lead firmware engineer,
server hardware R&D group,
Yandex Moscow office.
tel: +7-903-510-33-33
