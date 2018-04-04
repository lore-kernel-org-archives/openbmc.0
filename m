Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40G6cR30DHzF1TR
 for <openbmc@lists.ozlabs.org>; Wed,  4 Apr 2018 10:42:29 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 657993C4;
 Tue,  3 Apr 2018 20:42:22 -0400 (EDT)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: netboot image behavioral change
Message-Id: <FC82F572-06EA-43AE-8331-9DFA01338D9C@fuzziesquirrel.com>
Date: Tue, 3 Apr 2018 20:42:22 -0400
Cc: Xo Wang <xow@google.com>, Matt Spinler <mspinler@gmail.com>,
 msbarth <msbarth@linux.vnet.ibm.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3273)
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
X-List-Received-Date: Wed, 04 Apr 2018 00:42:32 -0000

I have resurrected a year old change from Xo:

https://gerrit.openbmc-project.xyz/#/c/1957/

When/if merged this will turn off the generation of netboot
cpios when using the obmc-phosphor-image image recipe by
default.

You can restore this behavior after the referenced change
has been merged by adding:

IMAGE_FSTYPES += "cpio.${INITRAMFS_CTYPE}.u-boot"

to your local.conf.

thx - brad
