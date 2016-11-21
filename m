Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMblW1c4wzDvLt
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 15:51:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dRKh8ujg"; 
 dkim-atps=neutral
Received: by mail-pf0-x243.google.com with SMTP id 144so17482500pfv.0
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 20:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=message-id:subject:from:to:date:mime-version
 :content-transfer-encoding;
 bh=PrWrawyHBMvSCtvFdZraYpsKuvZhUGOl6BsFR3cKHcM=;
 b=dRKh8ujgmdM2Bgb1hG9wR1+w55nrhlgxJdez913MBNaUy3TsVSqreej9sMsYGcikZE
 vQjUtfpIdY2Htf1JkW6pgkgm8suwFvcfmAo6eaYn5M1IsLE13PAbUIow4k+mpehVoclk
 89p84vLKI5fzFmu71sEihhDkeYvcgbM47Z/1wQBqkteOk9msC3Crr/9lEcWG2TeH6W+r
 aYwi6umKkheTRJigJNeEKBU9SyqHJIfEcijLPGoATdVNY29r2VctSvBjPuIl3iJ4LZrp
 3fIZrXny+2bYiglGORRedkRe7bO3hRLFK4ZQH4I+1Hw9IwUQK+tr3wN7zKfGqGfDCFUj
 c15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:message-id:subject:from:to:date:mime-version
 :content-transfer-encoding;
 bh=PrWrawyHBMvSCtvFdZraYpsKuvZhUGOl6BsFR3cKHcM=;
 b=CbeGVPKnCXUck11YRLp1rdQ52baa/HTkoX7xYHRx/ITV3RcIKMuD0U2dUFJst9mRt7
 G9IwnuAYUwXryytNeFV+FAE3M6JGBMLdrXugFPOlljKoLiEIKG6Ne1vqA5P6D5CvdnPb
 MCn754/1mKEgekBlC8ej02dKEZ4f8j7HctPDAtz7vHpD6WzJWlaQOVDTF2wWxv3lxZZg
 oI3mczI/WDgdMN67I5zCzbUbmLHQK9n29vd6gt68wPVwvJKHUikse4DrVUNYpTFfHbxE
 KDNMFOL+v3TjtBwNRcc4bEIuw4LkE20asDC6sdXLX5J6JTm34aXQJrYysJDGTCOPfPxB
 Fo6Q==
X-Gm-Message-State: AKaTC008/kor/v3KqId7Idd3tO2UZyjjhaXSKIqnnydzab6R9s8tyr4xWBBBIxmPEvhRSQ==
X-Received: by 10.99.127.72 with SMTP id p8mr27796352pgn.183.1479703861403;
 Sun, 20 Nov 2016 20:51:01 -0800 (PST)
Received: from cyril.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id d15sm33441747pfl.46.2016.11.20.20.50.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 20 Nov 2016 20:51:00 -0800 (PST)
Message-ID: <1479703856.680.2.camel@gmail.com>
Subject: Restricting HOST flash access on OpenBMC
From: Cyril Bur <cyrilbur@gmail.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, Jeremy Kerr
 <jk@ozlabs.org>, Abhishek Pandit <abhishekpandit@google.com>
Date: Mon, 21 Nov 2016 15:50:56 +1100
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Mon, 21 Nov 2016 04:51:03 -0000

Hello,

Apologies, I have been working on this in a bit of a silo and I suspect
a lot of people will be interested to know this work is going on.

The aim of my work is to provide a simple interface for the host and
the BMC to talk in order for the BMC to give controlled access to the
flash.

At the moment, the BMC maps the host LPC bus to point to the PNOR
directly. This may be undesirable and presents security concerns. If
the host can be taught to request access to the flash then the BMC
could map the LPC bus into a region of its RAM and (depending on
policy) writes wouldn't get propagated to the actual flash. Policy
details are for later.

I developed a simple protocol to allow this exchange of information
documented in the README.md file of the userspace test daemon I wrote
to proof of concept this: https://github.com/cyrilbur-ibm/mboxbridge/tr
ee/newio I will no doubt move this somewhere more suitable in due
course.

I chose to use the MBOX registers on the BMC as they provide a fast
method of data transfer and can raise interrupts on both the host and
BMC.

The aim of sharing this now is to show that the interface works and
that implementation independent things can start to be integrated into
skiboot and linux. Having said that, I would appreciate any feedback, I
have had my head in this for quite some time please let me know if I've
missed something.

The implementation is only a proof of concept, some details still need
to be worked out, especially what happens on BMC reboot. I believe the
interface is ok in that respect, just my implementation which is
lacking.

Do try it out if you want. Of course changes need to be made to the BMC
kernel as well as skiboot:
https://github.com/cyrilbur-ibm/linux/tree/newio
https://github.com/cyrilbur-ibm/skiboot/tree/newio

Thanks,

Cyril
