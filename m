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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gm7q0LHPzDqNK
 for <openbmc@lists.ozlabs.org>; Tue,  9 Jun 2020 07:08:37 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Message-ID: <b80d18b2bc2766d58158e9c93f05201e87b445cd.camel@fuzziesquirrel.com>
Subject: Re: Redfish EventService Implementation
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: RAJESWARAN THILLAIGOVINDAN <rajeswaran.thillaigovindan@gmail.com>, 
 openbmc@lists.ozlabs.org, apparao.puli@linux.intel.com
Date: Mon, 08 Jun 2020 17:08:15 -0400
In-Reply-To: <019f5263-a7b2-9cb8-4420-cb597bd29afd@gmail.com>
References: <019f5263-a7b2-9cb8-4420-cb597bd29afd@gmail.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Mon, 08 Jun 2020 21:08:39 -0000

On Sat, 2020-02-01 at 02:23 +0530, RAJESWARAN THILLAIGOVINDAN wrote:
> Hi,
> 
> I am going through the bmcweb code for implementing Redfish
> EventService based on the design document 
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24749. This design
> is hooked to the journal based Redfish Event Logging.

Would anyone else be willing to opine on whether or not they think
journal based event schemes are what we want going forward for OpenBMC?

My feeling is that they are not - as an alternative IPC mechanism don't
we end up re-implementing things that DBus already does?  Doesn't it
require us to raise the same event twice everywhere (Once with DBus, and
once in the journal)?  What does journal based eventing do that DBus
signals don't do?

Please poke holes.

thx - brad
