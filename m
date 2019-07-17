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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pbk757wkzDqQ1
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2019 22:12:29 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id C705A6DEB3;
 Wed, 17 Jul 2019 08:12:24 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: Obtaining fan/temperature sensor status for Redfish
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <2678493d-5dd3-d083-eaaf-64c42e485542@yadro.com>
Date: Wed, 17 Jul 2019 08:12:24 -0400
Cc: Shawn McCarney <shawnmm@linux.vnet.ibm.com>,
 openbmc@lists.ozlabs.org
Content-Transfer-Encoding: 7bit
Message-Id: <45B70BC1-4E9A-4212-9EC6-F4C58F30FD81@fuzziesquirrel.com>
References: <bcdd6246-e116-a5a5-24b2-cd36181a00c5@linux.vnet.ibm.com>
 <2678493d-5dd3-d083-eaaf-64c42e485542@yadro.com>
To: Alexander Amelkin <a.amelkin@yadro.com>
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
X-List-Received-Date: Wed, 17 Jul 2019 12:12:32 -0000

at 4:30 AM, Alexander Amelkin <a.amelkin@yadro.com> wrote:

> can be set by either the operator or the system software

Can you elaborate on what made you think the operator could set operational  
statuses?
