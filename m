Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=173.167.31.197;
 helo=bajor.fuzziesquirrel.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hkkh6s0wzDqQK
 for <openbmc@lists.ozlabs.org>; Wed, 18 Mar 2020 07:08:28 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=us-ascii;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: service for tracking user activity (phosphor-audit)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <B9364499-3954-4862-BDF2-52467AF39327@gmail.com>
Date: Tue, 17 Mar 2020 16:08:25 -0400
Cc: Ivan Mikhaylov <i.mikhaylov@yadro.com>,
 Matt Spinler <mspinler@linux.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, joseph-reynolds@charter.net,
 gmills@us.ibm.com
Content-Transfer-Encoding: 7bit
Message-Id: <07C231EA-1761-4014-9A78-E2BDA3D71F0E@fuzziesquirrel.com>
References: <4efbcd540d3dd4bfb8021bdb6864326f72092852.camel@yadro.com>
 <da51cb6767c7f1e9130204f6f9c4af0019552b5b.camel@yadro.com>
 <B9364499-3954-4862-BDF2-52467AF39327@gmail.com>
To: Andrew Geissler <geissonator@gmail.com>
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
X-List-Received-Date: Tue, 17 Mar 2020 20:08:29 -0000

at 2:46 PM, Andrew Geissler <geissonator@gmail.com> wrote:

>
> Matt and Deepak could weigh in on whether this could be a part of
> phosphor-logging.

This would be my preference.

thx - Brad
