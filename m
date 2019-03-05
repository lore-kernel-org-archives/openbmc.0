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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44DW3m12WlzDqFv
 for <openbmc@lists.ozlabs.org>; Wed,  6 Mar 2019 08:58:12 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Tue, 5 Mar 2019 16:58:42 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Tom Joseph <tomjose@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Repository for IBM specific PLDM commands
Message-ID: <20190305215842.ehcjg6rxte4xzg3c@thinkpad>
References: <e6426267-ab30-ac36-e10b-6b48388dee91@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <e6426267-ab30-ac36-e10b-6b48388dee91@linux.vnet.ibm.com>
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
X-List-Received-Date: Tue, 05 Mar 2019 21:58:12 -0000

On Mon, Mar 04, 2019 at 08:14:09PM +0530, Tom Joseph wrote:
>Hi Brad,
>
>Could you help create a repo for IBM specific PLDM commands? In 
>certain use cases standard PLDM commands doesn't meet the usecases of 
>IBM servers.
>The file I/O PLDM commands are the first set that fits this category.
>
>Regards,
>Tom

Tom - I created ibm-pldm-oem.  I hope the name is ok.

thx - brad
