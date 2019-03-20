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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44PVq648TbzDqCW;
 Thu, 21 Mar 2019 00:18:25 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Wed, 20 Mar 2019 09:18:59 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Joseph Reynolds <jrey@linux.ibm.com>
Cc: openbmc@lists.ozlabs.org,
 openbmc <openbmc-bounces+jrey=linux.ibm.com@lists.ozlabs.org>
Subject: Re: API authentication
Message-ID: <20190320131858.yziiadaogwcl2hfz@thinkpad>
References: <20190318103504.zcfgdmgqfhi63jte@thinkpad>
 <91edbcb6aa1390130fb15b11f35e48bd@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <91edbcb6aa1390130fb15b11f35e48bd@linux.vnet.ibm.com>
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
X-List-Received-Date: Wed, 20 Mar 2019 13:18:28 -0000

On Mon, Mar 18, 2019 at 09:58:33AM -0500, Joseph Reynolds wrote:
>On 2019-03-18 05:35, Brad Bishop wrote:
>>I am looking for ideas on how to implement a mechanism to restrict 
>>access to
>>specific methods of a service/API (e.g. Redfish).
>>
>>This would be orthogonal to role-based authorization - e.g. the 
>>authorization
>>would be provided by someone other than the system administrator - 
>>e.g. the
>>system manufacturer.
>
>Is this a followup to the March 4 OpenBMC Community call?  
>https://github.com/openbmc/openbmc/wiki/Weekly-Community-Telecon
>
>My understanding is that we would design and code the BMC with 
>functions for things like manufacturing test and specialized 
>diagnostics ... functions which could harm the device, etc.   So we 
>want the functions to be present for manufacturing test and service 
>calls, but locked out for all other users.  Is that what this 
>mechanism is for?

I hadn't thought of mfg mode commands as a use case for this but on the
surface it does seem to be a match.
