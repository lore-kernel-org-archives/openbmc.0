Return-Path: <cyrilbur@gmail.com>
Received: from mail-pa0-x231.google.com (mail-pa0-x231.google.com
 [IPv6:2607:f8b0:400e:c03::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 0E6651A0BC0
 for <openbmc@lists.ozlabs.org>; Wed,  2 Dec 2015 10:51:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=nw1ojLcG; 
 dkim-atps=neutral
Received: by pacdm15 with SMTP id dm15so20433828pac.3
 for <openbmc@lists.ozlabs.org>; Tue, 01 Dec 2015 15:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:subject:message-id:mime-version:content-type
 :content-transfer-encoding;
 bh=y2mEY6303OWxZqdMpSpxQS0XTGdr+4c5vEzjVkAr1pc=;
 b=nw1ojLcGlLenKjOhfKEOGTdlWYiT24eFQcaF74lqdekF7c7WNvVMp658MZ1pC2rQRb
 cDd++9Jn7avDP+ztrQkxEvTVpMMN15zb5NMiVsU9f48/vRoX6aXooEctQm9VnwFvOVZN
 xeoepdiuudxvoGlPSn2aLu/jXnfbN37Ey4Hs3Uf5psD7zx/pemav++874vmWLp+YwLiU
 xGcat4EUcHtSeDwy9IoLB8vrepyWxFWQyGAvmb7zyIVIdQorePnL749S2BSBQTCg5C4i
 THwa6yMetM+Fno6amuIUCazhOu748N2B7wIIUhwXJCILkUA9WQtZgrhgzhkhjkTltPHv
 nBag==
X-Received: by 10.66.219.163 with SMTP id pp3mr182095pac.55.1449013869981;
 Tue, 01 Dec 2015 15:51:09 -0800 (PST)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id r26sm154462pfa.45.2015.12.01.15.51.08
 for <openbmc@lists.ozlabs.org> (version=TLSv1/SSLv3 cipher=OTHER);
 Tue, 01 Dec 2015 15:51:09 -0800 (PST)
Date: Wed, 2 Dec 2015 10:50:59 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: Testing
Message-ID: <20151202105059.1ebcc4dc@camb691>
X-Mailer: Claws Mail 3.13.0 (GTK+ 2.24.28; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Tue, 01 Dec 2015 23:51:12 -0000

Hi all,

I'd like to open some discussion about testing. I honestly haven't given that
much thought to big picture testing but I can describe what I'm doing to
btbridged to at least have something. I'm sure everyone has ideas as to which
direction the testing should be going and what we should be doing and this is
the conversation I would like to start.

At the moment it is almost impossible to test btbridged, short of actually
booting a real openbmc and making the host to something and through observation
try to see that all went well there really isn't a way of knowing if changes
work.

Joel kindly added a .travis.yml (travis-ci.org can automate) file to the
project to at least have compile checks, which is a great start. I'm currently
expanding on it so include a 'fake' bt-host and a trivial ipmi client. I don't
expect these tests to get too fancy but I do hope they'll be able to catch
broken commits. Future direction might be to have everything done in qemu so
that the 'fake' environment is closer to the real thing, doing so in qemu would
also allow us to test the bt-host driver in linux.

Cyril
