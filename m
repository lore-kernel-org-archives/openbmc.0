Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sMGQ4ND4zDqpd
 for <openbmc@lists.ozlabs.org>; Tue, 15 Oct 2019 02:01:49 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 4AABE1527D5;
 Mon, 14 Oct 2019 11:01:40 -0400 (EDT)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain;
	charset=us-ascii;
	delsp=yes;
	format=flowed
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: host-ipmid bumps failing on tiogapass
Message-Id: <482C700C-A6AC-4B90-96CC-0E0BB2A7F4F3@fuzziesquirrel.com>
Date: Mon, 14 Oct 2019 11:01:40 -0400
Cc: Vijay Khemka <vijaykhemka@fb.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Emily Shaffer <emilyshaffer@google.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
To: William Kennington <wak@google.com>
X-Mailer: Apple Mail (2.3445.104.11)
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
X-List-Received-Date: Mon, 14 Oct 2019 15:01:51 -0000

Hi William

After: c514d874e4 (transporthandler: Rewrite + New Handler)

fb-ipmi-oem no longer builds which is an issue because the tiogapass system  
uses it for the bitbake CI.  Is this a backwards compatibility issue or a  
bug in fb-ipmi-oem or something else?

thx - brad
