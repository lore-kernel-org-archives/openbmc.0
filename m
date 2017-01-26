Return-Path: <mouse@yandex-team.ru>
X-Greylist: delayed 322 seconds by postgrey-1.36 at bilbo;
 Thu, 26 Jan 2017 21:48:55 AEDT
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.b="jb25EkOM"; dkim-atps=neutral
Received: from forwardcorp1j.cmail.yandex.net (forwardcorp1j.cmail.yandex.net
 [5.255.227.106])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v8JYz5bRJzDq75
 for <openbmc@lists.ozlabs.org>; Thu, 26 Jan 2017 21:48:55 +1100 (AEDT)
Received: from mxbackcorp1j.mail.yandex.net (mxbackcorp1j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::162])
 by forwardcorp1j.cmail.yandex.net (Yandex) with ESMTP id AB31520E91;
 Thu, 26 Jan 2017 13:43:17 +0300 (MSK)
Received: from webcorp03h.yandex-team.ru (webcorp03h.yandex-team.ru
 [37.9.109.161])
 by mxbackcorp1j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
 i437WIPcqL-hHBmvHP1; Thu, 26 Jan 2017 13:43:17 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1485427397; bh=1yIQzo447aLr1e+cy0i/yZplofmiC+tBW/DHFdoBiyo=;
 h=From:To:In-Reply-To:References:Subject:Message-Id:Date;
 b=jb25EkOMOx+kV4oT4I81j/HahbSeyqxobuIzhf96g1tXaK0f83p+AxyLS/BO/S78m
 sKSKwnDueoYyoecE6Fp9gQhYXPgvnLdhT0lZTuYo+i43a812pNiX+0eRLDqYlN0IfG
 hGbkzpKNhoL9qZFJxU/Cgj3Qq/H7wCUSyMNvInyg=
Authentication-Results: mxbackcorp1j.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000001030
Received: by webcorp03h.yandex-team.ru with HTTP;
 Thu, 26 Jan 2017 13:43:17 +0300
From: Anton D. Kachalov <mouse@yandex-team.ru>
To: Adriana Kobylak <anoo@linux.vnet.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
In-Reply-To: <75C63AB7-E340-4A78-BA82-80F96EAEA051@linux.vnet.ibm.com>
References: <75C63AB7-E340-4A78-BA82-80F96EAEA051@linux.vnet.ibm.com>
Subject: Re: OpenBMC Image Management
MIME-Version: 1.0
Message-Id: <101001485427397@webcorp03h.yandex-team.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Thu, 26 Jan 2017 13:43:17 +0300
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jan 2017 10:48:59 -0000

Hello.

26.01.2017, 01:32, "Adriana Kobylak" <anoo@linux.vnet.ibm.com>:
> General:
> * Use CRAMFS for read-only partitions, and UBIFS for read-write partitions.

Why CRAMFS? It's small, but supports only zlib compression, has a 16MB file size limitation and marked as obsolete in kernel tree. Why not SquashFS? It's better for larger projects, has a number of modern compression algos.

> PNOR:
> * Ability to ‘patch’ by copying a Hostboot image *.bin into a designated directory (/usr/local/ for example).

Would it be good to add support for opkg-based packaging to incrementally (hotfix) system's update? I use it in OpenWRT.

> * Tool to write from PNOR image to BMC format. Implement UBI initially but it could be extended to support different volume managements on other BMCs.
>
> BMC:
> *Save multiple firmware versions, starting with 2, to provide the ability to roll-back if needed. If single BMC chip system, save both versions there. If two BMC chip system, save other version in 2nd chip.
> * Implement various levels of ‘persistency’, such as dev, factory, field. Dev persistency would allow for local patches (/usr/local/ for example) that can be cleared before shipping to customers. Factory mode could delete the location where user data such as network settings resides but preserves the mac address and uuid for example. Etc.
>
> Thanks,
>
> Adriana
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

-- 
Anton D. Kachalov
