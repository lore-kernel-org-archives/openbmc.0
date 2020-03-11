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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48cxBf6GgVzDqYV
 for <openbmc@lists.ozlabs.org>; Thu, 12 Mar 2020 02:45:57 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=us-ascii;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: Adding a detailed physical model to bmcweb
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAH1kD+a-3tb-=Xi17w=qrW3xLTJCk9JHF1b+PA=hvkekjSWt-w@mail.gmail.com>
Date: Wed, 11 Mar 2020 11:45:49 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: 7bit
Message-Id: <DED4A00E-CF36-4CB4-97B1-CD9BB96BF3C4@fuzziesquirrel.com>
References: <CAH1kD+a-3tb-=Xi17w=qrW3xLTJCk9JHF1b+PA=hvkekjSWt-w@mail.gmail.com>
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
X-List-Received-Date: Wed, 11 Mar 2020 15:46:03 -0000

at 5:22 PM, Richard Hanley <rhanley@google.com> wrote:

> One of the requirements we have for our data center management software  
> is that we need to be able to map resources (e.g. actions, telemetry, and  
> assemblies) directly to the physical component that it originated from as  
> well as how those components are physically connected.
>
> Historically this mapping was done through a custom protocol on the host,  
> and we would like to move this to a Redfish service on the BMC.

Hi Richard.  We (IBM) also have a need for the same detailed mapping  
information but from other services on the BMC.

> Let's just say for the moment that we get a service that collects this  
> information


Right, so where we have shared interest I think is how this service works  
and exports its information to _any_ BMC service (not just bmcweb -  
exporting the mapping information via external interfaces is less of a  
priority over here).  Can you say any more about this service?

thanks!

-brad
