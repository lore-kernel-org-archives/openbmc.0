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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CkJM48rJzDqyn
 for <openbmc@lists.ozlabs.org>; Fri,  1 May 2020 04:22:41 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=us-ascii;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: modeling and reporting io fabrics from BMC
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAH1kD+Zf+Vx6ytOC8LPWNeGwo92284Nu87KhmGiAGkmoTyAs4A@mail.gmail.com>
Date: Thu, 30 Apr 2020 14:22:35 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: 7bit
Message-Id: <4C4D423A-CE1D-415E-9E7B-DDE3E22EA7D5@fuzziesquirrel.com>
References: <38BD6912-026E-4145-9489-1E839CE5877A@fuzziesquirrel.com>
 <CAH1kD+Zf+Vx6ytOC8LPWNeGwo92284Nu87KhmGiAGkmoTyAs4A@mail.gmail.com>
To: Richard Hanley <rhanley@google.com>
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
X-List-Received-Date: Thu, 30 Apr 2020 18:22:44 -0000

at 1:53 PM, Richard Hanley <rhanley@google.com> wrote:

> I don't really have any experience with any prior art here, but I am  
> expecting that we'll be looking into managing fabrics in a BMC with  
> Redfish soon. If I learn anything else I'll let you know.

Thanks for the reply Richard!
